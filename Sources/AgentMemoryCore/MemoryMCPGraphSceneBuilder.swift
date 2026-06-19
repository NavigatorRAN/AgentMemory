import Foundation

public struct MemoryMCPGraphScene: Equatable, Sendable {
    public var nodes: [MemoryMCPGraphSceneNode]
    public var edges: [MemoryMCPGraphEdge]

    public init(nodes: [MemoryMCPGraphSceneNode], edges: [MemoryMCPGraphEdge]) {
        self.nodes = nodes
        self.edges = edges
    }
}

public struct MemoryMCPGraphSceneNode: Equatable, Sendable {
    public var id: String
    public var label: String
    public var kind: MemoryMCPGraphNode.Kind
    public var subtitle: String?
    public var position: MemoryMCPGraphPoint3D

    public init(
        id: String,
        label: String,
        kind: MemoryMCPGraphNode.Kind,
        subtitle: String?,
        position: MemoryMCPGraphPoint3D
    ) {
        self.id = id
        self.label = label
        self.kind = kind
        self.subtitle = subtitle
        self.position = position
    }
}

public struct MemoryMCPGraphPoint3D: Equatable, Sendable {
    public var x: Double
    public var y: Double
    public var z: Double

    public init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}

public struct MemoryMCPGraphSceneBuilder: Sendable {
    private let radius: Double
    private let eventDepth: Double

    public init(radius: Double = 120, eventDepth: Double = 4) {
        self.radius = radius
        self.eventDepth = eventDepth
    }

    public func build(from graph: MemoryMCPGraph) -> MemoryMCPGraphScene {
        let sortedNodes = graph.nodes.sorted { $0.id < $1.id }
        guard !sortedNodes.isEmpty else {
            return MemoryMCPGraphScene(nodes: [], edges: graph.edges.sorted { $0.id < $1.id })
        }

        let sceneNodes = sortedNodes.enumerated().map { index, node in
            let angle = (Double(index) / Double(sortedNodes.count)) * 2 * Double.pi
            return MemoryMCPGraphSceneNode(
                id: node.id,
                label: node.label,
                kind: node.kind,
                subtitle: node.subtitle,
                position: MemoryMCPGraphPoint3D(
                    x: cos(angle) * radius,
                    y: sin(angle) * radius,
                    z: zPosition(for: node.kind)
                )
            )
        }

        return MemoryMCPGraphScene(
            nodes: sceneNodes,
            edges: graph.edges.sorted { $0.id < $1.id }
        )
    }

    private func zPosition(for kind: MemoryMCPGraphNode.Kind) -> Double {
        switch kind {
        case .entity:
            return 0
        case .event:
            return eventDepth
        }
    }
}
