public enum AgentMemoryWorkspace: String, CaseIterable, Identifiable, Codable, Sendable {
    case ingestion
    case review
    case search
    case wiki
    case graph
    case rag

    public var id: String { rawValue }

    public var title: String {
        switch self {
        case .ingestion:
            "Ingestion"
        case .review:
            "Review"
        case .search:
            "Search"
        case .wiki:
            "Wiki"
        case .graph:
            "Memory Graph"
        case .rag:
            "RAG Queue"
        }
    }

    public var subtitle: String {
        switch self {
        case .ingestion:
            "Drop stacks, fetch source text, and run overnight batches."
        case .review:
            "Approve, edit, skip, retry, and export uncertain captures."
        case .search:
            "Find saved memory, entities, and source-backed context."
        case .wiki:
            "Read compiled knowledge pages refreshed from Memory MCP, RAG, and source captures."
        case .graph:
            "Explore Memory MCP entities, events, communities, and evidence paths."
        case .rag:
            "Inspect remote RAG queue health, exports, jobs, and failures."
        }
    }

    public var systemImage: String {
        switch self {
        case .ingestion:
            "tray.and.arrow.down"
        case .review:
            "checklist"
        case .search:
            "magnifyingglass"
        case .wiki:
            "book.pages"
        case .graph:
            "point.3.connected.trianglepath.dotted"
        case .rag:
            "shippingbox"
        }
    }
}
