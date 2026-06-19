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
            }

            Section("Status") {
                Text(viewModel.config.liveMemoryWritesEnabled ? "Live writes enabled" : "Live writes disabled")
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(width: 460)
    }
}
