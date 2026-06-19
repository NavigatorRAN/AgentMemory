import XCTest
@testable import AgentMemoryCore

final class AgentMemoryCoreTests: XCTestCase {
    func testCaptureItemDefaultsToQueuedUnknownSource() {
        let item = CaptureItem(displayName: "Note", rawInput: "Remember this")

        XCTAssertEqual(item.displayName, "Note")
        XCTAssertEqual(item.sourceType, .unknown)
        XCTAssertEqual(item.status, .queued)
        XCTAssertEqual(item.proposedOutcomes, [])
        XCTAssertEqual(item.confidence, 0)
    }

    func testSourceClassifierRecognizesCommonCaptureTypes() {
        let classifier = SourceClassifier()

        XCTAssertEqual(classifier.classify(rawInput: "https://example.com/article"), .url)
        XCTAssertEqual(classifier.classify(rawInput: "https://youtube.com/watch?v=abc123"), .video)
        XCTAssertEqual(classifier.classify(rawInput: "/tmp/report.pdf"), .pdf)
        XCTAssertEqual(classifier.classify(rawInput: "/tmp/screenshot.png"), .image)
        XCTAssertEqual(classifier.classify(rawInput: "fatal error: connection refused"), .codeOrLog)
        XCTAssertEqual(classifier.classify(rawInput: "Plain note about a project decision"), .text)
    }

    func testOutcomeClassifierProposesMemoryOutcomes() {
        let classifier = OutcomeClassifier()

        XCTAssertEqual(classifier.classify(text: "Decision: keep Memory MCP as source of truth"), [.decision, .entity, .reference])
        XCTAssertEqual(classifier.classify(text: "Gotcha: transcript unavailable for this video"), [.gotcha, .reference])
        XCTAssertEqual(classifier.classify(text: "TODO: follow up on RAG export schema"), [.task, .reference])
        XCTAssertEqual(classifier.classify(text: "Memory MCP runs on the local Mac mini"), [.entity, .reference])
    }
}
