# AgentMemory Durable Store Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Add a durable local store so AgentMemory can save and reload capture queue state, source archive metadata, rules, and morning briefs across app launches.

**Architecture:** Keep persistence in `AgentMemoryCore` as a small JSON document store so the app remains easy to inspect before choosing a heavier database. Introduce an `AgentMemoryStore` snapshot model, an `AgentMemoryDiskStore` for atomic load/save, and queue snapshot import/export methods. The SwiftUI app will use the store to seed its preview state and expose a clear persistence boundary for the next slice.

**Tech Stack:** Swift 6, Swift Package Manager, Foundation `Codable`, JSONEncoder/JSONDecoder, atomic file replacement, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/Models.swift`: Add persisted app-state models.
- `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`: JSON load/save store for app snapshots.
- `Sources/AgentMemoryCore/ProcessingQueue.swift`: Add initialization from saved items and snapshot export.
- `Sources/AgentMemoryApp/ContentView.swift`: Use a stored sample state boundary rather than hard-coded loose arrays.
- `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`: Persistence, queue restore, archive metadata, and corrupted-file tests.
- `README.md`: Document the local JSON persistence slice.

---

### Task 1: Persisted State Models

**Files:**
- Modify: `Sources/AgentMemoryCore/Models.swift`
- Create: `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`

- [x] **Step 1: Add failing model round-trip test**

Create `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`:

```swift
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
}
```

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: FAIL because `AgentMemorySnapshot` and encoder helpers do not exist.

- [x] **Step 2: Add persisted snapshot models**

Append to `Sources/AgentMemoryCore/Models.swift`:

```swift
public struct AgentMemorySnapshot: Codable, Equatable, Sendable {
    public var version: Int
    public var items: [CaptureItem]
    public var rules: [IngestionRule]
    public var archivedSources: [ArchivedSource]
    public var morningBriefs: [MorningBrief]

    public init(
        version: Int = 1,
        items: [CaptureItem] = [],
        rules: [IngestionRule] = [],
        archivedSources: [ArchivedSource] = [],
        morningBriefs: [MorningBrief] = []
    ) {
        self.version = version
        self.items = items
        self.rules = rules
        self.archivedSources = archivedSources
        self.morningBriefs = morningBriefs
    }
}

public extension JSONEncoder {
    static var agentMemory: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }
}

