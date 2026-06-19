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
