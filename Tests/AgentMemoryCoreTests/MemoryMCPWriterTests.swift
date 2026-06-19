import XCTest
@testable import AgentMemoryCore

final class MemoryMCPWriterTests: XCTestCase {
    func testPayloadBuilderCreatesRecordEventPayloadWithProvenance() {
        let itemID = UUID(uuidString: "11111111-1111-1111-1111-111111111111")!
        let item = CaptureItem(
            id: itemID,
            displayName: "Decision note",
            rawInput: "Decision: keep Memory MCP as source of truth",
            createdAt: Date(timeIntervalSince1970: 100),
            sourceType: .text,
            status: .complete,
            proposedOutcomes: [.decision, .entity, .reference],
            confidence: 0.92
        )
        let archived = ArchivedSource(
            itemID: itemID,
            displayName: "Decision note",
            archivedPath: "/archive/source.txt",
            sourceType: .text,
            createdAt: Date(timeIntervalSince1970: 101),
            originalPath: "/tmp/source.txt",
            byteSize: 42
        )

        let payload = MemoryMCPPayloadBuilder(agent: "CODEX").recordEventPayload(for: item, archivedSource: archived)

        XCTAssertEqual(payload.agent, "CODEX")
        XCTAssertEqual(payload.entities, ["agentmemory", "decision-note"])
        XCTAssertEqual(payload.tags, ["agentmemory", "capture", "decision", "entity", "reference", "text"])
        XCTAssertTrue(payload.content.contains("Decision: keep Memory MCP as source of truth"))
        XCTAssertTrue(payload.content.contains("Archived source: /archive/source.txt"))
        XCTAssertTrue(payload.content.contains("Original path: /tmp/source.txt"))
        XCTAssertTrue(payload.content.contains("Byte size: 42"))
    }

    func testPayloadBuilderFallsBackWithoutArchiveMetadata() {
        let item = CaptureItem(
            displayName: "Terminal failure",
            rawInput: "fatal error: Memory MCP unreachable",
            sourceType: .codeOrLog,
            status: .complete,
            proposedOutcomes: [.gotcha, .reference],
            confidence: 0.9
        )

        let payload = MemoryMCPPayloadBuilder(agent: "CODEX").recordEventPayload(for: item, archivedSource: nil)

        XCTAssertEqual(payload.entities, ["agentmemory", "terminal-failure"])
        XCTAssertEqual(payload.tags, ["agentmemory", "capture", "gotcha", "reference", "codeOrLog"])
        XCTAssertTrue(payload.content.contains("Source archive: not available"))
    }

    func testMemoryMCPWriterSendsPayloadThroughTransport() async throws {
        let item = CaptureItem(
            displayName: "Decision note",
            rawInput: "Decision: ship Memory MCP writer",
            sourceType: .text,
            status: .complete,
            proposedOutcomes: [.decision, .reference],
            confidence: 0.91
        )
        let transport = RecordingMemoryMCPTransport()
        let writer = MemoryMCPWriter(
            payloadBuilder: MemoryMCPPayloadBuilder(agent: "CODEX"),
            transport: transport,
            archivedSourceResolver: { _ in nil }
        )

        try await writer.write(item: item)

        let payloads = await transport.payloads
        XCTAssertEqual(payloads.count, 1)
        XCTAssertEqual(payloads[0].agent, "CODEX")
        XCTAssertTrue(payloads[0].content.contains("Decision: ship Memory MCP writer"))
    }
}

private actor RecordingMemoryMCPTransport: MemoryMCPTransporting {
    private(set) var payloads: [MemoryMCPRecordEventPayload] = []

    func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws {
        payloads.append(payload)
    }
}
