import Foundation

public struct MemoryMCPGraphOverviewBuilder: Sendable {
    private let minimumAggregateMembers: Int
    private let maxExpansionMembers: Int
    private let maxExpansionNeighbors: Int

    public init(
        minimumAggregateMembers: Int = 4,
        maxExpansionMembers: Int = 420,
        maxExpansionNeighbors: Int = 120
    ) {
        self.minimumAggregateMembers = max(2, minimumAggregateMembers)
        self.maxExpansionMembers = max(20, maxExpansionMembers)
        self.maxExpansionNeighbors = max(20, maxExpansionNeighbors)
    }

    public func overview(from graph: MemoryMCPGraph) -> MemoryMCPGraph {
        let aggregateGroups = aggregateGroups(in: graph)
        guard !aggregateGroups.isEmpty else {
            return graph
        }

        let aggregateByMemberID = Dictionary(
            uniqueKeysWithValues: aggregateGroups.flatMap { group in
                group.memberIDs.map { ($0, group) }
            }
        )
        let aggregatedMemberIDs = Set(aggregateByMemberID.keys)
        let passthroughNodes = graph.nodes.filter { !aggregatedMemberIDs.contains($0.id) }
        let aggregateNodes = aggregateGroups.map(aggregateNode(for:))
        let nodesByID = Dictionary(uniqueKeysWithValues: (passthroughNodes + aggregateNodes).map { ($0.id, $0) })

        var edgesByID: [String: MemoryMCPGraphEdge] = [:]
        for edge in graph.edges {
            let sourceID = aggregateByMemberID[edge.sourceID]?.id ?? edge.sourceID
            let targetID = aggregateByMemberID[edge.targetID]?.id ?? edge.targetID
            guard sourceID != targetID,
                  nodesByID[sourceID] != nil,
                  nodesByID[targetID] != nil
            else {
                continue
            }

            let label = aggregateByMemberID[edge.sourceID] != nil || aggregateByMemberID[edge.targetID] != nil
                ? "summarizes"
                : edge.label
            let id = "edge:\(sourceID):\(targetID):\(label)"
            edgesByID[id] = MemoryMCPGraphEdge(id: id, sourceID: sourceID, targetID: targetID, label: label)
        }

        return MemoryMCPGraph(
            nodes: nodesByID.values.sorted { $0.id < $1.id },
            edges: edgesByID.values.sorted { $0.id < $1.id }
        )
    }

    public func focusedGraph(
        from graph: MemoryMCPGraph,
        overview: MemoryMCPGraph? = nil,
        selectedNodeID: String?
    ) -> MemoryMCPGraph {
        guard let selectedNodeID else {
            return overview ?? self.overview(from: graph)
        }

        let aggregateGroups = aggregateGroups(in: graph)
        if let aggregateGroup = aggregateGroups.first(where: { $0.id == selectedNodeID }) {
            return expandedAggregateGraph(for: aggregateGroup, from: graph)
        }

        return MemoryMCPGraphFocusBuilder().focusedGraph(from: graph, selectedNodeID: selectedNodeID)
    }

    public func isAggregateNodeID(_ nodeID: String, in graph: MemoryMCPGraph) -> Bool {
        aggregateGroups(in: graph).contains { $0.id == nodeID }
    }

