import AgentMemoryCore
import SwiftUI

struct ContentView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        NavigationSplitView {
            sidebar
                .navigationTitle("AgentMemory")
        } detail: {
            workspaceDetail
                .navigationTitle(viewModel.selectedWorkspace.title)
                .toolbar {
                    workspaceToolbar
                }
        }
    }

    private var sidebar: some View {
        List(selection: workspaceSelection) {
            Section("Workspaces") {
                ForEach(AgentMemoryWorkspace.allCases) { workspace in
                    Label {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(workspace.title)
                                .lineLimit(1)
                            Text(workspaceCountText(for: workspace))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    } icon: {
                        Image(systemName: workspace.systemImage)
                            .foregroundStyle(.secondary)
                            .frame(width: 18)
                    }
                    .tag(workspace)
                }
            }

            Section("Captures") {
                Picker("Filter", selection: Binding(
                    get: { viewModel.sidebarFilter },
                    set: { viewModel.setSidebarFilter($0) }
                )) {
                    ForEach(CaptureSidebarFilter.allCases) { filter in
                        Text(filter.rawValue).tag(filter)
                    }
                }
                .pickerStyle(.segmented)

                TextField("Search captures", text: $viewModel.sidebarSearchQuery)
                    .textFieldStyle(.roundedBorder)

                ForEach(viewModel.sidebarItems.prefix(8)) { item in
                    Button {
                        viewModel.selectedItemID = item.id
                        if item.status == .needsReview {
                            viewModel.selectedWorkspace = .review
                        }
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: captureIcon(for: item.sourceType))
                                .foregroundStyle(.secondary)
                                .frame(width: 16)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(item.displayName)
                                    .lineLimit(1)
                                Text("\(item.sourceType.rawValue) - \(item.status.rawValue)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
                            }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .listStyle(.sidebar)
    }

    private var workspaceSelection: Binding<AgentMemoryWorkspace?> {
        Binding<AgentMemoryWorkspace?>(
            get: { viewModel.selectedWorkspace },
            set: { workspace in
                if let workspace {
                    viewModel.selectedWorkspace = workspace
                }
            }
        )
    }

    @ViewBuilder
    private var workspaceDetail: some View {
        switch viewModel.selectedWorkspace {
        case .ingestion:
            IngestionWorkspaceView(viewModel: viewModel)
        case .review:
            ReviewWorkspaceView(viewModel: viewModel)
        case .search:
            SearchWorkspaceView(viewModel: viewModel)
        case .graph:
            GraphWorkspaceView(viewModel: viewModel)
        case .rag:
            RAGWorkspaceView(viewModel: viewModel)
        }
    }

    @ToolbarContentBuilder
    private var workspaceToolbar: some ToolbarContent {
        ToolbarItemGroup(placement: .primaryAction) {
            switch viewModel.selectedWorkspace {
            case .ingestion:
                Button("Run Batch") {
                    viewModel.runQueuedBatch()
                }
                Menu("Fetch") {
                    Button("Web Pages") {
                        viewModel.fetchQueuedWebPages()
                    }
                    Button("YouTube") {
                        viewModel.fetchQueuedYouTubeTranscripts()
                    }
                    Button("Apple Docs") {
                        viewModel.fetchQueuedAppleDocumentation()
                    }
                }
            case .review:
                Button("Next Review") {
                    viewModel.selectNextReviewItem()
                }
                Button("Approve") {
                    viewModel.approveSelectedReviewItem()
                }
                .disabled(viewModel.selectedItem?.status != .needsReview)
            case .search:
                Button("Search") {
                    viewModel.searchMemoryMCP()
                }
                .disabled(!viewModel.canSearchMemoryMCP)
                Menu("Entity") {
                    Button("Recall") {
                        viewModel.recallMemoryMCPEntity()
                    }
                    Button("Detail") {
                        viewModel.loadMemoryMCPEntityDetail()
                    }
                    Button("Browse") {
                        viewModel.listMemoryMCPEntities()
                    }
                }
                .disabled(!viewModel.canSearchMemoryMCP)
            case .graph:
                if viewModel.selectedMemoryGraphNodeID != nil {
                    Button("Clear Focus") {
                        viewModel.clearMemoryGraphFocus()
                    }
                }
                Button("Refresh") {
                    viewModel.refreshMemoryMCPGraphOverview()
                }
                .disabled(!viewModel.canSearchMemoryMCP)
            case .rag:
                Button("Refresh Stats") {
                    viewModel.refreshRAGQueueStats()
                }
                .disabled(!viewModel.canRefreshRAGQueueStats)
                Menu("Exports") {
                    Button("Export Selected") {
                        viewModel.exportSelectedItemToRAG()
                    }
                    .disabled(!viewModel.canExportSelectedItemToRAG)
                    Button("Export Completed") {
                        viewModel.exportCompletedItemsToRAG()
                    }
                    .disabled(!viewModel.canExportCompletedItemsToRAG)
                    Button("Refresh Jobs") {
                        viewModel.refreshRAGJobStatuses()
                    }
                    .disabled(!viewModel.canRefreshRAGJobStatuses)
                }
            }
        }

        ToolbarItemGroup(placement: .automatic) {
            Button("Save") {
                viewModel.save()
            }
            Button("Reload") {
                viewModel.load()
            }
        }
    }

    private func workspaceCountText(for workspace: AgentMemoryWorkspace) -> String {
        switch workspace {
        case .ingestion:
            "\(viewModel.snapshot.items.filter { $0.status == .queued }.count) queued"
        case .review:
            "\(viewModel.reviewItems.count) waiting"
        case .search:
            "\(viewModel.memorySearchResults.count + viewModel.memoryEntityResults.count) loaded"
        case .graph:
            "\(viewModel.memoryGraph.nodes.count) nodes"
        case .rag:
            "\(viewModel.snapshot.items.filter { $0.ragExport != nil }.count) exports"
        }
    }

    private func captureIcon(for sourceType: SourceType) -> String {
        switch sourceType {
        case .url:
            "link"
        case .video:
            "play.rectangle"
        case .pdf:
            "doc.richtext"
        case .image:
            "photo"
        case .text:
            "text.alignleft"
        case .codeOrLog:
            "terminal"
        case .emailOrCalendar:
            "calendar"
        case .folder:
            "folder"
        case .mixedBatch:
            "tray.full"
        case .unknown:
            "questionmark.circle"
        }
    }
}
