import XCTest
@testable import AgentMemoryCore

final class YouTubeVideoIDParserTests: XCTestCase {
    func testParsesStandardWatchURL() {
        let parser = YouTubeVideoIDParser()

        let id = parser.videoID(from: "https://www.youtube.com/watch?v=dQw4w9WgXcQ&t=42s")

        XCTAssertEqual(id, "dQw4w9WgXcQ")
    }

    func testParsesShortShareURL() {
        let parser = YouTubeVideoIDParser()

        let id = parser.videoID(from: "https://youtu.be/dQw4w9WgXcQ?si=abc123")

        XCTAssertEqual(id, "dQw4w9WgXcQ")
    }

    func testParsesShortsURL() {
        let parser = YouTubeVideoIDParser()

        let id = parser.videoID(from: "https://www.youtube.com/shorts/dQw4w9WgXcQ")

        XCTAssertEqual(id, "dQw4w9WgXcQ")
    }

    func testRejectsNonYouTubeURL() {
        let parser = YouTubeVideoIDParser()

        XCTAssertNil(parser.videoID(from: "https://example.com/watch?v=dQw4w9WgXcQ"))
    }
}
