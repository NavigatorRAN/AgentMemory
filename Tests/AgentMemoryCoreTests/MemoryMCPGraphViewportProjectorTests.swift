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
            edges: [
                MemoryMCPGraphEdge(id: "edge:left:right", sourceID: "left", targetID: "right", label: "mentions")
            ]
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
        XCTAssertEqual(projection.edgeSegments, [
            MemoryMCPGraphViewportEdgeSegment(
                id: "edge:left:right",
                sourceID: "left",
                targetID: "right",
                label: "mentions",
                source: MemoryMCPGraphPoint2D(x: 10, y: 90),
                target: MemoryMCPGraphPoint2D(x: 190, y: 10)
            )
        ])
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

    func testProjectsSceneWithCameraRotationAndZoom() {
        let scene = MemoryMCPGraphScene(
            nodes: [
                MemoryMCPGraphSceneNode(
                    id: "front",
                    label: "Front",
                    kind: .entity,
                    subtitle: nil,
                    position: MemoryMCPGraphPoint3D(x: 40, y: 0, z: 30),
                    communityIndex: 2,
                    importance: 0.8
                ),
                MemoryMCPGraphSceneNode(
                    id: "back",
                    label: "Back",
                    kind: .wiki,
                    subtitle: nil,
                    position: MemoryMCPGraphPoint3D(x: -40, y: 0, z: -30),
                    communityIndex: 3,
                    importance: 0.4
                )
            ],
            edges: [
                MemoryMCPGraphEdge(id: "edge:front:back", sourceID: "front", targetID: "back", label: "documents")
            ]
        )

        let projection = MemoryMCPGraphViewportProjector().project(
            scene,
            width: 240,
            height: 160,
            padding: 20,
            camera: MemoryMCPGraphCamera(yaw: .pi / 4, pitch: 0.25, zoom: 1.4)
        )

        XCTAssertEqual(Set(projection.nodes.map(\.id)), ["front", "back"])
        XCTAssertEqual(Set(projection.nodes.map(\.communityIndex)), [2, 3])
        XCTAssertTrue(projection.nodes.contains { abs($0.depth) > 0 })
        XCTAssertEqual(projection.edgeSegments.count, 1)
    }
}
