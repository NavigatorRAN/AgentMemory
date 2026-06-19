import Foundation

public enum MemoryWriterResolver {
    public enum ResolverError: Error, Equatable {
        case invalidEndpoint
    }

    public static func writer(
        config: AgentMemoryConfig,
        archivedSources: [ArchivedSource],
        transportFactory: @escaping @Sendable (URL) -> MemoryMCPTransporting = { MemoryMCPHTTPTransport(endpoint: $0) }
    ) throws -> MemoryWriting {
        guard config.liveMemoryWritesEnabled else {
            return MockMemoryWriter()
        }

        guard let endpoint = config.memoryMCPEndpointURL else {
            throw ResolverError.invalidEndpoint
        }

        return MemoryMCPWriter(
            payloadBuilder: MemoryMCPPayloadBuilder(agent: config.resolvedAgentName),
            transport: transportFactory(endpoint),
            archivedSourceResolver: { item in
                archivedSources.first { $0.itemID == item.id }
            }
        )
    }
}
