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
        XCTAssertEqual(classifier.classify(rawInput: "https://www.youtube.com/shorts/dQw4w9WgXcQ"), .video)
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

    func testProcessingQueueClassifiesAndCompletesHighConfidenceItem() async {
        let queue = ProcessingQueue(
            sourceClassifier: SourceClassifier(),
            outcomeClassifier: OutcomeClassifier(),
            ruleEngine: RuleEngine(rules: []),
            memoryWriter: MockMemoryWriter()
        )

        await queue.enqueue(rawInput: "Decision: keep Memory MCP as source of truth", displayName: "Decision note")
        await queue.processNext()

        let items = await queue.items
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items[0].sourceType, .text)
        XCTAssertEqual(items[0].proposedOutcomes, [.decision, .entity, .reference])
        XCTAssertEqual(items[0].status, .complete)
    }

    func testProcessingQueueRecordsAttemptMetadata() async {
        let queue = ProcessingQueue(
            sourceClassifier: SourceClassifier(),
            outcomeClassifier: OutcomeClassifier(),
            ruleEngine: RuleEngine(rules: []),
            memoryWriter: MockMemoryWriter()
        )

        await queue.enqueue(rawInput: "Decision: keep Memory MCP as source of truth", displayName: "Decision note")
        await queue.processNext()

        let items = await queue.items
        XCTAssertEqual(items[0].attemptCount, 1)
        XCTAssertNotNil(items[0].lastAttemptAt)
    }

    func testProcessingQueueCanPauseAndResumeQueuedItems() async {
        let queue = ProcessingQueue(
            sourceClassifier: SourceClassifier(),
            outcomeClassifier: OutcomeClassifier(),
            ruleEngine: RuleEngine(rules: []),
            memoryWriter: MockMemoryWriter()
        )

        await queue.enqueue(rawInput: "Plain note", displayName: "Note")
        await queue.pauseAll()
        let pausedItems = await queue.items
        XCTAssertEqual(pausedItems[0].status, .paused)

        await queue.resumePaused()
        let resumedItems = await queue.items
        XCTAssertEqual(resumedItems[0].status, .queued)
    }

    func testSourceArchiveCreatesMetadataForItem() throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let archive = SourceArchive(root: root)
        let item = CaptureItem(displayName: "Note", rawInput: "Decision: archive locally", sourceType: .text)

        let archived = try archive.archive(item: item)

        XCTAssertEqual(archived.itemID, item.id)
        XCTAssertEqual(archived.displayName, "Note")
        XCTAssertEqual(archived.sourceType, .text)
        XCTAssertTrue(FileManager.default.fileExists(atPath: archived.archivedPath))
    }

    func testMorningBriefSummarizesBatch() {
        let items = [
            CaptureItem(displayName: "Done", rawInput: "Decision: use local archive", sourceType: .text, status: .complete, proposedOutcomes: [.decision, .reference], confidence: 0.9),
            CaptureItem(displayName: "Review", rawInput: "Possible relationship", sourceType: .text, status: .needsReview, proposedOutcomes: [.link], confidence: 0.5),
            CaptureItem(displayName: "Failed", rawInput: "force write failure", sourceType: .text, status: .failed, proposedOutcomes: [.reference], confidence: 0.7, failureReason: "Memory write failed")
        ]

        let brief = MorningBriefBuilder().build(from: items)

        XCTAssertEqual(brief.processedCount, 3)
        XCTAssertEqual(brief.completedCount, 1)
        XCTAssertEqual(brief.needsReviewCount, 1)
        XCTAssertEqual(brief.failedCount, 1)
        XCTAssertEqual(brief.graphChanges, ["1 completed memory item updated the graph"])
        XCTAssertEqual(brief.exceptions.count, 2)
    }
}
