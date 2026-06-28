import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphViewportNodeMarkerBuilderTests: XCTestCase {
    func testBuildsMarkersWithSelectedRingRadius() {
        let projection = MemoryMCPGraphViewportProjection(
            nodes: [
                MemoryMCPGraphViewportNode(
                    id: "entity:agentmemory",
                    label: "AgentMemory",
                    kind: .entity,
                    point: MemoryMCPGraphPoint2D(x: 40, y: 50)
                ),
                MemoryMCPGraphViewportNode(
                    id: "event:import",
                    label: "Import event",
                    kind: .event,
                    point: MemoryMCPGraphPoint2D(x: 80, y: 50)
                )
            ],
            edges: []
        )

        let markers = MemoryMCPGraphViewportNodeMarkerBuilder().markers(
            from: projection,
            selectedNodeID: "entity:agentmemory"
        )

        XCTAssertEqual(markers, [
            MemoryMCPGraphViewportNodeMarker(
                id: "entity:agentmemory",
                kind: .entity,
                point: MemoryMCPGraphPoint2D(x: 40, y: 50),
                radius: 5.8,
                selectionRingRadius: 10.8,
                depth: 0,
                communityIndex: 0,
                importance: 0.35
            ),
            MemoryMCPGraphViewportNodeMarker(
                id: "event:import",
                kind: .event,
                point: MemoryMCPGraphPoint2D(x: 80, y: 50),
                radius: 4.8,
                selectionRingRadius: nil,
                depth: 0,
                communityIndex: 0,
                importance: 0.35
            )
        ])
    }

    func testMissingSelectionBuildsUnselectedMarkers() {
        let projection = MemoryMCPGraphViewportProjection(
            nodes: [
                MemoryMCPGraphViewportNode(
                    id: "event:import",
                    label: "Import event",
                    kind: .event,
                    point: MemoryMCPGraphPoint2D(x: 80, y: 50)
                )
            ],
            edges: []
        )

        let markers = MemoryMCPGraphViewportNodeMarkerBuilder().markers(from: projection, selectedNodeID: "missing")

        XCTAssertEqual(markers[0].selectionRingRadius, nil)
    }
}
