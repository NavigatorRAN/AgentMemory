# AgentMemory Stack Import Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add drag/drop and multi-item stack import so AgentMemory can queue several pasted strings or file URLs at once.

**Architecture:** Keep dropped-item conversion in `AgentMemoryCore` with a small `CaptureStackBuilder` that produces `CaptureItem` values from text snippets and file URLs. Add view-model methods for batch enqueue/persist. Add a SwiftUI drop zone that accepts text and file URLs and displays the result in the existing queue.

**Tech Stack:** Swift 6, SwiftUI `.dropDestination`, Foundation URL/file APIs, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/CaptureStackBuilder.swift`: Builds queue items from text stacks and file URLs.
- `Tests/AgentMemoryCoreTests/CaptureStackBuilderTests.swift`: Tests text splitting, file URL naming, and empty input filtering.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Adds batch enqueue helpers for raw strings and URLs.
- `Sources/AgentMemoryApp/ContentView.swift`: Adds a drop zone and wires text/file drops into the view model.
- `README.md`: Notes drag/drop stack import in the current build slice.

---

### Task 1: Core Stack Builder

**Files:**
- Create: `Sources/AgentMemoryCore/CaptureStackBuilder.swift`
- Create: `Tests/AgentMemoryCoreTests/CaptureStackBuilderTests.swift`

- [ ] **Step 1: Add failing tests**

Create `Tests/AgentMemoryCoreTests/CaptureStackBuilderTests.swift`:

```swift
import XCTest
@testable import AgentMemoryCore

final class CaptureStackBuilderTests: XCTestCase {
    func testBuildsItemsFromTextLines() {
        let builder = CaptureStackBuilder()
        let items = builder.items(fromTextStack: "https://example.com\n\nDecision: keep local source archive")

        XCTAssertEqual(items.count, 2)
        XCTAssertEqual(items[0].displayName, "example.com")
        XCTAssertEqual(items[0].rawInput, "https://example.com")
        XCTAssertEqual(items[1].displayName, "Decision: keep local source archive")
        XCTAssertEqual(items[1].rawInput, "Decision: keep local source archive")
    }

    func testBuildsItemsFromFileURLs() {
        let builder = CaptureStackBuilder()
        let urls = [
            URL(fileURLWithPath: "/tmp/research.pdf"),
            URL(fileURLWithPath: "/tmp/screenshot.png")
        ]

        let items = builder.items(fromFileURLs: urls)

        XCTAssertEqual(items.map(\.displayName), ["research.pdf", "screenshot.png"])
        XCTAssertEqual(items.map(\.rawInput), ["/tmp/research.pdf", "/tmp/screenshot.png"])
    }

    func testEmptyTextStackProducesNoItems() {
        let builder = CaptureStackBuilder()

        XCTAssertEqual(builder.items(fromTextStack: " \n\n\t ").count, 0)
    }
}
```

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter CaptureStackBuilderTests`

Expected: FAIL because `CaptureStackBuilder` does not exist.

- [ ] **Step 2: Implement stack builder**

Create `Sources/AgentMemoryCore/CaptureStackBuilder.swift`:

```swift
import Foundation

public struct CaptureStackBuilder: Sendable {
    public init() {}

    public func items(fromTextStack text: String) -> [CaptureItem] {
        text
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .map { rawInput in
                CaptureItem(displayName: suggestedTitle(for: rawInput), rawInput: rawInput)
            }
    }

    public func items(fromFileURLs urls: [URL]) -> [CaptureItem] {
        urls.map { url in
            CaptureItem(displayName: url.lastPathComponent, rawInput: url.path)
        }
    }

    private func suggestedTitle(for rawInput: String) -> String {
        if let url = URL(string: rawInput), let host = url.host {
            return host
        }

        return String(rawInput.prefix(40))
    }
}
```

- [ ] **Step 3: Verify builder tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter CaptureStackBuilderTests`

Expected: PASS.

- [ ] **Step 4: Commit**

```bash
git add Sources/AgentMemoryCore/CaptureStackBuilder.swift Tests/AgentMemoryCoreTests/CaptureStackBuilderTests.swift
git commit -m "Add capture stack builder"
```

---

### Task 2: View Model Batch Enqueue

**Files:**
- Modify: `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`

- [ ] **Step 1: Add batch methods**

Add these methods to `AgentMemoryViewModel` after `addCapture()`:

```swift
    func addTextStack(_ text: String) {
        let items = CaptureStackBuilder().items(fromTextStack: text)
        addBatch(items, sourceLabel: "text stack")
    }

    func addFileURLs(_ urls: [URL]) {
        let items = CaptureStackBuilder().items(fromFileURLs: urls)
        addBatch(items, sourceLabel: "file stack")
    }

    private func addBatch(_ items: [CaptureItem], sourceLabel: String) {
        guard !items.isEmpty else {
            statusMessage = "No captures found in \(sourceLabel)."
            return
        }

        snapshot.items.append(contentsOf: items)
        statusMessage = "Added \(items.count) captures from \(sourceLabel)."
        save()
    }
```

- [ ] **Step 2: Verify app builds**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [ ] **Step 3: Commit**

```bash
git add Sources/AgentMemoryApp/AgentMemoryViewModel.swift
git commit -m "Add batch enqueue actions"
```

---

### Task 3: SwiftUI Drop Zone

**Files:**
- Modify: `Sources/AgentMemoryApp/ContentView.swift`

- [ ] **Step 1: Add drop zone to detail stack**

In `ContentView`, insert `dropZone` between `capturePanel` and `queueSummary`.

Add this computed view:

```swift
    private var dropZone: some View {
        VStack(spacing: 8) {
            Image(systemName: "tray.and.arrow.down")
                .font(.largeTitle)
            Text("Drop files, URLs, or a stack of text lines")
                .font(.headline)
            Text("Each dropped file or non-empty line becomes a queued capture.")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 140)
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
        .dropDestination(for: URL.self) { urls, _ in
            viewModel.addFileURLs(urls)
            return true
        }
        .dropDestination(for: String.self) { strings, _ in
            viewModel.addTextStack(strings.joined(separator: "\n"))
            return true
        }
    }
```

- [ ] **Step 2: Verify build and tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

- [ ] **Step 3: Commit**

```bash
git add Sources/AgentMemoryApp/ContentView.swift
git commit -m "Add stack import drop zone"
```

---

### Task 4: Final Docs And PR

**Files:**
- Modify: `README.md`
- Modify: `docs/superpowers/plans/2026-06-19-agentmemory-stack-import.md`

- [ ] **Step 1: Update README**

Add to the current build slice list:

```markdown
- Drag/drop stack import for files, URLs, and multi-line text
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
git add README.md docs/superpowers/plans/2026-06-19-agentmemory-stack-import.md
git commit -m "Document stack import flow"
```

- [ ] **Step 5: Push and open PR**

```bash
git push -u origin codex/agentmemory-stack-import
```

Open a draft PR titled `[codex] Add stack import`.

---

## Self-Review

Spec coverage:

- Mixed stacks: implemented for dropped files and multi-line text.
- App inbox: drop zone supplements existing manual entry.
- Persistence: batch enqueue calls existing save path.
- Overnight processing: still future; this slice queues stacks but does not schedule background processing.
- Share extension/watched folders: still future capture surfaces.

Placeholder scan: all implementation steps include exact code and verification commands.

Type consistency: `CaptureStackBuilder`, `addTextStack`, and `addFileURLs` are introduced before use.
