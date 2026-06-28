import Foundation

public struct MemoryMCPGraphViewportProjection: Equatable, Sendable {
    public var nodes: [MemoryMCPGraphViewportNode]
    public var edges: [MemoryMCPGraphEdge]
    public var edgeSegments: [MemoryMCPGraphViewportEdgeSegment]

    public init(
        nodes: [MemoryMCPGraphViewportNode],
        edges: [MemoryMCPGraphEdge],
        edgeSegments: [MemoryMCPGraphViewportEdgeSegment] = []
    ) {
        self.nodes = nodes
        self.edges = edges
        self.edgeSegments = edgeSegments
    }
}

public struct MemoryMCPGraphViewportNode: Equatable, Sendable {
    public var id: String
    public var label: String
    public var kind: MemoryMCPGraphNode.Kind
    public var point: MemoryMCPGraphPoint2D
    public var depth: Double
    public var communityIndex: Int
    public var importance: Double

    public init(
        id: String,
        label: String,
        kind: MemoryMCPGraphNode.Kind,
        point: MemoryMCPGraphPoint2D,
        depth: Double = 0,
        communityIndex: Int = 0,
        importance: Double = 0.35
    ) {
        self.id = id
        self.label = label
        self.kind = kind
        self.point = point
        self.depth = depth
        self.communityIndex = communityIndex
        self.importance = importance
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

public struct MemoryMCPGraphViewportEdgeSegment: Equatable, Sendable {
    public var id: String
    public var sourceID: String
    public var targetID: String
    public var label: String
    public var source: MemoryMCPGraphPoint2D
    public var target: MemoryMCPGraphPoint2D

    public init(
        id: String,
        sourceID: String,
        targetID: String,
        label: String,
        source: MemoryMCPGraphPoint2D,
        target: MemoryMCPGraphPoint2D
    ) {
        self.id = id
        self.sourceID = sourceID
        self.targetID = targetID
        self.label = label
        self.source = source
        self.target = target
    }
}

public struct MemoryMCPGraphCamera: Equatable, Sendable {
    public var yaw: Double
    public var pitch: Double
    public var zoom: Double
    public var distance: Double

    public init(yaw: Double = 0, pitch: Double = 0, zoom: Double = 1, distance: Double = 420) {
        self.yaw = yaw
        self.pitch = pitch
        self.zoom = zoom
        self.distance = distance
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
                point: point,
                communityIndex: node.communityIndex,
                importance: node.importance
            )
        }

        let nodesByID = Dictionary(uniqueKeysWithValues: nodes.map { ($0.id, $0) })
        let edgeSegments = scene.edges.compactMap { edge -> MemoryMCPGraphViewportEdgeSegment? in
            guard let source = nodesByID[edge.sourceID],
                  let target = nodesByID[edge.targetID]
            else {
                return nil
            }

            return MemoryMCPGraphViewportEdgeSegment(
                id: edge.id,
                sourceID: edge.sourceID,
                targetID: edge.targetID,
                label: edge.label,
                source: source.point,
                target: target.point
            )
        }

        return MemoryMCPGraphViewportProjection(
            nodes: nodes,
            edges: scene.edges,
            edgeSegments: edgeSegments
        )
    }

    public func project(
        _ scene: MemoryMCPGraphScene,
        width: Double,
        height: Double,
        padding: Double,
        camera: MemoryMCPGraphCamera
    ) -> MemoryMCPGraphViewportProjection {
        guard !scene.nodes.isEmpty else {
            return MemoryMCPGraphViewportProjection(nodes: [], edges: scene.edges)
        }

        let rotatedNodes = scene.nodes.map { node in
            (node: node, rotated: rotate(node.position, yaw: camera.yaw, pitch: camera.pitch))
        }
        let projected = rotatedNodes.map { item in
            let perspective = max(0.22, camera.distance / max(80, camera.distance + item.rotated.z))
            return (
                node: item.node,
                point: MemoryMCPGraphPoint2D(
                    x: item.rotated.x * perspective,
                    y: item.rotated.y * perspective
                ),
                depth: item.rotated.z
            )
        }

        let maxAbsX = projected.map { abs($0.point.x) }.max() ?? 1
        let maxAbsY = projected.map { abs($0.point.y) }.max() ?? 1
        let maxAbs = max(maxAbsX, maxAbsY, 1)
        let drawableWidth = max(width - (padding * 2), 0)
        let drawableHeight = max(height - (padding * 2), 0)
        let scale = (min(drawableWidth, drawableHeight) / 2) / maxAbs
        let zoom = max(0.35, min(camera.zoom, 5))

        let nodes = projected.map { item in
            MemoryMCPGraphViewportNode(
                id: item.node.id,
                label: item.node.label,
                kind: item.node.kind,
                point: MemoryMCPGraphPoint2D(
                    x: (width / 2) + (item.point.x * scale * zoom),
                    y: (height / 2) - (item.point.y * scale * zoom)
                ),
                depth: item.depth,
                communityIndex: item.node.communityIndex,
                importance: item.node.importance
            )
        }

        let nodesByID = Dictionary(uniqueKeysWithValues: nodes.map { ($0.id, $0) })
        let edgeSegments = scene.edges.compactMap { edge -> MemoryMCPGraphViewportEdgeSegment? in
            guard let source = nodesByID[edge.sourceID],
                  let target = nodesByID[edge.targetID]
            else {
                return nil
            }

            return MemoryMCPGraphViewportEdgeSegment(
                id: edge.id,
                sourceID: edge.sourceID,
                targetID: edge.targetID,
                label: edge.label,
                source: source.point,
                target: target.point
            )
        }

        return MemoryMCPGraphViewportProjection(
            nodes: nodes.sorted { lhs, rhs in
                if lhs.depth == rhs.depth {
                    return lhs.id < rhs.id
                }
                return lhs.depth > rhs.depth
            },
            edges: scene.edges,
            edgeSegments: edgeSegments
        )
    }

    private func rotate(_ point: MemoryMCPGraphPoint3D, yaw: Double, pitch: Double) -> MemoryMCPGraphPoint3D {
        let cosYaw = cos(yaw)
        let sinYaw = sin(yaw)
        let yawedX = (point.x * cosYaw) + (point.z * sinYaw)
        let yawedZ = (-point.x * sinYaw) + (point.z * cosYaw)

        let cosPitch = cos(pitch)
        let sinPitch = sin(pitch)
        let pitchedY = (point.y * cosPitch) - (yawedZ * sinPitch)
        let pitchedZ = (point.y * sinPitch) + (yawedZ * cosPitch)

        return MemoryMCPGraphPoint3D(x: yawedX, y: pitchedY, z: pitchedZ)
    }
}
