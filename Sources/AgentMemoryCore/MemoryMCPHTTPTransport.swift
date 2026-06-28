import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct MemoryMCPHTTPTransport: MemoryMCPTransporting {
    public enum TransportError: Error, Equatable {
        case nonHTTPResponse
        case unsuccessfulStatus(Int)
        case missingSessionID
        case missingStructuredContent
    }

    private let endpoint: URL
    private let session: URLSession

    public init(endpoint: URL, session: URLSession = .shared) {
        self.endpoint = endpoint
        self.session = session
    }

    public func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws {
        _ = try await callTool(
            name: "record_event",
            arguments: payload,
            structuredContent: EmptyStructuredContent.self
        )
    }

    public func searchEvents(query: String, limit: Int = 20, entities: [String]? = nil, since: String? = nil) async throws -> [MemoryMCPSearchEvent] {
        let structured = try await callTool(
            name: "search_events",
            arguments: SearchEventsArguments(query: query, entities: entities, since: since, limit: limit),
            structuredContent: SearchEventsStructuredContent.self
        )
        return structured.result
    }

    public func recallEvents(forEntity entity: String, limit: Int = 10, includeContent: Bool = true, since: String? = nil, until: String? = nil) async throws -> [MemoryMCPSearchEvent] {
        let structured = try await callTool(
            name: "recall_for_entity",
            arguments: RecallForEntityArguments(entity: entity, includeContent: includeContent, limit: limit, since: since, until: until),
            structuredContent: SearchEventsStructuredContent.self
        )
        return structured.result
    }

    public func getEntity(named name: String) async throws -> MemoryMCPEntityDetail {
        try await callTool(
            name: "get_entity",
            arguments: GetEntityArguments(name: name),
            structuredContent: MemoryMCPEntityDetail.self
        )
    }

    public func listEntities(prefix: String? = nil, type: String? = nil) async throws -> [MemoryMCPEntitySummary] {
        let structured = try await callTool(
            name: "list_entities",
            arguments: ListEntitiesArguments(prefix: prefix, type: type),
            structuredContent: ListEntitiesStructuredContent.self
        )
        return structured.result
    }

    public func searchWiki(query: String, limit: Int = 20) async throws -> [MemoryMCPWikiSearchResult] {
        let structured = try await callTool(
            name: "search_wiki",
            arguments: SearchWikiArguments(query: query, limit: limit),
            structuredContent: SearchWikiStructuredContent.self
        )
        return structured.result
    }

    public func getWikiPage(slug: String) async throws -> MemoryMCPWikiPageDetail {
        try await callTool(
            name: "get_wiki_page",
            arguments: GetWikiPageArguments(slug: slug),
            structuredContent: MemoryMCPWikiPageDetail.self
        )
    }

    public func memoryGraph(query: String? = nil, limit: Int = 10_000) async throws -> MemoryMCPGraph {
        let structured = try await callTool(
            name: "memory_graph",
            arguments: MemoryGraphArguments(query: query, limit: limit),
            structuredContent: MemoryGraphStructuredContent.self
        )
        return structured.graph
    }

    private func callTool<Arguments: Encodable, StructuredContent: Decodable>(
        name: String,
        arguments: Arguments,
        structuredContent: StructuredContent.Type
    ) async throws -> StructuredContent {
        let sessionID = try await initializeSession()
        try await sendInitialized(sessionID: sessionID)

        let request = JSONRPCRequest(
            id: 3,
            method: "tools/call",
            params: ToolCallParams(name: name, arguments: arguments)
        )
        let data = try await send(request, sessionID: sessionID, acceptedStatusCodes: 200..<300)
        let decoded = try JSONDecoder.agentMemory.decode(ToolCallResponse<StructuredContent>.self, from: data)
        guard let structuredContent = decoded.result.structuredContent else {
            if StructuredContent.self == EmptyStructuredContent.self {
                return EmptyStructuredContent() as! StructuredContent
            }
            throw TransportError.missingStructuredContent
        }
        return structuredContent
    }

    private func initializeSession() async throws -> String {
        let request = JSONRPCRequest(
            id: 1,
            method: "initialize",
            params: InitializeParams(
                protocolVersion: "2024-11-05",
                capabilities: [:],
                clientInfo: ClientInfo(name: "AgentMemory", version: "0.1")
            )
        )
        let (_, response) = try await sendWithResponse(request, sessionID: nil, acceptedStatusCodes: 200..<300)
        guard let sessionID = response.value(forHeader: "mcp-session-id") else {
            throw TransportError.missingSessionID
        }
        return sessionID
    }

    private func sendInitialized(sessionID: String) async throws {
        let request = JSONRPCNotification(method: "notifications/initialized", params: EmptyParams())
        _ = try await send(request, sessionID: sessionID, acceptedStatusCodes: 200..<300)
    }

    private func send<RequestBody: Encodable>(
        _ body: RequestBody,
        sessionID: String?,
        acceptedStatusCodes: Range<Int>
    ) async throws -> Data {
        let (data, _) = try await sendWithResponse(body, sessionID: sessionID, acceptedStatusCodes: acceptedStatusCodes)
        return data
    }

    private func sendWithResponse<RequestBody: Encodable>(
        _ body: RequestBody,
        sessionID: String?,
        acceptedStatusCodes: Range<Int>
    ) async throws -> (Data, HTTPURLResponse) {
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        if let sessionID {
            request.setValue(sessionID, forHTTPHeaderField: "mcp-session-id")
        }
        request.httpBody = try JSONEncoder.agentMemory.encode(body)

        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw TransportError.nonHTTPResponse
        }

        guard acceptedStatusCodes.contains(httpResponse.statusCode) else {
            throw TransportError.unsuccessfulStatus(httpResponse.statusCode)
        }

        return (data, httpResponse)
    }
}

