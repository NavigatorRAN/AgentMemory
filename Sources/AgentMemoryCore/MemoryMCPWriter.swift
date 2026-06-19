import Foundation

public protocol MemoryMCPTransporting: Sendable {
    func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws
}

public struct MemoryMCPWriter: MemoryWriting {
    private let payloadBuilder: MemoryMCPPayloadBuilder
    private let transport: MemoryMCPTransporting
    private let archivedSourceResolver: @Sendable (CaptureItem) -> ArchivedSource?

    public init(
        payloadBuilder: MemoryMCPPayloadBuilder,
        transport: MemoryMCPTransporting,
        archivedSourceResolver: @escaping @Sendable (CaptureItem) -> ArchivedSource?
    ) {
        self.payloadBuilder = payloadBuilder
        self.transport = transport
        self.archivedSourceResolver = archivedSourceResolver
    }

    public func write(item: CaptureItem) async throws {
        let payload = payloadBuilder.recordEventPayload(
            for: item,
            archivedSource: archivedSourceResolver(item)
        )
        try await transport.recordEvent(payload)
    }
}
