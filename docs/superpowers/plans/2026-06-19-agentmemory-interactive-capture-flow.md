# AgentMemory Interactive Capture Flow Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** Turn the AgentMemory dashboard from a static preview into an interactive local workflow that can add captures, process queued items, save snapshots to disk, and reload persisted state.

**Architecture:** Add a `@MainActor` `AgentMemoryViewModel` in the app target. The view model owns the `AgentMemorySnapshot`, talks to `AgentMemoryDiskStore`, uses `ProcessingQueue` for processing, and exposes small UI actions. `ContentView` becomes a view over the model, with text fields and buttons for add/process/save/reload.

**Tech Stack:** Swift 6, SwiftUI, Observation, Foundation JSON persistence, XCTest.

---

## File Structure

- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: New app-facing state owner and UI actions.
- `Sources/AgentMemoryApp/ContentView.swift`: Bind to the view model and add real controls.
- `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`: Add default app support directory helper.
- `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`: Cover default support path helper.
- `README.md`: Document the interactive capture slice.

---

### Task 1: App Store Location Helper

**Files:**
- Modify: `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`
- Modify: `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`

- [x] **Step 1: Add failing app support path test**

Append to `Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift`:

```swift
func testDefaultAppSupportRootUsesAgentMemoryDirectory() throws {
    let root = try AgentMemoryDiskStore.defaultAppSupportRoot(
        fileManager: .default,
        bundleIdentifier: "dev.navigatorran.AgentMemory"
    )

    XCTAssertEqual(root.lastPathComponent, "AgentMemory")
    XCTAssertTrue(root.path.contains("Application Support"))
}
```

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests/testDefaultAppSupportRootUsesAgentMemoryDirectory`

Expected: FAIL because `defaultAppSupportRoot` does not exist.

- [x] **Step 2: Implement default root helper**

Append to `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`:

```swift
public extension AgentMemoryDiskStore {
    static func defaultAppSupportRoot(
        fileManager: FileManager = .default,
        bundleIdentifier: String? = Bundle.main.bundleIdentifier
    ) throws -> URL {
        let base = try fileManager.url(
            for: .applicationSupportDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )

        let folderName = bundleIdentifier?.split(separator: ".").last.map(String.init) ?? "AgentMemory"
        return base.appendingPathComponent(folderName, isDirectory: true)
    }
}
```

- [x] **Step 3: Verify helper test**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryStoreTests/testDefaultAppSupportRootUsesAgentMemoryDirectory`

Expected: PASS.

- [x] **Step 4: Commit**

```bash
git add Sources/AgentMemoryCore/AgentMemoryDiskStore.swift Tests/AgentMemoryCoreTests/AgentMemoryStoreTests.swift
git commit -m "Add default app support store path"
```

---

### Task 2: View Model

**Files:**
- Create: `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`

- [x] **Step 1: Create view model**

Create `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`:

```swift
import AgentMemoryCore
import Foundation
import Observation

@MainActor
@Observable
final class AgentMemoryViewModel {
    var snapshot: AgentMemorySnapshot
    var captureText: String = ""
    var captureTitle: String = ""
    var statusMessage: String = "Ready"

    private let store: AgentMemoryDiskStore

    init(store: AgentMemoryDiskStore, initialSnapshot: AgentMemorySnapshot = AgentMemorySnapshot()) {
        self.store = store
        self.snapshot = initialSnapshot
    }

    convenience init() {
        let root = (try? AgentMemoryDiskStore.defaultAppSupportRoot()) ?? FileManager.default.temporaryDirectory.appendingPathComponent("AgentMemory", isDirectory: true)
        self.init(store: AgentMemoryDiskStore(root: root), initialSnapshot: AgentMemoryViewModel.sampleSnapshot)
        load()
        if snapshot.items.isEmpty {
            snapshot = AgentMemoryViewModel.sampleSnapshot
            save()
        }
    }

    var brief: MorningBrief {
        MorningBriefBuilder().build(from: snapshot.items)
    }

    func addCapture() {
        let rawInput = captureText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !rawInput.isEmpty else {
            statusMessage = "Add capture text or a URL first."
            return
        }

        let title = captureTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        let displayName = title.isEmpty ? suggestedTitle(for: rawInput) : title
        snapshot.items.append(CaptureItem(displayName: displayName, rawInput: rawInput))
        captureText = ""
        captureTitle = ""
        statusMessage = "Added \(displayName)."
        save()
    }

    func processNext() {
        Task {
            let queue = ProcessingQueue(
                items: snapshot.items,
                sourceClassifier: SourceClassifier(),
                outcomeClassifier: OutcomeClassifier(),
                ruleEngine: RuleEngine(rules: snapshot.rules),
                memoryWriter: MockMemoryWriter()
            )

            await queue.processNext()
            snapshot.items = await queue.snapshotItems()
            statusMessage = "Processed next queued item."
            save()
        }
    }

    func processAllQueued() {
        Task {
            let queue = ProcessingQueue(
                items: snapshot.items,
                sourceClassifier: SourceClassifier(),
                outcomeClassifier: OutcomeClassifier(),
                ruleEngine: RuleEngine(rules: snapshot.rules),
                memoryWriter: MockMemoryWriter()
            )

            var previousItems = await queue.snapshotItems()
            while previousItems.contains(where: { $0.status == .queued }) {
                await queue.processNext()
                let currentItems = await queue.snapshotItems()
                if currentItems == previousItems {
                    break
                }
                previousItems = currentItems
            }

            snapshot.items = await queue.snapshotItems()
            statusMessage = "Processed queued captures."
            save()
        }
    }

    func save() {
        do {
            try store.save(snapshot)
            statusMessage = "Saved local state."
        } catch {
            statusMessage = "Save failed: \(error.localizedDescription)"
        }
    }

    func load() {
        do {
            snapshot = try store.load()
            statusMessage = "Loaded local state."
        } catch {
            statusMessage = "Load failed: \(error.localizedDescription)"
        }
    }

    private func suggestedTitle(for rawInput: String) -> String {
        if let url = URL(string: rawInput), let host = url.host {
            return host
        }

        return String(rawInput.prefix(40))
    }

    static var sampleSnapshot: AgentMemorySnapshot {
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
}
```

