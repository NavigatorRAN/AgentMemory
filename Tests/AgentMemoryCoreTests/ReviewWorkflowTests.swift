import XCTest
@testable import AgentMemoryCore

final class ReviewWorkflowTests: XCTestCase {
    func testReviewPayloadPreviewIncludesDecisionContext() {
        let item = CaptureItem(
            displayName: "Review decision",
            rawInput: "Decision: keep reviewed memory visible before write",
            sourceType: .text,
            status: .needsReview,
            proposedOutcomes: [.decision, .reference],
            confidence: 0.72
        )

        let payload = MemoryMCPPayloadBuilder(agent: "CODEX").recordEventPayload(for: item, archivedSource: nil)

        XCTAssertEqual(payload.agent, "CODEX")
        XCTAssertEqual(payload.entities, ["agentmemory", "review-decision"])
        XCTAssertTrue(payload.content.contains("AgentMemory capture processed: Review decision"))
        XCTAssertTrue(payload.content.contains("Decision: keep reviewed memory visible before write"))
        XCTAssertTrue(payload.content.contains("Source type: text"))
        XCTAssertTrue(payload.content.contains("Outcomes: decision, reference"))
        XCTAssertTrue(payload.content.contains("Confidence: 0.72"))
    }
}
