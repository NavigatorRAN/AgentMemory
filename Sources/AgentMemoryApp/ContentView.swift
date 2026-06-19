import AgentMemoryCore
import SwiftUI

struct ContentView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        NavigationSplitView {
            List(selection: $viewModel.selectedItemID) {
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
                        .tag(item.id)
                    }
                }
            }
            .navigationTitle("AgentMemory")
        } detail: {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    capturePanel
                    dropZone
                    queueSummary
                    actionBar
                    statusLine
                    reviewPanel
                    latestBatchRun
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
            Button("Run Overnight Batch") {
                viewModel.runQueuedBatch()
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

    private var reviewPanel: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Review Capture")
                    .font(.title2.bold())
                Spacer()
                Text("\(viewModel.reviewItems.count) waiting")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            if let item = viewModel.selectedItem {
                Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 8) {
                    GridRow {
                        Text("Title")
                            .foregroundStyle(.secondary)
                        TextField(
                            "Review title",
                            text: Binding(
                                get: { viewModel.selectedItemTitleBindingValue() },
                                set: { viewModel.updateSelectedItemTitle($0) }
                            )
                        )
                        .textFieldStyle(.roundedBorder)
                    }
                    GridRow {
                        Text("Status")
                            .foregroundStyle(.secondary)
                        Text(item.status.rawValue)
                    }
                    GridRow {
                        Text("Source")
                            .foregroundStyle(.secondary)
                        Text(item.sourceType.rawValue)
                    }
                    GridRow {
                        Text("Confidence")
                            .foregroundStyle(.secondary)
                        Text(item.confidence.formatted(.number.precision(.fractionLength(2))))
                    }
                    GridRow {
                        Text("Outcomes")
                            .foregroundStyle(.secondary)
                        Text(item.proposedOutcomes.map(\.rawValue).joined(separator: ", "))
                    }
                }

                Text("Review Reasons")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(viewModel.selectedReviewExplanations, id: \.self) { explanation in
                        Label(explanation, systemImage: "info.circle")
                            .foregroundStyle(.secondary)
                    }
                }

                Text("Source Archive")
                    .font(.headline)
                if let archivedSource = viewModel.selectedArchivedSource {
                    Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 8) {
                        GridRow {
                            Text("Archived")
                                .foregroundStyle(.secondary)
                            Text(archivedSource.archivedPath)
                                .textSelection(.enabled)
                        }
                        GridRow {
                            Text("Original")
                                .foregroundStyle(.secondary)
                            Text(archivedSource.originalPath ?? "Not available")
                                .textSelection(.enabled)
                        }
                        GridRow {
                            Text("Type")
                                .foregroundStyle(.secondary)
                            Text(archivedSource.sourceType.rawValue)
                        }
                        GridRow {
                            Text("Bytes")
                                .foregroundStyle(.secondary)
                            Text(archivedSource.byteSize.map(String.init) ?? "Not available")
                        }
                    }
                } else {
                    Text("Source archive metadata is not available for this capture yet.")
                        .foregroundStyle(.secondary)
                }

                Text("Archived Text Preview")
                    .font(.headline)
                Text(viewModel.selectedArchivedSourcePreview)
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))

                Text("Raw Input")
                    .font(.headline)
                TextField(
                    "Raw input",
                    text: Binding(
                        get: { viewModel.selectedItemRawInputBindingValue() },
                        set: { viewModel.updateSelectedItemRawInput($0) }
                    ),
                    axis: .vertical
                )
                .textFieldStyle(.roundedBorder)
                .lineLimit(4...10)

                Text("Memory Outcomes")
                    .font(.headline)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 140), spacing: 10)], alignment: .leading, spacing: 10) {
                    ForEach(MemoryOutcome.allCases, id: \.self) { outcome in
                        Toggle(
                            outcome.rawValue,
                            isOn: Binding(
                                get: { viewModel.selectedItemHasOutcome(outcome) },
                                set: { viewModel.setSelectedItemOutcome(outcome, isEnabled: $0) }
                            )
                        )
                    }
                }

                Text("Custom Tags")
                    .font(.headline)
                TextField(
                    "Comma-separated tags",
                    text: Binding(
                        get: { viewModel.selectedItemCustomTagsBindingValue() },
                        set: { viewModel.updateSelectedItemCustomTags($0) }
                    )
                )
                .textFieldStyle(.roundedBorder)

                Text("Proposed Memory MCP Payload")
                    .font(.headline)
                Text(viewModel.selectedReviewPayloadPreview)
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))

                HStack {
                    Button("Save Review Edits") {
                        viewModel.saveSelectedReviewEdits()
                    }

                    Button("Approve Write") {
                        viewModel.approveSelectedReviewItem()
                    }
                    .disabled(item.status != .needsReview)

                    Button("Skip") {
                        viewModel.skipSelectedReviewItem()
                    }
                    .disabled(item.status != .needsReview)
                }
            } else {
                Text("Select a capture to review.")
                    .foregroundStyle(.secondary)
            }
        }
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

    private var latestBatchRun: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Latest Batch Run")
                .font(.title2.bold())

            if let run = viewModel.snapshot.batchRuns.last {
                Grid(alignment: .leading, horizontalSpacing: 18, verticalSpacing: 8) {
                    GridRow {
                        metric("Queued", run.queuedItemCount)
                        metric("Complete", run.completedItemCount)
                        metric("Review", run.reviewItemCount)
                        metric("Failed", run.failedItemCount)
                    }
                }

                Text(run.summary)
                    .foregroundStyle(.secondary)
            } else {
                Text("No batch runs yet.")
                    .foregroundStyle(.secondary)
            }
        }
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
