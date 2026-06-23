import XCTest
@testable import AgentMemoryCore

final class AgentMemoryWikiTests: XCTestCase {
    func testWikiPageBuilderCreatesCompiledPagesFromCompletedCaptures() {
        let item = CaptureItem(
            id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
            displayName: "Foundation Models",
            rawInput: "LanguageModelSession supports tool calling and guided generation.",
            createdAt: Date(timeIntervalSince1970: 100),
            sourceType: .url,
            status: .complete,
            proposedOutcomes: [.reference],
            confidence: 0.91,
            customTags: ["apple-docs", "foundation-models"],
            ragExport: RAGExportStatus(
                jobID: 644,
                exportedAt: Date(timeIntervalSince1970: 120),
                collection: "apple-developer-docs",
                remoteStatus: "done",
                chunksUpserted: 18,
                docID: "foundation-models"
            )
        )
        let snapshot = AgentMemorySnapshot(items: [item])

        let pages = AgentMemoryWikiPageBuilder(now: { Date(timeIntervalSince1970: 200) })
            .pages(from: snapshot, reason: .ragExport)

        XCTAssertEqual(pages.map(\.slug), ["foundation-models"])
        XCTAssertEqual(pages[0].title, "Foundation Models")
        XCTAssertEqual(pages[0].sourceItemIDs, [item.id])
        XCTAssertEqual(pages[0].ragCollections, ["apple-developer-docs"])
        XCTAssertEqual(pages[0].tags, ["agentmemory-wiki", "apple-docs", "foundation-models", "rag-backed"])
        XCTAssertTrue(pages[0].summary.contains("LanguageModelSession"))
        XCTAssertTrue(pages[0].body.contains("RAG collection: apple-developer-docs"))
    }

    func testWikiFileStoreWritesIndexLogAndPageMarkdown() throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let store = AgentMemoryWikiFileStore(root: root)
        let page = AgentMemoryWikiPage(
            slug: "foundation-models",
            title: "Foundation Models",
            summary: "Compiled notes for Foundation Models.",
            body: "## Notes\nLanguageModelSession supports guided generation.",
            entities: ["agentmemory", "foundation-models"],
            tags: ["agentmemory-wiki", "apple-docs"],
            sourceItemIDs: [UUID(uuidString: "11111111-1111-1111-1111-111111111111")!],
            ragCollections: ["apple-developer-docs"],
            sourceURLs: ["https://developer.apple.com/documentation/foundationmodels"],
            refreshedAt: Date(timeIntervalSince1970: 200),
            refreshReason: .ragExport
        )
        let run = AgentMemoryWikiRefreshRun(
            startedAt: Date(timeIntervalSince1970: 190),
            completedAt: Date(timeIntervalSince1970: 201),
            reason: .ragExport,
            pageCount: 1,
            syncedPageCount: 1,
            failedSyncCount: 0,
            summary: "Refreshed 1 wiki page."
        )

        try store.write(pages: [page], latestRun: run)

        let pageMarkdown = try String(contentsOf: root.appendingPathComponent("foundation-models.md"))
        let indexMarkdown = try String(contentsOf: root.appendingPathComponent("index.md"))
        let logMarkdown = try String(contentsOf: root.appendingPathComponent("log.md"))

