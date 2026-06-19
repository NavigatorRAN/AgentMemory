import XCTest
@testable import AgentMemoryCore

final class AppleDocumentationIngestionServiceTests: XCTestCase {
    func testCatalogPathBuildsDocumentationAndDataURLs() {
        let path = URLSessionAppleDocumentationFetcher.documentationPath(
            fromIdentifier: "doc://com.apple.documentation/documentation/FoundationModels"
        )

        XCTAssertEqual(path, "/documentation/foundationmodels")
        XCTAssertEqual(
            URLSessionAppleDocumentationFetcher.dataURL(forDocumentationPath: path!).absoluteString,
            "https://developer.apple.com/tutorials/data/documentation/foundationmodels.json"
        )
    }

    func testPageParserExtractsSummaryAndReferences() throws {
        let object: [String: Any] = [
            "identifier": [
                "interfaceLanguage": "swift",
                "url": "doc://com.apple.foundationmodels/documentation/FoundationModels"
            ],
            "metadata": [
                "title": "Foundation Models"
            ],
            "abstract": [
                ["type": "text", "text": "Perform tasks with language models."]
            ],
            "primaryContentSections": [
                [
                    "kind": "content",
                    "content": [
                        ["type": "paragraph", "inlineContent": [["type": "text", "text": "Use sessions to generate content."]]]
                    ]
                ]
            ],
            "topicSections": [
                [
                    "title": "Essentials",
                    "identifiers": [
                        "doc://com.apple.foundationmodels/documentation/FoundationModels/generating-content"
                    ]
                ]
            ],
            "references": [
                "doc://com.apple.foundationmodels/documentation/FoundationModels/generating-content": [
                    "identifier": "doc://com.apple.foundationmodels/documentation/FoundationModels/generating-content",
                    "url": "/documentation/foundationmodels/generating-content",
                    "title": "Generating content",
                    "abstract": [
                        ["type": "text", "text": "Generate text with a model session."]
                    ],
                    "kind": "article",
                    "role": "article"
                ]
            ]
        ]

        let page = try AppleDocumentationPageParser().page(from: object)

        XCTAssertEqual(page.title, "Foundation Models")
        XCTAssertEqual(page.documentationURL.absoluteString, "https://developer.apple.com/documentation/foundationmodels")
        XCTAssertEqual(page.abstract, "Perform tasks with language models.")
        XCTAssertTrue(page.bodyText.contains("Use sessions to generate content."))
        XCTAssertTrue(page.bodyText.contains("Generating content"))
        XCTAssertEqual(page.references.count, 1)
        XCTAssertEqual(page.references[0].dataURL.absoluteString, "https://developer.apple.com/tutorials/data/documentation/foundationmodels/generating-content.json")
    }

    func testFetchQueuedAppleDocumentationExpandsRootAndChildPages() async throws {
        let rootURL = URL(string: "https://developer.apple.com/documentation/foundationmodels")!
        let childURL = URL(string: "https://developer.apple.com/documentation/foundationmodels/generating-content")!
        let rootDataURL = AppleDocumentationIngestionService.dataURL(for: rootURL)
        let childDataURL = AppleDocumentationIngestionService.dataURL(for: childURL)
        let rootPage = AppleDocumentationPage(
            title: "Foundation Models",
            identifier: "doc://com.apple.foundationmodels/documentation/FoundationModels",
            documentationURL: rootURL,
            abstract: "Perform tasks with language models.",
            bodyText: "Framework overview.",
            references: [
                AppleDocumentationReference(
                    title: "Generating content",
                    identifier: "doc://com.apple.foundationmodels/documentation/FoundationModels/generating-content",
                    documentationURL: childURL,
                    dataURL: childDataURL,
                    abstract: "Generate text with a model session.",
                    kind: "article",
                    role: "article"
                )
            ]
        )
        let childPage = AppleDocumentationPage(
            title: "Generating content",
            identifier: "doc://com.apple.foundationmodels/documentation/FoundationModels/generating-content",
            documentationURL: childURL,
            abstract: "Generate text with a model session.",
            bodyText: "Use a language model session.",
            references: []
        )
        let item = CaptureItem(
            displayName: "Foundation Models",
            rawInput: rootURL.absoluteString,
            sourceType: .url,
            customTags: ["apple-docs"]
        )
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = AppleDocumentationIngestionService(
            archive: SourceArchive(root: root),
            fetcher: StubAppleDocumentationFetcher(pages: [rootDataURL: rootPage, childDataURL: childPage]),
            options: AppleDocumentationIngestionOptions(maxChildPagesPerRoot: 1)
        )

        let processed = await service.fetchQueuedAppleDocumentation(in: AgentMemorySnapshot(items: [item]))

        XCTAssertEqual(processed.items.count, 2)
        XCTAssertEqual(processed.items[0].displayName, "Foundation Models")
        XCTAssertEqual(processed.items[0].status, .needsReview)
        XCTAssertEqual(processed.items[0].proposedOutcomes, [.reference, .entity, .link])
        XCTAssertTrue(processed.items[0].rawInput.contains("Source URL: \(rootURL.absoluteString)"))
        XCTAssertTrue(processed.items[0].customTags.contains("apple-docs"))
        XCTAssertEqual(processed.items[1].displayName, "Generating content")
        XCTAssertEqual(processed.items[1].status, .needsReview)
        XCTAssertTrue(processed.items[1].rawInput.contains("Root: Foundation Models"))
        XCTAssertEqual(processed.archivedSources.count, 2)
    }

    func testFetchQueuedAppleDocumentationRetriesFailedAppleDocCaptures() async throws {
        let rootURL = URL(string: "https://developer.apple.com/documentation/foundationmodels")!
        let rootDataURL = AppleDocumentationIngestionService.dataURL(for: rootURL)
        let rootPage = AppleDocumentationPage(
            title: "Foundation Models",
            identifier: "doc://com.apple.foundationmodels/documentation/FoundationModels",
            documentationURL: rootURL,
            abstract: "Perform tasks with language models.",
            bodyText: "Framework overview.",
            references: []
        )
        let failedItem = CaptureItem(
            displayName: "Foundation Models",
            rawInput: rootURL.absoluteString,
            sourceType: .url,
            status: .failed,
            failureReason: "Apple documentation fetch failed",
            customTags: ["apple-docs"]
        )
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let service = AppleDocumentationIngestionService(
            archive: SourceArchive(root: root),
            fetcher: StubAppleDocumentationFetcher(pages: [rootDataURL: rootPage])
        )

        let processed = await service.fetchQueuedAppleDocumentation(in: AgentMemorySnapshot(items: [failedItem]))

        XCTAssertEqual(processed.items[0].status, .needsReview)
        XCTAssertNil(processed.items[0].failureReason)
        XCTAssertTrue(processed.items[0].rawInput.contains("Source URL: \(rootURL.absoluteString)"))
    }
}

private struct StubAppleDocumentationFetcher: AppleDocumentationFetching {
    var pages: [URL: AppleDocumentationPage]

    func fetchTechnologies() async throws -> [AppleDocumentationTechnology] {
        []
    }

    func fetchPage(dataURL: URL) async throws -> AppleDocumentationPage {
        guard let page = pages[dataURL] else {
            throw URLError(.resourceUnavailable)
        }

        return page
    }
}
