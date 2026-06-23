import Foundation

public struct MemoryMCPGraph: Equatable, Sendable {
    public var nodes: [MemoryMCPGraphNode]
    public var edges: [MemoryMCPGraphEdge]

    public init(nodes: [MemoryMCPGraphNode], edges: [MemoryMCPGraphEdge]) {
        self.nodes = nodes
        self.edges = edges
    }
}

public struct MemoryMCPGraphNode: Equatable, Sendable {
    public enum Kind: String, Equatable, Sendable {
        case entity
        case event
        case wiki
        case unknown
    }

    public var id: String
    public var label: String
    public var kind: Kind
    public var subtitle: String?

    public init(id: String, label: String, kind: Kind, subtitle: String?) {
        self.id = id
        self.label = label
        self.kind = kind
        self.subtitle = subtitle
    }
}

public struct MemoryMCPGraphEdge: Equatable, Sendable {
    public var id: String
    public var sourceID: String
    public var targetID: String
    public var label: String

    public init(id: String, sourceID: String, targetID: String, label: String) {
        self.id = id
        self.sourceID = sourceID
        self.targetID = targetID
        self.label = label
    }
}

public struct MemoryMCPGraphBuilder: Sendable {
    public init() {}

    public func build(
        events: [MemoryMCPSearchEvent],
        entityDetail: MemoryMCPEntityDetail?,
        entitySummaries: [MemoryMCPEntitySummary]
    ) -> MemoryMCPGraph {
        var nodesByID: [String: MemoryMCPGraphNode] = [:]
        var edgesByID: [String: MemoryMCPGraphEdge] = [:]

        for summary in entitySummaries {
            let id = entityID(summary.name)
            nodesByID[id] = MemoryMCPGraphNode(
                id: id,
                label: summary.displayName,
                kind: .entity,
                subtitle: entitySummarySubtitle(type: summary.type, eventCount: summary.eventCount)
            )
        }

        if let entityDetail {
            let id = entityID(entityDetail.name)
            nodesByID[id] = MemoryMCPGraphNode(
                id: id,
                label: entityDetail.displayName,
                kind: .entity,
                subtitle: entityDetail.frontmatter["type"]?.stringValue
            )
            addRecentEvents(entityDetail.recentEvents, nodesByID: &nodesByID, edgesByID: &edgesByID)
        }

        for event in events {
            addSearchEvent(event, nodesByID: &nodesByID, edgesByID: &edgesByID)
        }

        return MemoryMCPGraph(
            nodes: nodesByID.values.sorted { $0.id < $1.id },
            edges: edgesByID.values.sorted { $0.id < $1.id }
        )
    }

    private func addSearchEvent(
        _ event: MemoryMCPSearchEvent,
        nodesByID: inout [String: MemoryMCPGraphNode],
        edgesByID: inout [String: MemoryMCPGraphEdge]
    ) {
        let sourceID = eventID(event.id)
        nodesByID[sourceID] = MemoryMCPGraphNode(
            id: sourceID,
            label: eventLabel(content: event.content, fallback: event.id),
            kind: .event,
            subtitle: event.eventDate
        )

        for entity in event.entities {
            addEntityMention(entityName: entity, sourceID: sourceID, nodesByID: &nodesByID, edgesByID: &edgesByID)
        }
    }

    private func addRecentEvents(
        _ events: [MemoryMCPRecentEvent],
        nodesByID: inout [String: MemoryMCPGraphNode],
        edgesByID: inout [String: MemoryMCPGraphEdge]
    ) {
        for event in events {
            let sourceID = eventID(event.id)
            nodesByID[sourceID] = MemoryMCPGraphNode(
                id: sourceID,
                label: eventLabel(content: event.content, fallback: event.id),
                kind: .event,
                subtitle: event.eventDate
            )

            for entity in event.entities {
                addEntityMention(entityName: entity, sourceID: sourceID, nodesByID: &nodesByID, edgesByID: &edgesByID)
            }
        }
    }

    private func addEntityMention(
        entityName: String,
        sourceID: String,
        nodesByID: inout [String: MemoryMCPGraphNode],
        edgesByID: inout [String: MemoryMCPGraphEdge]
    ) {
        let targetID = entityID(entityName)
        if nodesByID[targetID] == nil {
            nodesByID[targetID] = MemoryMCPGraphNode(id: targetID, label: entityName, kind: .entity, subtitle: nil)
        }

        let id = "edge:\(sourceID):\(targetID)"
        edgesByID[id] = MemoryMCPGraphEdge(id: id, sourceID: sourceID, targetID: targetID, label: "mentions")
    }

    private func entityID(_ name: String) -> String {
        "entity:\(name)"
    }

    private func eventID(_ id: String) -> String {
        "event:\(id)"
    }

    private func eventLabel(content: String?, fallback: String) -> String {
        let trimmed = (content ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            return fallback
        }

        return String(trimmed.prefix(80))
    }

    private func entitySummarySubtitle(type: String, eventCount: Int) -> String {
        "\(type) | \(eventCount) events"
    }
}
