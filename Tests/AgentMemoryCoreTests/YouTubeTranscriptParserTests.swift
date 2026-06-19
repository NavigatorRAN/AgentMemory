import XCTest
@testable import AgentMemoryCore

final class YouTubeTranscriptParserTests: XCTestCase {
    func testParsesTimedTextXMLIntoTranscript() throws {
        let xml = """
        <?xml version="1.0" encoding="utf-8" ?>
        <transcript>
          <text start="0.0" dur="1.2">Welcome to the session</text>
          <text start="1.2" dur="2.4">Today we build agent memory</text>
        </transcript>
        """

        let transcript = try YouTubeTranscriptParser().transcript(from: Data(xml.utf8))

        XCTAssertEqual(transcript, "Welcome to the session\nToday we build agent memory")
    }

    func testDecodesXMLTextEntities() throws {
        let xml = """
        <transcript>
          <text start="0.0" dur="1.2">Memory MCP &amp; RAG &quot;exports&quot;</text>
        </transcript>
        """

        let transcript = try YouTubeTranscriptParser().transcript(from: Data(xml.utf8))

        XCTAssertEqual(transcript, "Memory MCP & RAG \"exports\"")
    }

    func testThrowsForEmptyTranscript() {
        let xml = "<transcript></transcript>"

        XCTAssertThrowsError(try YouTubeTranscriptParser().transcript(from: Data(xml.utf8)))
    }
}
