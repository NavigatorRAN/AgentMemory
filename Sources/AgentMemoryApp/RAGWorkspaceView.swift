import AgentMemoryCore
import SwiftUI

struct RAGWorkspaceView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                HStack(alignment: .top, spacing: 16) {
                    queueHealth
                        .frame(maxWidth: 420)
                    exportHistory
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading, spacing: 6) {
                Text("RAG Queue")
                    .font(.largeTitle.bold())
                Text("Inspect remote queue health, export history, and recorded job status without opening Streamlit.")
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Button("Refresh Queue Stats") {
                viewModel.refreshRAGQueueStats()
            }
            .disabled(!viewModel.canRefreshRAGQueueStats)
        }
    }

    private var queueHealth: some View {
        WorkspacePanel(title: "Remote Queue Health") {
            if ragQueueStatsCounts.isEmpty {
                Text("No remote queue stats loaded yet.")
                    .foregroundStyle(.secondary)
            } else {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 110), spacing: 10)], alignment: .leading, spacing: 10) {
                    ForEach(ragQueueStatsCounts, id: \.status) { status, count in
                        WorkspaceMetric(title: status.capitalized, value: count)
                    }
                }
            }

            HStack {
                Button("Refresh Stats") {
                    viewModel.refreshRAGQueueStats()
                }
                .disabled(!viewModel.canRefreshRAGQueueStats)

                Button("Refresh Jobs") {
                    viewModel.refreshRAGJobStatuses()
                }
                .disabled(!viewModel.canRefreshRAGJobStatuses)
            }
        }
    }

    private var exportHistory: some View {
        VStack(alignment: .leading, spacing: 16) {
            WorkspacePanel(title: "Export Actions") {
                HStack {
                    Button("Export Selected") {
                        viewModel.exportSelectedItemToRAG()
                    }
                    .disabled(!viewModel.canExportSelectedItemToRAG)

                    Button("Export Completed") {
                        viewModel.exportCompletedItemsToRAG()
                    }
                    .disabled(!viewModel.canExportCompletedItemsToRAG)
                }
            }

            WorkspacePanel(title: "Latest RAG Export") {
                if let run = viewModel.snapshot.ragExportRuns.last {
                    HStack(spacing: 12) {
                        WorkspaceMetric(title: "Exported", value: run.exportedCount)
                        WorkspaceMetric(title: "Skipped", value: run.skippedCount)
                        WorkspaceMetric(title: "Failed", value: run.failedCount)
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

            WorkspacePanel(title: "Recorded Exports") {
                let exportedItems = viewModel.snapshot.items.filter { $0.ragExport != nil }
                if exportedItems.isEmpty {
                    Text("No captures have been exported to RAG yet.")
                        .foregroundStyle(.secondary)
                } else {
                    ForEach(exportedItems) { item in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.displayName)
                                .font(.headline)
                                .lineLimit(1)
                            Text(ragExportSummary(for: item))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(8)
                        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
    }

    private var ragStatusCounts: [(status: String, count: Int)] {
        RAGJobStatusSummaryBuilder()
            .counts(in: viewModel.snapshot.items)
            .sorted { $0.key < $1.key }
            .map { (status: $0.key, count: $0.value) }
    }

    private var ragQueueStatsCounts: [(status: String, count: Int)] {
        (viewModel.ragQueueStats?.countsByStatus ?? [:])
            .sorted { $0.key < $1.key }
            .map { (status: $0.key, count: $0.value) }
    }
}
