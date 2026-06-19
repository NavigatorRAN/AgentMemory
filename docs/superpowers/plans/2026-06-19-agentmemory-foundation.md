# AgentMemory Foundation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Build the first runnable macOS foundation for AgentMemory: a native SwiftUI app with a capture inbox, processing queue model, two-stage classification, source archive skeleton, rules/confidence gates, and a morning brief preview.

**Architecture:** Create a Swift Package Manager macOS app so the repo can build and test without Xcode project generation. Keep core ingestion behavior in a pure Swift `AgentMemoryCore` library with focused unit tests, and keep the SwiftUI app target thin. The first version uses deterministic local classifiers and mock writers so the UI and queue model work before wiring real Memory MCP or RAG MCP clients.

**Tech Stack:** Swift 6, Swift Package Manager, SwiftUI, XCTest, Foundation file APIs, local JSON persistence.

---

## File Structure

- `Package.swift`: SwiftPM package with `AgentMemoryCore`, `AgentMemoryApp`, and `AgentMemoryCoreTests`.
- `Sources/AgentMemoryCore/Models.swift`: Core enums and value types for sources, outcomes, queue items, rules, confidence, memory candidates, and morning briefs.
- `Sources/AgentMemoryCore/SourceClassifier.swift`: Deterministic source-type classifier.
- `Sources/AgentMemoryCore/OutcomeClassifier.swift`: Deterministic memory-outcome classifier for v1 fixtures.
- `Sources/AgentMemoryCore/RuleEngine.swift`: User-rule matching and routing decisions.
- `Sources/AgentMemoryCore/ProcessingQueue.swift`: Queue state machine, enqueue, pause, resume, retry, and processing loop.
- `Sources/AgentMemoryCore/SourceArchive.swift`: Local archive path and metadata writer skeleton.
- `Sources/AgentMemoryCore/MorningBriefBuilder.swift`: Builds digest, exceptions, and graph-change summary from queue results.
- `Sources/AgentMemoryCore/MockMemoryWriter.swift`: Mock Memory MCP and RAG export writers for tests and UI preview.
- `Sources/AgentMemoryApp/AgentMemoryApp.swift`: SwiftUI app entry point.
- `Sources/AgentMemoryApp/ContentView.swift`: App shell with inbox, queue, review, graph placeholder, and morning brief.
- `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`: Focused XCTest coverage for the first build slice.
- `README.md`: Add build and test commands.

---

### Task 1: Swift Package Scaffold

**Files:**
- Create: `Package.swift`
- Create: `Sources/AgentMemoryCore/Models.swift`
- Create: `Sources/AgentMemoryApp/AgentMemoryApp.swift`
- Create: `Sources/AgentMemoryApp/ContentView.swift`
- Create: `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`
- Modify: `README.md`

- [x] **Step 1: Create the package manifest**

Create `Package.swift`:

```swift
// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "AgentMemory",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "AgentMemoryCore", targets: ["AgentMemoryCore"]),
        .executable(name: "AgentMemory", targets: ["AgentMemoryApp"])
    ],
    targets: [
        .target(name: "AgentMemoryCore"),
        .executableTarget(
            name: "AgentMemoryApp",
            dependencies: ["AgentMemoryCore"]
        ),
        .testTarget(
            name: "AgentMemoryCoreTests",
            dependencies: ["AgentMemoryCore"]
        )
    ]
)
```

- [x] **Step 2: Add minimal core models**

Create `Sources/AgentMemoryCore/Models.swift`:

