import Foundation

public struct WebPageIngestionService: Sendable {
    private let archive: SourceArchive
    private let fetcher: WebPageFetching

    public init(archive: SourceArchive, fetcher: WebPageFetching) {
        self.archive = archive
        self.fetcher = fetcher
    }

    public func fetchQueuedWebPages(in snapshot: AgentMemorySnapshot) async -> AgentMemorySnapshot {
        var updated = snapshot

        for index in updated.items.indices where updated.items[index].status == .queued {
            guard let url = URL(string: updated.items[index].rawInput),
                  let scheme = url.scheme?.lowercased(),
                  ["http", "https"].contains(scheme)
            else {
                continue
            }

            do {
                updated.items[index].status = .extracting
                let page = try await fetcher.fetch(url: url)
                updated.items[index].displayName = page.title
                updated.items[index].rawInput = page.text
                updated.items[index].sourceType = .url
                updated.items[index].proposedOutcomes = [.reference]
                updated.items[index].confidence = 0.72
                updated.items[index].customTags = stableUnique(updated.items[index].customTags + ["web"])
                updated.items[index].status = .needsReview
                updated.items[index].failureReason = nil

                if !updated.archivedSources.contains(where: { $0.itemID == updated.items[index].id }) {
                    updated.archivedSources.append(try archive.archive(item: updated.items[index]))
                }
            } catch {
                updated.items[index].status = .failed
                updated.items[index].failureReason = "Web fetch failed: \(error.localizedDescription)"
            }
        }

        return updated
    }

    private func stableUnique(_ values: [String]) -> [String] {
        var seen: Set<String> = []
        var result: [String] = []

        for value in values where !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }

        return result
    }
}
