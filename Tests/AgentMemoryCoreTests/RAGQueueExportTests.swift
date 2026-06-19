import XCTest
@testable import AgentMemoryCore

final class RAGQueueExportTests: XCTestCase {
    func testExportBuilderCreatesMarkdownDocumentForCapture() {
        let item = CaptureItem(
            id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
            displayName: "YouTube video transcript",
            rawInput: "Source: https://youtu.be/example\n\nTranscript:\nA useful idea",
            createdAt: Date(timeIntervalSince1970: 100),
            sourceType: .video,
            status: .needsReview,
            proposedOutcomes: [.reference],
            confidence: 0.72,
            customTags: ["youtube", "transcript"]
        )

        let document = RAGQueueExportBuilder().document(for: item)

        XCTAssertEqual(document.filename, "agentmemory-youtube-video-transcript-11111111.md")
        XCTAssertEqual(document.collection, "agentmemory")
        XCTAssertEqual(document.tags, ["agentmemory", "video", "youtube", "transcript"])
        XCTAssertTrue(document.content.contains("# YouTube video transcript"))
        XCTAssertTrue(document.content.contains("Source type: video"))
        XCTAssertTrue(document.content.contains("A useful idea"))
    }

    func testWriterStagesDocumentAndEnqueuesRemoteJob() async throws {
        let document = RAGExportDocument(
            filename: "agentmemory-note.md",
            content: "# Note",
            collection: "agentmemory",
            tags: ["agentmemory", "reference"]
        )
        let transport = RecordingRAGQueueTransport()
        let writer = RAGQueueWriter(transport: transport)

        let jobID = try await writer.enqueue(document)

        XCTAssertEqual(jobID, 42)
        let staged = await transport.staged
        XCTAssertEqual(staged, [document])
    }

    func testSSHTransportCopiesDocumentAndRunsRemoteEnqueue() async throws {
        let document = RAGExportDocument(
            filename: "agentmemory-note.md",
            content: "# Note",
            collection: "agentmemory",
            tags: ["agentmemory", "reference"]
        )
        let runner = RecordingCommandRunner(outputs: ["", "42\n"])
        let transport = RAGSSHQueueTransport(
            config: RAGSSHQueueConfig(
                host: "192.168.1.107",
                user: "veronika",
                identityPath: "/Users/matt/.ssh/id_rsa_hermes"
            ),
            commandRunner: runner
        )

        let jobID = try await transport.stageAndEnqueue(document)

        XCTAssertEqual(jobID, 42)
        let commands = await runner.commands
        XCTAssertEqual(commands.count, 2)
        XCTAssertEqual(commands[0].executable, "/usr/bin/scp")
        XCTAssertTrue(commands[0].arguments.contains("veronika@192.168.1.107:/opt/rag/uploads-staging/agentmemory-note.md"))
        XCTAssertEqual(commands[1].executable, "/usr/bin/ssh")
        XCTAssertTrue(commands[1].arguments.last?.contains("queue_db.enqueue") == true)
        XCTAssertTrue(commands[1].arguments.last?.contains("uploads-staging") == true)
        XCTAssertTrue(commands[1].arguments.last?.contains("agentmemory-note.md") == true)
    }

    func testSSHTransportChecksRemoteRAGQueueConnection() async throws {
        let runner = RecordingCommandRunner(outputs: ["staging-ok\n", "queue-ok\n"])
        let transport = RAGSSHQueueTransport(
            config: RAGSSHQueueConfig(
                host: "192.168.1.107",
                user: "veronika",
                identityPath: "/Users/matt/.ssh/id_rsa_hermes"
            ),
            commandRunner: runner
        )

        let result = try await transport.checkConnection()

        XCTAssertEqual(result, RAGQueueConnectionCheck(stagingDirectory: "/opt/rag/uploads-staging", ingestDirectory: "/opt/rag/ingest"))
        let commands = await runner.commands
        XCTAssertEqual(commands.count, 2)
        XCTAssertEqual(commands[0].executable, "/usr/bin/ssh")
        XCTAssertTrue(commands[0].arguments.last?.contains("test -d '/opt/rag/uploads-staging'") == true)
        XCTAssertTrue(commands[1].arguments.last?.contains("import queue_db") == true)
    }
}

private actor RecordingRAGQueueTransport: RAGQueueTransporting {
    private(set) var staged: [RAGExportDocument] = []

    func stageAndEnqueue(_ document: RAGExportDocument) async throws -> Int {
        staged.append(document)
        return 42
    }
}

private actor RecordingCommandRunner: CommandRunning {
    private(set) var commands: [CommandInvocation] = []
    private var outputs: [String]

    init(outputs: [String]) {
        self.outputs = outputs
    }

    func run(_ invocation: CommandInvocation) async throws -> String {
        commands.append(invocation)
        return outputs.removeFirst()
    }
}