public struct MemoryMCPSearchEvent: Codable, Equatable, Sendable {
    public var id: String
    public var eventDate: String
    public var recordedAt: String
    public var entities: [String]
    public var tags: [String]
    public var agent: String?
    public var content: String
    public var path: String

    public init(
        id: String,
        eventDate: String,
        recordedAt: String,
        entities: [String],
        tags: [String],
        agent: String?,
        content: String,
        path: String
    ) {
        self.id = id
        self.eventDate = eventDate
        self.recordedAt = recordedAt
        self.entities = entities
        self.tags = tags
        self.agent = agent
        self.content = content
        self.path = path
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case eventDate = "event_date"
        case recordedAt = "recorded_at"
        case entities
        case tags
        case agent
        case content
        case path
    }
}

public struct MemoryMCPEntityDetail: Codable, Equatable, Sendable {
    public var name: String
    public var displayName: String
    public var frontmatter: [String: MemoryMCPJSONValue]
    public var content: String
    public var path: String?
    public var recentEvents: [MemoryMCPRecentEvent]

    public init(
        name: String,
        displayName: String,
        frontmatter: [String: MemoryMCPJSONValue],
        content: String,
        path: String?,
        recentEvents: [MemoryMCPRecentEvent]
    ) {
        self.name = name
        self.displayName = displayName
        self.frontmatter = frontmatter
        self.content = content
        self.path = path
        self.recentEvents = recentEvents
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
        case frontmatter
        case content
        case path
        case recentEvents = "recent_events"
    }
}

public struct MemoryMCPEntitySummary: Codable, Equatable, Sendable {
    public var name: String
    public var displayName: String
    public var type: String
    public var eventCount: Int
    public var lastEventDate: String?

    public init(name: String, displayName: String, type: String, eventCount: Int, lastEventDate: String?) {
        self.name = name
        self.displayName = displayName
        self.type = type
        self.eventCount = eventCount
        self.lastEventDate = lastEventDate
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
        case type
        case eventCount = "event_count"
        case lastEventDate = "last_event_date"
    }
}

