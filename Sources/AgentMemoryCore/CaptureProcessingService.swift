import Foundation

public struct CaptureProcessingService: Sendable {
    private let archive: SourceArchive
    private let memoryWriter: MemoryWriting

    public init(archive: SourceArchive, memoryWriter: MemoryWriting) {
        self.archive = archive
        self.memoryWriter = memoryWriter
    }

    public func processNext(in snapshot: AgentMemorySnapshot) async -> AgentMemorySnapshot {
        var updated = snapshot
        let queue = makeQueue(from: snapshot)
        await queue.processNext()
        updated.items = await queue.snapshotItems()
        updated.archivedSources = archiveNewlyProcessedItems(in: updated)
        return updated
    }

    public func processAllQueued(in snapshot: AgentMemorySnapshot) async -> AgentMemorySnapshot {
        var updated = snapshot
        let queue = makeQueue(from: snapshot)
        var previousItems = await queue.snapshotItems()

        while previousItems.contains(where: { $0.status == .queued }) {
            await queue.processNext()
            let currentItems = await queue.snapshotItems()
            if currentItems == previousItems {
                break
            }
            previousItems = currentItems
        }

        updated.items = await queue.snapshotItems()
        updated.archivedSources = archiveNewlyProcessedItems(in: updated)
        return updated
    }

    public func processQueuedBatch(in snapshot: AgentMemorySnapshot, startedAt: Date = Date()) async -> AgentMemorySnapshot {
        let queuedIDs = Set(snapshot.items.filter { $0.status == .queued }.map(\.id))
        var updated = await processAllQueued(in: snapshot)
        let processedBatchItems = updated.items.filter { queuedIDs.contains($0.id) }
        let completedCount = processedBatchItems.filter { $0.status == .complete }.count
        let reviewCount = processedBatchItems.filter { $0.status == .needsReview }.count
        let failedCount = processedBatchItems.filter { $0.status == .failed }.count
        let status: BatchRunStatus = failedCount > 0 ? .failed : .complete
        let summary = "Processed \(queuedIDs.count) queued captures: \(completedCount) complete, \(reviewCount) review, \(failedCount) failed."

        updated.batchRuns.append(
            BatchRun(
                startedAt: startedAt,
                completedAt: Date(),
                status: status,
                queuedItemCount: queuedIDs.count,
                completedItemCount: completedCount,
                reviewItemCount: reviewCount,
                failedItemCount: failedCount,
                summary: summary
            )
        )
        updated.morningBriefs.append(MorningBriefBuilder().build(from: updated.items))
        return updated
    }

    private func makeQueue(from snapshot: AgentMemorySnapshot) -> ProcessingQueue {
        ProcessingQueue(
            items: snapshot.items,
            sourceClassifier: SourceClassifier(),
            outcomeClassifier: OutcomeClassifier(),
            ruleEngine: RuleEngine(rules: snapshot.rules),
            memoryWriter: memoryWriter
        )
    }

    private func archiveNewlyProcessedItems(in snapshot: AgentMemorySnapshot) -> [ArchivedSource] {
        var archivedSources = snapshot.archivedSources
        let archivedIDs = Set(archivedSources.map(\.itemID))
        let processFinishedStatuses: Set<QueueStatus> = [.complete, .needsReview, .failed, .skipped]

        for item in snapshot.items where processFinishedStatuses.contains(item.status) && !archivedIDs.contains(item.id) {
            do {
                archivedSources.append(try archive.archive(item: item))
            } catch {
                archivedSources.append(
                    ArchivedSource(
                        itemID: item.id,
                        displayName: item.displayName,
                        archivedPath: "archive-error: \(error.localizedDescription)",
                        sourceType: item.sourceType,
                        createdAt: Date()
                    )
                )
            }
        }

        return archivedSources
    }
}