    private func expandedAggregateGraph(for group: AggregateGroup, from graph: MemoryMCPGraph) -> MemoryMCPGraph {
        let nodesByID = Dictionary(uniqueKeysWithValues: graph.nodes.map { ($0.id, $0) })
        let memberIDs = Array(group.memberIDs.sorted { lhs, rhs in
            let lhsImportance = importance(of: nodesByID[lhs])
            let rhsImportance = importance(of: nodesByID[rhs])
            if lhsImportance == rhsImportance {
                return lhs < rhs
            }
            return lhsImportance > rhsImportance
        }.prefix(maxExpansionMembers))
        let memberIDSet = Set(memberIDs)

        let neighborIDs = graph.edges.flatMap { edge -> [String] in
            if memberIDSet.contains(edge.sourceID), !memberIDSet.contains(edge.targetID) {
                return [edge.targetID]
            }
            if memberIDSet.contains(edge.targetID), !memberIDSet.contains(edge.sourceID) {
                return [edge.sourceID]
            }
            return []
        }
        .reduce(into: Set<String>()) { $0.insert($1) }
        .sorted { lhs, rhs in
            let lhsImportance = importance(of: nodesByID[lhs])
            let rhsImportance = importance(of: nodesByID[rhs])
            if lhsImportance == rhsImportance {
                return lhs < rhs
            }
            return lhsImportance > rhsImportance
        }
        .prefix(maxExpansionNeighbors)

        var includedNodeIDs = Set(memberIDs)
        includedNodeIDs.formUnion(neighborIDs)

        var outputNodes = includedNodeIDs.compactMap { nodesByID[$0] }
        let aggregateNode = aggregateNode(for: group)
        outputNodes.append(aggregateNode)

        var edgesByID: [String: MemoryMCPGraphEdge] = [:]
        for memberID in memberIDs {
            let id = "edge:\(aggregateNode.id):\(memberID):contains"
            edgesByID[id] = MemoryMCPGraphEdge(
                id: id,
                sourceID: aggregateNode.id,
                targetID: memberID,
                label: "contains"
            )
        }

        for edge in graph.edges where includedNodeIDs.contains(edge.sourceID) && includedNodeIDs.contains(edge.targetID) {
            edgesByID[edge.id] = edge
        }

        return MemoryMCPGraph(
            nodes: outputNodes.sorted { $0.id < $1.id },
            edges: edgesByID.values.sorted { $0.id < $1.id }
        )
    }

    private func aggregateGroups(in graph: MemoryMCPGraph) -> [AggregateGroup] {
        let collectionByPageID = collectionNamesByPageID(in: graph)
        let pagesByGroup = Dictionary(grouping: graph.nodes.compactMap { node -> (AggregateKey, MemoryMCPGraphNode)? in
            guard let key = aggregateKey(for: node, collectionName: collectionByPageID[node.id]) else {
                return nil
            }
            return (key, node)
        }, by: { $0.0 })

        return pagesByGroup.compactMap { key, pairs -> AggregateGroup? in
            let nodes = pairs.map(\.1)
            guard nodes.count >= minimumAggregateMembers else {
                return nil
            }
            return AggregateGroup(
                key: key,
                memberIDs: Set(nodes.map(\.id)),
                eventCount: nodes.reduce(0) { $0 + eventCount(in: $1.subtitle) }
            )
        }
        .sorted { lhs, rhs in
            if lhs.memberIDs.count == rhs.memberIDs.count {
                return lhs.id < rhs.id
            }
            return lhs.memberIDs.count > rhs.memberIDs.count
        }
    }

    private func aggregateKey(for node: MemoryMCPGraphNode, collectionName: String?) -> AggregateKey? {
        guard node.kind == .entity else {
            return nil
        }

        let label = node.label.lowercased()
        if label.hasPrefix("web-page-") {
            let source = collectionName ?? sourceName(fromWebPageLabel: label) ?? "web-pages"
            let section = sectionName(fromWebPageLabel: label)
            return AggregateKey(source: source, section: section)
        }

        if label.hasPrefix("product-documentation-") {
            let suffix = String(label.dropFirst("product-documentation-".count))
            let parts = suffix.split(separator: "-")
            guard let source = parts.first else {
                return nil
            }
            let section = parts.dropFirst().first.map(String.init) ?? "docs"
            return AggregateKey(source: String(source), section: section)
        }

        return nil
    }