```swift
import Foundation

public enum SourceType: String, Codable, CaseIterable, Sendable {
    case url
    case video
    case pdf
    case image
    case text
    case codeOrLog
    case emailOrCalendar
    case folder
    case mixedBatch
    case unknown
}

public enum MemoryOutcome: String, Codable, CaseIterable, Sendable {
    case event
    case entity
    case link
    case decision
    case gotcha
    case task
    case reference
}

public enum QueueStatus: String, Codable, CaseIterable, Sendable {
    case queued
    case classifying
    case extracting
    case analyzing
    case writingMemory
    case exportingToRAG
    case complete
    case needsReview
    case failed
    case skipped
    case paused
}

public struct CaptureItem: Identifiable, Codable, Equatable, Sendable {
    public var id: UUID
    public var displayName: String
    public var rawInput: String
    public var createdAt: Date
    public var sourceType: SourceType
    public var status: QueueStatus
    public var proposedOutcomes: [MemoryOutcome]
    public var confidence: Double
    public var failureReason: String?

    public init(
        id: UUID = UUID(),
        displayName: String,
        rawInput: String,
        createdAt: Date = Date(),
        sourceType: SourceType = .unknown,
        status: QueueStatus = .queued,
        proposedOutcomes: [MemoryOutcome] = [],
        confidence: Double = 0,
        failureReason: String? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.rawInput = rawInput
        self.createdAt = createdAt
        self.sourceType = sourceType
        self.status = status
        self.proposedOutcomes = proposedOutcomes
        self.confidence = confidence
        self.failureReason = failureReason
    }
}
```

- [x] **Step 3: Add a minimal SwiftUI app**

Create `Sources/AgentMemoryApp/AgentMemoryApp.swift`:

```swift
import SwiftUI

@main
struct AgentMemoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

Create `Sources/AgentMemoryApp/ContentView.swift`:

```swift
import AgentMemoryCore
import SwiftUI

struct ContentView: View {
    @State private var items: [CaptureItem] = [
        CaptureItem(displayName: "WWDC video URL", rawInput: "https://developer.apple.com/videos/play/wwdc2026/101"),
        CaptureItem(displayName: "Terminal log", rawInput: "Error: Memory MCP unreachable")
    ]

