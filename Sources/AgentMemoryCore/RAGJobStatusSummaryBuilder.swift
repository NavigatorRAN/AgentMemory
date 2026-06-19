public struct RAGJobStatusSummaryBuilder: Sendable {
    public init() {}

    public func counts(in items: [CaptureItem]) -> [String: Int] {
        var counts: [String: Int] = [:]

        for item in items {
            guard let status = item.ragExport?.remoteStatus, !status.isEmpty else {
                continue
            }

            counts[status, default: 0] += 1
        }

        return counts
    }
}
