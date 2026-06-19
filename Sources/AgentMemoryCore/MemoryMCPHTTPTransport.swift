import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct MemoryMCPHTTPTransport: MemoryMCPTransporting {
    public struct RecordEventRequest: Codable, Equatable, Sendable {
        public var tool: String
        public var payload: MemoryMCPRecordEventPayload

        public init(tool: String, payload: MemoryMCPRecordEventPayload) {
            self.tool = tool
            self.payload = payload
        }
    }

    public enum TransportError: Error, Equatable {
        case nonHTTPResponse
        case unsuccessfulStatus(Int)
    }

    private let endpoint: URL
    private let session: URLSession

    public init(endpoint: URL, session: URLSession = .shared) {
        self.endpoint = endpoint
        self.session = session
    }

    public func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws {
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder.agentMemory.encode(
            RecordEventRequest(tool: "record_event", payload: payload)
        )

        let (_, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw TransportError.nonHTTPResponse
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw TransportError.unsuccessfulStatus(httpResponse.statusCode)
        }
    }
}
