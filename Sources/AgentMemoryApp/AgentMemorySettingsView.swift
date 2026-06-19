import SwiftUI

struct AgentMemorySettingsView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        Form {
            Section("Memory MCP") {
                TextField("Endpoint URL", text: $viewModel.config.memoryMCPEndpoint)
                    .textFieldStyle(.roundedBorder)
                TextField("Agent name", text: $viewModel.config.agentName)
                    .textFieldStyle(.roundedBorder)
                Toggle("Enable live Memory MCP writes", isOn: $viewModel.config.liveMemoryWritesEnabled)
                Button("Save Settings") {
                    viewModel.saveConfig()
                }
                Button("Send Test Write") {
                    viewModel.testMemoryMCPConnection()
                }
                .disabled(!viewModel.config.liveMemoryWritesEnabled)
            }

            Section("RAG Export") {
                Toggle("Enable RAG export", isOn: $viewModel.config.ragExportEnabled)
                TextField("Host", text: $viewModel.config.ragHost)
                    .textFieldStyle(.roundedBorder)
                TextField("User", text: $viewModel.config.ragUser)
                    .textFieldStyle(.roundedBorder)
                TextField("SSH identity path", text: $viewModel.config.ragIdentityPath)
                    .textFieldStyle(.roundedBorder)
                TextField("Collection", text: $viewModel.config.ragCollection)
                    .textFieldStyle(.roundedBorder)
                Button("Save Settings") {
                    viewModel.saveConfig()
                }
            }

            Section("Status") {
                Text(viewModel.config.liveMemoryWritesEnabled ? "Live writes enabled" : "Live writes disabled")
                    .foregroundStyle(.secondary)
                Text(viewModel.config.ragExportEnabled ? "RAG export enabled" : "RAG export disabled")
                    .foregroundStyle(.secondary)
                Text(viewModel.statusMessage)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(width: 460)
    }
}
