import Foundation

public struct AgentMemoryConfig: Codable, Equatable, Sendable {
    public var memoryMCPEndpoint: String
    public var agentName: String
    public var liveMemoryWritesEnabled: Bool
    public var ragHost: String
    public var ragUser: String
    public var ragIdentityPath: String
    public var ragCollection: String
    public var ragExportEnabled: Bool

    public init(
        memoryMCPEndpoint: String = "",
        agentName: String = "CODEX",
        liveMemoryWritesEnabled: Bool = false,
        ragHost: String = "192.168.1.107",
        ragUser: String = "veronika",
        ragIdentityPath: String = "~/.ssh/id_rsa_hermes",
        ragCollection: String = "agentmemory",
        ragExportEnabled: Bool = false
    ) {
        self.memoryMCPEndpoint = memoryMCPEndpoint
        self.agentName = agentName
        self.liveMemoryWritesEnabled = liveMemoryWritesEnabled
        self.ragHost = ragHost
        self.ragUser = ragUser
        self.ragIdentityPath = ragIdentityPath
        self.ragCollection = ragCollection
        self.ragExportEnabled = ragExportEnabled
    }

    private enum CodingKeys: String, CodingKey {
        case memoryMCPEndpoint
        case agentName
        case liveMemoryWritesEnabled
        case ragHost
        case ragUser
        case ragIdentityPath
        case ragCollection
        case ragExportEnabled
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.memoryMCPEndpoint = try container.decodeIfPresent(String.self, forKey: .memoryMCPEndpoint) ?? ""
        self.agentName = try container.decodeIfPresent(String.self, forKey: .agentName) ?? "CODEX"
        self.liveMemoryWritesEnabled = try container.decodeIfPresent(Bool.self, forKey: .liveMemoryWritesEnabled) ?? false
        self.ragHost = try container.decodeIfPresent(String.self, forKey: .ragHost) ?? "192.168.1.107"
        self.ragUser = try container.decodeIfPresent(String.self, forKey: .ragUser) ?? "veronika"
        self.ragIdentityPath = try container.decodeIfPresent(String.self, forKey: .ragIdentityPath) ?? "~/.ssh/id_rsa_hermes"
        self.ragCollection = try container.decodeIfPresent(String.self, forKey: .ragCollection) ?? "agentmemory"
        self.ragExportEnabled = try container.decodeIfPresent(Bool.self, forKey: .ragExportEnabled) ?? false
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

    var resolvedRAGCollection: String {
        let trimmed = ragCollection.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? "agentmemory" : trimmed
    }

    func ragSSHQueueConfig(homeDirectory: String = NSHomeDirectory()) -> RAGSSHQueueConfig? {
        let host = ragHost.trimmingCharacters(in: .whitespacesAndNewlines)
        let user = ragUser.trimmingCharacters(in: .whitespacesAndNewlines)
        let identityPath = expandedHomePath(ragIdentityPath, homeDirectory: homeDirectory)

        guard !host.isEmpty, !user.isEmpty, !identityPath.isEmpty else {
            return nil
        }

        return RAGSSHQueueConfig(host: host, user: user, identityPath: identityPath)
    }

    private func expandedHomePath(_ value: String, homeDirectory: String) -> String {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed == "~" {
            return homeDirectory
        }

        if trimmed.hasPrefix("~/") {
            return homeDirectory + String(trimmed.dropFirst())
        }

        return trimmed
    }
}
