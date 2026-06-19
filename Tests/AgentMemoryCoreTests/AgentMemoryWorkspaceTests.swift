import XCTest
@testable import AgentMemoryCore

final class AgentMemoryWorkspaceTests: XCTestCase {
    func testWorkspaceOrderAndDisplayMetadata() {
        XCTAssertEqual(AgentMemoryWorkspace.allCases, [.ingestion, .review, .search, .graph, .rag])
        XCTAssertEqual(AgentMemoryWorkspace.ingestion.title, "Ingestion")
        XCTAssertEqual(AgentMemoryWorkspace.review.systemImage, "checklist")
        XCTAssertEqual(AgentMemoryWorkspace.search.subtitle, "Find saved memory, entities, and source-backed context.")
        XCTAssertEqual(AgentMemoryWorkspace.graph.title, "Memory Graph")
        XCTAssertEqual(AgentMemoryWorkspace.rag.systemImage, "shippingbox")
    }
}
