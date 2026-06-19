import XCTest
@testable import AgentMemoryCore

final class YouTubeTranscriptIngestionServiceTests: XCTestCase {
    func testFetchesQueuedYouTubeTranscriptIntoReviewAndArchive() async {
        let url = URL(string: "https://youtu.be/dQw4w9WgXcQ")!
        let item = CaptureItem(displayName: "Video", rawInput: url.absoluteString, sourceType: .video)
        let captionURL = URL(string: "https://www.youtube.com/api/timedtext?v=dQw4w9WgXcQ&lang=en")!
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = YouTubeTranscriptIngestionService(
            archive: SourceArchive(root: root),
            fetcher: StubYouTubeTranscriptFetcher(
                watchHTML: [
                    URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!: watchHTML(captionURL: captionURL)
                ],
                transcriptData: [
                    captionURL: Data("<transcript><text>Transcript line one</text><text>Line two</text></transcript>".utf8)
                ]
            )
        )

        let processed = await service.fetchQueuedTranscripts(in: AgentMemorySnapshot(items: [item]))

        XCTAssertEqual(processed.items[0].displayName, "YouTube video dQw4w9WgXcQ transcript")
        XCTAssertEqual(processed.items[0].rawInput, "Source: https://youtu.be/dQw4w9WgXcQ\n\nTranscript:\nTranscript line one\nLine two")
        XCTAssertEqual(processed.items[0].sourceType, .video)
        XCTAssertEqual(processed.items[0].status, .needsReview)
        XCTAssertEqual(processed.items[0].proposedOutcomes, [.reference])
        XCTAssertEqual(processed.items[0].confidence, 0.72)
        XCTAssertEqual(processed.items[0].customTags, ["youtube", "transcript"])
        XCTAssertEqual(processed.archivedSources.count, 1)
        XCTAssertTrue(FileManager.default.fileExists(atPath: processed.archivedSources[0].archivedPath))
    }

    func testTranscriptFailureMarksVideoCaptureFailed() async {
        let item = CaptureItem(displayName: "Video", rawInput: "https://youtu.be/dQw4w9WgXcQ", sourceType: .video)
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = YouTubeTranscriptIngestionService(
            archive: SourceArchive(root: root),
            fetcher: StubYouTubeTranscriptFetcher(watchHTML: [:], transcriptData: [:])
        )

        let processed = await service.fetchQueuedTranscripts(in: AgentMemorySnapshot(items: [item]))

        XCTAssertEqual(processed.items[0].status, .failed)
        XCTAssertTrue(processed.items[0].failureReason?.contains("YouTube transcript failed") == true)
        XCTAssertEqual(processed.archivedSources, [])
    }

    func testIgnoresQueuedNonYouTubeCaptures() async {
        let item = CaptureItem(displayName: "Article", rawInput: "https://example.com/article", sourceType: .url)
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = YouTubeTranscriptIngestionService(
            archive: SourceArchive(root: root),
            fetcher: StubYouTubeTranscriptFetcher(watchHTML: [:], transcriptData: [:])
        )

        let processed = await service.fetchQueuedTranscripts(in: AgentMemorySnapshot(items: [item]))

        XCTAssertEqual(processed.items[0], item)
    }

    private func watchHTML(captionURL: URL) -> String {
        """
        <script>
        {"captionTracks":[{"baseUrl":"\(captionURL.absoluteString.replacingOccurrences(of: "&", with: "\\u0026"))","name":{"simpleText":"English"},"languageCode":"en"}]}
        </script>
        """
    }
}

private struct StubYouTubeTranscriptFetcher: YouTubeTranscriptFetching {
    var watchHTML: [URL: String]
    var transcriptData: [URL: Data]

    func fetchWatchHTML(url: URL) async throws -> String {
        guard let html = watchHTML[url] else {
            throw URLError(.resourceUnavailable)
        }

        return html
    }

    func fetchTranscriptData(url: URL) async throws -> Data {
        guard let data = transcriptData[url] else {
            throw URLError(.resourceUnavailable)
        }

        return data
    }
}
