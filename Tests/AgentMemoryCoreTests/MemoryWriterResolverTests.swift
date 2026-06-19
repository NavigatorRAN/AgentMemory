import XCTest
@testable import AgentMemoryCore

final class MemoryWriterResolverTests: XCTestCase {
    func testDisabledConfigUsesMockWriter() throws {
        let writer = try MemoryWriterResolver.writer(
            config: AgentMemoryConfig(liveMemoryWritesEnabled: false),
            archivedSources: []
        )

        XCTAssertTrue(writer is MockMemoryWriter)
    }

    func testEnabledConfigRequiresValidEndpoint() {
        XCTAssertThrowsError(
            try MemoryWriterResolver.writer(
                config: AgentMemoryConfig(
                    memoryMCPEndpoint: "not a url",
                    agentName: "CODEX",
                    liveMemoryWritesEnabled: true
                ),
                archivedSources: []
            )
        ) { error in
            XCTAssertEqual(error as? MemoryWriterResolver.ResolverError, .invalidEndpoint)
        }
    }

    func testEnabledConfigBuildsLiveWriterWithConfiguredAgent() async throws {
        let itemID = UUID(uuidString: "22222222-2222-2222-2222-222222222222")!
        let item = CaptureItem(
            id: itemID,
            displayName: "Live write",
            rawInput: "Decision: test live Memory MCP writer",
            sourceType: .text,
            status: .complete,
            proposedOutcomes: [.decision, .reference],
            confidence: 0.91
        )
        let archived = ArchivedSource(
            itemID: itemID,
            displayName: "Live write",
            archivedPath: "/archive/live-write.txt",
            sourceType: .text,
            createdAt: Date(timeIntervalSince1970: 100)
        )
        let transport = RecordingResolverTransport()
        let writer = try MemoryWriterResolver.writer(
            config: AgentMemoryConfig(
                memoryMCPEndpoint: "http://127.0.0.1:8006/mcp",
                agentName: "LOCAL_AGENT",
                liveMemoryWritesEnabled: true
            ),
            archivedSources: [archived],
            transportFactory: { _ in transport }
        )

        try await writer.write(item: item)

        let payloads = await transport.payloads
        XCTAssertEqual(payloads.count, 1)
        XCTAssertEqual(payloads[0].agent, "LOCAL_AGENT")
        XCTAssertTrue(payloads[0].content.contains("Decision: test live Memory MCP writer"))
        XCTAssertTrue(payloads[0].content.contains("Archived source: /archive/live-write.txt"))
    }

    func testBlankAgentFallsBackToCodex() async throws {
        let transport = RecordingResolverTransport()
        let writer = try MemoryWriterResolver.writer(
            config: AgentMemoryConfig(
                memoryMCPEndpoint: "http://127.0.0.1:8006/mcp",
                agentName: "  ",
                liveMemoryWritesEnabled: true
            ),
            archivedSources: [],
            transportFactory: { _ in transport }
        )

        try await writer.write(
            item: CaptureItem(
                displayName: "Default agent",
                rawInput: "Decision: default to CODEX",
                sourceType: .text,
                status: .complete,
                proposedOutcomes: [.decision],
                confidence: 0.9
            )
        )

        let payloads = await transport.payloads
        XCTAssertEqual(payloads[0].agent, "CODEX")
    }
}

private actor RecordingResolverTransport: MemoryMCPTransporting {
    private(set) var payloads: [MemoryMCPRecordEventPayload] = []

    func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws {
        payloads.append(payload)
    }
}
