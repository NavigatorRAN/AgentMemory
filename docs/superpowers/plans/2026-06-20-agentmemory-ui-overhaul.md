# AgentMemory UI Overhaul Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Turn the current single-scroll developer dashboard into the approved workspace-based AgentMemory UI with separate Ingestion, Review, Search, Memory Graph, and RAG Queue pages.

**Architecture:** Add a small app workspace selection model in `AgentMemoryCore`, expose it through `AgentMemoryViewModel`, and split the current `ContentView` into focused SwiftUI workspace views. Reuse the existing backend actions and graph projection code; this pass changes layout, action grouping, and visual hierarchy rather than replacing backend behavior.

**Tech Stack:** Swift 6, SwiftUI on macOS 14, Observation, XCTest, existing AgentMemoryCore services.

---

## File Structure

- Create `Sources/AgentMemoryCore/AgentMemoryWorkspace.swift`: Defines primary workspace cases, display labels, symbols, and descriptions.
- Test `Tests/AgentMemoryCoreTests/AgentMemoryWorkspaceTests.swift`: Verifies workspace order and metadata.
- Modify `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Adds selected workspace state and lightweight workspace helper counts.
- Replace `Sources/AgentMemoryApp/ContentView.swift`: Keeps root split layout and shared helper views only.
- Create `Sources/AgentMemoryApp/IngestionWorkspaceView.swift`: Capture add, drop zone, queue summary, batch actions, latest batch, morning brief.
- Create `Sources/AgentMemoryApp/ReviewWorkspaceView.swift`: Review queue and focused review editor/actions.
- Create `Sources/AgentMemoryApp/SearchWorkspaceView.swift`: Memory MCP search, recall, detail, browse results.
- Create `Sources/AgentMemoryApp/GraphWorkspaceView.swift`: Full graph canvas, graph metrics, graph node list, graph inspector.
- Create `Sources/AgentMemoryApp/RAGWorkspaceView.swift`: RAG queue stats, export history, selected export actions.
- Create `Sources/AgentMemoryApp/WorkspaceSharedViews.swift`: Small reusable metric cards, status rows, and formatting helpers used across workspace views.
- Modify `README.md`: Replace “graph rendering planned next” language and note workspace-based UI.

---

### Task 1: Workspace Model

**Files:**
- Create: `Sources/AgentMemoryCore/AgentMemoryWorkspace.swift`
- Create: `Tests/AgentMemoryCoreTests/AgentMemoryWorkspaceTests.swift`
- Modify: `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`

- [x] **Step 1: Write the failing workspace metadata test**

Create `Tests/AgentMemoryCoreTests/AgentMemoryWorkspaceTests.swift`:

```swift
import XCTest
@testable import AgentMemoryCore

final class AgentMemoryWorkspaceTests: XCTestCase {
    func testWorkspaceOrderAndDisplayMetadata() {
        XCTAssertEqual(AgentMemoryWorkspace.allCases, [.ingestion, .review, .search, .graph, .rag])
        XCTAssertEqual(AgentMemoryWorkspace.ingestion.title, "Ingestion")
        XCTAssertEqual(AgentMemoryWorkspace.review.systemImage, "checklist")
        XCTAssertEqual(AgentMemoryWorkspace.search.subtitle, "Find saved memory, entities, and source-backed context.")
        XCTAssertEqual(AgentMemoryWorkspace.graph.title, "Memory Graph")
        XCTAssertEqual(AgentMemoryWorkspace.rag.systemImage, "shippingbox")
    }
}
```

- [x] **Step 2: Run the failing test**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryWorkspaceTests
```

Expected: FAIL because `AgentMemoryWorkspace` does not exist.

- [x] **Step 3: Implement the workspace model**

Create `Sources/AgentMemoryCore/AgentMemoryWorkspace.swift`:

```swift
public enum AgentMemoryWorkspace: String, CaseIterable, Identifiable, Codable, Sendable {
    case ingestion
    case review
    case search
    case graph
    case rag

    public var id: String { rawValue }

    public var title: String {
        switch self {
        case .ingestion: "Ingestion"
        case .review: "Review"
        case .search: "Search"
        case .graph: "Memory Graph"
        case .rag: "RAG Queue"
        }
    }

    public var subtitle: String {
        switch self {
        case .ingestion: "Drop stacks, fetch source text, and run overnight batches."
        case .review: "Approve, edit, skip, retry, and export uncertain captures."
        case .search: "Find saved memory, entities, and source-backed context."
        case .graph: "Explore Memory MCP entities, events, communities, and evidence paths."
        case .rag: "Inspect remote RAG queue health, exports, jobs, and failures."
        }
    }

    public var systemImage: String {
        switch self {
        case .ingestion: "tray.and.arrow.down"
        case .review: "checklist"
        case .search: "magnifyingglass"
        case .graph: "point.3.connected.trianglepath.dotted"
        case .rag: "shippingbox"
        }
    }
}
```

