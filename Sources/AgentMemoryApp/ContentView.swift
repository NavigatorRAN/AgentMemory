import AgentMemoryCore
import SwiftUI

struct ContentView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        NavigationSplitView {
            List(selection: $viewModel.selectedItemID) {
                Picker("Filter", selection: Binding(
                    get: { viewModel.sidebarFilter },
                    set: { viewModel.setSidebarFilter($0) }
                )) {
                    ForEach(CaptureSidebarFilter.allCases) { filter in
                        Text(filter.rawValue).tag(filter)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 6)

                TextField("Search captures", text: $viewModel.sidebarSearchQuery)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 6)

                Section("Capture Inbox") {
                    ForEach(viewModel.sidebarItems) { item in
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
                    memorySearchPanel
                    reviewPanel
                    latestBatchRun
                    latestRAGExport
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
            Button("Fetch Web Pages") {
                viewModel.fetchQueuedWebPages()
            }
            Button("Fetch YouTube") {
                viewModel.fetchQueuedYouTubeTranscripts()
            }
            Button("Export RAG") {
                viewModel.exportSelectedItemToRAG()
            }
            .disabled(!viewModel.canExportSelectedItemToRAG)
            Button("Export Completed RAG") {
                viewModel.exportCompletedItemsToRAG()
            }
            .disabled(!viewModel.canExportCompletedItemsToRAG)
            Button("Refresh RAG Status") {
                viewModel.refreshRAGJobStatuses()
            }
            .disabled(!viewModel.canRefreshRAGJobStatuses)
            Button("Retry Failed") {
                viewModel.retryAllFailedItems()
            }
            Button("Next Review") {
                viewModel.selectNextReviewItem()
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

    private var memorySearchPanel: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Memory MCP Search")
                    .font(.title2.bold())
                Spacer()
                Button("Search") {
                    viewModel.searchMemoryMCP()
                }
                .disabled(!viewModel.canSearchMemoryMCP)
                Button("Recall Entity") {
                    viewModel.recallMemoryMCPEntity()
                }
                .disabled(!viewModel.canSearchMemoryMCP)
                Button("Entity Detail") {
                    viewModel.loadMemoryMCPEntityDetail()
                }
                .disabled(!viewModel.canSearchMemoryMCP)
                Button("Browse Entities") {
                    viewModel.listMemoryMCPEntities()
                }
                .disabled(!viewModel.canSearchMemoryMCP)
            }

            TextField("Search saved memory, enter an entity name, or filter entities", text: $viewModel.memorySearchQuery)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    viewModel.searchMemoryMCP()
                }

            if viewModel.memorySearchResults.isEmpty && viewModel.memoryEntityDetail == nil && viewModel.memoryEntityResults.isEmpty {
                Text("No Memory MCP search results loaded.")
                    .foregroundStyle(.secondary)
            } else {
                if !viewModel.memoryEntityResults.isEmpty {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(viewModel.memoryEntityResults, id: \.name) { entity in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(entity.displayName)
                                    .font(.headline)
                                HStack {
                                    Text(entity.name)
                                    Text(entity.type)
                                    Text("\(entity.eventCount) events")
                                    if let lastEventDate = entity.lastEventDate {
                                        Text(lastEventDate)
                                    }
                                }
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }

                if let entity = viewModel.memoryEntityDetail {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(entity.displayName)
                            .font(.headline)
                        Text(entity.content.isEmpty ? "No canonical entity notes yet." : entity.content)
                            .textSelection(.enabled)
                        if let type = entity.frontmatter["type"]?.stringValue {
                            Text(type)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        if let path = entity.path {
                            Text(path)
                                .font(.caption)
                                .foregroundStyle(.tertiary)
                                .textSelection(.enabled)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
                }

                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.memorySearchResults, id: \.id) { event in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(event.content)
                                .lineLimit(4)
                                .textSelection(.enabled)
                            HStack {
                                Text(event.eventDate)
                                if let agent = event.agent {
                                    Text(agent)
                                }
                                if !event.entities.isEmpty {
                                    Text(event.entities.joined(separator: ", "))
                                }
                            }
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            if !event.path.isEmpty {
                                Text(event.path)
                                    .font(.caption)
                                    .foregroundStyle(.tertiary)
                                    .textSelection(.enabled)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
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
                        Text("Attempts")
                            .foregroundStyle(.secondary)
                        Text(attemptSummary(for: item))
                    }
                    GridRow {
                        Text("RAG Export")
                            .foregroundStyle(.secondary)
                        Text(ragExportSummary(for: item))
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

                    Button("Retry Selected") {
                        viewModel.retrySelectedItem()
                    }
                    .disabled(!viewModel.canRetrySelectedItem)
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

    private func attemptSummary(for item: CaptureItem) -> String {
        guard let lastAttemptAt = item.lastAttemptAt else {
            return "\(item.attemptCount) attempts"
        }

        return "\(item.attemptCount) attempts, last \(lastAttemptAt.formatted(date: .abbreviated, time: .shortened))"
    }

    private func ragExportSummary(for item: CaptureItem) -> String {
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

    private var latestRAGExport: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Latest RAG Export")
                .font(.title2.bold())

            if let run = viewModel.snapshot.ragExportRuns.last {
                Grid(alignment: .leading, horizontalSpacing: 18, verticalSpacing: 8) {
                    GridRow {
                        metric("Exported", run.exportedCount)
                        metric("Skipped", run.skippedCount)
                        metric("Failed", run.failedCount)
                    }
                }

                Text(run.summary)
                    .foregroundStyle(.secondary)

                ForEach(ragStatusCounts, id: \.status) { status, count in
                    Label("\(status): \(count)", systemImage: "circle.hexagongrid")
                        .foregroundStyle(.secondary)
                }

                ForEach(run.failures, id: \.itemID) { failure in
                    Label("\(failure.displayName): \(failure.reason)", systemImage: "exclamationmark.triangle")
                        .foregroundStyle(.secondary)
                }
            } else {
                Text("No RAG export runs yet.")
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var ragStatusCounts: [(status: String, count: Int)] {
        RAGJobStatusSummaryBuilder()
            .counts(in: viewModel.snapshot.items)
            .sorted { $0.key < $1.key }
            .map { (status: $0.key, count: $0.value) }
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
            Text("Memory Graph")
                .font(.title2.bold())

            let graph = viewModel.memoryGraph
            Grid(alignment: .leading, horizontalSpacing: 18, verticalSpacing: 8) {
                GridRow {
                    metric("Nodes", graph.nodes.count)
                    metric("Edges", graph.edges.count)
                }
            }

            if graph.nodes.isEmpty {
                Text("Run a Memory MCP search, recall, entity detail, or entity browse to populate the graph projection.")
                    .foregroundStyle(.secondary)
            } else {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 220), spacing: 10)], alignment: .leading, spacing: 10) {
                    ForEach(graph.nodes, id: \.id) { node in
                        VStack(alignment: .leading, spacing: 4) {
                            Label(node.label, systemImage: graphNodeIcon(for: node.kind))
                                .font(.headline)
                                .lineLimit(2)
                            if let subtitle = node.subtitle {
                                Text(subtitle)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(2)
                            }
                        }
                        .frame(maxWidth: .infinity, minHeight: 64, alignment: .leading)
                        .padding()
                        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
    }

    private func graphNodeIcon(for kind: MemoryMCPGraphNode.Kind) -> String {
        switch kind {
        case .entity:
            return "circle.hexagongrid"
        case .event:
            return "clock"
        }
    }
}
