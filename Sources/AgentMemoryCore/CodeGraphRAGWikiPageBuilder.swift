import Foundation

public struct CodeGraphRAGWikiPageBuilder: Sendable {
    private let now: @Sendable () -> Date

    public init(now: @escaping @Sendable () -> Date = Date.init) {
        self.now = now
    }

    public func pages(from index: CodeGraphRAGIndex, reports: [CodeGraphRAGCommunityReport]) -> [AgentMemoryWikiPage] {
        ([overviewPage(from: index, reports: reports)] + reports.map { page(from: $0, index: index) })
            .sorted { $0.slug < $1.slug }
    }

    private func overviewPage(from index: CodeGraphRAGIndex, reports: [CodeGraphRAGCommunityReport]) -> AgentMemoryWikiPage {
        let repoSlug = slug(for: index.repositoryName)
        let summary = "GraphRAG-inspired local code index for \(index.repositoryName): \(index.textUnits.count) text units, \(index.symbols.count) symbols, \(index.relationships.count) relationships, \(reports.count) communities."
        let body = [
            "## CodeGraphRAG Overview",
            summary,
            "",
            "Conceptual inspiration: Microsoft GraphRAG.",
            "This implementation does not vendor Microsoft GraphRAG code.",
            "",
            "## Communities",
            reports.map { "- \($0.name): \($0.summary)" }.joined(separator: "\n"),
            "",
            "## Retrieval Guidance",
            "Use this page for whole-repo orientation. Use community pages for local subsystem retrieval, then fall back to RAG chunks for source-level detail."
        ].joined(separator: "\n")

        return AgentMemoryWikiPage(
            slug: "codegraphrag-\(repoSlug)-overview",
            title: "CodeGraphRAG \(index.repositoryName) Overview",
            summary: summary,
            body: body,
            entities: ["agentmemory", "code-graphrag", "codegraphrag:\(repoSlug)", "repo:\(repoSlug)"],
            tags: ["agentmemory-wiki", "code-graphrag", "graphrag-inspired", "repo-overview"],
            sourceItemIDs: [],
            ragCollections: [],
            sourceURLs: [
                "https://microsoft.github.io/graphrag/",
                "https://github.com/microsoft/graphrag"
            ],
            refreshedAt: now(),
            refreshReason: .manual,
            filePath: "codegraphrag-\(repoSlug)-overview.md"
        )
    }

    private func page(from report: CodeGraphRAGCommunityReport, index: CodeGraphRAGIndex) -> AgentMemoryWikiPage {
        let repoSlug = slug(for: index.repositoryName)
        let communitySlug = slug(for: report.name)
        let body = [
            "## Summary",
            report.summary,
            "",
            "## Key Files",
            report.keyFiles.map { "- \($0)" }.joined(separator: "\n"),
            "",
            "## Key Symbols",
            report.keySymbols.map { "- \($0)" }.joined(separator: "\n"),
            "",
            "## Claims",
            report.claims.map { "- \($0)" }.joined(separator: "\n"),
            "",
            "## Relationships",
            report.relationships.map { "- \($0.source) \($0.kind.rawValue) \($0.target)" }.joined(separator: "\n"),
            "",
            "Conceptual inspiration: Microsoft GraphRAG community reports.",
            "This implementation does not vendor Microsoft GraphRAG code."
        ].joined(separator: "\n")

        return AgentMemoryWikiPage(
            slug: "codegraphrag-\(repoSlug)-\(communitySlug)",
            title: "CodeGraphRAG \(index.repositoryName) \(report.name)",
            summary: report.summary,
            body: body,
            entities: [
                "agentmemory",
                "code-graphrag",
                "codegraphrag:\(repoSlug)",
                "codegraphrag:\(repoSlug):\(communitySlug)",
                "repo:\(repoSlug)"
            ],
            tags: ["agentmemory-wiki", "code-graphrag", "graphrag-inspired", "code-community"],
            sourceItemIDs: [],
            ragCollections: [],
            sourceURLs: [
                "https://microsoft.github.io/graphrag/",
                "https://github.com/microsoft/graphrag"
            ],
            refreshedAt: now(),
            refreshReason: .manual,
            filePath: "codegraphrag-\(repoSlug)-\(communitySlug).md"
        )
    }

    private func slug(for value: String) -> String {
        AgentMemoryWikiPageBuilder.slug(for: value)
    }
}
