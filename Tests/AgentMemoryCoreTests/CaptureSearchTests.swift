import XCTest
@testable import AgentMemoryCore

final class CaptureSearchTests: XCTestCase {
    func testBlankQueryReturnsAllItems() {
        let items = [
            CaptureItem(displayName: "One", rawInput: "alpha"),
            CaptureItem(displayName: "Two", rawInput: "beta")
        ]

        XCTAssertEqual(CaptureSearch().filter(items, query: " \n\t "), items)
    }

    func testMatchesTitleAndRawInput() {
        let items = [
            CaptureItem(displayName: "WWDC session", rawInput: "video transcript"),
            CaptureItem(displayName: "Article", rawInput: "Memory MCP gotcha")
        ]

        XCTAssertEqual(CaptureSearch().filter(items, query: "gotcha"), [items[1]])
        XCTAssertEqual(CaptureSearch().filter(items, query: "wwdc"), [items[0]])
    }

    func testMatchesStatusSourceAndTags() {
        let items = [
            CaptureItem(displayName: "Video", rawInput: "transcript", sourceType: .video, status: .needsReview, customTags: ["youtube"]),
            CaptureItem(displayName: "Article", rawInput: "web text", sourceType: .url, status: .failed, customTags: ["web"])
        ]

        XCTAssertEqual(CaptureSearch().filter(items, query: "needsReview"), [items[0]])
        XCTAssertEqual(CaptureSearch().filter(items, query: "video"), [items[0]])
        XCTAssertEqual(CaptureSearch().filter(items, query: "web"), [items[1]])
    }
}
