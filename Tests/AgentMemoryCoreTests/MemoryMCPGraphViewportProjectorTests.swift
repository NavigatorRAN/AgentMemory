import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphViewportProjectorTests: XCTestCase {
    func testProjectsSceneIntoViewportWithPadding() {
        let scene = MemoryMCPGraphScene(
            nodes: [
                MemoryMCPGraphSceneNode(
                    id: "left",
                    label: "Left",
                    kind: .entity,
                    subtitle: nil,
                    position: MemoryMCPGraphPoint3D(x: -10, y: 0, z: 0)
                ),
                MemoryMCPGraphSceneNode(
                    id: "right",
                    label: "Right",
                    kind: .event,
                    subtitle: nil,
                    position: MemoryMCPGraphPoint3D(x: 10, y: 20, z: 4)
                )
            ],
            edges: []
        )

        let projection = MemoryMCPGraphViewportProjector().project(
            scene,
            width: 200,
            height: 100,
            padding: 10
        )

        XCTAssertEqual(projection.nodes.map(\.id), ["left", "right"])
        XCTAssertEqual(projection.nodes[0].point, MemoryMCPGraphPoint2D(x: 10, y: 90))
        XCTAssertEqual(projection.nodes[1].point, MemoryMCPGraphPoint2D(x: 190, y: 10))
    }

    func testProjectsSingleNodeToViewportCenter() {
        let scene = MemoryMCPGraphScene(
            nodes: [
                MemoryMCPGraphSceneNode(
                    id: "only",
                    label: "Only",
                    kind: .entity,
                    subtitle: nil,
                    position: MemoryMCPGraphPoint3D(x: 5, y: 5, z: 0)
                )
            ],
            edges: []
        )

        let projection = MemoryMCPGraphViewportProjector().project(scene, width: 200, height: 100, padding: 10)

        XCTAssertEqual(projection.nodes[0].point, MemoryMCPGraphPoint2D(x: 100, y: 50))
    }
}
