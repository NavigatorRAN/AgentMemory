import XCTest
@testable import AgentMemoryCore

final class AgentMemoryStoreTests: XCTestCase {
    func testAgentMemorySnapshotRoundTripsThroughJSON() throws {
        let item = CaptureItem(
            id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
            displayName: "Decision note",
            rawInput: "Decision: keep Memory MCP as source of truth",
            createdAt: Date(timeIntervalSince1970: 100),
            sourceType: .text,
            status: .complete,
            proposedOutcomes: [.decision, .entity, .reference],
            confidence: 0.92
        )
        let rule = IngestionRule(
            id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!,
            name: "WWDC videos",
            sourceType: .video,
            matchText: "developer.apple.com/videos",
            workspace: "WWDC26",
            actions: [.autoWriteMemory, .exportToRAG]
        )
        let archived = ArchivedSource(
            itemID: item.id,
            displayName: item.displayName,
            archivedPath: "/tmp/source.txt",
            sourceType: .text,
            createdAt: Date(timeIntervalSince1970: 101)
        )
        let brief = MorningBrief(
            processedCount: 1,
            completedCount: 1,
            needsReviewCount: 0,
            failedCount: 0,
            newEntities: ["Decision note"],
            graphChanges: ["1 completed memory item updated the graph"],
            exceptions: []
        )

        let snapshot = AgentMemorySnapshot(
            version: 1,
            items: [item],
            rules: [rule],
            archivedSources: [archived],
            morningBriefs: [brief]
        )

        let data = try JSONEncoder.agentMemory.encode(snapshot)
        let decoded = try JSONDecoder.agentMemory.decode(AgentMemorySnapshot.self, from: data)

        XCTAssertEqual(decoded, snapshot)
    }

    func testDiskStoreSavesAndLoadsSnapshot() throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let store = AgentMemoryDiskStore(root: root)
        let createdAt = Date(timeIntervalSince1970: 200)
        let snapshot = AgentMemorySnapshot(
            items: [
                CaptureItem(displayName: "Note", rawInput: "Decision: persist queue", createdAt: createdAt, sourceType: .text, status: .queued)
            ],
            rules: [
                IngestionRule(name: "Logs", sourceType: .codeOrLog, workspace: "Troubleshooting", actions: [.needsReview])
            ]
        )

        try store.save(snapshot)
        let loaded = try store.load()

        XCTAssertEqual(loaded, snapshot)
        XCTAssertTrue(FileManager.default.fileExists(atPath: store.snapshotURL.path))
    }

    func testDiskStoreReturnsEmptySnapshotWhenFileDoesNotExist() throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let store = AgentMemoryDiskStore(root: root)

        let loaded = try store.load()

        XCTAssertEqual(loaded, AgentMemorySnapshot())
    }

    func testDiskStoreSurfacesCorruptedSnapshot() throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let store = AgentMemoryDiskStore(root: root)
        try Data("not-json".utf8).write(to: store.snapshotURL)

        XCTAssertThrowsError(try store.load())
    }

    func testProcessingQueueRestoresFromSavedItems() async {
        let savedItems = [
            CaptureItem(displayName: "Queued", rawInput: "Decision: saved queue", sourceType: .text, status: .queued),
            CaptureItem(displayName: "Review", rawInput: "Possible inferred link", sourceType: .text, status: .needsReview)
        ]
        let queue = ProcessingQueue(
            items: savedItems,
            sourceClassifier: SourceClassifier(),
            outcomeClassifier: OutcomeClassifier(),
            ruleEngine: RuleEngine(rules: []),
            memoryWriter: MockMemoryWriter()
        )

        let restored = await queue.snapshotItems()
        XCTAssertEqual(restored, savedItems)

        await queue.processNext()
        let processed = await queue.snapshotItems()
        XCTAssertEqual(processed[0].status, .complete)
        XCTAssertEqual(processed[1].status, .needsReview)
    }

    func testDefaultAppSupportRootUsesAgentMemoryDirectory() throws {
        let root = try AgentMemoryDiskStore.defaultAppSupportRoot(
            fileManager: .default,
            bundleIdentifier: "dev.navigatorran.AgentMemory"
        )

        XCTAssertEqual(root.lastPathComponent, "AgentMemory")
        XCTAssertTrue(root.path.contains("Application Support"))
    }
}
