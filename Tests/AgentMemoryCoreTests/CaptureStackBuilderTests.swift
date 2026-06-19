import XCTest
@testable import AgentMemoryCore

final class CaptureStackBuilderTests: XCTestCase {
    func testBuildsItemsFromTextLines() {
        let builder = CaptureStackBuilder()
        let items = builder.items(fromTextStack: "https://example.com\n\nDecision: keep local source archive")

        XCTAssertEqual(items.count, 2)
        XCTAssertEqual(items[0].displayName, "example.com")
        XCTAssertEqual(items[0].rawInput, "https://example.com")
        XCTAssertEqual(items[1].displayName, "Decision: keep local source archive")
        XCTAssertEqual(items[1].rawInput, "Decision: keep local source archive")
    }

    func testBuildsItemsFromFileURLs() {
        let builder = CaptureStackBuilder()
        let urls = [
            URL(fileURLWithPath: "/tmp/research.pdf"),
            URL(fileURLWithPath: "/tmp/screenshot.png")
        ]

        let items = builder.items(fromFileURLs: urls)

        XCTAssertEqual(items.map(\.displayName), ["research.pdf", "screenshot.png"])
        XCTAssertEqual(items.map(\.rawInput), ["/tmp/research.pdf", "/tmp/screenshot.png"])
    }

    func testEmptyTextStackProducesNoItems() {
        let builder = CaptureStackBuilder()

        XCTAssertEqual(builder.items(fromTextStack: " \n\n\t ").count, 0)
    }
}
