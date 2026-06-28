public struct MemoryMCPGraphViewportNodeMarker: Equatable, Sendable {
    public var id: String
    public var kind: MemoryMCPGraphNode.Kind
    public var point: MemoryMCPGraphPoint2D
    public var radius: Double
    public var selectionRingRadius: Double?
    public var depth: Double
    public var communityIndex: Int
    public var importance: Double

    public init(
        id: String,
        kind: MemoryMCPGraphNode.Kind,
        point: MemoryMCPGraphPoint2D,
        radius: Double,
        selectionRingRadius: Double?,
        depth: Double = 0,
        communityIndex: Int = 0,
        importance: Double = 0.35
    ) {
        self.id = id
        self.kind = kind
        self.point = point
        self.radius = radius
        self.selectionRingRadius = selectionRingRadius
        self.depth = depth
        self.communityIndex = communityIndex
        self.importance = importance
    }
}

public struct MemoryMCPGraphViewportNodeMarkerBuilder: Sendable {
    public init() {}

    public func markers(
        from projection: MemoryMCPGraphViewportProjection,
        selectedNodeID: String?
    ) -> [MemoryMCPGraphViewportNodeMarker] {
        projection.nodes.map { node in
            let baseRadius: Double
            switch node.kind {
            case .entity:
                baseRadius = 3.0
            case .wiki:
                baseRadius = 3.6
            case .event:
                baseRadius = 2.0
            case .unknown:
                baseRadius = 1.8
            }

            let radius = baseRadius + (node.importance * 8)
            let selectionRingRadius = node.id == selectedNodeID ? radius + 5 : nil

            return MemoryMCPGraphViewportNodeMarker(
                id: node.id,
                kind: node.kind,
                point: node.point,
                radius: radius,
                selectionRingRadius: selectionRingRadius,
                depth: node.depth,
                communityIndex: node.communityIndex,
                importance: node.importance
            )
        }
    }
}
