import Foundation

public struct MemoryMCPRecordEventPayload: Codable, Equatable, Sendable {
    public var agent: String
    public var content: String
    public var entities: [String]
    public var tags: [String]

    public init(agent: String, content: String, entities: [String], tags: [String]) {
        self.agent = agent
        self.content = content
        self.entities = entities
        self.tags = tags
    }
}

public struct MemoryMCPPayloadBuilder: Sendable {
    private let agent: String

    public init(agent: String) {
        self.agent = agent
    }

    public func recordEventPayload(for item: CaptureItem, archivedSource: ArchivedSource?) -> MemoryMCPRecordEventPayload {
        let entitySlug = slug(for: item.displayName)
        let tags = ["agentmemory", "capture"]
            + item.proposedOutcomes.map(\.rawValue)
            + [item.sourceType.rawValue]

        return MemoryMCPRecordEventPayload(
            agent: agent,
            content: content(for: item, archivedSource: archivedSource),
            entities: ["agentmemory", entitySlug],
            tags: stableUnique(tags)
        )
    }

    private func content(for item: CaptureItem, archivedSource: ArchivedSource?) -> String {
        var lines = [
            "AgentMemory capture processed: \(item.displayName)",
            "",
            "Raw input:",
            item.rawInput,
            "",
            "Source type: \(item.sourceType.rawValue)",
            "Outcomes: \(item.proposedOutcomes.map(\.rawValue).joined(separator: ", "))",
            "Confidence: \(String(format: "%.2f", item.confidence))"
        ]

        if let archivedSource {
            lines.append("Archived source: \(archivedSource.archivedPath)")
            if let originalPath = archivedSource.originalPath {
                lines.append("Original path: \(originalPath)")
            }
            if let byteSize = archivedSource.byteSize {
                lines.append("Byte size: \(byteSize)")
            }
        } else {
            lines.append("Source archive: not available")
        }

        return lines.joined(separator: "\n")
    }

    private func slug(for value: String) -> String {
        let allowed = CharacterSet.alphanumerics
        let scalars = value.lowercased().unicodeScalars.map { scalar -> Character in
            allowed.contains(scalar) ? Character(scalar) : "-"
        }
        let collapsed = String(scalars)
            .split(separator: "-")
            .joined(separator: "-")
        return collapsed.isEmpty ? "capture" : collapsed
    }

    private func stableUnique(_ values: [String]) -> [String] {
        var seen: Set<String> = []
        var result: [String] = []

        for value in values where !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }

        return result
    }
}
