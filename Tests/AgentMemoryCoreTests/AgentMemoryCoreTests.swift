import XCTest
@testable import AgentMemoryCore

final class AgentMemoryCoreTests: XCTestCase {
    func testCaptureItemDefaultsToQueuedUnknownSource() {
        let item = CaptureItem(displayName: "Note", rawInput: "Remember this")

        XCTAssertEqual(item.displayName, "Note")
        XCTAssertEqual(item.sourceType, .unknown)
        XCTAssertEqual(item.status, .queued)
        XCTAssertEqual(item.proposedOutcomes, [])
        XCTAssertEqual(item.confidence, 0)
    }
}
