# AgentMemory Memory MCP Writer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a real Memory MCP writer boundary that maps high-confidence captures into `record_event` tool payloads with local source archive provenance.

**Architecture:** Introduce a testable `MemoryMCPRecordEventPayload` and `MemoryMCPPayloadBuilder` in core. Add a `MemoryMCPWriting` transport protocol and `MemoryMCPWriter` adapter that sends built payloads through the transport. Keep the app on `MockMemoryWriter` until a settings/config slice provides the live endpoint, but make the real adapter available and covered by tests.

**Tech Stack:** Swift 6, Codable payload models, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/MemoryMCPPayloadBuilder.swift`: Builds `record_event` payloads.
- `Sources/AgentMemoryCore/MemoryMCPWriter.swift`: Transport-backed writer adapter.
- `Tests/AgentMemoryCoreTests/MemoryMCPWriterTests.swift`: Payload mapping and transport tests.
- `README.md`: Note Memory MCP payload/writer boundary.

---

### Task 1: Payload Builder

**Files:**
- Create: `Sources/AgentMemoryCore/MemoryMCPPayloadBuilder.swift`
- Create: `Tests/AgentMemoryCoreTests/MemoryMCPWriterTests.swift`

- [ ] **Step 1: Add payload builder tests**

Create `Tests/AgentMemoryCoreTests/MemoryMCPWriterTests.swift`:

```swift
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
```

- [ ] **Step 2: Implement payload builder**

Create `Sources/AgentMemoryCore/MemoryMCPPayloadBuilder.swift`:

```swift
import Foundation

public struct MemoryMCPRecordEventPayload: Codable, Equatable, Sendable {
    public var agent: String
    public var content: String
    public var entities: [String]
    public var tags: [String]
}

public struct MemoryMCPPayloadBuilder: Sendable {
    private let agent: String

    public init(agent: String) {
        self.agent = agent
    }

    public func recordEventPayload(for item: CaptureItem, archivedSource: ArchivedSource?) -> MemoryMCPRecordEventPayload {
        let entitySlug = slug(for: item.displayName)
        let tags = ["agentmemory", "capture"]
            + item.proposedOutcomes.map(\.rawValue)
            + [item.sourceType.rawValue]

        return MemoryMCPRecordEventPayload(
            agent: agent,
            content: content(for: item, archivedSource: archivedSource),
            entities: ["agentmemory", entitySlug],
            tags: stableUnique(tags)
        )
    }

    private func content(for item: CaptureItem, archivedSource: ArchivedSource?) -> String {
        var lines = [
            "AgentMemory capture processed: \(item.displayName)",
            "",
            "Raw input:",
            item.rawInput,
            "",
            "Source type: \(item.sourceType.rawValue)",
            "Outcomes: \(item.proposedOutcomes.map(\\.rawValue).joined(separator: \", \"))",
            "Confidence: \(String(format: \"%.2f\", item.confidence))"
        ]

        if let archivedSource {
            lines.append("Archived source: \(archivedSource.archivedPath)")
            if let originalPath = archivedSource.originalPath {
                lines.append("Original path: \(originalPath)")
            }
            if let byteSize = archivedSource.byteSize {
                lines.append("Byte size: \(byteSize)")
            }
        } else {
            lines.append("Source archive: not available")
        }

        return lines.joined(separator: "\n")
    }

    private func slug(for value: String) -> String {
        let allowed = CharacterSet.alphanumerics
        let scalars = value.lowercased().unicodeScalars.map { scalar -> Character in
            allowed.contains(scalar) ? Character(scalar) : "-"
        }
        let collapsed = String(scalars)
            .split(separator: "-")
            .joined(separator: "-")
        return collapsed.isEmpty ? "capture" : collapsed
    }

    private func stableUnique(_ values: [String]) -> [String] {
        var seen: Set<String> = []
        var result: [String] = []

        for value in values where !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }

