public struct MemoryMCPGraphViewportProjection: Equatable, Sendable {
    public var nodes: [MemoryMCPGraphViewportNode]
    public var edges: [MemoryMCPGraphEdge]

    public init(nodes: [MemoryMCPGraphViewportNode], edges: [MemoryMCPGraphEdge]) {
        self.nodes = nodes
        self.edges = edges
    }
}

public struct MemoryMCPGraphViewportNode: Equatable, Sendable {
    public var id: String
    public var label: String
    public var kind: MemoryMCPGraphNode.Kind
    public var point: MemoryMCPGraphPoint2D

    public init(id: String, label: String, kind: MemoryMCPGraphNode.Kind, point: MemoryMCPGraphPoint2D) {
        self.id = id
        self.label = label
        self.kind = kind
        self.point = point
    }
}

public struct MemoryMCPGraphPoint2D: Equatable, Sendable {
    public var x: Double
    public var y: Double

    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

public struct MemoryMCPGraphViewportProjector: Sendable {
    public init() {}

    public func project(
        _ scene: MemoryMCPGraphScene,
        width: Double,
        height: Double,
        padding: Double
    ) -> MemoryMCPGraphViewportProjection {
        guard !scene.nodes.isEmpty else {
            return MemoryMCPGraphViewportProjection(nodes: [], edges: scene.edges)
        }

        let minX = scene.nodes.map(\.position.x).min() ?? 0
        let maxX = scene.nodes.map(\.position.x).max() ?? 0
        let minY = scene.nodes.map(\.position.y).min() ?? 0
        let maxY = scene.nodes.map(\.position.y).max() ?? 0
        let drawableWidth = max(width - (padding * 2), 0)
        let drawableHeight = max(height - (padding * 2), 0)
        let rangeX = maxX - minX
        let rangeY = maxY - minY

        let nodes = scene.nodes.map { node in
            let point: MemoryMCPGraphPoint2D
            if rangeX == 0 && rangeY == 0 {
                point = MemoryMCPGraphPoint2D(x: width / 2, y: height / 2)
            } else {
                let normalizedX = rangeX == 0 ? 0.5 : (node.position.x - minX) / rangeX
                let normalizedY = rangeY == 0 ? 0.5 : (node.position.y - minY) / rangeY
                point = MemoryMCPGraphPoint2D(
                    x: padding + (normalizedX * drawableWidth),
                    y: padding + ((1 - normalizedY) * drawableHeight)
                )
            }

            return MemoryMCPGraphViewportNode(
                id: node.id,
                label: node.label,
                kind: node.kind,
                point: point
            )
        }

        return MemoryMCPGraphViewportProjection(nodes: nodes, edges: scene.edges)
    }
}
