import Foundation

public struct MorningBriefBuilder: Sendable {
    public init() {}

    public func build(from items: [CaptureItem]) -> MorningBrief {
        let completed = items.filter { $0.status == .complete }
        let needsReview = items.filter { $0.status == .needsReview }
        let failed = items.filter { $0.status == .failed }
        let entityNames = completed
            .filter { $0.proposedOutcomes.contains(.entity) }
            .map(\.displayName)

        var exceptions = needsReview.map { "\($0.displayName) needs review" }
        exceptions.append(contentsOf: failed.map { "\($0.displayName): \($0.failureReason ?? "Failed")" })

        let graphChanges = completed.isEmpty
            ? []
            : ["\(completed.count) completed memory item updated the graph"]

        return MorningBrief(
            processedCount: items.count,
            completedCount: completed.count,
            needsReviewCount: needsReview.count,
            failedCount: failed.count,
            newEntities: entityNames,
            graphChanges: graphChanges,
            exceptions: exceptions
        )
    }
}
