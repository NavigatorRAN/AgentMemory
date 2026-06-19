import AgentMemoryCore
import SwiftUI

struct ContentView: View {
    @State private var items: [CaptureItem] = [
        CaptureItem(displayName: "WWDC video URL", rawInput: "https://developer.apple.com/videos/play/wwdc2026/101"),
        CaptureItem(displayName: "Terminal log", rawInput: "Error: Memory MCP unreachable")
    ]

    var body: some View {
        NavigationSplitView {
            List(selection: .constant(items.first?.id)) {
                Section("Capture Inbox") {
                    ForEach(items) { item in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.displayName)
                                .font(.headline)
                            Text(item.status.rawValue)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("AgentMemory")
        } detail: {
            VStack(alignment: .leading, spacing: 16) {
                Text("Agent Memory Ingestion Hub")
                    .font(.largeTitle.bold())
                Text("Drop mixed data stacks, classify sources, propose memory outcomes, and review the morning brief.")
                    .foregroundStyle(.secondary)
                HStack {
                    Button("Add Capture") {}
                    Button("Process Queue") {}
                    Button("Morning Brief") {}
                }
                Spacer()
            }
            .padding()
        }
    }
}
