import XCTest
@testable import AgentMemoryCore

final class CaptureProcessingServiceTests: XCTestCase {
    func testProcessNextArchivesProcessedCapture() async throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = CaptureProcessingService(
            archive: SourceArchive(root: root),
            memoryWriter: MockMemoryWriter()
        )
        let snapshot = AgentMemorySnapshot(
            items: [
                CaptureItem(displayName: "Decision", rawInput: "Decision: archive source material")
            ]
        )

        let processed = await service.processNext(in: snapshot)

        XCTAssertEqual(processed.items[0].status, .complete)
        XCTAssertEqual(processed.archivedSources.count, 1)
        XCTAssertEqual(processed.archivedSources[0].itemID, processed.items[0].id)
        XCTAssertTrue(FileManager.default.fileExists(atPath: processed.archivedSources[0].archivedPath))
    }

    func testProcessAllArchivesEachNewlyProcessedCaptureOnce() async {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = CaptureProcessingService(
            archive: SourceArchive(root: root),
            memoryWriter: MockMemoryWriter()
        )
        let first = CaptureItem(displayName: "Decision", rawInput: "Decision: archive source material")
        let second = CaptureItem(displayName: "Review", rawInput: "plain reference note")
        let archived = ArchivedSource(
            itemID: first.id,
            displayName: first.displayName,
            archivedPath: "/tmp/existing.txt",
            sourceType: .text,
            createdAt: Date(timeIntervalSince1970: 100)
        )
        let snapshot = AgentMemorySnapshot(items: [first, second], archivedSources: [archived])

        let processed = await service.processAllQueued(in: snapshot)

        XCTAssertEqual(processed.items.map(\.status), [.complete, .needsReview])
        XCTAssertEqual(processed.archivedSources.count, 2)
        XCTAssertEqual(processed.archivedSources.filter { $0.itemID == first.id }.count, 1)
        XCTAssertEqual(processed.archivedSources.filter { $0.itemID == second.id }.count, 1)
    }
}
