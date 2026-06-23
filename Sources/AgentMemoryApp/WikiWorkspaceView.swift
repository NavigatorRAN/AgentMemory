import AgentMemoryCore
import SwiftUI

struct WikiWorkspaceView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                HStack(alignment: .top, spacing: 16) {
                    pageList
                        .frame(maxWidth: 360)
                    pagePreview
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Wiki")
                .font(.largeTitle.bold())
            Text("Compiled knowledge pages refreshed automatically from captures, Memory MCP writes, and RAG exports.")
                .foregroundStyle(.secondary)
        }
    }

    private var pageList: some View {
        VStack(alignment: .leading, spacing: 16) {
            WorkspacePanel(title: "Refresh Flow") {
                Toggle("Automatic refresh", isOn: $viewModel.config.automaticWikiRefreshEnabled)
                    .onChange(of: viewModel.config.automaticWikiRefreshEnabled) {
                        viewModel.saveConfig()
                    }
                Toggle("Sync summaries to Memory MCP", isOn: $viewModel.config.wikiMemorySyncEnabled)
                    .onChange(of: viewModel.config.wikiMemorySyncEnabled) {
                        viewModel.saveConfig()
                    }
                TextField("CodeGraphRAG repo path", text: $viewModel.config.codeGraphRAGRepositoryPath)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        viewModel.saveConfig()
                    }

                HStack {
                    Button("Build CodeGraphRAG") {
                        viewModel.buildCodeGraphRAGIndex()
                    }
                    Button("Save Path") {
                        viewModel.saveConfig()
                    }
                }

                if let run = viewModel.latestWikiRefreshRun {
                    HStack(spacing: 10) {
                        WorkspaceMetric(title: "Pages", value: run.pageCount)
                        WorkspaceMetric(title: "Synced", value: run.syncedPageCount)
                        WorkspaceMetric(title: "Failed", value: run.failedSyncCount)
                    }

                    Text(run.summary)
                        .foregroundStyle(.secondary)
                    Text(run.completedAt.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                } else {
                    Text("No wiki refresh has run yet. It will refresh automatically after the next capture write, RAG export, or batch run.")
                        .foregroundStyle(.secondary)
                }
            }

            WorkspacePanel(title: "Pages") {
                if viewModel.snapshot.wikiPages.isEmpty {
                    WorkspaceEmptyState(
                        title: "No wiki pages yet",
                        message: "Process or approve captures to materialize compiled knowledge pages.",
                        systemImage: "book.pages"
                    )
                } else {
                    ForEach(viewModel.snapshot.wikiPages) { page in
                        Button {
                            viewModel.selectWikiPage(page)
                        } label: {
                            HStack(alignment: .top, spacing: 10) {
                                Image(systemName: page.lastMemoryMCPSyncAt == nil ? "doc.text" : "checkmark.circle")
                                    .foregroundStyle(page.memoryMCPSyncError == nil ? Color.secondary : Color.red)
                                    .frame(width: 18)
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(page.title)
                                        .font(.headline)
                                        .lineLimit(1)
                                    Text(page.summary)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(2)
                                }
                                Spacer()
                            }
                            .padding(8)
                            .background(selectionBackground(for: page), in: RoundedRectangle(cornerRadius: 8))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var pagePreview: some View {
        if let page = viewModel.selectedWikiPage {
            WorkspacePanel(title: page.title) {
                Text(page.summary)
                    .font(.headline)
                    .textSelection(.enabled)

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 10)], alignment: .leading, spacing: 10) {
                    WorkspaceMetric(title: "Entities", value: page.entities.count)
                    WorkspaceMetric(title: "Tags", value: page.tags.count)
                    WorkspaceMetric(title: "Sources", value: page.sourceItemIDs.count + page.sourceURLs.count)
                    WorkspaceMetric(title: "RAG", value: page.ragCollections.count)
                }

                if let syncError = page.memoryMCPSyncError {
                    Label(syncError, systemImage: "exclamationmark.triangle")
                        .foregroundStyle(.red)
                } else if let syncedAt = page.lastMemoryMCPSyncAt {
                    Label("Synced to Memory MCP \(syncedAt.formatted(date: .abbreviated, time: .shortened))", systemImage: "checkmark.circle")
                        .foregroundStyle(.secondary)
                }

                if let filePath = page.filePath {
                    Text(filePath)
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                        .textSelection(.enabled)
                }

                Divider()

                Text(page.body)
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        } else {
            WorkspacePanel(title: "Preview") {
                WorkspaceEmptyState(
                    title: "Select a wiki page",
                    message: "Generated pages will appear here after automatic refresh.",
                    systemImage: "doc.text.magnifyingglass"
                )
            }
        }
    }

    private func selectionBackground(for page: AgentMemoryWikiPage) -> Color {
        viewModel.selectedWikiPage?.slug == page.slug ? Color.accentColor.opacity(0.16) : Color.clear
    }
}
