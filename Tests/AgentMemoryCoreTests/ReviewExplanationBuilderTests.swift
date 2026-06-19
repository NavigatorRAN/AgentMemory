import XCTest
@testable import AgentMemoryCore

final class ReviewExplanationBuilderTests: XCTestCase {
    func testExplainsLowConfidence() {
        let item = CaptureItem(
            displayName: "Low confidence",
            rawInput: "possible link",
            sourceType: .text,
            status: .needsReview,
            proposedOutcomes: [.reference],
            confidence: 0.42
        )

        let explanations = ReviewExplanationBuilder().explanations(for: item)

        XCTAssertTrue(explanations.contains("Confidence is below the auto-write threshold."))
    }

    func testExplainsLinkOutcome() {
        let item = CaptureItem(
            displayName: "Relationship",
            rawInput: "this relates to that",
            sourceType: .text,
            status: .needsReview,
            proposedOutcomes: [.link, .reference],
            confidence: 0.91
        )

        let explanations = ReviewExplanationBuilder().explanations(for: item)

        XCTAssertTrue(explanations.contains("Link outcomes require review before writing."))
    }

    func testExplainsUnknownSource() {
        let item = CaptureItem(displayName: "Mystery", rawInput: "", sourceType: .unknown, status: .needsReview)

        let explanations = ReviewExplanationBuilder().explanations(for: item)

        XCTAssertTrue(explanations.contains("Source type is unknown."))
    }

    func testExplainsFailedStatus() {
        let item = CaptureItem(
            displayName: "Failed",
            rawInput: "Decision: failed write",
            sourceType: .text,
            status: .failed,
            proposedOutcomes: [.decision],
            confidence: 0.9,
            failureReason: "Memory write failed"
        )

        let explanations = ReviewExplanationBuilder().explanations(for: item)

        XCTAssertTrue(explanations.contains("Previous processing failed: Memory write failed"))
    }
}
