import Foundation

public struct MemoryMCPGraph: Equatable, Sendable {
    public var nodes: [MemoryMCPGraphNode]
    public var edges: [MemoryMCPGraphEdge]
    public var summary: MemoryMCPGraphSummary?

    public init(nodes: [MemoryMCPGraphNode], edges: [MemoryMCPGraphEdge], summary: MemoryMCPGraphSummary? = nil) {
        self.nodes = nodes
        self.edges = edges
        self.summary = summary
    }
}

public struct MemoryMCPGraphSummary: Codable, Equatable, Sendable {
    public var nodeCount: Int
    public var edgeCount: Int
    public var returnedNodeCount: Int?
    public var returnedEdgeCount: Int?
    public var totalNodeCount: Int?
    public var totalEdgeCount: Int?
    public var truncated: Bool?
    public var cacheGeneratedAt: String?
    public var query: String?

    public init(
        nodeCount: Int,
        edgeCount: Int,
        returnedNodeCount: Int? = nil,
        returnedEdgeCount: Int? = nil,
        totalNodeCount: Int? = nil,
        totalEdgeCount: Int? = nil,
        truncated: Bool? = nil,
        cacheGeneratedAt: String? = nil,
        query: String? = nil
    ) {
        self.nodeCount = nodeCount
        self.edgeCount = edgeCount
        self.returnedNodeCount = returnedNodeCount
        self.returnedEdgeCount = returnedEdgeCount
        self.totalNodeCount = totalNodeCount
        self.totalEdgeCount = totalEdgeCount
        self.truncated = truncated
        self.cacheGeneratedAt = cacheGeneratedAt
        self.query = query
    }

    private enum CodingKeys: String, CodingKey {
        case nodeCount = "node_count"
        case edgeCount = "edge_count"
        case returnedNodeCount = "returned_node_count"
        case returnedEdgeCount = "returned_edge_count"
        case totalNodeCount = "total_node_count"
        case totalEdgeCount = "total_edge_count"
        case truncated
        case cacheGeneratedAt = "cache_generated_at"
        case query
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
