import Foundation

public struct AgentMemoryConfig: Codable, Equatable, Sendable {
    public var memoryMCPEndpoint: String
    public var agentName: String
    public var liveMemoryWritesEnabled: Bool

    public init(
        memoryMCPEndpoint: String = "",
        agentName: String = "CODEX",
        liveMemoryWritesEnabled: Bool = false
    ) {
        self.memoryMCPEndpoint = memoryMCPEndpoint
        self.agentName = agentName
        self.liveMemoryWritesEnabled = liveMemoryWritesEnabled
    }
}

public extension AgentMemoryConfig {
    var memoryMCPEndpointURL: URL? {
        let trimmed = memoryMCPEndpoint.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let url = URL(string: trimmed),
              let scheme = url.scheme?.lowercased(),
              ["http", "https"].contains(scheme),
              url.host != nil
        else {
            return nil
        }

        return url
    }

    var resolvedAgentName: String {
        let trimmed = agentName.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? "CODEX" : trimmed
    }
}
