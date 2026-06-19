# AgentMemory Source Archive Processing Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Archive raw capture source material automatically when queued captures are processed, and persist archive metadata in the snapshot.

**Architecture:** Add a core `CaptureProcessingService` that coordinates `ProcessingQueue` and `SourceArchive`. It accepts a snapshot, processes next/all queued items, archives newly processed items that do not already have archive metadata, and returns an updated snapshot. Update the app view model to use this service instead of manually creating queues.

**Tech Stack:** Swift 6, Swift Package Manager, Foundation file APIs, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/CaptureProcessingService.swift`: New orchestration service for processing plus archiving.
- `Tests/AgentMemoryCoreTests/CaptureProcessingServiceTests.swift`: Tests processing one/all captures, archive metadata persistence, and duplicate archive prevention.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Use the processing service with a source archive rooted under the disk store.
- `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`: Add `sourceArchiveRoot` helper.
- `README.md`: Note source archive integration.

---

### Task 1: Disk Store Archive Root

**Files:**
- Modify: `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`
- Modify: `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`

- [ ] **Step 1: Add archive root test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`:

```swift
func testDiskStoreSourceArchiveRootIsUnderStoreRoot() {
    let root = URL(fileURLWithPath: "/tmp/AgentMemoryTest", isDirectory: true)
    let store = AgentMemoryDiskStore(root: root)

    XCTAssertEqual(store.sourceArchiveRoot.path, "/tmp/AgentMemoryTest/Sources")
}
```

- [ ] **Step 2: Add archive root helper**

Add this computed property to `AgentMemoryDiskStore`:

```swift
    public var sourceArchiveRoot: URL {
        root.appendingPathComponent("Sources", isDirectory: true)
    }
```

- [ ] **Step 3: Verify test**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests/testDiskStoreSourceArchiveRootIsUnderStoreRoot`

Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git add Sources/AgentMemoryCore/AgentMemoryDiskStore.swift Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift
git commit -m "Add source archive root helper"
```

---

### Task 2: Capture Processing Service

**Files:**
- Create: `Sources/AgentMemoryCore/CaptureProcessingService.swift`
- Create: `Tests/AgentMemoryCoreTests/CaptureProcessingServiceTests.swift`

- [ ] **Step 1: Add processing service tests**

Create `Tests/AgentMemoryCoreTests/CaptureProcessingServiceTests.swift`:

```swift
import XCTest
@testable import AgentMemoryCore

final class CaptureProcessingServiceTests: XCTestCase {
    func testProcessNextArchivesProcessedCapture() async throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = CaptureProcessingService(
            archive: SourceArchive(root: root),
            memoryWriter: MockMemoryWriter()
        )
        let snapshot = AgentMemorySnapshot(
            items: [
                CaptureItem(displayName: "Decision", rawInput: "Decision: archive source material")
            ]
        )

        let processed = await service.processNext(in: snapshot)

        XCTAssertEqual(processed.items[0].status, .complete)
        XCTAssertEqual(processed.archivedSources.count, 1)
        XCTAssertEqual(processed.archivedSources[0].itemID, processed.items[0].id)
        XCTAssertTrue(FileManager.default.fileExists(atPath: processed.archivedSources[0].archivedPath))
    }

    func testProcessAllArchivesEachNewlyProcessedCaptureOnce() async {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = CaptureProcessingService(
            archive: SourceArchive(root: root),
            memoryWriter: MockMemoryWriter()
        )
        let first = CaptureItem(displayName: "Decision", rawInput: "Decision: archive source material")
        let second = CaptureItem(displayName: "Review", rawInput: "plain reference note")
        let archived = ArchivedSource(
            itemID: first.id,
            displayName: first.displayName,
            archivedPath: "/tmp/existing.txt",
            sourceType: .text,
            createdAt: Date(timeIntervalSince1970: 100)
        )
        let snapshot = AgentMemorySnapshot(items: [first, second], archivedSources: [archived])

        let processed = await service.processAllQueued(in: snapshot)

        XCTAssertEqual(processed.items.map(\.status), [.complete, .needsReview])
        XCTAssertEqual(processed.archivedSources.count, 2)
        XCTAssertEqual(processed.archivedSources.filter { $0.itemID == first.id }.count, 1)
        XCTAssertEqual(processed.archivedSources.filter { $0.itemID == second.id }.count, 1)
    }
}
```

- [ ] **Step 2: Implement processing service**

Create `Sources/AgentMemoryCore/CaptureProcessingService.swift`:

