import Foundation

public struct AgentMemoryWikiPageBuilder: Sendable {
    private let now: @Sendable () -> Date

    public init(now: @escaping @Sendable () -> Date = Date.init) {
        self.now = now
    }

    public func pages(from snapshot: AgentMemorySnapshot, reason: AgentMemoryWikiRefreshReason) -> [AgentMemoryWikiPage] {
        let eligibleItems = snapshot.items.filter { item in
            item.status == .complete || item.ragExport != nil
        }

        let pages = eligibleItems.map { page(for: $0, archivedSource: archivedSource(for: $0, in: snapshot), reason: reason) }
        return pages.sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
    }

    private func page(for item: CaptureItem, archivedSource: ArchivedSource?, reason: AgentMemoryWikiRefreshReason) -> AgentMemoryWikiPage {
        let slug = Self.slug(for: item.displayName)
        let ragCollections = stableUnique([item.ragExport?.collection].compactMap { $0 })
        let sourceURLs = stableUnique(sourceURLs(for: item, archivedSource: archivedSource))
        let tags = stableUnique(
            ["agentmemory-wiki"] + item.customTags + (ragCollections.isEmpty ? [] : ["rag-backed"])
        )
        let entities = stableUnique(["agentmemory", "agentmemory-wiki", "wiki:\(slug)", slug])
        let summary = summary(for: item)

        return AgentMemoryWikiPage(
            slug: slug,
            title: item.displayName,
            summary: summary,
            body: body(for: item, archivedSource: archivedSource, sourceURLs: sourceURLs, ragCollections: ragCollections),
            entities: entities,
            tags: tags,
            sourceItemIDs: [item.id],
            ragCollections: ragCollections,
            sourceURLs: sourceURLs,
            refreshedAt: now(),
            refreshReason: reason,
            filePath: "\(slug).md"
        )
    }

    private func summary(for item: CaptureItem) -> String {
        let normalized = item.rawInput
            .split(whereSeparator: \.isNewline)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
        let prefix = normalized.prefix(240)
        return prefix.isEmpty ? "\(item.displayName) is tracked in AgentMemory." : String(prefix)
    }

    private func body(
        for item: CaptureItem,
        archivedSource: ArchivedSource?,
        sourceURLs: [String],
        ragCollections: [String]
    ) -> String {
        var lines = [
            "## Summary",
            summary(for: item),
            "",
            "## Source Context",
            "- Source type: \(item.sourceType.rawValue)",
            "- Capture status: \(item.status.rawValue)",
            "- Confidence: \(String(format: "%.2f", item.confidence))"
        ]

        if !item.proposedOutcomes.isEmpty {
            lines.append("- Outcomes: \(item.proposedOutcomes.map(\.rawValue).joined(separator: ", "))")
        }

        if !item.customTags.isEmpty {
            lines.append("- Tags: \(item.customTags.joined(separator: ", "))")
        }

        for collection in ragCollections {
            lines.append("- RAG collection: \(collection)")
        }

        if let ragExport = item.ragExport {
            lines.append("- RAG job: #\(ragExport.jobID)")
            if let remoteStatus = ragExport.remoteStatus {
                lines.append("- RAG status: \(remoteStatus)")
            }
            if let chunksUpserted = ragExport.chunksUpserted {
                lines.append("- RAG chunks: \(chunksUpserted)")
            }
            if let docID = ragExport.docID {
                lines.append("- RAG doc ID: \(docID)")
            }
        }

        if let archivedSource {
            lines.append("- Archived source: \(archivedSource.archivedPath)")
        }

        for sourceURL in sourceURLs {
            lines.append("- Source URL: \(sourceURL)")
        }

        lines += [
            "",
            "## Compiled Notes",
            item.rawInput
        ]

        return lines.joined(separator: "\n")
    }

    private func sourceURLs(for item: CaptureItem, archivedSource: ArchivedSource?) -> [String] {
        var urls: [String] = []
        if let url = URL(string: item.rawInput), url.scheme != nil {
            urls.append(url.absoluteString)
        }
        if let originalPath = archivedSource?.originalPath, originalPath.hasPrefix("http") {
            urls.append(originalPath)
        }
        return urls
    }

    public static func slug(for value: String) -> String {
        let allowed = CharacterSet.alphanumerics
        let scalars = value.lowercased().unicodeScalars.map { scalar -> Character in
            allowed.contains(scalar) ? Character(scalar) : "-"
        }
        let collapsed = String(scalars)
            .split(separator: "-")
            .joined(separator: "-")
        return collapsed.isEmpty ? "wiki-page" : collapsed
    }

    private func archivedSource(for item: CaptureItem, in snapshot: AgentMemorySnapshot) -> ArchivedSource? {
        snapshot.archivedSources.first { $0.itemID == item.id }
    }

    private func stableUnique(_ values: [String]) -> [String] {
        var seen: Set<String> = []
        var result: [String] = []

        for value in values where !value.isEmpty && !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }

        return result
    }
}
