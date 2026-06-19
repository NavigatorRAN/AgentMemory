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

    func testRuleEngineRoutesTrustedSource() {
        let rule = IngestionRule(
            name: "WWDC videos",
            sourceType: .video,
            matchText: "developer.apple.com/videos",
            workspace: "WWDC26",
            actions: [.autoWriteMemory, .exportToRAG]
        )
        let engine = RuleEngine(rules: [rule])

        let decision = engine.route(
            item: CaptureItem(displayName: "Session", rawInput: "https://developer.apple.com/videos/play/wwdc2026/101", sourceType: .video)
        )

        XCTAssertEqual(decision.workspace, "WWDC26")
        XCTAssertEqual(decision.actions, [.autoWriteMemory, .exportToRAG])
        XCTAssertEqual(decision.matchedRuleName, "WWDC videos")
    }

    func testRuleEngineFallsBackToInboxReview() {
        let engine = RuleEngine(rules: [])

        let decision = engine.route(
            item: CaptureItem(displayName: "Unknown", rawInput: "mystery", sourceType: .unknown)
        )

        XCTAssertEqual(decision.workspace, "Inbox")
        XCTAssertEqual(decision.actions, [.needsReview])
        XCTAssertNil(decision.matchedRuleName)
    }

    func testHighConfidenceGroundedItemsCanAutoWrite() {
        let candidate = CaptureItem(
            displayName: "Decision",
            rawInput: "Decision: keep Memory MCP as source of truth",
            sourceType: .text,
            proposedOutcomes: [.decision, .reference],
            confidence: 0.92
        )

        XCTAssertTrue(candidate.canAutoWrite)
    }

    func testLowConfidenceItemsNeedReview() {
        let candidate = CaptureItem(
            displayName: "Maybe link",
            rawInput: "This might relate to that",
            sourceType: .text,
            proposedOutcomes: [.link],
            confidence: 0.54
        )

        XCTAssertFalse(candidate.canAutoWrite)
    }
}
