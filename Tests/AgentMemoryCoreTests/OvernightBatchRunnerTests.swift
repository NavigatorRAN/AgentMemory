import XCTest
@testable import AgentMemoryCore

final class OvernightBatchRunnerTests: XCTestCase {
    func testSnapshotDecodesOlderJSONWithoutBatchRuns() throws {
        let json = """
        {
          "version" : 1,
          "items" : [],
          "rules" : [],
          "archivedSources" : [],
          "morningBriefs" : []
        }
        """.data(using: .utf8)!

        let snapshot = try JSONDecoder.agentMemory.decode(AgentMemorySnapshot.self, from: json)

        XCTAssertEqual(snapshot.batchRuns, [])
    }

    func testProcessQueuedBatchAppendsRunSummaryAndMorningBrief() async {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = CaptureProcessingService(
            archive: SourceArchive(root: root),
            memoryWriter: MockMemoryWriter()
        )
        let complete = CaptureItem(displayName: "Decision", rawInput: "Decision: run overnight batch")
        let review = CaptureItem(displayName: "Reference", rawInput: "plain reference note")
        let failed = CaptureItem(displayName: "Failure", rawInput: "Decision: force write failure")
        let snapshot = AgentMemorySnapshot(items: [complete, review, failed])

        let processed = await service.processQueuedBatch(in: snapshot, startedAt: Date(timeIntervalSince1970: 100))

        XCTAssertEqual(processed.batchRuns.count, 1)
        XCTAssertEqual(processed.morningBriefs.count, 1)
        XCTAssertEqual(processed.batchRuns[0].status, .failed)
        XCTAssertEqual(processed.batchRuns[0].queuedItemCount, 3)
        XCTAssertEqual(processed.batchRuns[0].completedItemCount, 1)
        XCTAssertEqual(processed.batchRuns[0].reviewItemCount, 1)
        XCTAssertEqual(processed.batchRuns[0].failedItemCount, 1)
        XCTAssertEqual(processed.batchRuns[0].summary, "Processed 3 queued captures: 1 complete, 1 review, 1 failed.")
    }

    func testProcessQueuedBatchRecordsCompleteRunWhenNothingFails() async {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = CaptureProcessingService(
            archive: SourceArchive(root: root),
            memoryWriter: MockMemoryWriter()
        )
        let snapshot = AgentMemorySnapshot(
            items: [
                CaptureItem(displayName: "Decision", rawInput: "Decision: run overnight batch"),
                CaptureItem(displayName: "Reference", rawInput: "plain reference note")
            ]
        )

        let processed = await service.processQueuedBatch(in: snapshot, startedAt: Date(timeIntervalSince1970: 200))

        XCTAssertEqual(processed.batchRuns[0].status, .complete)
        XCTAssertEqual(processed.batchRuns[0].queuedItemCount, 2)
        XCTAssertEqual(processed.batchRuns[0].completedItemCount, 1)
        XCTAssertEqual(processed.batchRuns[0].reviewItemCount, 1)
        XCTAssertEqual(processed.batchRuns[0].failedItemCount, 0)
    }
}