    var body: some View {
        NavigationSplitView {
            List(selection: .constant(items.first?.id)) {
                Section("Capture Inbox") {
                    ForEach(items) { item in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.displayName)
                                .font(.headline)
                            Text(item.status.rawValue)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("AgentMemory")
        } detail: {
            VStack(alignment: .leading, spacing: 16) {
                Text("Agent Memory Ingestion Hub")
                    .font(.largeTitle.bold())
                Text("Drop mixed data stacks, classify sources, propose memory outcomes, and review the morning brief.")
                    .foregroundStyle(.secondary)
                HStack {
                    Button("Add Capture") {}
                    Button("Process Queue") {}
                    Button("Morning Brief") {}
                }
                Spacer()
            }
            .padding()
        }
    }
}
```

- [x] **Step 4: Add a smoke test**

Create `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
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
}
```

- [x] **Step 5: Update README commands**

Append to `README.md`:

```markdown

## Build

```bash
swift test
swift run AgentMemory
```
```

- [x] **Step 6: Verify the scaffold**

Run: `swift test`

Expected: build succeeds and `AgentMemoryCoreTests.testCaptureItemDefaultsToQueuedUnknownSource` passes.

- [x] **Step 7: Commit**

```bash
git add Package.swift Sources Tests README.md
git commit -m "Scaffold SwiftUI AgentMemory app"
```

---

### Task 2: Two-Stage Classification

**Files:**
- Create: `Sources/AgentMemoryCore/SourceClassifier.swift`
- Create: `Sources/AgentMemoryCore/OutcomeClassifier.swift`
- Modify: `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`

- [x] **Step 1: Add failing source-classifier tests**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
func testSourceClassifierRecognizesCommonCaptureTypes() {
    let classifier = SourceClassifier()

    XCTAssertEqual(classifier.classify(rawInput: "https://example.com/article"), .url)
    XCTAssertEqual(classifier.classify(rawInput: "https://youtube.com/watch?v=abc123"), .video)
    XCTAssertEqual(classifier.classify(rawInput: "/tmp/report.pdf"), .pdf)
    XCTAssertEqual(classifier.classify(rawInput: "/tmp/screenshot.png"), .image)
    XCTAssertEqual(classifier.classify(rawInput: "fatal error: connection refused"), .codeOrLog)
    XCTAssertEqual(classifier.classify(rawInput: "Plain note about a project decision"), .text)
}
```

Run: `swift test`

Expected: FAIL because `SourceClassifier` does not exist.

- [x] **Step 2: Implement source classifier**

Create `Sources/AgentMemoryCore/SourceClassifier.swift`:

```swift
import Foundation

public struct SourceClassifier: Sendable {
    public init() {}

    public func classify(rawInput: String) -> SourceType {
        let value = rawInput.trimmingCharacters(in: .whitespacesAndNewlines)
        let lowercased = value.lowercased()

        if lowercased.contains("youtube.com/watch") || lowercased.contains("youtu.be/") {
            return .video
        }

        if lowercased.hasPrefix("http://") || lowercased.hasPrefix("https://") {
            return .url
        }

        if lowercased.hasSuffix(".pdf") {
            return .pdf
        }

        if [".png", ".jpg", ".jpeg", ".heic", ".tiff"].contains(where: lowercased.hasSuffix) {
            return .image
        }

        if lowercased.contains("fatal error")
            || lowercased.contains("exception")
            || lowercased.contains("traceback")
            || lowercased.contains("connection refused") {
            return .codeOrLog
        }

        return value.isEmpty ? .unknown : .text
    }
}
```

- [x] **Step 3: Add failing outcome-classifier tests**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
func testOutcomeClassifierProposesMemoryOutcomes() {
    let classifier = OutcomeClassifier()

    XCTAssertEqual(classifier.classify(text: "Decision: keep Memory MCP as source of truth"), [.decision, .reference])
    XCTAssertEqual(classifier.classify(text: "Gotcha: transcript unavailable for this video"), [.gotcha, .reference])
    XCTAssertEqual(classifier.classify(text: "TODO: follow up on RAG export schema"), [.task, .reference])
    XCTAssertEqual(classifier.classify(text: "Memory MCP runs on the local Mac mini"), [.entity, .reference])
}
```

Run: `swift test`

Expected: FAIL because `OutcomeClassifier` does not exist.

- [x] **Step 4: Implement outcome classifier**

Create `Sources/AgentMemoryCore/OutcomeClassifier.swift`:

```swift
import Foundation

public struct OutcomeClassifier: Sendable {
    public init() {}

    public func classify(text: String) -> [MemoryOutcome] {
        let lowercased = text.lowercased()
        var outcomes: [MemoryOutcome] = []

        if lowercased.contains("decision:") || lowercased.contains("decided") {
            outcomes.append(.decision)
        }

        if lowercased.contains("gotcha:") || lowercased.contains("failed") || lowercased.contains("fix:") {
            outcomes.append(.gotcha)
        }

        if lowercased.contains("todo:") || lowercased.contains("follow up") {
            outcomes.append(.task)
        }

        if lowercased.contains("runs on")
            || lowercased.contains("is a")
            || lowercased.contains("source of truth") {
            outcomes.append(.entity)
        }

        if outcomes.isEmpty {
            outcomes.append(.reference)
        } else if !outcomes.contains(.reference) {
            outcomes.append(.reference)
        }

        return outcomes
    }
}
```

- [x] **Step 5: Verify classification tests**

Run: `swift test`

Expected: all tests pass.

- [x] **Step 6: Commit**

```bash
git add Sources/AgentMemoryCore/SourceClassifier.swift Sources/AgentMemoryCore/OutcomeClassifier.swift Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift
git commit -m "Add two-stage capture classification"
```

---

### Task 3: Rules And Confidence Gates

**Files:**
- Modify: `Sources/AgentMemoryCore/Models.swift`
- Create: `Sources/AgentMemoryCore/RuleEngine.swift`
- Modify: `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`

- [x] **Step 1: Extend models**

Append to `Sources/AgentMemoryCore/Models.swift`:

```swift
public enum ProcessingAction: String, Codable, Sendable {
    case autoWriteMemory
    case needsReview
    case archiveOnly
    case exportToRAG
}

public struct IngestionRule: Identifiable, Codable, Equatable, Sendable {
    public var id: UUID
    public var name: String
    public var sourceType: SourceType
    public var matchText: String?
    public var workspace: String
    public var actions: [ProcessingAction]

