import XCTest
@testable import AgentMemoryCore

final class SourceArchiveTests: XCTestCase {
    func testArchiveCopiesExistingFileBytes() throws {
        let temporaryRoot = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: temporaryRoot, withIntermediateDirectories: true)
        let sourceFile = temporaryRoot.appendingPathComponent("source-note.txt")
        try Data("real file contents".utf8).write(to: sourceFile)

        let archiveRoot = temporaryRoot.appendingPathComponent("Archive", isDirectory: true)
        let archive = SourceArchive(root: archiveRoot)
        let item = CaptureItem(displayName: "source-note.txt", rawInput: sourceFile.path, sourceType: .text)

        let archived = try archive.archive(item: item)

        XCTAssertEqual(archived.originalPath, sourceFile.path)
        XCTAssertEqual(archived.byteSize, 18)
        XCTAssertEqual(URL(fileURLWithPath: archived.archivedPath).lastPathComponent, "source-note.txt")
        XCTAssertEqual(try String(contentsOfFile: archived.archivedPath, encoding: .utf8), "real file contents")
    }

    func testArchiveFallsBackToSourceTextForNonFileCapture() throws {
        let archiveRoot = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let archive = SourceArchive(root: archiveRoot)
        let item = CaptureItem(displayName: "Note", rawInput: "Decision: preserve source text", sourceType: .text)

        let archived = try archive.archive(item: item)

        XCTAssertNil(archived.originalPath)
        XCTAssertEqual(archived.byteSize, 30)
        XCTAssertEqual(URL(fileURLWithPath: archived.archivedPath).lastPathComponent, "source.txt")
        XCTAssertEqual(try String(contentsOfFile: archived.archivedPath, encoding: .utf8), "Decision: preserve source text")
    }
}
