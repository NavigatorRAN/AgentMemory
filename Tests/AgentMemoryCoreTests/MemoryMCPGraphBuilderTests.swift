import XCTest
@testable import AgentMemoryCore

final class MemoryMCPGraphBuilderTests: XCTestCase {
    func testBuildsGraphFromMemorySearchEventsAndEntitySummaries() {
        let events = [
            MemoryMCPSearchEvent(
                id: "event-1",
                eventDate: "2026-06-19T22:45:00+10:00",
                recordedAt: "2026-06-19T12:45:00Z",
                entities: ["agentmemory", "rag-mcp"],
                tags: ["project"],
                agent: "CODEX",
                content: "AgentMemory shipped RAG status summary.",
                path: "events/event-1.md"
            ),
            MemoryMCPSearchEvent(
                id: "event-2",
                eventDate: "2026-06-19T22:50:00+10:00",
                recordedAt: "2026-06-19T12:50:00Z",
                entities: ["agentmemory"],
                tags: ["project"],
                agent: "CODEX",
                content: "AgentMemory added Memory MCP search.",
                path: "events/event-2.md"
            )
        ]
        let entities = [
            MemoryMCPEntitySummary(
                name: "agentmemory",
                displayName: "AgentMemory",
                type: "project",
                eventCount: 50,
                lastEventDate: "2026-06-19T22:50:00+10:00"
            )
        ]

        let graph = MemoryMCPGraphBuilder().build(
            events: events,
            entityDetail: nil,
            entitySummaries: entities
        )

        XCTAssertEqual(graph.nodes.sorted { $0.id < $1.id }, [
            MemoryMCPGraphNode(id: "entity:agentmemory", label: "AgentMemory", kind: .entity, subtitle: "project | 50 events"),
            MemoryMCPGraphNode(id: "entity:rag-mcp", label: "rag-mcp", kind: .entity, subtitle: nil),
            MemoryMCPGraphNode(id: "event:event-1", label: "AgentMemory shipped RAG status summary.", kind: .event, subtitle: "2026-06-19T22:45:00+10:00"),
            MemoryMCPGraphNode(id: "event:event-2", label: "AgentMemory added Memory MCP search.", kind: .event, subtitle: "2026-06-19T22:50:00+10:00")
        ].sorted { $0.id < $1.id })

        XCTAssertEqual(graph.edges.sorted { $0.id < $1.id }, [
            MemoryMCPGraphEdge(id: "edge:event:event-1:entity:agentmemory", sourceID: "event:event-1", targetID: "entity:agentmemory", label: "mentions"),
            MemoryMCPGraphEdge(id: "edge:event:event-1:entity:rag-mcp", sourceID: "event:event-1", targetID: "entity:rag-mcp", label: "mentions"),
            MemoryMCPGraphEdge(id: "edge:event:event-2:entity:agentmemory", sourceID: "event:event-2", targetID: "entity:agentmemory", label: "mentions")
        ].sorted { $0.id < $1.id })
    }

    func testBuildsGraphFromEntityDetailRecentEvents() {
        let detail = MemoryMCPEntityDetail(
            name: "agentmemory",
            displayName: "AgentMemory",
            frontmatter: ["type": .string("project")],
            content: "Canonical notes.",
            path: "entities/agentmemory.md",
            recentEvents: [
                MemoryMCPRecentEvent(
                    id: "event-3",
                    eventDate: "2026-06-19T23:00:00+10:00",
                    recordedAt: "2026-06-19T13:00:00Z",
                    entities: ["agentmemory"],
                    tags: ["project"],
                    agent: "CODEX",
                    content: nil,
                    path: "events/event-3.md"
                )
            ]
        )

        let graph = MemoryMCPGraphBuilder().build(
            events: [],
            entityDetail: detail,
            entitySummaries: []
        )

        XCTAssertTrue(graph.nodes.contains(MemoryMCPGraphNode(id: "entity:agentmemory", label: "AgentMemory", kind: .entity, subtitle: "project")))
        XCTAssertTrue(graph.nodes.contains(MemoryMCPGraphNode(id: "event:event-3", label: "event-3", kind: .event, subtitle: "2026-06-19T23:00:00+10:00")))
        XCTAssertTrue(graph.edges.contains(MemoryMCPGraphEdge(id: "edge:event:event-3:entity:agentmemory", sourceID: "event:event-3", targetID: "entity:agentmemory", label: "mentions")))
    }
}
