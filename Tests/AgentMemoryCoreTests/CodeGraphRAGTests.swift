import XCTest
@testable import AgentMemoryCore

final class CodeGraphRAGTests: XCTestCase {
    func testIndexerBuildsTextUnitsSymbolsAndRelationshipsFromLocalRepo() throws {
        let repo = try makeFixtureRepo()

        let index = try CodeGraphRAGIndexer().indexRepository(at: repo, name: "FixtureRepo")

        XCTAssertEqual(index.repositoryName, "FixtureRepo")
        XCTAssertEqual(index.textUnits.map(\.relativePath).sorted(), [
            "README.md",
            "Sources/App/AppViewModel.swift",
            "Sources/App/helper.py",
            "Tests/AppTests/AppViewModelTests.swift"
        ])
        XCTAssertFalse(index.textUnits.contains { $0.relativePath.contains(".build") })
        XCTAssertTrue(index.symbols.contains(CodeGraphRAGSymbol(name: "AppViewModel", kind: .type, relativePath: "Sources/App/AppViewModel.swift", line: 3)))
        XCTAssertTrue(index.symbols.contains(CodeGraphRAGSymbol(name: "loadUser", kind: .function, relativePath: "Sources/App/AppViewModel.swift", line: 4)))
        XCTAssertTrue(index.symbols.contains(CodeGraphRAGSymbol(name: "Helper", kind: .type, relativePath: "Sources/App/helper.py", line: 1)))
        XCTAssertTrue(index.symbols.contains(CodeGraphRAGSymbol(name: "Overview", kind: .heading, relativePath: "README.md", line: 1)))
        XCTAssertTrue(index.relationships.contains(CodeGraphRAGRelationship(source: "Sources/App/AppViewModel.swift", target: "AppViewModel", kind: .contains, detail: "type")))
        XCTAssertTrue(index.relationships.contains(CodeGraphRAGRelationship(source: "Sources/App/AppViewModel.swift", target: "SwiftUI", kind: .imports, detail: nil)))
        XCTAssertTrue(index.relationships.contains(CodeGraphRAGRelationship(source: "Tests/AppTests/AppViewModelTests.swift", target: "Sources/App/AppViewModel.swift", kind: .tests, detail: "AppViewModel")))
    }

    func testCommunityBuilderGroupsRepoIntoSubsystemReports() throws {
        let repo = try makeFixtureRepo()
        let index = try CodeGraphRAGIndexer().indexRepository(at: repo, name: "FixtureRepo")

        let reports = CodeGraphRAGCommunityBuilder().reports(from: index)

        XCTAssertEqual(reports.map(\.name).sorted(), ["Docs", "Sources/App", "Tests/AppTests"])
        let sourceReport = try XCTUnwrap(reports.first { $0.name == "Sources/App" })
        XCTAssertEqual(sourceReport.keyFiles, ["Sources/App/AppViewModel.swift", "Sources/App/helper.py"])
        XCTAssertTrue(sourceReport.keySymbols.contains("AppViewModel"))
        XCTAssertTrue(sourceReport.summary.contains("Sources/App contains 2 files"))
        XCTAssertTrue(sourceReport.claims.contains("This community imports SwiftUI."))
    }

    func testWikiPageBuilderCreditsGraphRAGAndCreatesOverviewAndCommunityPages() throws {
        let repo = try makeFixtureRepo()
        let index = try CodeGraphRAGIndexer().indexRepository(at: repo, name: "FixtureRepo")
        let reports = CodeGraphRAGCommunityBuilder().reports(from: index)

        let pages = CodeGraphRAGWikiPageBuilder(now: { Date(timeIntervalSince1970: 300) })
            .pages(from: index, reports: reports)

        XCTAssertEqual(pages.map(\.slug).sorted(), [
            "codegraphrag-fixturerepo-docs",
            "codegraphrag-fixturerepo-overview",
            "codegraphrag-fixturerepo-sources-app",
            "codegraphrag-fixturerepo-tests-apptests"
        ])
        let overview = try XCTUnwrap(pages.first { $0.slug == "codegraphrag-fixturerepo-overview" })
        XCTAssertTrue(overview.tags.contains("code-graphrag"))
        XCTAssertTrue(overview.entities.contains("codegraphrag:fixturerepo"))
        XCTAssertTrue(overview.summary.contains("GraphRAG-inspired local code index"))
        XCTAssertTrue(overview.body.contains("Conceptual inspiration: Microsoft GraphRAG"))
        XCTAssertTrue(overview.body.contains("This implementation does not vendor Microsoft GraphRAG code."))
        let sourcePage = try XCTUnwrap(pages.first { $0.slug == "codegraphrag-fixturerepo-sources-app" })
        XCTAssertTrue(sourcePage.body.contains("AppViewModel"))
        XCTAssertTrue(sourcePage.body.contains("This community imports SwiftUI."))
    }

    private func makeFixtureRepo() throws -> URL {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        try write(
            """
            import SwiftUI

            struct AppViewModel {
                func loadUser() {}
            }
            """,
            to: root.appendingPathComponent("Sources/App/AppViewModel.swift")
        )
        try write(
            """
            class Helper:
                def parse(self):
                    return True
            """,
            to: root.appendingPathComponent("Sources/App/helper.py")
        )
        try write(
            """
            import XCTest
            @testable import FixtureRepo

            final class AppViewModelTests: XCTestCase {
                func testAppViewModelLoadsUser() {}
            }
            """,
            to: root.appendingPathComponent("Tests/AppTests/AppViewModelTests.swift")
        )
        try write(
            """
            # Overview

            This fixture describes the app.
            """,
            to: root.appendingPathComponent("README.md")
        )
        try write("ignored", to: root.appendingPathComponent(".build/debug.o"))
        return root
    }

    private func write(_ contents: String, to url: URL) throws {
        try FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        try contents.write(to: url, atomically: true, encoding: .utf8)
    }
}
