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