    public init(
        id: UUID = UUID(),
        name: String,
        sourceType: SourceType,
        matchText: String? = nil,
        workspace: String,
        actions: [ProcessingAction]
    ) {
        self.id = id
        self.name = name
        self.sourceType = sourceType
        self.matchText = matchText
        self.workspace = workspace
        self.actions = actions
    }
}

public struct RoutingDecision: Equatable, Sendable {
    public var workspace: String
    public var actions: [ProcessingAction]
    public var matchedRuleName: String?
}
```

- [x] **Step 2: Add failing rule-engine tests**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
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
```

Run: `swift test`

Expected: FAIL because `RuleEngine` does not exist.

- [x] **Step 3: Implement rule engine**

Create `Sources/AgentMemoryCore/RuleEngine.swift`:

```swift
import Foundation

public struct RuleEngine: Sendable {
    public var rules: [IngestionRule]

    public init(rules: [IngestionRule]) {
        self.rules = rules
    }

    public func route(item: CaptureItem) -> RoutingDecision {
        for rule in rules where rule.sourceType == item.sourceType {
            if let matchText = rule.matchText {
                guard item.rawInput.localizedCaseInsensitiveContains(matchText) else {
                    continue
                }
            }

            return RoutingDecision(
                workspace: rule.workspace,
                actions: rule.actions,
                matchedRuleName: rule.name
            )
        }

        return RoutingDecision(
            workspace: "Inbox",
            actions: [.needsReview],
            matchedRuleName: nil
        )
    }
}
```

- [x] **Step 4: Add confidence gate test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
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
```

Run: `swift test`

Expected: FAIL because `canAutoWrite` does not exist.

- [x] **Step 5: Implement confidence gate**

Append to `Sources/AgentMemoryCore/Models.swift`:

```swift
public extension CaptureItem {
    var canAutoWrite: Bool {
        confidence >= 0.85
            && !proposedOutcomes.isEmpty
            && !proposedOutcomes.contains(.link)
    }
}
```

- [x] **Step 6: Verify rules and confidence gates**

Run: `swift test`

Expected: all tests pass.

- [x] **Step 7: Commit**

```bash
git add Sources/AgentMemoryCore/Models.swift Sources/AgentMemoryCore/RuleEngine.swift Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift
git commit -m "Add routing rules and confidence gates"
```

---

### Task 4: Processing Queue And Mock Writers

**Files:**
- Create: `Sources/AgentMemoryCore/MockMemoryWriter.swift`
- Create: `Sources/AgentMemoryCore/ProcessingQueue.swift`
- Modify: `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`

- [x] **Step 1: Add failing queue processing test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
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
```

Run: `swift test`

Expected: FAIL because `ProcessingQueue` and `MockMemoryWriter` do not exist.

- [x] **Step 2: Implement mock writer**

Create `Sources/AgentMemoryCore/MockMemoryWriter.swift`:

```swift
import Foundation

public protocol MemoryWriting: Sendable {
    func write(item: CaptureItem) async throws
}

public struct MockMemoryWriter: MemoryWriting {
    public init() {}

    public func write(item: CaptureItem) async throws {
        if item.rawInput.localizedCaseInsensitiveContains("force write failure") {
            throw MemoryWriterError.rejectedFixture
        }
    }
}

public enum MemoryWriterError: Error, Equatable {
    case rejectedFixture
}
```

- [x] **Step 3: Implement processing queue**

Create `Sources/AgentMemoryCore/ProcessingQueue.swift`:

```swift
import Foundation

public actor ProcessingQueue {
    public private(set) var items: [CaptureItem] = []

    private let sourceClassifier: SourceClassifier
    private let outcomeClassifier: OutcomeClassifier
    private let ruleEngine: RuleEngine
    private let memoryWriter: MemoryWriting

    public init(
        sourceClassifier: SourceClassifier,
        outcomeClassifier: OutcomeClassifier,
        ruleEngine: RuleEngine,
        memoryWriter: MemoryWriting
    ) {
        self.sourceClassifier = sourceClassifier
        self.outcomeClassifier = outcomeClassifier
        self.ruleEngine = ruleEngine
        self.memoryWriter = memoryWriter
    }

    public func enqueue(rawInput: String, displayName: String) {
        items.append(CaptureItem(displayName: displayName, rawInput: rawInput))
    }

    public func processNext() async {
        guard let index = items.firstIndex(where: { $0.status == .queued }) else {
            return
        }

        items[index].status = .classifying
        items[index].sourceType = sourceClassifier.classify(rawInput: items[index].rawInput)

        items[index].status = .analyzing
        items[index].proposedOutcomes = outcomeClassifier.classify(text: items[index].rawInput)
        items[index].confidence = confidence(for: items[index])

        let decision = ruleEngine.route(item: items[index])

        if items[index].canAutoWrite || decision.actions.contains(.autoWriteMemory) {
            items[index].status = .writingMemory
            do {
                try await memoryWriter.write(item: items[index])
                items[index].status = .complete
            } catch {
                items[index].status = .failed
                items[index].failureReason = "Memory write failed: \\(error)"
            }
        } else {
            items[index].status = .needsReview
        }
    }

    public func pauseAll() {
        for index in items.indices where items[index].status == .queued {
            items[index].status = .paused
        }
    }

    public func resumePaused() {
        for index in items.indices where items[index].status == .paused {
            items[index].status = .queued
        }
    }

    private func confidence(for item: CaptureItem) -> Double {
        if item.proposedOutcomes.contains(.decision) || item.proposedOutcomes.contains(.gotcha) {
            return 0.9
        }

        if item.sourceType == .unknown {
            return 0.4
        }

        return 0.72
    }
}
```

- [x] **Step 4: Add pause/resume test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
func testProcessingQueueCanPauseAndResumeQueuedItems() async {
    let queue = ProcessingQueue(
        sourceClassifier: SourceClassifier(),
        outcomeClassifier: OutcomeClassifier(),
        ruleEngine: RuleEngine(rules: []),
        memoryWriter: MockMemoryWriter()
    )

    await queue.enqueue(rawInput: "Plain note", displayName: "Note")
    await queue.pauseAll()
    XCTAssertEqual(await queue.items[0].status, .paused)

    await queue.resumePaused()
    XCTAssertEqual(await queue.items[0].status, .queued)
}
```

- [x] **Step 5: Verify queue behavior**

Run: `swift test`

Expected: all tests pass.

- [x] **Step 6: Commit**

```bash
git add Sources/AgentMemoryCore/MockMemoryWriter.swift Sources/AgentMemoryCore/ProcessingQueue.swift Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift
git commit -m "Add processing queue foundation"
```

---

### Task 5: Source Archive And Morning Brief

**Files:**
- Create: `Sources/AgentMemoryCore/SourceArchive.swift`
- Create: `Sources/AgentMemoryCore/MorningBriefBuilder.swift`
- Modify: `Sources/AgentMemoryCore/Models.swift`
- Modify: `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`

- [x] **Step 1: Add archive and brief models**

Append to `Sources/AgentMemoryCore/Models.swift`:

```swift
public struct ArchivedSource: Codable, Equatable, Sendable {
    public var itemID: UUID
    public var displayName: String
    public var archivedPath: String
    public var sourceType: SourceType
    public var createdAt: Date
}

public struct MorningBrief: Equatable, Sendable {
    public var processedCount: Int
    public var completedCount: Int
    public var needsReviewCount: Int
    public var failedCount: Int
    public var newEntities: [String]
    public var graphChanges: [String]
    public var exceptions: [String]
}
```

- [x] **Step 2: Add failing source archive test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
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
```

Run: `swift test`

Expected: FAIL because `SourceArchive` does not exist.

- [x] **Step 3: Implement source archive**

Create `Sources/AgentMemoryCore/SourceArchive.swift`:

```swift
import Foundation

public struct SourceArchive: Sendable {
    public var root: URL

    public init(root: URL) {
        self.root = root
    }

    public func archive(item: CaptureItem) throws -> ArchivedSource {
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let itemDirectory = root.appendingPathComponent(item.id.uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: itemDirectory, withIntermediateDirectories: true)

        let sourceURL = itemDirectory.appendingPathComponent("source.txt")
        try item.rawInput.data(using: .utf8)?.write(to: sourceURL)

        return ArchivedSource(
            itemID: item.id,
            displayName: item.displayName,
            archivedPath: sourceURL.path,
            sourceType: item.sourceType,
            createdAt: Date()
        )
    }
}
```

- [x] **Step 4: Add failing morning brief test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift`:

```swift
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
```

Run: `swift test`

Expected: FAIL because `MorningBriefBuilder` does not exist.

- [x] **Step 5: Implement morning brief builder**

Create `Sources/AgentMemoryCore/MorningBriefBuilder.swift`:

```swift
import Foundation

public struct MorningBriefBuilder: Sendable {
    public init() {}

