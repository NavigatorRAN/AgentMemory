import Foundation

public struct CaptureSearch: Sendable {
    public init() {}

    public func filter(_ items: [CaptureItem], query: String) -> [CaptureItem] {
        let terms = query
            .lowercased()
            .components(separatedBy: .whitespacesAndNewlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        guard !terms.isEmpty else {
            return items
        }

        return items.filter { item in
            let haystack = searchableText(for: item).lowercased()
            return terms.allSatisfy { haystack.contains($0) }
        }
    }

    private func searchableText(for item: CaptureItem) -> String {
        [
            item.displayName,
            item.rawInput,
            item.sourceType.rawValue,
            item.status.rawValue,
            item.proposedOutcomes.map(\.rawValue).joined(separator: " "),
            item.customTags.joined(separator: " "),
            item.failureReason ?? ""
        ].joined(separator: " ")
    }
}
