import XCTest
@testable import AgentMemoryCore

final class YouTubeCaptionManifestParserTests: XCTestCase {
    func testExtractsFirstEnglishCaptionTrackFromWatchHTML() throws {
        let html = """
        <html><script>
        var ytInitialPlayerResponse = {
          "captions": {
            "playerCaptionsTracklistRenderer": {
              "captionTracks": [
                {
                  "baseUrl": "https://www.youtube.com/api/timedtext?v=abc&lang=en",
                  "name": { "simpleText": "English" },
                  "languageCode": "en"
                },
                {
                  "baseUrl": "https://www.youtube.com/api/timedtext?v=abc&lang=de",
                  "name": { "simpleText": "German" },
                  "languageCode": "de"
                }
              ]
            }
          }
        };
        </script></html>
        """

        let tracks = try YouTubeCaptionManifestParser().captionTracks(from: html)

        XCTAssertEqual(tracks.count, 2)
        XCTAssertEqual(tracks[0].baseURL.absoluteString, "https://www.youtube.com/api/timedtext?v=abc&lang=en")
        XCTAssertEqual(tracks[0].languageCode, "en")
        XCTAssertEqual(tracks[0].displayName, "English")
    }

    func testDecodesEscapedCaptionTrackJSON() throws {
        let html = #"""
        <script>
        {"captionTracks":[{"baseUrl":"https:\/\/www.youtube.com\/api\/timedtext?v=abc\u0026lang=en","name":{"simpleText":"English (auto-generated)"},"languageCode":"en"}]}
        </script>
        """#

        let tracks = try YouTubeCaptionManifestParser().captionTracks(from: html)

        XCTAssertEqual(tracks[0].baseURL.absoluteString, "https://www.youtube.com/api/timedtext?v=abc&lang=en")
        XCTAssertEqual(tracks[0].displayName, "English (auto-generated)")
    }

    func testThrowsWhenCaptionTracksAreMissing() {
        XCTAssertThrowsError(try YouTubeCaptionManifestParser().captionTracks(from: "<html>No captions</html>"))
    }
}
