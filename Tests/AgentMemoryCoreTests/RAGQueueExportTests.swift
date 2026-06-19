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

    func testSSHTransportFetchesRAGJobStatuses() async throws {
        let runner = RecordingCommandRunner(outputs: [
            """
            [{"id":42,"status":"done","error":null,"attempts":1,"chunks_upserted":12,"doc_id":"doc-42"}]

            """
        ])
        let transport = RAGSSHQueueTransport(
            config: RAGSSHQueueConfig(
                host: "192.168.1.107",
                user: "veronika",
                identityPath: "/Users/matt/.ssh/id_rsa_hermes"
            ),
            commandRunner: runner
        )

        let statuses = try await transport.fetchJobStatuses(jobIDs: [42])

        XCTAssertEqual(statuses, [
            RAGQueueJobStatus(
                id: 42,
                status: "done",
                error: nil,
                attempts: 1,
                chunksUpserted: 12,
                docID: "doc-42"
            )
        ])
        let commands = await runner.commands
        XCTAssertEqual(commands.count, 1)
        XCTAssertTrue(commands[0].arguments.last?.contains("from jobs") == true)
        XCTAssertTrue(commands[0].arguments.last?.contains("chunks_upserted") == true)
    }

    func testBatchExporterExportsOnlyCompletedUnexportedCaptures() async throws {
        let exportDate = Date(timeIntervalSince1970: 500)
        let completed = CaptureItem(
            id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
            displayName: "Completed note",
            rawInput: "Reference: ready",
            sourceType: .text,
            status: .complete
        )
        let needsReview = CaptureItem(
            id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!,
            displayName: "Review note",
            rawInput: "Maybe later",
            sourceType: .text,
            status: .needsReview
        )
        let alreadyExported = CaptureItem(
            id: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!,
            displayName: "Exported note",
            rawInput: "Already queued",
            sourceType: .text,
            status: .complete,
            ragExport: RAGExportStatus(jobID: 7, exportedAt: Date(timeIntervalSince1970: 300), collection: "agentmemory")
        )
        let failed = CaptureItem(
            id: UUID(uuidString: "44444444-4444-4444-4444-444444444444")!,
            displayName: "Failed note",
            rawInput: "Broken",
            sourceType: .text,
            status: .failed
        )
        let transport = RecordingRAGQueueTransport(jobIDs: [101])
        let exporter = RAGBatchExporter(
            defaultCollection: "agentmemory",
            transport: transport,
            now: { exportDate }
        )

        let result = try await exporter.exportCompletedItems(in: [completed, needsReview, alreadyExported, failed])

        XCTAssertEqual(result.exportedCount, 1)
        XCTAssertEqual(result.skippedCount, 3)
        XCTAssertEqual(result.items[0].ragExport, RAGExportStatus(jobID: 101, exportedAt: exportDate, collection: "agentmemory"))
        XCTAssertNil(result.items[1].ragExport)
        XCTAssertEqual(result.items[2].ragExport?.jobID, 7)
        XCTAssertNil(result.items[3].ragExport)
        let staged = await transport.staged
        XCTAssertEqual(staged.map(\.filename), ["agentmemory-completed-note-11111111.md"])
    }

    func testBatchExporterKeepsSuccessfulMetadataWhenLaterItemFails() async throws {
        let exportDate = Date(timeIntervalSince1970: 600)
        let first = CaptureItem(
            id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
            displayName: "First note",
            rawInput: "Reference: first",
            sourceType: .text,
            status: .complete
        )
        let second = CaptureItem(
            id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!,
            displayName: "Second note",
            rawInput: "Reference: second",
            sourceType: .text,
            status: .complete
        )
        let transport = ResultRAGQueueTransport(results: [.success(201), .failure(TestRAGExportError.remoteFailed)])
        let exporter = RAGBatchExporter(
            defaultCollection: "agentmemory",
            transport: transport,
            now: { exportDate }
        )

        let result = try await exporter.exportCompletedItems(in: [first, second])

        XCTAssertEqual(result.exportedCount, 1)
        XCTAssertEqual(result.failedCount, 1)
        XCTAssertEqual(result.items[0].ragExport?.jobID, 201)
        XCTAssertNil(result.items[1].ragExport)
        XCTAssertEqual(result.failures.map(\.displayName), ["Second note"])
    }
}

private enum TestRAGExportError: Error {
    case remoteFailed
}

private actor RecordingRAGQueueTransport: RAGQueueTransporting {
    private(set) var staged: [RAGExportDocument] = []
    private var jobIDs: [Int]

    init(jobIDs: [Int] = [42]) {
        self.jobIDs = jobIDs
    }

    func stageAndEnqueue(_ document: RAGExportDocument) async throws -> Int {
        staged.append(document)
        return jobIDs.isEmpty ? 42 : jobIDs.removeFirst()
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

private actor ResultRAGQueueTransport: RAGQueueTransporting {
    private var results: [Result<Int, TestRAGExportError>]

    init(results: [Result<Int, TestRAGExportError>]) {
        self.results = results
    }

    func stageAndEnqueue(_ document: RAGExportDocument) async throws -> Int {
        switch results.removeFirst() {
        case .success(let jobID):
            return jobID
        case .failure(let error):
            throw error
        }
    }
}