public extension JSONDecoder {
    static var agentMemory: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
```

- [x] **Step 3: Verify model test**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests/testAgentMemorySnapshotRoundTripsThroughJSON`

Expected: PASS.

- [x] **Step 4: Commit**

```bash
git add Sources/AgentMemoryCore/Models.swift Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift
git commit -m "Add persisted AgentMemory snapshot model"
```

---

### Task 2: JSON Disk Store

**Files:**
- Create: `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`
- Modify: `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`

- [x] **Step 1: Add failing save/load test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`:

```swift
func testDiskStoreSavesAndLoadsSnapshot() throws {
    let root = URL(fileURLWithPath: NSTemporaryDirectory())
        .appendingPathComponent(UUID().uuidString, isDirectory: true)
    let store = AgentMemoryDiskStore(root: root)
    let snapshot = AgentMemorySnapshot(
        items: [
            CaptureItem(displayName: "Note", rawInput: "Decision: persist queue", sourceType: .text, status: .queued)
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
```

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests/testDiskStoreSavesAndLoadsSnapshot`

Expected: FAIL because `AgentMemoryDiskStore` does not exist.

- [x] **Step 2: Implement disk store**

Create `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`:

```swift
import Foundation

public struct AgentMemoryDiskStore: Sendable {
    public var root: URL
    public var snapshotURL: URL {
        root.appendingPathComponent("agent-memory-state.json")
    }

    public init(root: URL) {
        self.root = root
    }

    public func load() throws -> AgentMemorySnapshot {
        guard FileManager.default.fileExists(atPath: snapshotURL.path) else {
            return AgentMemorySnapshot()
        }

        let data = try Data(contentsOf: snapshotURL)
        return try JSONDecoder.agentMemory.decode(AgentMemorySnapshot.self, from: data)
    }

    public func save(_ snapshot: AgentMemorySnapshot) throws {
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let data = try JSONEncoder.agentMemory.encode(snapshot)
        let temporaryURL = root.appendingPathComponent("agent-memory-state.json.tmp")
        try data.write(to: temporaryURL, options: .atomic)

        if FileManager.default.fileExists(atPath: snapshotURL.path) {
            _ = try FileManager.default.replaceItemAt(snapshotURL, withItemAt: temporaryURL)
        } else {
            try FileManager.default.moveItem(at: temporaryURL, to: snapshotURL)
        }
    }
}
```

- [x] **Step 3: Add missing-file and corrupted-file tests**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`:

```swift
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
```

- [x] **Step 4: Verify disk store tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests`

Expected: all store tests pass.

- [x] **Step 5: Commit**

```bash
git add Sources/AgentMemoryCore/AgentMemoryDiskStore.swift Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift
git commit -m "Add JSON disk store"
```

---

### Task 3: Queue Snapshot Restore

**Files:**
- Modify: `Sources/AgentMemoryCore/ProcessingQueue.swift`
- Modify: `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`

- [x] **Step 1: Add failing queue restore test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`:

```swift
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

    XCTAssertEqual(await queue.snapshotItems(), savedItems)

    await queue.processNext()
    let processed = await queue.snapshotItems()
    XCTAssertEqual(processed[0].status, .complete)
    XCTAssertEqual(processed[1].status, .needsReview)
}
```

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests/testProcessingQueueRestoresFromSavedItems`

Expected: FAIL because the queue initializer and `snapshotItems` do not exist.

- [x] **Step 2: Add queue restore APIs**

Modify `Sources/AgentMemoryCore/ProcessingQueue.swift`:

```swift
public actor ProcessingQueue {
    public private(set) var items: [CaptureItem]

    private let sourceClassifier: SourceClassifier
    private let outcomeClassifier: OutcomeClassifier
    private let ruleEngine: RuleEngine
    private let memoryWriter: MemoryWriting

    public init(
        items: [CaptureItem] = [],
        sourceClassifier: SourceClassifier,
        outcomeClassifier: OutcomeClassifier,
        ruleEngine: RuleEngine,
        memoryWriter: MemoryWriting
    ) {
        self.items = items
        self.sourceClassifier = sourceClassifier
        self.outcomeClassifier = outcomeClassifier
        self.ruleEngine = ruleEngine
        self.memoryWriter = memoryWriter
    }
```

Add before the final closing brace:

```swift
    public func snapshotItems() -> [CaptureItem] {
        items
    }
```

- [x] **Step 3: Verify queue restore test**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests/testProcessingQueueRestoresFromSavedItems`

Expected: PASS.

- [x] **Step 4: Run full test suite**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

- [x] **Step 5: Commit**

```bash
git add Sources/AgentMemoryCore/ProcessingQueue.swift Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift
git commit -m "Restore processing queue from persisted items"
```

---

### Task 4: Stored UI State Boundary

**Files:**
- Modify: `Sources/AgentMemoryApp/ContentView.swift`
- Modify: `README.md`

- [x] **Step 1: Add sample snapshot factory**

Add this private property and helper to `Sources/AgentMemoryApp/ContentView.swift`:

```swift
    @State private var snapshot: AgentMemorySnapshot = ContentView.sampleSnapshot

    private static var sampleSnapshot: AgentMemorySnapshot {
        AgentMemorySnapshot(
            items: [
                CaptureItem(
                    displayName: "WWDC workflow URL",
                    rawInput: "https://developer.apple.com/videos/play/wwdc2026/101",
                    sourceType: .video,
                    status: .complete,
                    proposedOutcomes: [.decision, .reference],
                    confidence: 0.9
                ),
                CaptureItem(
                    displayName: "Terminal failure log",
                    rawInput: "fatal error: Memory MCP unreachable",
                    sourceType: .codeOrLog,
                    status: .needsReview,
                    proposedOutcomes: [.gotcha, .reference],
                    confidence: 0.74
                ),
                CaptureItem(
                    displayName: "Mixed source stack",
                    rawInput: "/Users/matthewwarren/Desktop/research-stack",
                    sourceType: .mixedBatch,
                    status: .queued,
                    proposedOutcomes: [],
                    confidence: 0
                )
            ],
            rules: [
                IngestionRule(
                    name: "WWDC videos",
                    sourceType: .video,
                    matchText: "developer.apple.com/videos",
                    workspace: "WWDC26",
                    actions: [.autoWriteMemory, .exportToRAG]
                )
            ]
        )
    }
```

Replace references to `items` with `snapshot.items`.

Replace the `brief` property with:

```swift
    private var brief: MorningBrief {
        MorningBriefBuilder().build(from: snapshot.items)
    }
```

- [x] **Step 2: Verify app build**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [x] **Step 3: Update README status**

Add to the current build slice list in `README.md`:

```markdown
- JSON-backed app snapshot model
- Disk store for queue, rules, source archive metadata, and morning brief history
- Queue restore from persisted capture items
```

- [x] **Step 4: Commit**

```bash
git add Sources/AgentMemoryApp/ContentView.swift README.md
git commit -m "Use persisted snapshot boundary in UI"
```

---

### Task 5: Final Verification And PR

**Files:**
- Modify: `docs/superpowers/plans/2026-06-19-agentmemory-durable-store.md`

- [x] **Step 1: Mark completed plan steps**

Change completed checklist items in this plan from `- [x]` to `- [x]`.

- [x] **Step 2: Run final checks**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [x] **Step 3: Commit plan completion**

```bash
git add docs/superpowers/plans/2026-06-19-agentmemory-durable-store.md
git commit -m "Document durable store implementation plan"
```

- [x] **Step 4: Push branch**

```bash
git status --short --branch
git push -u origin codex/agentmemory-durable-store
```

Expected: branch pushed and working tree clean.

---

## Self-Review

Spec coverage:

- Durable queue state: queue item snapshots and restore APIs are implemented.
- Source archive metadata: archived sources persist in the snapshot.
- Rules: rules persist in the snapshot.
- Morning briefs: brief history persists in the snapshot.
- Overnight processing survival: this slice gives the durable state substrate, but background processing and restart continuation remain future work.
- Real Memory MCP/RAG transport: intentionally deferred; this slice stabilizes state before network writes.

Placeholder scan: no implementation step depends on an unnamed future type or unspecified command.

Type consistency: `AgentMemorySnapshot`, `AgentMemoryDiskStore`, and `snapshotItems()` are introduced before later use.
