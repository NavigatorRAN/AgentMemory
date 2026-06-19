import XCTest
@testable import AgentMemoryCore

final class ArchivedSourcePreviewReaderTests: XCTestCase {
    func testReadsArchivedTextPreview() throws {
        let source = try makeArchivedSource(contents: "Decision: preview archived source")

        let preview = ArchivedSourcePreviewReader().preview(for: source, limit: 200)

        XCTAssertEqual(preview, "Decision: preview archived source")
    }

    func testTruncatesLongPreview() throws {
        let source = try makeArchivedSource(contents: String(repeating: "a", count: 12))

        let preview = ArchivedSourcePreviewReader().preview(for: source, limit: 5)

        XCTAssertEqual(preview, "aaaaa\n\n[Preview truncated]")
    }

    func testReportsMissingArchivedFile() {
        let source = ArchivedSource(
            itemID: UUID(),
            displayName: "Missing",
            archivedPath: "/tmp/agentmemory-missing-\(UUID().uuidString).txt",
            sourceType: .text,
            createdAt: Date()
        )

        let preview = ArchivedSourcePreviewReader().preview(for: source, limit: 200)

        XCTAssertEqual(preview, "Archived source file is not readable.")
    }

    private func makeArchivedSource(contents: String) throws -> ArchivedSource {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let fileURL = root.appendingPathComponent("source.txt")
        try contents.data(using: .utf8)?.write(to: fileURL)
        return ArchivedSource(
            itemID: UUID(),
            displayName: "Source",
            archivedPath: fileURL.path,
            sourceType: .text,
            createdAt: Date()
        )
    }
}
