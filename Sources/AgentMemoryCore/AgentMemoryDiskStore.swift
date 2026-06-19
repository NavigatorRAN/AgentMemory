import Foundation

public struct AgentMemoryDiskStore: Sendable {
    public var root: URL
    public var snapshotURL: URL {
        root.appendingPathComponent("agent-memory-state.json")
    }

    public init(root: URL) {
        self.root = root
    }

    public func load() throws -> AgentMemorySnapshot {
        guard FileManager.default.fileExists(atPath: snapshotURL.path) else {
            return AgentMemorySnapshot()
        }

        let data = try Data(contentsOf: snapshotURL)
        return try JSONDecoder.agentMemory.decode(AgentMemorySnapshot.self, from: data)
    }

    public func save(_ snapshot: AgentMemorySnapshot) throws {
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let data = try JSONEncoder.agentMemory.encode(snapshot)
        let temporaryURL = root.appendingPathComponent("agent-memory-state.json.tmp")
        try data.write(to: temporaryURL, options: .atomic)

        if FileManager.default.fileExists(atPath: snapshotURL.path) {
            _ = try FileManager.default.replaceItemAt(snapshotURL, withItemAt: temporaryURL)
        } else {
            try FileManager.default.moveItem(at: temporaryURL, to: snapshotURL)
        }
    }
}