- [x] **Step 4: Add view-model selected workspace**

In `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`, add:

```swift
var selectedWorkspace: AgentMemoryWorkspace = .graph
```

near the other selected state.

- [x] **Step 5: Run the workspace test**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryWorkspaceTests
```

Expected: PASS.

---

### Task 2: Shared View Utilities

**Files:**
- Create: `Sources/AgentMemoryApp/WorkspaceSharedViews.swift`

- [x] **Step 1: Create shared UI helpers**

Create `Sources/AgentMemoryApp/WorkspaceSharedViews.swift`:

```swift
import AgentMemoryCore
import SwiftUI

struct WorkspaceMetric: View {
    var title: String
    var value: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(value.formatted())
                .font(.title2.bold())
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .frame(minWidth: 96, alignment: .leading)
        .padding(10)
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
    }
}

struct WorkspacePanel<Content: View>: View {
    var title: String
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.quaternary.opacity(0.55), in: RoundedRectangle(cornerRadius: 8))
    }
}

struct WorkspaceEmptyState: View {
    var title: String
    var message: String
    var systemImage: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: systemImage)
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
            Text(message)
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 180)
    }
}

func attemptSummary(for item: CaptureItem) -> String {
    guard let lastAttemptAt = item.lastAttemptAt else {
        return "\(item.attemptCount) attempts"
    }

    return "\(item.attemptCount) attempts, last \(lastAttemptAt.formatted(date: .abbreviated, time: .shortened))"
}

func ragExportSummary(for item: CaptureItem) -> String {
    guard let ragExport = item.ragExport else {
        return "Not exported"
    }

    var parts = [
        "Job #\(ragExport.jobID)",
        ragExport.collection,
        ragExport.exportedAt.formatted(date: .abbreviated, time: .shortened)
    ]

    if let remoteStatus = ragExport.remoteStatus {
        parts.append(remoteStatus)
    }

    if let chunksUpserted = ragExport.chunksUpserted {
        parts.append("\(chunksUpserted) chunks")
    }

    if let docID = ragExport.docID {
        parts.append(docID)
    }

    return parts.joined(separator: " | ")
}
```

- [x] **Step 2: Build**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: PASS.

---

### Task 3: Workspace Root Layout

**Files:**
- Replace: `Sources/AgentMemoryApp/ContentView.swift`

- [x] **Step 1: Replace root with workspace navigation**

Replace `Sources/AgentMemoryApp/ContentView.swift` with a root `NavigationSplitView` that:

- Shows `AgentMemoryWorkspace.allCases` in a native sidebar.
- Binds selection to `viewModel.selectedWorkspace`.
- Keeps capture list in the sidebar under a separate `Captures` section.
- Shows the selected workspace view in detail.
- Uses a toolbar with contextual actions instead of the old global button belt.

The replacement must call these child views, which later tasks create:

```swift
IngestionWorkspaceView(viewModel: viewModel)
ReviewWorkspaceView(viewModel: viewModel)
SearchWorkspaceView(viewModel: viewModel)
GraphWorkspaceView(viewModel: viewModel)
RAGWorkspaceView(viewModel: viewModel)
```

- [x] **Step 2: Build to see missing child views**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: FAIL because child workspace view files do not exist yet.

---

### Task 4: Ingestion Workspace

**Files:**
- Create: `Sources/AgentMemoryApp/IngestionWorkspaceView.swift`

- [x] **Step 1: Create ingestion workspace**

Create `IngestionWorkspaceView` with:

- Header.
- Add capture form.
- Large drop zone.
- Queue metrics.
- Grouped batch buttons: Add, Process Next, Process All, Run Overnight, Fetch Web Pages, Fetch YouTube, Retry Failed.
- Latest batch run and morning brief.

- [x] **Step 2: Build**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: still FAIL until remaining workspace files are created.

---

### Task 5: Review Workspace

**Files:**
- Create: `Sources/AgentMemoryApp/ReviewWorkspaceView.swift`

- [x] **Step 1: Create review workspace**

Create `ReviewWorkspaceView` with:

- Review count and `Next Review` button.
- Selected capture review fields.
- Source archive metadata and preview.
- Editable raw input, outcomes, and custom tags.
- Contextual buttons: Save Review Edits, Approve Write, Skip, Retry Selected, Export to RAG.

- [x] **Step 2: Build**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: still FAIL until remaining workspace files are created.

---

### Task 6: Search Workspace

**Files:**
- Create: `Sources/AgentMemoryApp/SearchWorkspaceView.swift`

- [x] **Step 1: Create search workspace**

Create `SearchWorkspaceView` with:

- Memory search field.
- Grouped search actions: Search, Recall Entity, Entity Detail, Browse Entities.
- Entity result cards.
- Entity detail panel.
- Memory search event results.

- [x] **Step 2: Build**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: still FAIL until remaining workspace files are created.

---

### Task 7: Graph Workspace

**Files:**
- Create: `Sources/AgentMemoryApp/GraphWorkspaceView.swift`

- [x] **Step 1: Create graph workspace**

Create `GraphWorkspaceView` with:

- Full-height graph canvas.
- Graph metrics.
- Clear Focus button only when focus exists.
- Graph node cards in a side/inspector section.
- Selected graph summary.
- Canvas tap-to-focus behavior copied from the existing graph preview.

- [x] **Step 2: Build**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: still FAIL until RAG workspace is created.

---

### Task 8: RAG Workspace

**Files:**
- Create: `Sources/AgentMemoryApp/RAGWorkspaceView.swift`

- [x] **Step 1: Create RAG workspace**

Create `RAGWorkspaceView` with:

- Queue stats refresh.
- Remote queue counts.
- Latest RAG export run.
- Status counts for recorded jobs.
- Buttons for Export Selected, Export Completed, Refresh Job Status, Refresh Queue Stats.

- [x] **Step 2: Build**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: PASS.

---

### Task 9: Polish Root Actions And README

**Files:**
- Modify: `Sources/AgentMemoryApp/ContentView.swift`
- Modify: `README.md`

- [x] **Step 1: Ensure no old global action belt remains**

Search:

```bash
rg -n "Process All Queued|Run Overnight Batch|Fetch Web Pages|Fetch YouTube|Export Completed RAG|Refresh RAG Status|actionBar|graphPlaceholder|memorySearchPanel|capturePanel" Sources/AgentMemoryApp
```

Expected: old helper names should not appear in `ContentView.swift`; action labels may appear only inside their relevant workspace files.

- [x] **Step 2: Update README**

Add bullets for:

- Workspace-based UI with dedicated Ingestion, Review, Search, Memory Graph, and RAG Queue pages.
- Graph-first workspace inspired by GraphRAG community/evidence maps.
- Contextual action groups replacing the overflowing global button belt.

Remove `graph rendering` from the planned-next sentence.

- [x] **Step 3: Build**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
```