    public func build(from items: [CaptureItem]) -> MorningBrief {
        let completed = items.filter { $0.status == .complete }
        let needsReview = items.filter { $0.status == .needsReview }
        let failed = items.filter { $0.status == .failed }
        let entityNames = completed
            .filter { $0.proposedOutcomes.contains(.entity) }
            .map(\\.displayName)

        var exceptions = needsReview.map { "\\($0.displayName) needs review" }
        exceptions.append(contentsOf: failed.map { "\\($0.displayName): \\($0.failureReason ?? "Failed")" })

        let graphChanges = completed.isEmpty
            ? []
            : ["\\(completed.count) completed memory item updated the graph"]

        return MorningBrief(
            processedCount: items.count,
            completedCount: completed.count,
            needsReviewCount: needsReview.count,
            failedCount: failed.count,
            newEntities: entityNames,
            graphChanges: graphChanges,
            exceptions: exceptions
        )
    }
}
```

- [x] **Step 6: Verify archive and brief behavior**

Run: `swift test`

Expected: all tests pass.

- [x] **Step 7: Commit**

```bash
git add Sources/AgentMemoryCore/Models.swift Sources/AgentMemoryCore/SourceArchive.swift Sources/AgentMemoryCore/MorningBriefBuilder.swift Tests/AgentMemoryCoreTests/AgentMemoryCoreTests.swift
git commit -m "Add source archive and morning brief"
```

---

### Task 6: Wire UI To Core Preview State

**Files:**
- Modify: `Sources/AgentMemoryApp/ContentView.swift`

- [x] **Step 1: Replace placeholder UI with queue dashboard**

Replace `Sources/AgentMemoryApp/ContentView.swift` with:

```swift
import AgentMemoryCore
import SwiftUI

struct ContentView: View {
    @State private var items: [CaptureItem] = [
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
    ]

