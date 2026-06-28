import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphSceneBuilderTests: XCTestCase {
    func testBuildsStable3DSceneFromGraph() {
        let graph = MemoryMCPGraph(
            nodes: [
                MemoryMCPGraphNode(id: "event:event-1", label: "Event", kind: .event, subtitle: "today"),
                MemoryMCPGraphNode(id: "entity:agentmemory", label: "AgentMemory", kind: .entity, subtitle: "project"),
                MemoryMCPGraphNode(id: "entity:product-documentation-litellm", label: "product-documentation-litellm", kind: .entity, subtitle: "unknown | 50 events"),
                MemoryMCPGraphNode(id: "wiki:overview", label: "Overview", kind: .wiki, subtitle: nil)
            ],
            edges: [
                MemoryMCPGraphEdge(
                    id: "edge:event:event-1:entity:agentmemory",
                    sourceID: "event:event-1",
                    targetID: "entity:agentmemory",
                    label: "mentions"
                )
            ]
        )

        let scene = MemoryMCPGraphSceneBuilder(radius: 10).build(from: graph)

        XCTAssertEqual(scene.nodes.map(\.id), [
            "entity:agentmemory",
            "entity:product-documentation-litellm",
            "event:event-1",
            "wiki:overview"
        ])
        XCTAssertGreaterThan(Set(scene.nodes.map(\.community)).count, 1)
        XCTAssertTrue(scene.nodes.contains { $0.community == "memory" })
        XCTAssertTrue(scene.nodes.contains { $0.community == "litellm" })
        XCTAssertTrue(scene.nodes.contains { $0.community == "wiki" })
        XCTAssertGreaterThan(scene.nodes.map { abs($0.position.z) }.max() ?? 0, 0)
        XCTAssertTrue(scene.nodes.allSatisfy { $0.importance > 0 })
        XCTAssertEqual(scene.edges, graph.edges)
    }
}
