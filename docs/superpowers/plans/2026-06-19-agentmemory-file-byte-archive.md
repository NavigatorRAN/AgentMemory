# AgentMemory File Byte Archive Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Preserve real file contents in the local source archive when a capture points at an existing file.

**Architecture:** Extend `ArchivedSource` with optional original path and byte size metadata. Teach `SourceArchive` to detect existing file paths, copy bytes into the item archive directory using the original filename, and fall back to `source.txt` for text/URL captures. Keep the app-level processing flow unchanged because it already uses `SourceArchive`.

**Tech Stack:** Swift 6, Foundation file APIs, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/Models.swift`: Add optional archived source metadata.
- `Sources/AgentMemoryCore/SourceArchive.swift`: Copy existing file bytes into archive.
- `Tests/AgentMemoryCoreTests/SourceArchiveTests.swift`: Focused archive behavior tests.
- `README.md`: Note file-byte archiving in current slice.

---

### Task 1: Archived Source Metadata

**Files:**
- Modify: `Sources/AgentMemoryCore/Models.swift`

- [x] **Step 1: Extend ArchivedSource**

Replace `ArchivedSource` in `Sources/AgentMemoryCore/Models.swift` with:

```swift
public struct ArchivedSource: Codable, Equatable, Sendable {
    public var itemID: UUID
    public var displayName: String
    public var archivedPath: String
    public var sourceType: SourceType
    public var createdAt: Date
    public var originalPath: String?
    public var byteSize: Int64?

    public init(
        itemID: UUID,
        displayName: String,
        archivedPath: String,
        sourceType: SourceType,
        createdAt: Date,
        originalPath: String? = nil,
        byteSize: Int64? = nil
    ) {
        self.itemID = itemID
        self.displayName = displayName
        self.archivedPath = archivedPath
        self.sourceType = sourceType
        self.createdAt = createdAt
        self.originalPath = originalPath
        self.byteSize = byteSize
    }
}
```

- [x] **Step 2: Verify existing tests compile**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass because new fields have defaults.

- [x] **Step 3: Commit**

```bash
git add Sources/AgentMemoryCore/Models.swift
git commit -m "Extend archived source metadata"
```

---

### Task 2: File Byte Copying

**Files:**
- Modify: `Sources/AgentMemoryCore/SourceArchive.swift`
- Create: `Tests/AgentMemoryCoreTests/SourceArchiveTests.swift`

- [x] **Step 1: Add focused source archive tests**

Create `Tests/AgentMemoryCoreTests/SourceArchiveTests.swift`:

```swift
import XCTest
@testable import AgentMemoryCore

final class SourceArchiveTests: XCTestCase {
    func testArchiveCopiesExistingFileBytes() throws {
        let temporaryRoot = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: temporaryRoot, withIntermediateDirectories: true)
        let sourceFile = temporaryRoot.appendingPathComponent("source-note.txt")
        try Data("real file contents".utf8).write(to: sourceFile)

        let archiveRoot = temporaryRoot.appendingPathComponent("Archive", isDirectory: true)
        let archive = SourceArchive(root: archiveRoot)
        let item = CaptureItem(displayName: "source-note.txt", rawInput: sourceFile.path, sourceType: .text)

        let archived = try archive.archive(item: item)

        XCTAssertEqual(archived.originalPath, sourceFile.path)
        XCTAssertEqual(archived.byteSize, 18)
        XCTAssertEqual(URL(fileURLWithPath: archived.archivedPath).lastPathComponent, "source-note.txt")
        XCTAssertEqual(try String(contentsOfFile: archived.archivedPath, encoding: .utf8), "real file contents")
    }

    func testArchiveFallsBackToSourceTextForNonFileCapture() throws {
        let archiveRoot = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let archive = SourceArchive(root: archiveRoot)
        let item = CaptureItem(displayName: "Note", rawInput: "Decision: preserve source text", sourceType: .text)

        let archived = try archive.archive(item: item)

        XCTAssertNil(archived.originalPath)
        XCTAssertEqual(archived.byteSize, 30)
        XCTAssertEqual(URL(fileURLWithPath: archived.archivedPath).lastPathComponent, "source.txt")
        XCTAssertEqual(try String(contentsOfFile: archived.archivedPath, encoding: .utf8), "Decision: preserve source text")
    }
}
```

- [x] **Step 2: Update SourceArchive implementation**

Replace `SourceArchive.archive(item:)` with:

```swift
    public func archive(item: CaptureItem) throws -> ArchivedSource {
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let itemDirectory = root.appendingPathComponent(item.id.uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: itemDirectory, withIntermediateDirectories: true)

        let rawURL = URL(fileURLWithPath: item.rawInput)
        if FileManager.default.fileExists(atPath: rawURL.path) {
            let destinationURL = itemDirectory.appendingPathComponent(rawURL.lastPathComponent)
            if FileManager.default.fileExists(atPath: destinationURL.path) {
                try FileManager.default.removeItem(at: destinationURL)
            }
            try FileManager.default.copyItem(at: rawURL, to: destinationURL)
            let attributes = try FileManager.default.attributesOfItem(atPath: destinationURL.path)
            let byteSize = attributes[.size] as? NSNumber

            return ArchivedSource(
                itemID: item.id,
                displayName: item.displayName,
                archivedPath: destinationURL.path,
                sourceType: item.sourceType,
                createdAt: Date(),
                originalPath: rawURL.path,
                byteSize: byteSize?.int64Value
            )
        }

        let sourceURL = itemDirectory.appendingPathComponent("source.txt")
        let data = Data(item.rawInput.utf8)
        try data.write(to: sourceURL)

        return ArchivedSource(
            itemID: item.id,
            displayName: item.displayName,
            archivedPath: sourceURL.path,
            sourceType: item.sourceType,
            createdAt: Date(),
            byteSize: Int64(data.count)
        )
    }
```

- [x] **Step 3: Verify archive tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter SourceArchiveTests`

Expected: PASS.

- [x] **Step 4: Run full suite**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

- [x] **Step 5: Commit**

```bash
git add Sources/AgentMemoryCore/SourceArchive.swift Tests/AgentMemoryCoreTests/SourceArchiveTests.swift
git commit -m "Archive real file contents"
```

---

### Task 3: README And PR

**Files:**
- Modify: `README.md`
- Modify: `docs/superpowers/plans/2026-06-19-agentmemory-file-byte-archive.md`

- [x] **Step 1: Update README**

Add to the current build slice list:

```markdown
- Real file-byte copying into the local source archive
```

- [x] **Step 2: Mark plan complete**

Change completed checklist items in this plan from `- [x]` to `- [x]`.

- [x] **Step 3: Final verification**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [x] **Step 4: Commit docs**

```bash
git add README.md docs/superpowers/plans/2026-06-19-agentmemory-file-byte-archive.md
git commit -m "Document file byte archive"
```

- [x] **Step 5: Push and open PR**

```bash
git push -u origin codex/agentmemory-file-byte-archive
```

Open a draft PR titled `[codex] Archive real file contents`.

---

## Self-Review

Spec coverage:

- Local source archive: now stores actual file bytes for file-path captures and source text for text captures.
- Provenance: archive metadata now records original path and byte size where available.
- Drag/drop: dropped file paths now preserve source bytes when processed.
- Hashing, file metadata beyond size/path, and sandbox-scoped bookmarks remain future hardening.

Placeholder scan: all steps include exact code and commands.

Type consistency: `ArchivedSource` defaults preserve existing initializers, and `SourceArchive.archive(item:)` remains the single integration point used by processing.
