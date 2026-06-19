public struct MemoryMCPGraphFocusBuilder: Sendable {
    public init() {}

    public func focusedGraph(from graph: MemoryMCPGraph, selectedNodeID: String?) -> MemoryMCPGraph {
        guard let selectedNodeID,
              graph.nodes.contains(where: { $0.id == selectedNodeID })
        else {
            return graph
        }

        let focusedEdges = graph.edges.filter {
            $0.sourceID == selectedNodeID || $0.targetID == selectedNodeID
        }
        let focusedNodeIDs = Set(
            [selectedNodeID] + focusedEdges.flatMap { [$0.sourceID, $0.targetID] }
        )

        return MemoryMCPGraph(
            nodes: graph.nodes
                .filter { focusedNodeIDs.contains($0.id) }
                .sorted { $0.id < $1.id },
            edges: focusedEdges.sorted { $0.id < $1.id }
        )
    }
}
