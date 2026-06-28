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
    public var community: String
    public var communityIndex: Int
    public var importance: Double

    public init(
        id: String,
        label: String,
        kind: MemoryMCPGraphNode.Kind,
        subtitle: String?,
        position: MemoryMCPGraphPoint3D,
        community: String = "default",
        communityIndex: Int = 0,
        importance: Double = 0.35
    ) {
        self.id = id
        self.label = label
        self.kind = kind
        self.subtitle = subtitle
        self.position = position
        self.community = community
        self.communityIndex = communityIndex
        self.importance = importance
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
    private let clusterSpread: Double
    private let maxCommunities: Int

    public init(radius: Double = 120, clusterSpread: Double = 34, maxCommunities: Int = 18) {
        self.radius = radius
        self.clusterSpread = clusterSpread
        self.maxCommunities = max(maxCommunities, 2)
    }

    public func build(from graph: MemoryMCPGraph) -> MemoryMCPGraphScene {
        let sortedNodes = graph.nodes.sorted { $0.id < $1.id }
        guard !sortedNodes.isEmpty else {
            return MemoryMCPGraphScene(nodes: [], edges: graph.edges.sorted { $0.id < $1.id })
        }

        let degreeByID = degrees(from: graph.edges)
        let importanceByID = Dictionary(
            uniqueKeysWithValues: sortedNodes.map { node in
                (node.id, importance(for: node, degree: degreeByID[node.id, default: 0]))
            }
        )
        let anchors = communityAnchors(in: sortedNodes, importanceByID: importanceByID)
        let anchorIDs = Set(anchors.map(\.id))
        let neighborIDsByID = neighbors(from: graph.edges)
        let communityByNodeID = communities(
            for: sortedNodes,
            anchors: anchors,
            anchorIDs: anchorIDs,
            neighborIDsByID: neighborIDsByID,
            importanceByID: importanceByID
        )
        let communityKeys = orderedCommunityKeys(from: communityByNodeID, anchors: anchors)
        let communityIndexByKey = Dictionary(uniqueKeysWithValues: communityKeys.enumerated().map { ($0.element, $0.offset) })
        let nodesByCommunity = Dictionary(grouping: sortedNodes, by: { communityByNodeID[$0.id, default: fallbackCommunity(for: $0)] })
        let communityCenterByKey = Dictionary(
            uniqueKeysWithValues: communityKeys.enumerated().map { index, key in
                (key, fibonacciPoint(index: index, count: communityKeys.count, radius: radius))
            }
        )

        var sceneNodes: [MemoryMCPGraphSceneNode] = []
        for key in communityKeys {
            let members = (nodesByCommunity[key] ?? []).sorted { lhs, rhs in
                let lhsImportance = importanceByID[lhs.id, default: 1]
                let rhsImportance = importanceByID[rhs.id, default: 1]
                if lhsImportance == rhsImportance {
                    return lhs.id < rhs.id
                }
                return lhsImportance > rhsImportance
            }
            let center = communityCenterByKey[key] ?? MemoryMCPGraphPoint3D(x: 0, y: 0, z: 0)
            let spread = clusterSpread * max(0.55, min(2.2, sqrt(Double(members.count)) / 9))
            for (index, node) in members.enumerated() {
                let offset = anchorIDs.contains(node.id)
                    ? MemoryMCPGraphPoint3D(x: 0, y: 0, z: 0)
                    : fibonacciPoint(index: index, count: max(members.count, 1), radius: spread * shellScale(for: index))
                sceneNodes.append(MemoryMCPGraphSceneNode(
                    id: node.id,
                    label: node.label,
                    kind: node.kind,
                    subtitle: node.subtitle,
                    position: MemoryMCPGraphPoint3D(
                        x: center.x + offset.x,
                        y: center.y + offset.y,
                        z: center.z + offset.z
                    ),
                    community: key,
                    communityIndex: communityIndexByKey[key, default: 0],
                    importance: importanceByID[node.id, default: 1]
                ))
            }
        }

        return MemoryMCPGraphScene(
            nodes: sceneNodes.sorted { $0.id < $1.id },
            edges: graph.edges.sorted { $0.id < $1.id }
        )
    }

    private func degrees(from edges: [MemoryMCPGraphEdge]) -> [String: Int] {
        var result: [String: Int] = [:]
        for edge in edges {
            result[edge.sourceID, default: 0] += 1
            result[edge.targetID, default: 0] += 1
        }
        return result
    }

    private func neighbors(from edges: [MemoryMCPGraphEdge]) -> [String: Set<String>] {
        var result: [String: Set<String>] = [:]
        for edge in edges {
            result[edge.sourceID, default: []].insert(edge.targetID)
            result[edge.targetID, default: []].insert(edge.sourceID)
        }
        return result
    }

    private func communityAnchors(
        in nodes: [MemoryMCPGraphNode],
        importanceByID: [String: Double]
    ) -> [MemoryMCPGraphNode] {
        let preferred = nodes.filter { node in
            let label = node.label.lowercased()
            return label.hasPrefix("product-documentation-")
                || label.hasPrefix("apple-doc")
                || label.contains("memory-mcp")
                || label.contains("agentmemory")
                || node.kind == .wiki
                || importanceByID[node.id, default: 0] >= 0.26
        }

        let candidates = preferred.isEmpty ? nodes : preferred
        return Array(candidates.sorted { lhs, rhs in
            let lhsImportance = importanceByID[lhs.id, default: 0]
            let rhsImportance = importanceByID[rhs.id, default: 0]
            if lhsImportance == rhsImportance {
                return lhs.id < rhs.id
            }
            return lhsImportance > rhsImportance
        }.prefix(maxCommunities))
    }

    private func communities(
        for nodes: [MemoryMCPGraphNode],
        anchors: [MemoryMCPGraphNode],
        anchorIDs: Set<String>,
        neighborIDsByID: [String: Set<String>],
        importanceByID: [String: Double]
    ) -> [String: String] {
        let anchorByID = Dictionary(uniqueKeysWithValues: anchors.map { ($0.id, $0) })
        var result: [String: String] = [:]

        for node in nodes {
            if anchorIDs.contains(node.id) {
                result[node.id] = communityKey(for: node)
                continue
            }

            let directAnchor = neighborIDsByID[node.id, default: []]
                .compactMap { anchorByID[$0] }
                .max { lhs, rhs in
                    importanceByID[lhs.id, default: 0] < importanceByID[rhs.id, default: 0]
                }

            if let directAnchor {
                result[node.id] = communityKey(for: directAnchor)
            } else {
                result[node.id] = fallbackCommunity(for: node)
            }
        }

        return result
    }

    private func orderedCommunityKeys(
        from communityByNodeID: [String: String],
        anchors: [MemoryMCPGraphNode]
    ) -> [String] {
        let anchorKeys = anchors.map(communityKey(for:))
        let counts = Dictionary(grouping: communityByNodeID.values, by: { $0 }).mapValues(\.count)
        let remainingKeys = counts.keys
            .filter { !anchorKeys.contains($0) }
            .sorted { lhs, rhs in
                if counts[lhs, default: 0] == counts[rhs, default: 0] {
                    return lhs < rhs
                }
                return counts[lhs, default: 0] > counts[rhs, default: 0]
            }

        return stableUnique(anchorKeys + remainingKeys)
    }

    private func importance(for node: MemoryMCPGraphNode, degree: Int) -> Double {
        let eventCount = eventCount(in: node.subtitle)
        let weighted = Double(eventCount + max(degree, 0))
        return min(1, max(0.05, log10(weighted + 10) / 4.2))
    }

    private func eventCount(in subtitle: String?) -> Int {
        guard let subtitle else {
            return 0
        }

        let parts = subtitle.split(separator: " ")
        for (index, part) in parts.enumerated() where part == "events" && index > 0 {
            let number = parts[index - 1].filter(\.isNumber)
            if let value = Int(number) {
                return value
            }
        }
        return 0
    }

    private func communityKey(for node: MemoryMCPGraphNode) -> String {
        let label = node.label.lowercased()
        if node.kind == .wiki {
            return "wiki"
        }
        if label.contains("apple-doc") || label.contains("developer-documentation") {
            return "apple-docs"
        }
        if let product = productDocumentationName(in: label) {
            return product
        }
        if label.contains("memory") || label.contains("agentmemory") {
            return "memory"
        }
        return fallbackCommunity(for: node)
    }

    private func fallbackCommunity(for node: MemoryMCPGraphNode) -> String {
        switch node.kind {
        case .entity:
            return semanticPrefix(in: node.label)
        case .event:
            return "events"
        case .wiki:
            return "wiki"
        case .unknown:
            return "unknown"
        }
    }

    private func productDocumentationName(in label: String) -> String? {
        for prefix in ["product-documentation-", "web-page-"] where label.hasPrefix(prefix) {
            let suffix = String(label.dropFirst(prefix.count))
            return String(suffix.split(separator: "-").prefix(2).joined(separator: "-"))
        }
        return nil
    }

    private func semanticPrefix(in label: String) -> String {
        let lowercased = label.lowercased()
        let tokens = lowercased.split(separator: "-")
        guard let first = tokens.first else {
            return "entities"
        }

        if ["agent", "memory", "apple", "product", "web", "docs"].contains(first) && tokens.count > 1 {
            return String(tokens.prefix(2).joined(separator: "-"))
        }
        return String(first)
    }

    private func fibonacciPoint(index: Int, count: Int, radius: Double) -> MemoryMCPGraphPoint3D {
        guard count > 1 else {
            return MemoryMCPGraphPoint3D(x: radius, y: 0, z: 0)
        }

        let goldenAngle = Double.pi * (3 - sqrt(5))
        let y = 1 - (Double(index) / Double(count - 1)) * 2
        let horizontalRadius = sqrt(max(0, 1 - (y * y)))
        let angle = goldenAngle * Double(index)
        return MemoryMCPGraphPoint3D(
            x: cos(angle) * horizontalRadius * radius,
            y: y * radius,
            z: sin(angle) * horizontalRadius * radius
        )
    }

    private func shellScale(for index: Int) -> Double {
        0.35 + (Double((index % 11) + 1) / 11)
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