```swift
import Foundation

public struct CaptureProcessingService: Sendable {
    private let archive: SourceArchive
    private let memoryWriter: MemoryWriting

    public init(archive: SourceArchive, memoryWriter: MemoryWriting) {
        self.archive = archive
        self.memoryWriter = memoryWriter
    }

    public func processNext(in snapshot: AgentMemorySnapshot) async -> AgentMemorySnapshot {
        var updated = snapshot
        let queue = makeQueue(from: snapshot)
        await queue.processNext()
        updated.items = await queue.snapshotItems()
        updated.archivedSources = archiveNewlyProcessedItems(in: updated)
        return updated
    }

    public func processAllQueued(in snapshot: AgentMemorySnapshot) async -> AgentMemorySnapshot {
        var updated = snapshot
        let queue = makeQueue(from: snapshot)
        var previousItems = await queue.snapshotItems()

        while previousItems.contains(where: { $0.status == .queued }) {
            await queue.processNext()
            let currentItems = await queue.snapshotItems()
            if currentItems == previousItems {
                break
            }
            previousItems = currentItems
        }

        updated.items = await queue.snapshotItems()
        updated.archivedSources = archiveNewlyProcessedItems(in: updated)
        return updated
    }

    private func makeQueue(from snapshot: AgentMemorySnapshot) -> ProcessingQueue {
        ProcessingQueue(
            items: snapshot.items,
            sourceClassifier: SourceClassifier(),
            outcomeClassifier: OutcomeClassifier(),
            ruleEngine: RuleEngine(rules: snapshot.rules),
            memoryWriter: memoryWriter
        )
    }

    private func archiveNewlyProcessedItems(in snapshot: AgentMemorySnapshot) -> [ArchivedSource] {
        var archivedSources = snapshot.archivedSources
        let archivedIDs = Set(archivedSources.map(\.itemID))
        let processFinishedStatuses: Set<QueueStatus> = [.complete, .needsReview, .failed, .skipped]

        for item in snapshot.items where processFinishedStatuses.contains(item.status) && !archivedIDs.contains(item.id) {
            do {
                archivedSources.append(try archive.archive(item: item))
            } catch {
                archivedSources.append(
                    ArchivedSource(
                        itemID: item.id,
                        displayName: item.displayName,
                        archivedPath: "archive-error: \(error.localizedDescription)",
                        sourceType: item.sourceType,
                        createdAt: Date()
                    )
                )
            }
        }

        return archivedSources
    }
}
```

- [ ] **Step 3: Verify service tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter CaptureProcessingServiceTests`

Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git add Sources/AgentMemoryCore/CaptureProcessingService.swift Tests/AgentMemoryCoreTests/CaptureProcessingServiceTests.swift
git commit -m "Archive captures during processing"
```

---

### Task 3: View Model Integration

**Files:**
- Modify: `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`

- [ ] **Step 1: Add processing service to view model**

Add a stored property:

```swift
    private let processingService: CaptureProcessingService
```

Change the designated initializer to:

```swift
    init(
        store: AgentMemoryDiskStore,
        initialSnapshot: AgentMemorySnapshot = AgentMemorySnapshot(),
        processingService: CaptureProcessingService? = nil
    ) {
        self.store = store
        self.snapshot = initialSnapshot
        self.processingService = processingService ?? CaptureProcessingService(
            archive: SourceArchive(root: store.sourceArchiveRoot),
            memoryWriter: MockMemoryWriter()
        )
    }
```

Replace `processNext()` with:

```swift
    func processNext() {
        Task {
            snapshot = await processingService.processNext(in: snapshot)
            statusMessage = "Processed next queued item and archived source."
            save()
        }
    }
```

Replace `processAllQueued()` with:

```swift
    func processAllQueued() {
        Task {
            snapshot = await processingService.processAllQueued(in: snapshot)
            statusMessage = "Processed queued captures and archived sources."
            save()
        }
    }
```

- [ ] **Step 2: Verify build and tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [ ] **Step 3: Commit**

```bash
git add Sources/AgentMemoryApp/AgentMemoryViewModel.swift
git commit -m "Use archive-aware processing service"
```

---

### Task 4: README And PR

**Files:**
- Modify: `README.md`
- Modify: `docs/superpowers/plans/2026-06-19-agentmemory-source-archive-processing.md`

- [ ] **Step 1: Update README**

Add to the current build slice list:

```markdown
- Source archive metadata attached during processing
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
git add README.md docs/superpowers/plans/2026-06-19-agentmemory-source-archive-processing.md
git commit -m "Document source archive processing"
```

- [ ] **Step 5: Push and open PR**

```bash
git push -u origin codex/agentmemory-source-archive-processing
```

Open a draft PR titled `[codex] Archive sources during processing`.

---

## Self-Review

Spec coverage:

- Source archive: processed captures now get archived and snapshot metadata is updated.
- Queue processing: next/all processing is coordinated through a core service.
- Persistence: app still saves snapshots after processing.
- Real source file copying, RAG export, and Memory MCP writes remain future slices.

Placeholder scan: all steps include exact code and verification commands.

Type consistency: `CaptureProcessingService`, `sourceArchiveRoot`, and view-model APIs match existing core types.
