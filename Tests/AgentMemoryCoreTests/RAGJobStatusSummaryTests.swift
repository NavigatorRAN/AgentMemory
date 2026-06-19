import XCTest
@testable import AgentMemoryCore

final class RAGJobStatusSummaryTests: XCTestCase {
    func testCountsRemoteStatusesForExportedCaptures() {
        let items = [
            CaptureItem(
                displayName: "Done",
                rawInput: "Ready",
                ragExport: RAGExportStatus(
                    jobID: 1,
                    exportedAt: Date(timeIntervalSince1970: 100),
                    collection: "agentmemory",
                    remoteStatus: "done"
                )
            ),
            CaptureItem(
                displayName: "Failed",
                rawInput: "Broken",
                ragExport: RAGExportStatus(
                    jobID: 2,
                    exportedAt: Date(timeIntervalSince1970: 101),
                    collection: "agentmemory",
                    remoteStatus: "failed"
                )
            ),
            CaptureItem(
                displayName: "Pending refresh",
                rawInput: "Unknown",
                ragExport: RAGExportStatus(
                    jobID: 3,
                    exportedAt: Date(timeIntervalSince1970: 102),
                    collection: "agentmemory"
                )
            )
        ]

        let counts = RAGJobStatusSummaryBuilder().counts(in: items)

        XCTAssertEqual(counts, ["done": 1, "failed": 1])
    }
}
