import AgentMemoryCore
import SwiftUI

struct IngestionWorkspaceView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                metrics
                HStack(alignment: .top, spacing: 16) {
                    newStackPanel
                    queuePanel
                }
                latestBatchRun
                morningBrief
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Ingestion")
                .font(.largeTitle.bold())
            Text("Drop mixed data stacks, fetch transcripts and web pages, then let AgentMemory process the queue.")
                .foregroundStyle(.secondary)
        }
    }

    private var metrics: some View {
        HStack(spacing: 12) {
            WorkspaceMetric(title: "Processed", value: viewModel.brief.processedCount)
            WorkspaceMetric(title: "Completed", value: viewModel.brief.completedCount)
            WorkspaceMetric(title: "Review", value: viewModel.brief.needsReviewCount)
            WorkspaceMetric(title: "Failed", value: viewModel.brief.failedCount)
        }
    }

    private var newStackPanel: some View {
        WorkspacePanel(title: "New Ingestion Stack") {
            TextField("Optional title", text: $viewModel.captureTitle)
                .textFieldStyle(.roundedBorder)
            TextField("Paste text, URL, path, or log snippet", text: $viewModel.captureText, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(3...6)

            dropZone

            HStack {
                Button("Add to Queue") {
                    viewModel.addCapture()
                }
                .keyboardShortcut(.return, modifiers: [.command])

                Button("Process Next") {
                    viewModel.processNext()
                }

                Menu("Batch") {
                    Button("Process All") {
                        viewModel.processAllQueued()
                    }
                    Button("Run Overnight") {
                        viewModel.runQueuedBatch()
                    }
                    Button("Retry Failed") {
                        viewModel.retryAllFailedItems()
                    }
                }

                Menu("Fetch") {
                    Button("Web Pages") {
                        viewModel.fetchQueuedWebPages()
                    }
                    Button("YouTube") {
                        viewModel.fetchQueuedYouTubeTranscripts()
                    }
                }
            }
        }
        .frame(maxWidth: 460)
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
        .frame(maxWidth: .infinity, minHeight: 180)
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

    private var queuePanel: some View {
        WorkspacePanel(title: "Stack Queue") {
            if viewModel.snapshot.items.isEmpty {
                WorkspaceEmptyState(
                    title: "No captures yet",
                    message: "Drop a stack or paste a URL to begin.",
                    systemImage: "tray"
                )
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.snapshot.items.prefix(12)) { item in
                        Button {
                            viewModel.selectedItemID = item.id
                            if item.status == .needsReview {
                                viewModel.selectedWorkspace = .review
                            }
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 3) {
                                    Text(item.displayName)
                                        .lineLimit(1)
                                    Text("\(item.sourceType.rawValue) - \(item.status.rawValue)")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(1)
                                }
                                Spacer()
                                Text(item.createdAt.formatted(date: .abbreviated, time: .shortened))
                                    .font(.caption2)
                                    .foregroundStyle(.tertiary)
                            }
                            .padding(8)
                            .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    private var latestBatchRun: some View {
        WorkspacePanel(title: "Latest Batch Run") {
            if let run = viewModel.snapshot.batchRuns.last {
                HStack(spacing: 12) {
                    WorkspaceMetric(title: "Queued", value: run.queuedItemCount)
                    WorkspaceMetric(title: "Complete", value: run.completedItemCount)
                    WorkspaceMetric(title: "Review", value: run.reviewItemCount)
                    WorkspaceMetric(title: "Failed", value: run.failedItemCount)
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
        WorkspacePanel(title: "Morning Brief") {
            if viewModel.brief.exceptions.isEmpty && viewModel.brief.graphChanges.isEmpty {
                Text("No morning brief changes yet.")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(viewModel.brief.exceptions, id: \.self) { exception in
                    Label(exception, systemImage: "exclamationmark.triangle")
                }

                ForEach(viewModel.brief.graphChanges, id: \.self) { change in
                    Label(change, systemImage: "point.3.connected.trianglepath.dotted")
                }
            }
        }
    }
}