Expected: PASS.

---

### Task 10: Full Verification And PR

**Files:**
- Modify: `docs/superpowers/plans/2026-06-20-agentmemory-ui-overhaul.md`

- [x] **Step 1: Run full verification**

Run:

```bash
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test
DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build
./script/build_and_run.sh --verify
```

Expected: PASS.

- [x] **Step 2: Mark plan verification complete**

Update this plan with the actual commands that passed.

- [x] **Step 3: Commit and open PR**

Run:

```bash
git add README.md Sources/AgentMemoryApp Sources/AgentMemoryCore Tests docs/superpowers/specs docs/superpowers/plans
git commit -m "Overhaul AgentMemory workspace UI"
git push -u origin codex/agentmemory-ui-overhaul
gh pr create --draft --base main --head codex/agentmemory-ui-overhaul --title "[codex] Overhaul AgentMemory workspace UI" --body "<summary and verification>"
```

- [x] **Step 4: Merge if clean**

If `gh pr view --json mergeStateStatus,statusCheckRollup` reports clean/no blocking checks, mark ready and squash-merge, then pull `main`.

---

## Self-Review

Verification results:

- `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryWorkspaceTests` passed.
- `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test` passed: 109 XCTest cases.
- `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build` passed.
- `./script/build_and_run.sh --verify` passed.

Spec coverage:

- Separate Ingestion, Review, Search, Graph, and RAG workspaces: Tasks 3-8.
- Button belt removal and contextual actions: Tasks 3-9.
- Graph as first-class workspace: Task 7.
- GraphRAG-inspired direction without full GraphRAG backend integration: Task 7 plus existing approved spec.
- README/docs update: Task 9.

Placeholder scan: no TBD/TODO placeholders remain.

Type consistency: workspace model uses `AgentMemoryWorkspace` everywhere; child workspace views take `@Bindable var viewModel: AgentMemoryViewModel`.
