import AgentMemoryCore
import SwiftUI

struct SearchWorkspaceView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                header
                searchControls
                results
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Search")
                .font(.largeTitle.bold())
            Text("Search saved memory, recall entities, inspect entity details, and browse Memory MCP records.")
                .foregroundStyle(.secondary)
        }
    }

    private var searchControls: some View {
        WorkspacePanel(title: "Memory MCP Search") {
            TextField("Search saved memory, enter an entity name, or filter entities", text: $viewModel.memorySearchQuery)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    viewModel.searchMemoryMCP()
                }

            HStack {
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
        }
    }

    @ViewBuilder
    private var results: some View {
        if viewModel.memorySearchResults.isEmpty && viewModel.memoryEntityDetail == nil && viewModel.memoryEntityResults.isEmpty {
            WorkspacePanel(title: "Results") {
                WorkspaceEmptyState(
                    title: "No Memory MCP results loaded",
                    message: "Run a search, recall an entity, load detail, or browse entities.",
                    systemImage: "magnifyingglass"
                )
            }
        } else {
            HStack(alignment: .top, spacing: 16) {
                entityResults
                eventResults
            }
        }
    }

    private var entityResults: some View {
        VStack(alignment: .leading, spacing: 16) {
            if !viewModel.memoryEntityResults.isEmpty {
                WorkspacePanel(title: "Entities") {
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
                WorkspacePanel(title: "Entity Detail") {
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
                }
            }
        }
        .frame(maxWidth: 420)
    }

    private var eventResults: some View {
        WorkspacePanel(title: "Memory Events") {
            if viewModel.memorySearchResults.isEmpty {
                Text("No event search results loaded.")
                    .foregroundStyle(.secondary)
            } else {
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