        return result
    }
}
```

- [ ] **Step 3: Verify payload tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPWriterTests`

Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git add Sources/AgentMemoryCore/MemoryMCPPayloadBuilder.swift Tests/AgentMemoryCoreTests/MemoryMCPWriterTests.swift
git commit -m "Build Memory MCP record event payloads"
```

---

### Task 2: Transport-Backed Writer

**Files:**
- Create: `Sources/AgentMemoryCore/MemoryMCPWriter.swift`
- Modify: `Tests/AgentMemoryCoreTests/MemoryMCPWriterTests.swift`

- [ ] **Step 1: Add writer transport test**

Append to `Tests/AgentMemoryCoreTests/MemoryMCPWriterTests.swift`:

```swift
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

    XCTAssertEqual(await transport.payloads.count, 1)
    XCTAssertEqual(await transport.payloads[0].agent, "CODEX")
    XCTAssertTrue(await transport.payloads[0].content.contains("Decision: ship Memory MCP writer"))
}

private actor RecordingMemoryMCPTransport: MemoryMCPTransporting {
    private(set) var payloads: [MemoryMCPRecordEventPayload] = []

    func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws {
        payloads.append(payload)
    }
}
```

- [ ] **Step 2: Implement writer**

Create `Sources/AgentMemoryCore/MemoryMCPWriter.swift`:

```swift
import Foundation

public protocol MemoryMCPTransporting: Sendable {
    func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws
}

public struct MemoryMCPWriter: MemoryWriting {
    private let payloadBuilder: MemoryMCPPayloadBuilder
    private let transport: MemoryMCPTransporting
    private let archivedSourceResolver: @Sendable (CaptureItem) -> ArchivedSource?

    public init(
        payloadBuilder: MemoryMCPPayloadBuilder,
        transport: MemoryMCPTransporting,
        archivedSourceResolver: @escaping @Sendable (CaptureItem) -> ArchivedSource?
    ) {
        self.payloadBuilder = payloadBuilder
        self.transport = transport
        self.archivedSourceResolver = archivedSourceResolver
    }

    public func write(item: CaptureItem) async throws {
        let payload = payloadBuilder.recordEventPayload(
            for: item,
            archivedSource: archivedSourceResolver(item)
        )
        try await transport.recordEvent(payload)
    }
}
```

- [ ] **Step 3: Verify writer tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPWriterTests`

Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git add Sources/AgentMemoryCore/MemoryMCPWriter.swift Tests/AgentMemoryCoreTests/MemoryMCPWriterTests.swift
git commit -m "Add Memory MCP writer adapter"
```

---

### Task 3: README And PR

**Files:**
- Modify: `README.md`
- Modify: `docs/superpowers/plans/2026-06-19-agentmemory-memory-mcp-writer.md`

- [ ] **Step 1: Update README**

Add to the current build slice list:

```markdown
- Memory MCP `record_event` payload builder and writer adapter
```

- [ ] **Step 2: Mark plan complete**

Change completed checklist items in this plan from `- [ ]` to `- [x]`.

- [ ] **Step 3: Final verification**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [ ] **Step 4: Commit docs**

```bash
git add README.md docs/superpowers/plans/2026-06-19-agentmemory-memory-mcp-writer.md
git commit -m "Document Memory MCP writer boundary"
```

- [ ] **Step 5: Push and open PR**

```bash
git push -u origin codex/agentmemory-memory-mcp-writer
```

Open a draft PR titled `[codex] Add Memory MCP writer adapter`.

---

## Self-Review

Spec coverage:

- Memory MCP write boundary: implemented as payload builder plus writer adapter.
- Provenance: payload includes archived source path, original path, and byte size when available.
- Live MCP transport: intentionally abstracted behind `MemoryMCPTransporting`; settings and real endpoint/session handshake remain next.
- App integration: app still uses `MockMemoryWriter` until a settings/config slice chooses a live transport.

Placeholder scan: all implementation steps include exact code and commands.

Type consistency: `MemoryMCPRecordEventPayload`, `MemoryMCPPayloadBuilder`, `MemoryMCPTransporting`, and `MemoryMCPWriter` are introduced before use.
