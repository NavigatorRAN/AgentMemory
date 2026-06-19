import Foundation

public struct ReviewExplanationBuilder: Sendable {
    public init() {}

    public func explanations(for item: CaptureItem) -> [String] {
        var explanations: [String] = []

        if item.confidence < 0.85 {
            explanations.append("Confidence is below the auto-write threshold.")
        }

        if item.proposedOutcomes.contains(.link) {
            explanations.append("Link outcomes require review before writing.")
        }

        if item.sourceType == .unknown {
            explanations.append("Source type is unknown.")
        }

        if item.status == .failed, let failureReason = item.failureReason {
            explanations.append("Previous processing failed: \(failureReason)")
        }

        if explanations.isEmpty {
            explanations.append("Review requested by routing or user action.")
        }

        return explanations
    }
}