public struct MemoryMCPRecentEvent: Codable, Equatable, Sendable {
    public var id: String
    public var eventDate: String
    public var recordedAt: String
    public var entities: [String]
    public var tags: [String]
    public var agent: String?
    public var content: String?
    public var path: String

    public init(
        id: String,
        eventDate: String,
        recordedAt: String,
        entities: [String],
        tags: [String],
        agent: String?,
        content: String?,
        path: String
    ) {
        self.id = id
        self.eventDate = eventDate
        self.recordedAt = recordedAt
        self.entities = entities
        self.tags = tags
        self.agent = agent
        self.content = content
        self.path = path
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case eventDate = "event_date"
        case recordedAt = "recorded_at"
        case entities
        case tags
        case agent
        case content
        case path
    }
}

public struct MemoryMCPWikiSearchResult: Codable, Equatable, Sendable {
    public var slug: String
    public var title: String
    public var summary: String
    public var path: String?
    public var tags: [String]
    public var ragCollections: [String]
    public var updatedAt: String?

    public init(
        slug: String,
        title: String,
        summary: String,
        path: String?,
        tags: [String],
        ragCollections: [String],
        updatedAt: String?
    ) {
        self.slug = slug
        self.title = title
        self.summary = summary
        self.path = path
        self.tags = tags
        self.ragCollections = ragCollections
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case slug
        case title
        case summary
        case path
        case tags
        case ragCollections = "rag_collections"
        case updatedAt = "updated_at"
    }
}

public struct MemoryMCPWikiPageDetail: Codable, Equatable, Sendable {
    public var slug: String
    public var title: String
    public var summary: String
    public var body: String
    public var path: String?
    public var tags: [String]
    public var ragCollections: [String]
    public var sourceURLs: [String]
    public var updatedAt: String?

    public init(
        slug: String,
        title: String,
        summary: String,
        body: String,
        path: String?,
        tags: [String],
        ragCollections: [String],
        sourceURLs: [String],
        updatedAt: String?
    ) {
        self.slug = slug
        self.title = title
        self.summary = summary
        self.body = body
        self.path = path
        self.tags = tags
        self.ragCollections = ragCollections
        self.sourceURLs = sourceURLs
        self.updatedAt = updatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case slug
        case title
        case summary
        case body
        case path
        case tags
        case ragCollections = "rag_collections"
        case sourceURLs = "source_urls"
        case updatedAt = "updated_at"
    }
}

public enum MemoryMCPJSONValue: Codable, Equatable, Sendable {
    case string(String)
    case number(Double)
    case bool(Bool)
    case array([MemoryMCPJSONValue])
    case object([String: MemoryMCPJSONValue])
    case null

    public var stringValue: String? {
        if case let .string(value) = self {
            return value
        }
        return nil
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() {
            self = .null
        } else if let value = try? container.decode(Bool.self) {
            self = .bool(value)
        } else if let value = try? container.decode(Double.self) {
            self = .number(value)
        } else if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([MemoryMCPJSONValue].self) {
            self = .array(value)
        } else {
            self = .object(try container.decode([String: MemoryMCPJSONValue].self))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .string(value):
            try container.encode(value)
        case let .number(value):
            try container.encode(value)
        case let .bool(value):
            try container.encode(value)
        case let .array(value):
            try container.encode(value)
        case let .object(value):
            try container.encode(value)
        case .null:
            try container.encodeNil()
        }
    }
}

private struct JSONRPCRequest<Params: Encodable>: Encodable {
    var jsonrpc = "2.0"
    var id: Int
    var method: String
    var params: Params
}

private struct JSONRPCNotification<Params: Encodable>: Encodable {
    var jsonrpc = "2.0"
    var method: String
    var params: Params
}

private struct InitializeParams: Encodable {
    var protocolVersion: String
    var capabilities: [String: String]
    var clientInfo: ClientInfo
}

