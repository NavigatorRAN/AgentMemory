import Foundation

public struct AgentMemoryWikiFileStore: Sendable {
    public var root: URL

    public init(root: URL) {
        self.root = root
    }

    public func write(pages: [AgentMemoryWikiPage], latestRun: AgentMemoryWikiRefreshRun?) throws {
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)

        for page in pages {
            let url = root.appendingPathComponent("\(page.slug).md")
            try markdown(for: page).write(to: url, atomically: true, encoding: .utf8)
        }

        try indexMarkdown(for: pages).write(
            to: root.appendingPathComponent("index.md"),
            atomically: true,
            encoding: .utf8
        )
        try logMarkdown(for: latestRun).write(
            to: root.appendingPathComponent("log.md"),
            atomically: true,
            encoding: .utf8
        )
    }

    public func markdown(for page: AgentMemoryWikiPage) -> String {
        let frontmatter = [
            "---",
            "title: \(page.title)",
            "slug: \(page.slug)",
            "refreshed_at: \(ISO8601DateFormatter().string(from: page.refreshedAt))",
            "refresh_reason: \(page.refreshReason.rawValue)",
            "entities: \(page.entities.joined(separator: ", "))",
            "tags: \(page.tags.joined(separator: ", "))",
            "rag_collections: \(page.ragCollections.joined(separator: ", "))",
            "source_urls: \(page.sourceURLs.joined(separator: ", "))",
            "---",
            ""
        ].joined(separator: "\n")

        return [
            frontmatter,
            "# \(page.title)",
            "",
            page.summary,
            "",
            page.body
        ].joined(separator: "\n")
    }

    private func indexMarkdown(for pages: [AgentMemoryWikiPage]) -> String {
        let pageLinks = pages
            .sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
            .map { "- [\($0.title)](\($0.slug).md) - \($0.summary)" }

        return ([
            "# AgentMemory Wiki",
            "",
            "Compiled knowledge pages refreshed automatically by AgentMemory.",
            ""
        ] + pageLinks).joined(separator: "\n")
    }

    private func logMarkdown(for latestRun: AgentMemoryWikiRefreshRun?) -> String {
        guard let latestRun else {
            return "# AgentMemory Wiki Log\n\nNo refresh runs recorded yet.\n"
        }

        return [
            "# AgentMemory Wiki Log",
            "",
            "- Completed: \(ISO8601DateFormatter().string(from: latestRun.completedAt))",
            "- Reason: \(latestRun.reason.rawValue)",
            "- Pages: \(latestRun.pageCount)",
            "- Synced to Memory MCP: \(latestRun.syncedPageCount)",
            "- Sync failures: \(latestRun.failedSyncCount)",
            "",
            latestRun.summary,
            ""
        ].joined(separator: "\n")
    }
}
