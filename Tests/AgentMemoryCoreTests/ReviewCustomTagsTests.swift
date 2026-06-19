import XCTest
@testable import AgentMemoryCore

final class ReviewCustomTagsTests: XCTestCase {
    func testPayloadIncludesCustomTags() {
        let item = CaptureItem(
            displayName: "Tagged review",
            rawInput: "Decision: include custom tags",
            sourceType: .text,
            status: .needsReview,
            proposedOutcomes: [.decision, .reference],
            confidence: 0.81,
            customTags: ["wwdc26", "workflow"]
        )

        let payload = MemoryMCPPayloadBuilder(agent: "CODEX").recordEventPayload(for: item, archivedSource: nil)

        XCTAssertTrue(payload.tags.contains("wwdc26"))
        XCTAssertTrue(payload.tags.contains("workflow"))
    }

    func testCaptureItemDecodesOlderJSONWithoutCustomTags() throws {
        let json = """
        {
          "id" : "33333333-3333-3333-3333-333333333333",
          "displayName" : "Older capture",
          "rawInput" : "plain note",
          "createdAt" : "2026-06-19T00:00:00Z",
          "sourceType" : "text",
          "status" : "needsReview",
          "proposedOutcomes" : ["reference"],
          "confidence" : 0.4
        }
        """.data(using: .utf8)!

        let item = try JSONDecoder.agentMemory.decode(CaptureItem.self, from: json)

        XCTAssertEqual(item.customTags, [])
    }
}