private struct ClientInfo: Encodable {
    var name: String
    var version: String
}

private struct ToolCallParams<Arguments: Encodable>: Encodable {
    var name: String
    var arguments: Arguments
}

private struct SearchEventsArguments: Encodable {
    var query: String
    var entities: [String]?
    var since: String?
    var limit: Int
}

private struct RecallForEntityArguments: Encodable {
    var entity: String
    var includeContent: Bool
    var limit: Int
    var since: String?
    var until: String?

    private enum CodingKeys: String, CodingKey {
        case entity
        case includeContent = "include_content"
        case limit
        case since
        case until
    }
}

private struct GetEntityArguments: Encodable {
    var name: String
}

private struct ListEntitiesArguments: Encodable {
    var prefix: String?
    var type: String?
}

private struct SearchWikiArguments: Encodable {
    var query: String
    var limit: Int
}

private struct GetWikiPageArguments: Encodable {
    var slug: String
}

private struct MemoryGraphArguments: Encodable {
    var query: String?
    var limit: Int
}

private struct ListEntitiesStructuredContent: Decodable {
    var result: [MemoryMCPEntitySummary]
}

private struct SearchWikiStructuredContent: Decodable {
    var result: [MemoryMCPWikiSearchResult]
}

private struct MemoryGraphStructuredContent: Decodable {
    var nodes: [ServerMemoryGraphNode]
    var edges: [ServerMemoryGraphEdge]

    var graph: MemoryMCPGraph {
        MemoryMCPGraph(
            nodes: nodes.map(\.graphNode).sorted { $0.id < $1.id },
            edges: edges.map(\.graphEdge).sorted { $0.id < $1.id }
        )
    }
}

private struct ServerMemoryGraphNode: Decodable {
    var id: String
    var label: String
    var kind: String
    var type: String?
    var eventCount: Int?

    var graphNode: MemoryMCPGraphNode {
        MemoryMCPGraphNode(
            id: id,
            label: label,
            kind: graphNodeKind(from: kind),
            subtitle: subtitle
        )
    }

    private var subtitle: String? {
        switch (type, eventCount) {
        case let (.some(type), .some(eventCount)):
            return "\(type) | \(eventCount) events"
        case let (.some(type), .none):
            return type
        case let (.none, .some(eventCount)):
            return "\(eventCount) events"
        case (.none, .none):
            return nil
        }
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case label
        case kind
        case type
        case eventCount = "event_count"
    }
}

private struct ServerMemoryGraphEdge: Decodable {
    var source: String
    var target: String
    var relation: String
    var weight: Double?

    var graphEdge: MemoryMCPGraphEdge {
        MemoryMCPGraphEdge(
            id: "edge:\(source):\(target):\(relation)",
            sourceID: source,
            targetID: target,
            label: relation
        )
    }
}

private func graphNodeKind(from rawKind: String) -> MemoryMCPGraphNode.Kind {
    switch rawKind.lowercased() {
    case "entity":
        return .entity
    case "event":
        return .event
    case "wiki":
        return .wiki
    default:
        return .unknown
    }
}

private struct ToolCallResponse<StructuredContent: Decodable>: Decodable {
    var result: ToolCallResult<StructuredContent>
}

private struct ToolCallResult<StructuredContent: Decodable>: Decodable {
    var structuredContent: StructuredContent?
}

private struct SearchEventsStructuredContent: Decodable {
    var result: [MemoryMCPSearchEvent]
}

private struct EmptyStructuredContent: Codable {
    init() {}
}

private struct EmptyParams: Codable {
    init() {}
}

private extension HTTPURLResponse {
    func value(forHeader name: String) -> String? {
        for (key, value) in allHeaderFields {
            guard String(describing: key).lowercased() == name.lowercased() else {
                continue
            }
            return String(describing: value)
        }
        return nil
    }
}
