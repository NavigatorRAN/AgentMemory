public struct MemoryMCPGraphSelectionSummary: Equatable, Sendable {
    public var nodeID: String
    public var label: String
    public var kind: MemoryMCPGraphNode.Kind
    public var subtitle: String?
    public var connectedEdgeCount: Int

    public init(
        nodeID: String,
        label: String,
        kind: MemoryMCPGraphNode.Kind,
        subtitle: String?,
        connectedEdgeCount: Int
    ) {
        self.nodeID = nodeID
        self.label = label
        self.kind = kind
        self.subtitle = subtitle
        self.connectedEdgeCount = connectedEdgeCount
    }
}

public struct MemoryMCPGraphSelectionSummaryBuilder: Sendable {
    public init() {}

    public func summary(from graph: MemoryMCPGraph, selectedNodeID: String?) -> MemoryMCPGraphSelectionSummary? {
        guard let selectedNodeID,
              let node = graph.nodes.first(where: { $0.id == selectedNodeID })
        else {
            return nil
        }

        let connectedEdgeCount = graph.edges.filter {
            $0.sourceID == selectedNodeID || $0.targetID == selectedNodeID
        }.count

        return MemoryMCPGraphSelectionSummary(
            nodeID: node.id,
            label: node.label,
            kind: node.kind,
            subtitle: node.subtitle,
            connectedEdgeCount: connectedEdgeCount
        )
    }
}