- [x] **Step 2: Verify app builds**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [x] **Step 3: Commit**

```bash
git add Sources/AgentMemoryApp/AgentMemoryViewModel.swift
git commit -m "Add AgentMemory app view model"
```

---

### Task 3: Interactive Content View

**Files:**
- Modify: `Sources/AgentMemoryApp/ContentView.swift`

- [x] **Step 1: Replace static snapshot with view model**

Replace `Sources/AgentMemoryApp/ContentView.swift` with:

```swift
import AgentMemoryCore
import SwiftUI

struct ContentView: View {
    @State private var viewModel = AgentMemoryViewModel()

    var body: some View {
        NavigationSplitView {
            List {
                Section("Capture Inbox") {
                    ForEach(viewModel.snapshot.items) { item in
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
                    capturePanel
                    queueSummary
                    actionBar
                    statusLine
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

    private var capturePanel: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Add Capture")
                .font(.title2.bold())
            TextField("Optional title", text: $viewModel.captureTitle)
                .textFieldStyle(.roundedBorder)
            TextField("Paste text, URL, path, or log snippet", text: $viewModel.captureText, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(3...6)
            Button("Add to Queue") {
                viewModel.addCapture()
            }
            .keyboardShortcut(.return, modifiers: [.command])
        }
    }

    private var queueSummary: some View {
        Grid(alignment: .leading, horizontalSpacing: 18, verticalSpacing: 10) {
            GridRow {
                metric("Processed", viewModel.brief.processedCount)
                metric("Completed", viewModel.brief.completedCount)
                metric("Review", viewModel.brief.needsReviewCount)
                metric("Failed", viewModel.brief.failedCount)
            }
        }
    }

    private var actionBar: some View {
        HStack {
            Button("Process Next") {
                viewModel.processNext()
            }
            Button("Process All Queued") {
                viewModel.processAllQueued()
            }
            Button("Save") {
                viewModel.save()
            }
            Button("Reload") {
                viewModel.load()
            }
        }
    }

    private var statusLine: some View {
        Text(viewModel.statusMessage)
            .font(.callout)
            .foregroundStyle(.secondary)
    }

    private func metric(_ title: String, _ value: Int) -> some View {
        VStack(alignment: .leading) {
            Text("\(value)")
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

            ForEach(viewModel.brief.exceptions, id: \.self) { exception in
                Label(exception, systemImage: "exclamationmark.triangle")
            }

            ForEach(viewModel.brief.graphChanges, id: \.self) { change in
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

- [x] **Step 2: Verify build and tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

- [x] **Step 3: Commit**

```bash
git add Sources/AgentMemoryApp/ContentView.swift
git commit -m "Wire interactive capture dashboard"
```

---

### Task 4: README And Final Verification

**Files:**
- Modify: `README.md`
- Modify: `docs/superpowers/plans/2026-06-19-agentmemory-interactive-capture-flow.md`

- [x] **Step 1: Update README status**

Add to the current build slice list in `README.md`:

```markdown
- Interactive add/process/save/reload UI flow
- App view model backed by the JSON disk store
```

- [x] **Step 2: Mark completed plan steps**

Change completed checklist items in this plan from `- [x]` to `- [x]`.

- [x] **Step 3: Final verification**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [x] **Step 4: Commit docs**

```bash
git add README.md docs/superpowers/plans/2026-06-19-agentmemory-interactive-capture-flow.md
git commit -m "Document interactive capture flow"
```

- [x] **Step 5: Push and open PR**

```bash
git status --short --branch
git push -u origin codex/agentmemory-interactive-capture
```

Open a draft PR titled `[codex] Add interactive capture flow`.

---

## Self-Review

Spec coverage:

- In-app inbox: implemented through title/text capture fields and Add to Queue.
- Queue processing: Process Next and Process All Queued call the existing queue.
- Persistence: add/process/save/reload all flow through `AgentMemoryDiskStore`.
- Morning brief: still generated from persisted snapshot state.
- Full stack drag/drop, watched folders, share extension, real MCP writes, and graph rendering remain future slices.

Placeholder scan: all code-bearing steps include concrete code and exact verification commands.

Type consistency: `AgentMemoryViewModel`, `AgentMemorySnapshot`, `AgentMemoryDiskStore`, and `ProcessingQueue` usage matches existing APIs or APIs introduced in this plan.
