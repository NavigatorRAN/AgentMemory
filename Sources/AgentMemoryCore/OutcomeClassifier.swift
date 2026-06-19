import Foundation

public struct OutcomeClassifier: Sendable {
    public init() {}

    public func classify(text: String) -> [MemoryOutcome] {
        let lowercased = text.lowercased()
        var outcomes: [MemoryOutcome] = []

        if lowercased.contains("decision:") || lowercased.contains("decided") {
            outcomes.append(.decision)
        }

        if lowercased.contains("gotcha:") || lowercased.contains("failed") || lowercased.contains("fix:") {
            outcomes.append(.gotcha)
        }

        if lowercased.contains("todo:") || lowercased.contains("follow up") {
            outcomes.append(.task)
        }

        if lowercased.contains("runs on")
            || lowercased.contains("is a")
            || lowercased.contains("source of truth") {
            outcomes.append(.entity)
        }

        if outcomes.isEmpty {
            outcomes.append(.reference)
        } else if !outcomes.contains(.reference) {
            outcomes.append(.reference)
        }

        return outcomes
    }
}