        XCTAssertTrue(pageMarkdown.contains("title: Foundation Models"))
        XCTAssertTrue(pageMarkdown.contains("rag_collections: apple-developer-docs"))
        XCTAssertTrue(pageMarkdown.contains("LanguageModelSession supports guided generation."))
        XCTAssertTrue(indexMarkdown.contains("- [Foundation Models](foundation-models.md)"))
        XCTAssertTrue(logMarkdown.contains("ragExport"))
    }

    func testSnapshotRoundTripsWikiStateAndDecodesOlderJSONWithoutWikiFields() throws {
        let page = AgentMemoryWikiPage(
            slug: "agentmemory",
            title: "AgentMemory",
            summary: "Compiled project page.",
            body: "## Notes\nAgentMemory keeps a compiled wiki.",
            entities: ["agentmemory"],
            tags: ["agentmemory-wiki"],
            sourceItemIDs: [],
            ragCollections: [],
            sourceURLs: [],
            refreshedAt: Date(timeIntervalSince1970: 200),
            refreshReason: .memoryWrite,
            lastMemoryMCPSyncAt: Date(timeIntervalSince1970: 210),
            memoryMCPSyncError: nil
        )
        let run = AgentMemoryWikiRefreshRun(
            startedAt: Date(timeIntervalSince1970: 190),
            completedAt: Date(timeIntervalSince1970: 211),
            reason: .memoryWrite,
            pageCount: 1,
            syncedPageCount: 1,
            failedSyncCount: 0,
            summary: "Refreshed 1 wiki page."
        )
        let snapshot = AgentMemorySnapshot(wikiPages: [page], wikiRefreshRuns: [run])

        let data = try JSONEncoder.agentMemory.encode(snapshot)
        let decoded = try JSONDecoder.agentMemory.decode(AgentMemorySnapshot.self, from: data)

        XCTAssertEqual(decoded, snapshot)

        let legacy = """
        {
          "version" : 1,
          "items" : [],
          "rules" : [],
          "archivedSources" : [],
          "morningBriefs" : [],
          "batchRuns" : [],
          "ragExportRuns" : []
        }
        """.data(using: .utf8)!

        let legacySnapshot = try JSONDecoder.agentMemory.decode(AgentMemorySnapshot.self, from: legacy)
        XCTAssertEqual(legacySnapshot.wikiPages, [])
        XCTAssertEqual(legacySnapshot.wikiRefreshRuns, [])
    }

    func testWikiPayloadMarksPagesDiscoverableThroughExistingMemoryMCPSearch() {
        let page = AgentMemoryWikiPage(
            slug: "foundation-models",
            title: "Foundation Models",
            summary: "Compiled notes for Foundation Models.",
            body: "## Notes\nLanguageModelSession supports guided generation.",
            entities: ["agentmemory", "foundation-models"],
            tags: ["agentmemory-wiki", "apple-docs"],
            sourceItemIDs: [],
            ragCollections: ["apple-developer-docs"],
            sourceURLs: ["https://developer.apple.com/documentation/foundationmodels"],
            refreshedAt: Date(timeIntervalSince1970: 200),
            refreshReason: .ragExport
        )

        let payload = MemoryMCPPayloadBuilder(agent: "CODEX").recordEventPayload(for: page)

        XCTAssertEqual(payload.agent, "CODEX")
        XCTAssertEqual(payload.entities, ["agentmemory", "agentmemory-wiki", "wiki:foundation-models", "foundation-models"])
        XCTAssertTrue(payload.tags.contains("agentmemory-wiki"))
        XCTAssertTrue(payload.tags.contains("rag-backed"))
        XCTAssertTrue(payload.content.contains("Wiki page refreshed: Foundation Models"))
        XCTAssertTrue(payload.content.contains("Local wiki page: foundation-models.md"))
        XCTAssertTrue(payload.content.contains("RAG collections: apple-developer-docs"))
    }

    func testWikiMemorySyncerRecordsEachPageAndReportsFailures() async {
        let pages = [
            AgentMemoryWikiPage(
                slug: "foundation-models",
                title: "Foundation Models",
                summary: "Compiled notes for Foundation Models.",
                body: "## Notes\nLanguageModelSession supports guided generation.",
                entities: ["agentmemory", "foundation-models"],
                tags: ["agentmemory-wiki"],
                sourceItemIDs: [],
                ragCollections: ["apple-developer-docs"],
                sourceURLs: [],
                refreshedAt: Date(timeIntervalSince1970: 200),
                refreshReason: .ragExport
            ),
            AgentMemoryWikiPage(
                slug: "core-ai",
                title: "Core AI",
                summary: "Compiled notes for Core AI.",
                body: "## Notes\nCore AI includes model assets and inference concepts.",
                entities: ["agentmemory", "core-ai"],
                tags: ["agentmemory-wiki"],
                sourceItemIDs: [],
                ragCollections: [],
                sourceURLs: [],
                refreshedAt: Date(timeIntervalSince1970: 200),
                refreshReason: .ragExport
            )
        ]
        let transport = FailingSecondWikiTransport()
        let syncer = AgentMemoryWikiMemorySyncer(
            payloadBuilder: MemoryMCPPayloadBuilder(agent: "CODEX"),
            transport: transport,
            now: { Date(timeIntervalSince1970: 220) }
        )

        let result = await syncer.sync(pages: pages)

        XCTAssertEqual(result.syncedPages.map(\.slug), ["foundation-models"])
        XCTAssertEqual(result.failedPages.map(\.slug), ["core-ai"])
        XCTAssertEqual(result.pages[0].lastMemoryMCPSyncAt, Date(timeIntervalSince1970: 220))
        XCTAssertNil(result.pages[0].memoryMCPSyncError)
        XCTAssertEqual(result.pages[1].memoryMCPSyncError, "sync failed")
        let payloads = await transport.payloads
        XCTAssertEqual(payloads.count, 2)
        XCTAssertTrue(payloads[0].tags.contains("agentmemory-wiki"))
    }
}

private actor FailingSecondWikiTransport: MemoryMCPTransporting {
    private(set) var payloads: [MemoryMCPRecordEventPayload] = []

    func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws {
        payloads.append(payload)
        if payloads.count == 2 {
            throw TestWikiSyncError.failed
        }
    }
}

private enum TestWikiSyncError: LocalizedError {
    case failed

    var errorDescription: String? {
        "sync failed"
    }
}
