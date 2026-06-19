import Foundation

public struct RAGExportDocument: Equatable, Sendable {
    public var filename: String
    public var content: String
    public var collection: String
    public var tags: [String]

    public init(filename: String, content: String, collection: String, tags: [String]) {
        self.filename = filename
        self.content = content
        self.collection = collection
        self.tags = tags
    }
}

public struct RAGQueueExportBuilder: Sendable {
    private let defaultCollection: String

    public init(defaultCollection: String = "agentmemory") {
        self.defaultCollection = defaultCollection
    }

    public func document(for item: CaptureItem) -> RAGExportDocument {
        let tags = stableUnique(["agentmemory", item.sourceType.rawValue] + item.customTags)
        let shortID = item.id.uuidString.prefix(8).lowercased()

        return RAGExportDocument(
            filename: "agentmemory-\(slug(for: item.displayName))-\(shortID).md",
            content: content(for: item),
            collection: defaultCollection,
            tags: tags
        )
    }

    private func content(for item: CaptureItem) -> String {
        [
            "# \(item.displayName)",
            "",
            "AgentMemory capture export for RAG.",
            "",
            "- Source type: \(item.sourceType.rawValue)",
            "- Status: \(item.status.rawValue)",
            "- Outcomes: \(item.proposedOutcomes.map(\.rawValue).joined(separator: ", "))",
            "- Confidence: \(String(format: "%.2f", item.confidence))",
            "",
            "## Content",
            "",
            item.rawInput
        ].joined(separator: "\n")
    }

    private func slug(for value: String) -> String {
        let allowed = CharacterSet.alphanumerics
        let scalars = value.lowercased().unicodeScalars.map { scalar -> Character in
            allowed.contains(scalar) ? Character(scalar) : "-"
        }
        let collapsed = String(scalars)
            .split(separator: "-")
            .joined(separator: "-")
        return collapsed.isEmpty ? "capture" : collapsed
    }

    private func stableUnique(_ values: [String]) -> [String] {
        var seen: Set<String> = []
        var result: [String] = []

        for value in values where !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }

        return result
    }
}

public protocol RAGQueueTransporting: Sendable {
    func stageAndEnqueue(_ document: RAGExportDocument) async throws -> Int
}

public struct RAGQueueWriter: Sendable {
    private let transport: RAGQueueTransporting

    public init(transport: RAGQueueTransporting) {
        self.transport = transport
    }

    public func enqueue(_ document: RAGExportDocument) async throws -> Int {
        try await transport.stageAndEnqueue(document)
    }
}

public struct RAGSSHQueueConfig: Equatable, Sendable {
    public var host: String
    public var user: String
    public var identityPath: String
    public var remoteStagingDirectory: String
    public var remoteIngestDirectory: String

    public init(
        host: String,
        user: String,
        identityPath: String,
        remoteStagingDirectory: String = "/opt/rag/uploads-staging",
        remoteIngestDirectory: String = "/opt/rag/ingest"
    ) {
        self.host = host
        self.user = user
        self.identityPath = identityPath
        self.remoteStagingDirectory = remoteStagingDirectory
        self.remoteIngestDirectory = remoteIngestDirectory
    }
}

public struct CommandInvocation: Equatable, Sendable {
    public var executable: String
    public var arguments: [String]

    public init(executable: String, arguments: [String]) {
        self.executable = executable
        self.arguments = arguments
    }
}

public protocol CommandRunning: Sendable {
    func run(_ invocation: CommandInvocation) async throws -> String
}

public enum CommandRunnerError: Error, Equatable {
    case nonZeroExit(Int32, String)
    case unreadableOutput
}

public struct ProcessCommandRunner: CommandRunning {
    public init() {}

    public func run(_ invocation: CommandInvocation) async throws -> String {
        try await Task.detached {
            let process = Process()
            process.executableURL = URL(fileURLWithPath: invocation.executable)
            process.arguments = invocation.arguments

            let outputPipe = Pipe()
            let errorPipe = Pipe()
            process.standardOutput = outputPipe
            process.standardError = errorPipe

            try process.run()
            process.waitUntilExit()

            let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
            let errorData = errorPipe.fileHandleForReading.readDataToEndOfFile()
            let output = String(data: outputData, encoding: .utf8) ?? ""
            let error = String(data: errorData, encoding: .utf8) ?? ""

            guard process.terminationStatus == 0 else {
                throw CommandRunnerError.nonZeroExit(process.terminationStatus, error.isEmpty ? output : error)
            }

            return output
        }.value
    }
}

public enum RAGSSHQueueTransportError: Error, Equatable {
    case invalidJobID(String)
}

public struct RAGSSHQueueTransport: RAGQueueTransporting {
    private let config: RAGSSHQueueConfig
    private let commandRunner: CommandRunning

    public init(
        config: RAGSSHQueueConfig,
        commandRunner: CommandRunning = ProcessCommandRunner()
    ) {
        self.config = config
        self.commandRunner = commandRunner
    }

    public func stageAndEnqueue(_ document: RAGExportDocument) async throws -> Int {
        let localURL = try writeTemporaryFile(for: document)
        defer { try? FileManager.default.removeItem(at: localURL.deletingLastPathComponent()) }

        let remotePath = "\(config.remoteStagingDirectory)/\(document.filename)"
        _ = try await commandRunner.run(
            CommandInvocation(
                executable: "/usr/bin/scp",
                arguments: sshOptions() + [localURL.path, "\(config.user)@\(config.host):\(remotePath)"]
            )
        )

        let output = try await commandRunner.run(
            CommandInvocation(
                executable: "/usr/bin/ssh",
                arguments: sshOptions() + ["\(config.user)@\(config.host)", remoteEnqueueScript(remotePath: remotePath, document: document)]
            )
        )

        guard let jobID = Int(output.trimmingCharacters(in: .whitespacesAndNewlines)) else {
            throw RAGSSHQueueTransportError.invalidJobID(output)
        }

        return jobID
    }

    private func writeTemporaryFile(for document: RAGExportDocument) throws -> URL {
        let directory = FileManager.default.temporaryDirectory
            .appendingPathComponent("AgentMemoryRAGExport-\(UUID().uuidString)", isDirectory: true)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        let fileURL = directory.appendingPathComponent(document.filename)
        try Data(document.content.utf8).write(to: fileURL)
        return fileURL
    }

    private func sshOptions() -> [String] {
        [
            "-i", config.identityPath,
            "-o", "IdentitiesOnly=yes",
            "-o", "BatchMode=yes"
        ]
    }

    private func remoteEnqueueScript(remotePath: String, document: RAGExportDocument) -> String {
        let tagsJSON = (try? String(data: JSONEncoder().encode(document.tags), encoding: .utf8)) ?? "[]"
        return """
        cd \(shellQuote(config.remoteIngestDirectory)) && ./.venv/bin/python -c \(shellQuote("import queue_db; print(queue_db.enqueue(\(pythonString(remotePath)), \(pythonString(document.collection)), \(tagsJSON)))"))
        """
    }

    private func pythonString(_ value: String) -> String {
        let data = (try? JSONEncoder().encode(value)) ?? Data("\"\(value)\"".utf8)
        return String(data: data, encoding: .utf8) ?? "\"\(value)\""
    }

    private func shellQuote(_ value: String) -> String {
        "'\(value.replacingOccurrences(of: "'", with: "'\"'\"'"))'"
    }
}
