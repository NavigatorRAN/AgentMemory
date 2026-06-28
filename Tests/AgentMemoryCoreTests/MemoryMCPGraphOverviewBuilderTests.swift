import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphOverviewBuilderTests: XCTestCase {
    func testOverviewAggregatesImportedWebPagesByCollectionAndSection() {
        let graph = MemoryMCPGraph(
            nodes: [
                MemoryMCPGraphNode(id: "entity:home-assistant-docs", label: "home-assistant-docs", kind: .entity, subtitle: "documentation-collection | 10 events"),
                MemoryMCPGraphNode(id: "entity:web-page-automation-actions-home-assistant", label: "web-page-automation-actions-home-assistant", kind: .entity, subtitle: "1 events"),
                MemoryMCPGraphNode(id: "entity:web-page-automation-triggers-home-assistant", label: "web-page-automation-triggers-home-assistant", kind: .entity, subtitle: "1 events"),
                MemoryMCPGraphNode(id: "entity:web-page-automating-home-assistant-home-assistant", label: "web-page-automating-home-assistant-home-assistant", kind: .entity, subtitle: "2 events"),
                MemoryMCPGraphNode(id: "entity:web-page-adding-integrations-home-assistant", label: "web-page-adding-integrations-home-assistant", kind: .entity, subtitle: "1 events"),
                MemoryMCPGraphNode(id: "wiki:home-assistant-docs", label: "Home Assistant Documentation", kind: .wiki, subtitle: nil)
            ],
            edges: [
                MemoryMCPGraphEdge(id: "edge:collection:automation-actions", sourceID: "entity:home-assistant-docs", targetID: "entity:web-page-automation-actions-home-assistant", label: "co_occurs"),
                MemoryMCPGraphEdge(id: "edge:collection:automation-triggers", sourceID: "entity:home-assistant-docs", targetID: "entity:web-page-automation-triggers-home-assistant", label: "co_occurs"),
                MemoryMCPGraphEdge(id: "edge:collection:automating", sourceID: "entity:home-assistant-docs", targetID: "entity:web-page-automating-home-assistant-home-assistant", label: "co_occurs"),
                MemoryMCPGraphEdge(id: "edge:collection:integrations", sourceID: "entity:home-assistant-docs", targetID: "entity:web-page-adding-integrations-home-assistant", label: "co_occurs"),
                MemoryMCPGraphEdge(id: "edge:collection:wiki", sourceID: "entity:home-assistant-docs", targetID: "wiki:home-assistant-docs", label: "documents")
            ]
        )

        let overview = MemoryMCPGraphOverviewBuilder(minimumAggregateMembers: 3).overview(from: graph)

        XCTAssertTrue(overview.nodes.contains(MemoryMCPGraphNode(
            id: "aggregate:home-assistant-docs:automation",
            label: "home-assistant-docs / automation",
            kind: .entity,
            subtitle: "3 pages | 4 events"
        )))
        XCTAssertFalse(overview.nodes.contains { $0.id == "entity:web-page-automation-actions-home-assistant" })
        XCTAssertTrue(overview.nodes.contains { $0.id == "entity:web-page-adding-integrations-home-assistant" })
        XCTAssertTrue(overview.edges.contains {
            $0.sourceID == "entity:home-assistant-docs"
                && $0.targetID == "aggregate:home-assistant-docs:automation"
                && $0.label == "summarizes"
        })
        XCTAssertTrue(overview.nodes.contains { $0.id == "wiki:home-assistant-docs" })
    }

    func testFocusedGraphExpandsSelectedAggregateBackToPageNodes() {
        let graph = MemoryMCPGraph(
            nodes: [
                MemoryMCPGraphNode(id: "entity:home-assistant-docs", label: "home-assistant-docs", kind: .entity, subtitle: "documentation-collection | 10 events"),
                MemoryMCPGraphNode(id: "entity:web-page-automation-actions-home-assistant", label: "web-page-automation-actions-home-assistant", kind: .entity, subtitle: "1 events"),
                MemoryMCPGraphNode(id: "entity:web-page-automation-triggers-home-assistant", label: "web-page-automation-triggers-home-assistant", kind: .entity, subtitle: "1 events"),
                MemoryMCPGraphNode(id: "entity:web-page-automating-home-assistant-home-assistant", label: "web-page-automating-home-assistant-home-assistant", kind: .entity, subtitle: "2 events")
            ],
            edges: [
                MemoryMCPGraphEdge(id: "edge:collection:automation-actions", sourceID: "entity:home-assistant-docs", targetID: "entity:web-page-automation-actions-home-assistant", label: "co_occurs"),
                MemoryMCPGraphEdge(id: "edge:collection:automation-triggers", sourceID: "entity:home-assistant-docs", targetID: "entity:web-page-automation-triggers-home-assistant", label: "co_occurs"),
                MemoryMCPGraphEdge(id: "edge:collection:automating", sourceID: "entity:home-assistant-docs", targetID: "entity:web-page-automating-home-assistant-home-assistant", label: "co_occurs")
            ]
        )

        let focused = MemoryMCPGraphOverviewBuilder(minimumAggregateMembers: 3).focusedGraph(
            from: graph,
            selectedNodeID: "aggregate:home-assistant-docs:automation"
        )

        XCTAssertTrue(focused.nodes.contains { $0.id == "aggregate:home-assistant-docs:automation" })
        XCTAssertTrue(focused.nodes.contains { $0.id == "entity:web-page-automation-actions-home-assistant" })
        XCTAssertTrue(focused.nodes.contains { $0.id == "entity:web-page-automation-triggers-home-assistant" })
        XCTAssertTrue(focused.edges.contains {
            $0.sourceID == "aggregate:home-assistant-docs:automation"
                && $0.targetID == "entity:web-page-automation-actions-home-assistant"
                && $0.label == "contains"
        })
    }
}
