import XCTest
@testable import AgentMemoryCore

final class WebPageIngestionServiceTests: XCTestCase {
    func testFetchesQueuedHTTPURLIntoReviewAndArchive() async throws {
        let item = CaptureItem(displayName: "Article", rawInput: "https://example.com/article")
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = WebPageIngestionService(
            archive: SourceArchive(root: root),
            fetcher: StubWebPageFetcher(
                pages: [
                    URL(string: "https://example.com/article")!: FetchedWebPage(
                        url: URL(string: "https://example.com/article")!,
                        title: "Example Article",
                        text: "Article body text"
                    )
                ]
            )
        )

        let processed = await service.fetchQueuedWebPages(in: AgentMemorySnapshot(items: [item]))

        XCTAssertEqual(processed.items[0].displayName, "Example Article")
        XCTAssertEqual(processed.items[0].rawInput, "Article body text")
        XCTAssertEqual(processed.items[0].sourceType, .url)
        XCTAssertEqual(processed.items[0].status, .needsReview)
        XCTAssertEqual(processed.items[0].proposedOutcomes, [.reference])
        XCTAssertEqual(processed.items[0].confidence, 0.72)
        XCTAssertEqual(processed.items[0].customTags, ["web"])
        XCTAssertEqual(processed.archivedSources.count, 1)
        XCTAssertTrue(FileManager.default.fileExists(atPath: processed.archivedSources[0].archivedPath))
    }

    func testFetchFailureMarksURLCaptureFailed() async {
        let item = CaptureItem(displayName: "Article", rawInput: "https://example.com/missing")
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = WebPageIngestionService(
            archive: SourceArchive(root: root),
            fetcher: StubWebPageFetcher(pages: [:])
        )

        let processed = await service.fetchQueuedWebPages(in: AgentMemorySnapshot(items: [item]))

        XCTAssertEqual(processed.items[0].status, .failed)
        XCTAssertTrue(processed.items[0].failureReason?.contains("Web fetch failed") == true)
        XCTAssertEqual(processed.archivedSources, [])
    }

    func testIgnoresNonURLQueuedCaptures() async {
        let item = CaptureItem(displayName: "Note", rawInput: "plain note")
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = WebPageIngestionService(
            archive: SourceArchive(root: root),
            fetcher: StubWebPageFetcher(pages: [:])
        )

        let processed = await service.fetchQueuedWebPages(in: AgentMemorySnapshot(items: [item]))

        XCTAssertEqual(processed.items[0], item)
    }
}

private struct StubWebPageFetcher: WebPageFetching {
    var pages: [URL: FetchedWebPage]

    func fetch(url: URL) async throws -> FetchedWebPage {
        guard let page = pages[url] else {
            throw URLError(.resourceUnavailable)
        }

        return page
    }
}
