import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphSceneBuilderTests: XCTestCase {
    func testBuildsStable3DSceneFromGraph() {
        let graph = MemoryMCPGraph(
            nodes: [
                MemoryMCPGraphNode(id: "event:event-1", label: "Event", kind: .event, subtitle: "today"),
                MemoryMCPGraphNode(id: "entity:agentmemory", label: "AgentMemory", kind: .entity, subtitle: "project"),
                MemoryMCPGraphNode(id: "entity:rag-mcp", label: "RAG MCP", kind: .entity, subtitle: nil)
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
            "entity:rag-mcp",
            "event:event-1"
        ])
        XCTAssertEqual(scene.nodes[0].position.roundedForTest, MemoryMCPGraphPoint3D(x: 10, y: 0, z: 0))
        XCTAssertEqual(scene.nodes[1].position.roundedForTest, MemoryMCPGraphPoint3D(x: -5, y: 8.66, z: 0))
        XCTAssertEqual(scene.nodes[2].position.roundedForTest, MemoryMCPGraphPoint3D(x: -5, y: -8.66, z: 4))
        XCTAssertEqual(scene.edges, graph.edges)
    }
}

private extension MemoryMCPGraphPoint3D {
    var roundedForTest: MemoryMCPGraphPoint3D {
        MemoryMCPGraphPoint3D(
            x: (x * 100).rounded() / 100,
            y: (y * 100).rounded() / 100,
            z: (z * 100).rounded() / 100
        )
    }
}