    private func collectionNamesByPageID(in graph: MemoryMCPGraph) -> [String: String] {
        let nodesByID = Dictionary(uniqueKeysWithValues: graph.nodes.map { ($0.id, $0) })
        let collectionIDs = Set(graph.nodes.compactMap { node -> String? in
            guard node.kind == .entity,
                  node.label.lowercased().contains("docs"),
                  node.subtitle?.lowercased().contains("documentation-collection") == true
            else {
                return nil
            }
            return node.id
        })

        var result: [String: String] = [:]
        for edge in graph.edges {
            if collectionIDs.contains(edge.sourceID), isPageNode(nodesByID[edge.targetID]) {
                result[edge.targetID] = nodesByID[edge.sourceID]?.label ?? edge.sourceID
            } else if collectionIDs.contains(edge.targetID), isPageNode(nodesByID[edge.sourceID]) {
                result[edge.sourceID] = nodesByID[edge.targetID]?.label ?? edge.targetID
            }
        }
        return result
    }

    private func isPageNode(_ node: MemoryMCPGraphNode?) -> Bool {
        guard let node else {
            return false
        }
        let label = node.label.lowercased()
        return node.kind == .entity
            && (label.hasPrefix("web-page-") || label.hasPrefix("product-documentation-"))
    }

    private func aggregateNode(for group: AggregateGroup) -> MemoryMCPGraphNode {
        MemoryMCPGraphNode(
            id: group.id,
            label: group.title,
            kind: .entity,
            subtitle: "\(group.memberIDs.count) pages | \(group.eventCount) events"
        )
    }

    private func sourceName(fromWebPageLabel label: String) -> String? {
        let trimmed = trimWebPageAffixes(label)
        let tokens = trimmed.split(separator: "-").map(String.init)
        guard tokens.count >= 2 else {
            return nil
        }

        if tokens.suffix(2) == ["home", "assistant"] {
            return "home-assistant-docs"
        }
        return nil
    }

    private func sectionName(fromWebPageLabel label: String) -> String {
        let trimmed = trimWebPageAffixes(label)
        let tokens = trimmed.split(separator: "-").map(String.init)
        let semanticSections = [
            "automation",
            "automating",
            "blueprint",
            "blueprints",
            "configuration",
            "configuring",
            "dashboard",
            "dashboards",
            "energy",
            "integration",
            "integrations",
            "installation",
            "installing",
            "scene",
            "scenes",
            "script",
            "scripts",
            "sensor",
            "sensors",
            "voice"
        ]

        if let semantic = tokens.first(where: { semanticSections.contains($0) }) {
            return canonicalSectionName(semantic)
        }

        if let first = tokens.first(where: { $0.rangeOfCharacter(from: .alphanumerics) != nil }) {
            let initial = first.prefix(1).uppercased()
            return first.first?.isNumber == true ? "0-9" : initial
        }
        return "other"
    }

    private func trimWebPageAffixes(_ label: String) -> String {
        var trimmed = label
        if trimmed.hasPrefix("web-page-") {
            trimmed.removeFirst("web-page-".count)
        }
        if trimmed.hasSuffix("-home-assistant") {
            trimmed.removeLast("-home-assistant".count)
        }
        return trimmed
    }

    private func canonicalSectionName(_ section: String) -> String {
        switch section {
        case "automating":
            return "automation"
        case "blueprints":
            return "blueprint"
        case "configuring":
            return "configuration"
        case "dashboards":
            return "dashboard"
        case "integrations":
            return "integration"
        case "installing":
            return "installation"
        case "scenes":
            return "scene"
        case "scripts":
            return "script"
        case "sensors":
            return "sensor"
        default:
            return section
        }
    }

    private func importance(of node: MemoryMCPGraphNode?) -> Int {
        eventCount(in: node?.subtitle)
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
}

private struct AggregateGroup: Equatable, Sendable {
    var key: AggregateKey
    var memberIDs: Set<String>
    var eventCount: Int

    var id: String {
        "aggregate:\(key.source):\(key.section)"
    }

    var title: String {
        "\(key.source) / \(key.section)"
    }
}

private struct AggregateKey: Hashable, Sendable {
    var source: String
    var section: String
}
