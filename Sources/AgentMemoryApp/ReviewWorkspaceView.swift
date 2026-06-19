import AgentMemoryCore
import SwiftUI

struct ReviewWorkspaceView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                HStack(alignment: .top, spacing: 16) {
                    reviewQueue
                        .frame(maxWidth: 360)
                    focusedReview
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Review")
                    .font(.largeTitle.bold())
                Text("Approve uncertain captures, fix outcomes, and preserve provenance before writing memory.")
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Button("Next Review") {
                viewModel.selectNextReviewItem()
            }
        }
    }

    private var reviewQueue: some View {
        WorkspacePanel(title: "\(viewModel.reviewItems.count) Waiting") {
            if viewModel.reviewItems.isEmpty {
                WorkspaceEmptyState(
                    title: "Review queue is clear",
                    message: "Low-confidence captures will appear here.",
                    systemImage: "checkmark.circle"
                )
            } else {
                ForEach(viewModel.reviewItems) { item in
                    Button {
                        viewModel.selectedItemID = item.id
                    } label: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.displayName)
                                .font(.headline)
                                .lineLimit(2)
                            Text("\(item.sourceType.rawValue) - confidence \(item.confidence.formatted(.number.precision(.fractionLength(2))))")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(8)
                        .background(item.id == viewModel.selectedItem?.id ? .tertiary : .quaternary, in: RoundedRectangle(cornerRadius: 8))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    @ViewBuilder
    private var focusedReview: some View {
        if let item = viewModel.selectedItem {
            VStack(alignment: .leading, spacing: 14) {
                reviewSummary(for: item)
                reviewReasons
                sourceArchive
                rawInput
                memoryOutcomes
                customTags
                proposedPayload
                reviewActions(for: item)
            }
        } else {
            WorkspacePanel(title: "Focused Review") {
                WorkspaceEmptyState(
                    title: "Select a capture",
                    message: "Choose a review item from the queue to inspect and approve it.",
                    systemImage: "sidebar.left"
                )
            }
        }
    }

    private func reviewSummary(for item: CaptureItem) -> some View {
        WorkspacePanel(title: "Focused Review") {
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
            }
        }
    }

    private var reviewReasons: some View {
        WorkspacePanel(title: "Review Reasons") {
            if viewModel.selectedReviewExplanations.isEmpty {
                Text("No review reasons are available for this capture.")
                    .foregroundStyle(.secondary)
            } else {
                ForEach(viewModel.selectedReviewExplanations, id: \.self) { explanation in
                    Label(explanation, systemImage: "info.circle")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }

    private var sourceArchive: some View {
        WorkspacePanel(title: "Source Archive") {
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

                Text(viewModel.selectedArchivedSourcePreview)
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
            } else {
                Text("Source archive metadata is not available for this capture yet.")
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var rawInput: some View {
        WorkspacePanel(title: "Raw Input") {
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
        }
    }

    private var memoryOutcomes: some View {
        WorkspacePanel(title: "Memory Outcomes") {
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
        }
    }

    private var customTags: some View {
        WorkspacePanel(title: "Custom Tags") {
            TextField(
                "Comma-separated tags",
                text: Binding(
                    get: { viewModel.selectedItemCustomTagsBindingValue() },
                    set: { viewModel.updateSelectedItemCustomTags($0) }
                )
            )
            .textFieldStyle(.roundedBorder)
        }
    }

    private var proposedPayload: some View {
        WorkspacePanel(title: "Proposed Memory MCP Payload") {
            Text(viewModel.selectedReviewPayloadPreview)
                .font(.system(.body, design: .monospaced))
                .textSelection(.enabled)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
        }
    }

    private func reviewActions(for item: CaptureItem) -> some View {
        HStack {
            Button("Save Edits") {
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
            Button("Retry") {
                viewModel.retrySelectedItem()
            }
            .disabled(!viewModel.canRetrySelectedItem)
            Button("Export to RAG") {
                viewModel.exportSelectedItemToRAG()
            }
            .disabled(!viewModel.canExportSelectedItemToRAG)
        }
    }
}
