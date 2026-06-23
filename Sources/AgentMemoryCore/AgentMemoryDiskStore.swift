import Foundation

public struct AgentMemoryDiskStore: Sendable {
    public var root: URL
    public var snapshotURL: URL {
        root.appendingPathComponent("agent-memory-state.json")
    }
    public var configURL: URL {
        root.appendingPathComponent("agent-memory-config.json")
    }
    public var sourceArchiveRoot: URL {
        root.appendingPathComponent("Sources", isDirectory: true)
    }
    public var wikiRoot: URL {
        root.appendingPathComponent("Wiki", isDirectory: true)
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

    public func loadConfig() throws -> AgentMemoryConfig {
        guard FileManager.default.fileExists(atPath: configURL.path) else {
            return AgentMemoryConfig()
        }

        let data = try Data(contentsOf: configURL)
        return try JSONDecoder.agentMemory.decode(AgentMemoryConfig.self, from: data)
    }

    public func saveConfig(_ config: AgentMemoryConfig) throws {
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let data = try JSONEncoder.agentMemory.encode(config)
        let temporaryURL = root.appendingPathComponent("agent-memory-config.json.tmp")
        try data.write(to: temporaryURL, options: .atomic)

        if FileManager.default.fileExists(atPath: configURL.path) {
            _ = try FileManager.default.replaceItemAt(configURL, withItemAt: temporaryURL)
        } else {
            try FileManager.default.moveItem(at: temporaryURL, to: configURL)
        }
    }
}

public extension AgentMemoryDiskStore {
    static func defaultAppSupportRoot(
        fileManager: FileManager = .default,
        bundleIdentifier: String? = Bundle.main.bundleIdentifier
    ) throws -> URL {
        let base = try fileManager.url(
            for: .applicationSupportDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )

        let folderName = bundleIdentifier?.split(separator: ".").last.map(String.init) ?? "AgentMemory"
        return base.appendingPathComponent(folderName, isDirectory: true)
    }
}
