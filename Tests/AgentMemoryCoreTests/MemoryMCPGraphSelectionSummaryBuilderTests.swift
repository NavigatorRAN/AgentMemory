import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphSelectionSummaryBuilderTests: XCTestCase {
    func testBuildsSummaryForSelectedNode() {
        let graph = MemoryMCPGraph(
            nodes: [
                MemoryMCPGraphNode(id: "entity:agentmemory", label: "AgentMemory", kind: .entity, subtitle: "project"),
                MemoryMCPGraphNode(id: "event:event-1", label: "Event 1", kind: .event, subtitle: nil),
                MemoryMCPGraphNode(id: "event:event-2", label: "Event 2", kind: .event, subtitle: nil)
            ],
            edges: [
                MemoryMCPGraphEdge(id: "edge:1", sourceID: "event:event-1", targetID: "entity:agentmemory", label: "mentions"),
                MemoryMCPGraphEdge(id: "edge:2", sourceID: "event:event-2", targetID: "entity:agentmemory", label: "mentions")
            ]
        )

        let summary = MemoryMCPGraphSelectionSummaryBuilder().summary(
            from: graph,
            selectedNodeID: "entity:agentmemory"
        )

        XCTAssertEqual(
            summary,
            MemoryMCPGraphSelectionSummary(
                nodeID: "entity:agentmemory",
                label: "AgentMemory",
                kind: .entity,
                subtitle: "project",
                connectedEdgeCount: 2
            )
        )
    }

    func testReturnsNilForMissingSelection() {
        let graph = MemoryMCPGraph(
            nodes: [
                MemoryMCPGraphNode(id: "entity:agentmemory", label: "AgentMemory", kind: .entity, subtitle: nil)
            ],
            edges: []
        )

        XCTAssertNil(MemoryMCPGraphSelectionSummaryBuilder().summary(from: graph, selectedNodeID: nil))
        XCTAssertNil(MemoryMCPGraphSelectionSummaryBuilder().summary(from: graph, selectedNodeID: "entity:missing"))
    }
}
