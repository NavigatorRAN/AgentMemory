import SwiftUI

@main
struct AgentMemoryApp: App {
    @State private var viewModel = AgentMemoryViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }

        Settings {
            AgentMemorySettingsView(viewModel: viewModel)
        }
    }
}
