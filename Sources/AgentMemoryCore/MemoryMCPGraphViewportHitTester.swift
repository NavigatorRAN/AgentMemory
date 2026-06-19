public struct MemoryMCPGraphViewportHit: Equatable, Sendable {
    public var nodeID: String

    public init(nodeID: String) {
        self.nodeID = nodeID
    }
}

public struct MemoryMCPGraphViewportHitTester: Sendable {
    public init() {}

    public func hitNode(
        in projection: MemoryMCPGraphViewportProjection,
        point: MemoryMCPGraphPoint2D,
        radius: Double
    ) -> MemoryMCPGraphViewportHit? {
        let radiusSquared = radius * radius
        let nearest = projection.nodes
            .map { node in
                let dx = node.point.x - point.x
                let dy = node.point.y - point.y
                return (nodeID: node.id, distanceSquared: (dx * dx) + (dy * dy))
            }
            .filter { $0.distanceSquared <= radiusSquared }
            .min { $0.distanceSquared < $1.distanceSquared }

        guard let nearest else {
            return nil
        }

        return MemoryMCPGraphViewportHit(nodeID: nearest.nodeID)
    }
}
