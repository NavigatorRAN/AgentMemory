public struct MemoryMCPGraphViewportNodeMarker: Equatable, Sendable {
    public var id: String
    public var kind: MemoryMCPGraphNode.Kind
    public var point: MemoryMCPGraphPoint2D
    public var radius: Double
    public var selectionRingRadius: Double?

    public init(
        id: String,
        kind: MemoryMCPGraphNode.Kind,
        point: MemoryMCPGraphPoint2D,
        radius: Double,
        selectionRingRadius: Double?
    ) {
        self.id = id
        self.kind = kind
        self.point = point
        self.radius = radius
        self.selectionRingRadius = selectionRingRadius
    }
}

public struct MemoryMCPGraphViewportNodeMarkerBuilder: Sendable {
    public init() {}

    public func markers(
        from projection: MemoryMCPGraphViewportProjection,
        selectedNodeID: String?
    ) -> [MemoryMCPGraphViewportNodeMarker] {
        projection.nodes.map { node in
            let radius = node.kind == .entity ? 8.0 : 6.0
            let selectionRingRadius = node.id == selectedNodeID ? radius + 5 : nil

            return MemoryMCPGraphViewportNodeMarker(
                id: node.id,
                kind: node.kind,
                point: node.point,
                radius: radius,
                selectionRingRadius: selectionRingRadius
            )
        }
    }
}
