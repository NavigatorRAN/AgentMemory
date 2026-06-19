import XCTest
@testable import AgentMemoryCore

final class MemoryMCPHTTPTransportTests: XCTestCase {
    override func tearDown() {
        RecordingURLProtocol.requestHandler = nil
        super.tearDown()
    }

    func testTransportCallsRecordEventThroughMCPJSONRPCSession() async throws {
        let endpoint = URL(string: "http://127.0.0.1:8006/mcp")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [RecordingURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let transport = MemoryMCPHTTPTransport(endpoint: endpoint, session: session)
        let payload = MemoryMCPRecordEventPayload(
            agent: "CODEX",
            content: "Captured decision",
            entities: ["agentmemory"],
            tags: ["capture"]
        )
        var requestIndex = 0

        RecordingURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url, endpoint)
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
            XCTAssertEqual(request.value(forHTTPHeaderField: "Accept"), "application/json")
            let body = try XCTUnwrap(request.httpBodyStreamData)
            let decoded = try JSONSerialization.jsonObject(with: body) as? [String: Any]
            requestIndex += 1

            switch requestIndex {
            case 1:
                XCTAssertEqual(decoded?["method"] as? String, "initialize")
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-1"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":1,"result":{"protocolVersion":"2024-11-05","capabilities":{},"serverInfo":{"name":"memory","version":"3.2.4"}}}
                    """.utf8)
                )
            case 2:
                XCTAssertEqual(request.value(forHTTPHeaderField: "mcp-session-id"), "session-1")
                XCTAssertEqual(decoded?["method"] as? String, "notifications/initialized")
                return (HTTPURLResponse(url: endpoint, statusCode: 202, httpVersion: nil, headerFields: ["mcp-session-id": "session-1"])!, Data())
            case 3:
                XCTAssertEqual(request.value(forHTTPHeaderField: "mcp-session-id"), "session-1")
                XCTAssertEqual(decoded?["method"] as? String, "tools/call")
                let params = try XCTUnwrap(decoded?["params"] as? [String: Any])
                XCTAssertEqual(params["name"] as? String, "record_event")
                let arguments = try XCTUnwrap(params["arguments"] as? [String: Any])
                XCTAssertEqual(arguments["agent"] as? String, payload.agent)
                XCTAssertEqual(arguments["content"] as? String, payload.content)
                XCTAssertEqual(arguments["entities"] as? [String], payload.entities)
                XCTAssertEqual(arguments["tags"] as? [String], payload.tags)
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-1"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":3,"result":{"content":[{"type":"text","text":"{}"}],"structuredContent":{"id":"event-1"}}}
                    """.utf8)
                )
            default:
                XCTFail("Unexpected request \(requestIndex)")
                return (HTTPURLResponse(url: endpoint, statusCode: 500, httpVersion: nil, headerFields: nil)!, Data())
            }
        }

        try await transport.recordEvent(payload)
        XCTAssertEqual(requestIndex, 3)
    }

    func testTransportSearchEventsParsesMCPWrappedResult() async throws {
        let endpoint = URL(string: "http://127.0.0.1:8006/mcp")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [RecordingURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let transport = MemoryMCPHTTPTransport(endpoint: endpoint, session: session)
        var requestIndex = 0

        RecordingURLProtocol.requestHandler = { request in
            let body = try XCTUnwrap(request.httpBodyStreamData)
            let decoded = try JSONSerialization.jsonObject(with: body) as? [String: Any]
            requestIndex += 1

            switch requestIndex {
            case 1:
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-2"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":1,"result":{"protocolVersion":"2024-11-05","capabilities":{},"serverInfo":{"name":"memory","version":"3.2.4"}}}
                    """.utf8)
                )
            case 2:
                return (HTTPURLResponse(url: endpoint, statusCode: 202, httpVersion: nil, headerFields: ["mcp-session-id": "session-2"])!, Data())
            case 3:
                XCTAssertEqual(decoded?["method"] as? String, "tools/call")
                let params = try XCTUnwrap(decoded?["params"] as? [String: Any])
                XCTAssertEqual(params["name"] as? String, "search_events")
                let arguments = try XCTUnwrap(params["arguments"] as? [String: Any])
                XCTAssertEqual(arguments["query"] as? String, "AgentMemory")
                XCTAssertEqual(arguments["limit"] as? Int, 2)
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-2"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":3,"result":{"structuredContent":{"result":[{"id":"event-1","event_date":"2026-06-19T22:45:00+10:00","recorded_at":"2026-06-19T12:37:42Z","entities":["agentmemory"],"tags":["project"],"agent":"CODEX","content":"AgentMemory event","path":"events/example.md"}]}}}
                    """.utf8)
                )
            default:
                XCTFail("Unexpected request \(requestIndex)")
                return (HTTPURLResponse(url: endpoint, statusCode: 500, httpVersion: nil, headerFields: nil)!, Data())
            }
        }

        let results = try await transport.searchEvents(query: "AgentMemory", limit: 2)

        XCTAssertEqual(results, [
            MemoryMCPSearchEvent(
                id: "event-1",
                eventDate: "2026-06-19T22:45:00+10:00",
                recordedAt: "2026-06-19T12:37:42Z",
                entities: ["agentmemory"],
                tags: ["project"],
                agent: "CODEX",
                content: "AgentMemory event",
                path: "events/example.md"
            )
        ])
    }

    func testTransportRecallsEventsForEntity() async throws {
        let endpoint = URL(string: "http://127.0.0.1:8006/mcp")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [RecordingURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let transport = MemoryMCPHTTPTransport(endpoint: endpoint, session: session)
        var requestIndex = 0

        RecordingURLProtocol.requestHandler = { request in
            let body = try XCTUnwrap(request.httpBodyStreamData)
            let decoded = try JSONSerialization.jsonObject(with: body) as? [String: Any]
            requestIndex += 1

            switch requestIndex {
            case 1:
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-3"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":1,"result":{"protocolVersion":"2024-11-05","capabilities":{},"serverInfo":{"name":"memory","version":"3.2.4"}}}
                    """.utf8)
                )
            case 2:
                return (HTTPURLResponse(url: endpoint, statusCode: 202, httpVersion: nil, headerFields: ["mcp-session-id": "session-3"])!, Data())
            case 3:
                XCTAssertEqual(decoded?["method"] as? String, "tools/call")
                let params = try XCTUnwrap(decoded?["params"] as? [String: Any])
                XCTAssertEqual(params["name"] as? String, "recall_for_entity")
                let arguments = try XCTUnwrap(params["arguments"] as? [String: Any])
                XCTAssertEqual(arguments["entity"] as? String, "agentmemory")
                XCTAssertEqual(arguments["limit"] as? Int, 3)
                XCTAssertEqual(arguments["include_content"] as? Bool, true)
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-3"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":3,"result":{"structuredContent":{"result":[{"id":"event-2","event_date":"2026-06-19T22:50:00+10:00","recorded_at":"2026-06-19T12:50:00Z","entities":["agentmemory"],"tags":["project"],"agent":"CODEX","content":"Entity recall event","path":"events/entity.md"}]}}}
                    """.utf8)
                )
            default:
                XCTFail("Unexpected request \(requestIndex)")
                return (HTTPURLResponse(url: endpoint, statusCode: 500, httpVersion: nil, headerFields: nil)!, Data())
            }
        }

        let results = try await transport.recallEvents(forEntity: "agentmemory", limit: 3)

        XCTAssertEqual(results, [
            MemoryMCPSearchEvent(
                id: "event-2",
                eventDate: "2026-06-19T22:50:00+10:00",
                recordedAt: "2026-06-19T12:50:00Z",
                entities: ["agentmemory"],
                tags: ["project"],
                agent: "CODEX",
                content: "Entity recall event",
                path: "events/entity.md"
            )
        ])
    }

    func testTransportGetsEntityDetail() async throws {
        let endpoint = URL(string: "http://127.0.0.1:8006/mcp")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [RecordingURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let transport = MemoryMCPHTTPTransport(endpoint: endpoint, session: session)
        var requestIndex = 0

        RecordingURLProtocol.requestHandler = { request in
            let body = try XCTUnwrap(request.httpBodyStreamData)
            let decoded = try JSONSerialization.jsonObject(with: body) as? [String: Any]
            requestIndex += 1

            switch requestIndex {
            case 1:
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-4"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":1,"result":{"protocolVersion":"2024-11-05","capabilities":{},"serverInfo":{"name":"memory","version":"3.2.4"}}}
                    """.utf8)
                )
            case 2:
                return (HTTPURLResponse(url: endpoint, statusCode: 202, httpVersion: nil, headerFields: ["mcp-session-id": "session-4"])!, Data())
            case 3:
                XCTAssertEqual(decoded?["method"] as? String, "tools/call")
                let params = try XCTUnwrap(decoded?["params"] as? [String: Any])
                XCTAssertEqual(params["name"] as? String, "get_entity")
                let arguments = try XCTUnwrap(params["arguments"] as? [String: Any])
                XCTAssertEqual(arguments["name"] as? String, "agentmemory")
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-4"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":3,"result":{"structuredContent":{"name":"agentmemory","display_name":"AgentMemory","content":"Canonical entity notes.","path":"entities/agentmemory.md","frontmatter":{"entity":"agentmemory","type":"project","display_name":"AgentMemory"},"recent_events":[{"id":"event-3","event_date":"2026-06-19T22:55:00+10:00","recorded_at":"2026-06-19T12:55:00Z","entities":["agentmemory"],"tags":["project"],"agent":"CODEX","path":"events/detail.md"}]}}}
                    """.utf8)
                )
            default:
                XCTFail("Unexpected request \(requestIndex)")
                return (HTTPURLResponse(url: endpoint, statusCode: 500, httpVersion: nil, headerFields: nil)!, Data())
            }
        }

        let entity = try await transport.getEntity(named: "agentmemory")

        XCTAssertEqual(entity.name, "agentmemory")
        XCTAssertEqual(entity.displayName, "AgentMemory")
        XCTAssertEqual(entity.content, "Canonical entity notes.")
        XCTAssertEqual(entity.path, "entities/agentmemory.md")
        XCTAssertEqual(entity.frontmatter["type"]?.stringValue, "project")
        XCTAssertEqual(entity.recentEvents, [
            MemoryMCPRecentEvent(
                id: "event-3",
                eventDate: "2026-06-19T22:55:00+10:00",
                recordedAt: "2026-06-19T12:55:00Z",
                entities: ["agentmemory"],
                tags: ["project"],
                agent: "CODEX",
                content: nil,
                path: "events/detail.md"
            )
        ])
    }

    func testTransportListsEntities() async throws {
        let endpoint = URL(string: "http://127.0.0.1:8006/mcp")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [RecordingURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let transport = MemoryMCPHTTPTransport(endpoint: endpoint, session: session)
        var requestIndex = 0

        RecordingURLProtocol.requestHandler = { request in
            let body = try XCTUnwrap(request.httpBodyStreamData)
            let decoded = try JSONSerialization.jsonObject(with: body) as? [String: Any]
            requestIndex += 1

            switch requestIndex {
            case 1:
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-5"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":1,"result":{"protocolVersion":"2024-11-05","capabilities":{},"serverInfo":{"name":"memory","version":"3.2.4"}}}
                    """.utf8)
                )
            case 2:
                return (HTTPURLResponse(url: endpoint, statusCode: 202, httpVersion: nil, headerFields: ["mcp-session-id": "session-5"])!, Data())
            case 3:
                let params = try XCTUnwrap(decoded?["params"] as? [String: Any])
                XCTAssertEqual(params["name"] as? String, "list_entities")
                let arguments = try XCTUnwrap(params["arguments"] as? [String: Any])
                XCTAssertEqual(arguments["prefix"] as? String, "agent")
                return (
                    HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: ["mcp-session-id": "session-5"])!,
                    Data("""
                    {"jsonrpc":"2.0","id":3,"result":{"structuredContent":{"result":[{"name":"agentmemory","display_name":"AgentMemory","type":"unknown","event_count":50,"last_event_date":"2026-06-19T22:45:00+10:00"},{"name":"agent-chat","display_name":"Agent Chat","type":"service","event_count":0,"last_event_date":null}]}}}
                    """.utf8)
                )
            default:
                XCTFail("Unexpected request \(requestIndex)")
                return (HTTPURLResponse(url: endpoint, statusCode: 500, httpVersion: nil, headerFields: nil)!, Data())
            }
        }

        let entities = try await transport.listEntities(prefix: "agent")

        XCTAssertEqual(entities, [
            MemoryMCPEntitySummary(name: "agentmemory", displayName: "AgentMemory", type: "unknown", eventCount: 50, lastEventDate: "2026-06-19T22:45:00+10:00"),
            MemoryMCPEntitySummary(name: "agent-chat", displayName: "Agent Chat", type: "service", eventCount: 0, lastEventDate: nil)
        ])
    }

    func testTransportThrowsForNonSuccessStatus() async {
        let endpoint = URL(string: "http://127.0.0.1:8006/mcp")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [RecordingURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let transport = MemoryMCPHTTPTransport(endpoint: endpoint, session: session)

        RecordingURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(url: endpoint, statusCode: 500, httpVersion: nil, headerFields: nil)!, Data("bad".utf8))
        }

        await XCTAssertThrowsErrorAsync(
            try await transport.recordEvent(
                MemoryMCPRecordEventPayload(agent: "CODEX", content: "content", entities: [], tags: [])
            )
        )
    }
}

private final class RecordingURLProtocol: URLProtocol {
    nonisolated(unsafe) static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        guard let handler = Self.requestHandler else {
            client?.urlProtocol(self, didFailWithError: URLError(.badServerResponse))
            return
        }

        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}

private extension URLRequest {
    var httpBodyStreamData: Data? {
        guard let stream = httpBodyStream else {
            return httpBody
        }

        stream.open()
        defer { stream.close() }

        var data = Data()
        let bufferSize = 1024
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)
        defer { buffer.deallocate() }

        while stream.hasBytesAvailable {
            let count = stream.read(buffer, maxLength: bufferSize)
            if count <= 0 { break }
            data.append(buffer, count: count)
        }

        return data
    }
}

private func XCTAssertThrowsErrorAsync(
    _ expression: @autoclosure () async throws -> Void,
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    do {
        try await expression()
        XCTFail("Expected error", file: file, line: line)
    } catch {
        // Expected.
    }
}
