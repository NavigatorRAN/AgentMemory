import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphFocusBuilderTests: XCTestCase {
    func testNilSelectionReturnsWholeGraph() {
        let graph = sampleGraph()

        let focused = MemoryMCPGraphFocusBuilder().focusedGraph(from: graph, selectedNodeID: nil)

        XCTAssertEqual(focused, graph)
    }

    func testSelectionReturnsSelectedNodeAndImmediateNeighbors() {
        let graph = sampleGraph()

        let focused = MemoryMCPGraphFocusBuilder().focusedGraph(
            from: graph,
            selectedNodeID: "entity:agentmemory"
        )

        XCTAssertEqual(focused.nodes.sorted { $0.id < $1.id }, [
            MemoryMCPGraphNode(id: "entity:agentmemory", label: "AgentMemory", kind: .entity, subtitle: "project"),
            MemoryMCPGraphNode(id: "event:event-1", label: "Event 1", kind: .event, subtitle: nil),
            MemoryMCPGraphNode(id: "event:event-2", label: "Event 2", kind: .event, subtitle: nil)
        ].sorted { $0.id < $1.id })
        XCTAssertEqual(focused.edges.sorted { $0.id < $1.id }, [
            MemoryMCPGraphEdge(id: "edge:event:event-1:entity:agentmemory", sourceID: "event:event-1", targetID: "entity:agentmemory", label: "mentions"),
            MemoryMCPGraphEdge(id: "edge:event:event-2:entity:agentmemory", sourceID: "event:event-2", targetID: "entity:agentmemory", label: "mentions")
        ].sorted { $0.id < $1.id })
    }

    func testUnknownSelectionReturnsWholeGraph() {
        let graph = sampleGraph()

        let focused = MemoryMCPGraphFocusBuilder().focusedGraph(
            from: graph,
            selectedNodeID: "entity:missing"
        )

        XCTAssertEqual(focused, graph)
    }

    private func sampleGraph() -> MemoryMCPGraph {
        MemoryMCPGraph(
            nodes: [
                MemoryMCPGraphNode(id: "entity:agentmemory", label: "AgentMemory", kind: .entity, subtitle: "project"),
                MemoryMCPGraphNode(id: "entity:rag-mcp", label: "RAG MCP", kind: .entity, subtitle: nil),
                MemoryMCPGraphNode(id: "event:event-1", label: "Event 1", kind: .event, subtitle: nil),
                MemoryMCPGraphNode(id: "event:event-2", label: "Event 2", kind: .event, subtitle: nil)
            ],
            edges: [
                MemoryMCPGraphEdge(id: "edge:event:event-1:entity:agentmemory", sourceID: "event:event-1", targetID: "entity:agentmemory", label: "mentions"),
                MemoryMCPGraphEdge(id: "edge:event:event-1:entity:rag-mcp", sourceID: "event:event-1", targetID: "entity:rag-mcp", label: "mentions"),
                MemoryMCPGraphEdge(id: "edge:event:event-2:entity:agentmemory", sourceID: "event:event-2", targetID: "entity:agentmemory", label: "mentions")
            ]
        )
    }
}
