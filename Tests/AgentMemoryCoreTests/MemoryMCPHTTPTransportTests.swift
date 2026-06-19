import XCTest
@testable import AgentMemoryCore

final class MemoryMCPHTTPTransportTests: XCTestCase {
    override func tearDown() {
        RecordingURLProtocol.requestHandler = nil
        super.tearDown()
    }

    func testTransportPostsRecordEventPayload() async throws {
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

        RecordingURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url, endpoint)
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
            let body = try XCTUnwrap(request.httpBodyStreamData)
            let decoded = try JSONDecoder.agentMemory.decode(MemoryMCPHTTPTransport.RecordEventRequest.self, from: body)
            XCTAssertEqual(decoded.tool, "record_event")
            XCTAssertEqual(decoded.payload, payload)
            return (HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: nil)!, Data())
        }

        try await transport.recordEvent(payload)
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