    private var brief: MorningBrief {
        MorningBriefBuilder().build(from: items)
    }

    var body: some View {
        NavigationSplitView {
            List {
                Section("Capture Inbox") {
                    ForEach(items) { item in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.displayName)
                                .font(.headline)
                            HStack {
                                Text(item.sourceType.rawValue)
                                Text(item.status.rawValue)
                            }
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("AgentMemory")
        } detail: {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    queueSummary
                    morningBrief
                    graphPlaceholder
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Agent Memory Ingestion Hub")
                .font(.largeTitle.bold())
            Text("Capture mixed data stacks, route them through rules and confidence gates, then write curated memory to Memory MCP.")
                .foregroundStyle(.secondary)
        }
    }

    private var queueSummary: some View {
        Grid(alignment: .leading, horizontalSpacing: 18, verticalSpacing: 10) {
            GridRow {
                metric("Processed", brief.processedCount)
                metric("Completed", brief.completedCount)
                metric("Review", brief.needsReviewCount)
                metric("Failed", brief.failedCount)
            }
        }
    }

    private func metric(_ title: String, _ value: Int) -> some View {
        VStack(alignment: .leading) {
            Text("\\(value)")
                .font(.title.bold())
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(minWidth: 110, alignment: .leading)
        .padding()
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
    }

    private var morningBrief: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Morning Brief")
                .font(.title2.bold())

            ForEach(brief.exceptions, id: \\.self) { exception in
                Label(exception, systemImage: "exclamationmark.triangle")
            }

            ForEach(brief.graphChanges, id: \\.self) { change in
                Label(change, systemImage: "point.3.connected.trianglepath.dotted")
            }
        }
    }

    private var graphPlaceholder: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Graph Changes")
                .font(.title2.bold())
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.quaternary)
                    .frame(height: 220)
                Text("3D graph renderer lands after the core queue and memory-write path.")
                    .foregroundStyle(.secondary)
            }
        }
    }
}
```

- [x] **Step 2: Verify app target builds**

Run: `swift build`

Expected: `Build complete!`

- [x] **Step 3: Verify tests still pass**

Run: `swift test`

Expected: all tests pass.

- [x] **Step 4: Commit**

```bash
git add Sources/AgentMemoryApp/ContentView.swift
git commit -m "Wire SwiftUI dashboard preview"
```

---

### Task 7: Final Verification And Push

**Files:**
- Modify: `README.md`
- Modify: `docs/superpowers/plans/2026-06-19-agentmemory-foundation.md`

- [x] **Step 1: Update README with current status**

Add this section to `README.md`:

```markdown

