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
}
