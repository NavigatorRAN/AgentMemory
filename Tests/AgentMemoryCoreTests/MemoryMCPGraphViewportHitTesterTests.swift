import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphViewportHitTesterTests: XCTestCase {
    func testReturnsNearestNodeWithinHitRadius() {
        let projection = MemoryMCPGraphViewportProjection(
            nodes: [
                MemoryMCPGraphViewportNode(
                    id: "entity:larder",
                    label: "Larder",
                    kind: .entity,
                    point: MemoryMCPGraphPoint2D(x: 40, y: 50)
                ),
                MemoryMCPGraphViewportNode(
                    id: "event:import",
                    label: "Import event",
                    kind: .event,
                    point: MemoryMCPGraphPoint2D(x: 60, y: 50)
                )
            ],
            edges: []
        )

        let hit = MemoryMCPGraphViewportHitTester().hitNode(
            in: projection,
            point: MemoryMCPGraphPoint2D(x: 55, y: 50),
            radius: 8
        )

        XCTAssertEqual(hit?.nodeID, "event:import")
    }

    func testReturnsNilWhenPointIsOutsideHitRadius() {
        let projection = MemoryMCPGraphViewportProjection(
            nodes: [
                MemoryMCPGraphViewportNode(
                    id: "entity:larder",
                    label: "Larder",
                    kind: .entity,
                    point: MemoryMCPGraphPoint2D(x: 40, y: 50)
                )
            ],
            edges: []
        )

        let hit = MemoryMCPGraphViewportHitTester().hitNode(
            in: projection,
            point: MemoryMCPGraphPoint2D(x: 80, y: 50),
            radius: 8
        )

        XCTAssertNil(hit)
    }
}