## Current Build Slice

The first build slice is a local SwiftUI foundation:

- Capture inbox preview
- Two-stage source and outcome classification
- Rule routing model
- Confidence gate model
- Processing queue actor
- Local source archive skeleton
- Morning brief builder
- Mock Memory MCP writer

Real Memory MCP/RAG MCP transport, share extension, watched folders, and graph rendering are planned next.
```

- [x] **Step 2: Mark plan checkboxes complete as implemented**

Edit `docs/superpowers/plans/2026-06-19-agentmemory-foundation.md` so completed steps are checked.

- [x] **Step 3: Run final verification**

Run: `swift test`

Expected: all tests pass.

Run: `swift build`

Expected: build succeeds.

- [x] **Step 4: Push branch**

```bash
git status --short
git push
```

Expected: clean working tree after push.

---

## Self-Review

Spec coverage:

- Universal capture inbox: Task 1 and Task 6 provide the first in-app capture surface; share extension, watched folders, clipboard, and shortcuts remain planned next-step features.
- Batch queue: Task 4 implements the first processing queue actor; Task 6 visualizes a mixed stack; durable overnight persistence remains next.
- Two-stage classification: Task 2 implements source and outcome classification.
- Rules and confidence gates: Task 3 implements routing rules and auto-write confidence.
- Source archive: Task 5 implements local source metadata and source text persistence skeleton.
- Memory MCP/RAG: Task 4 introduces mock Memory writer; real MCP clients are deliberately deferred until the app skeleton and payload models are stable.
- Morning brief: Task 5 implements the builder; Task 6 shows it in UI.
- Graph/search: Task 6 provides a graph placeholder only; real graph/search belong in the next plan after the queue and data model exist.

Placeholder scan: this plan intentionally names deferred areas in the self-review and README status, but every implementation task has concrete file changes and verification commands.

Type consistency: all model names used by later tasks are introduced before use.
