import Foundation

public struct AgentMemoryWikiMemorySyncResult: Equatable, Sendable {
    public var pages: [AgentMemoryWikiPage]
    public var syncedPages: [AgentMemoryWikiPage]
    public var failedPages: [AgentMemoryWikiPage]

    public init(
        pages: [AgentMemoryWikiPage],
        syncedPages: [AgentMemoryWikiPage],
        failedPages: [AgentMemoryWikiPage]
    ) {
        self.pages = pages
        self.syncedPages = syncedPages
        self.failedPages = failedPages
    }
}

public struct AgentMemoryWikiMemorySyncer: Sendable {
    private let payloadBuilder: MemoryMCPPayloadBuilder
    private let transport: MemoryMCPTransporting
    private let now: @Sendable () -> Date

    public init(
        payloadBuilder: MemoryMCPPayloadBuilder,
        transport: MemoryMCPTransporting,
        now: @escaping @Sendable () -> Date = Date.init
    ) {
        self.payloadBuilder = payloadBuilder
        self.transport = transport
        self.now = now
    }

    public func sync(pages: [AgentMemoryWikiPage]) async -> AgentMemoryWikiMemorySyncResult {
        var updatedPages: [AgentMemoryWikiPage] = []
        var syncedPages: [AgentMemoryWikiPage] = []
        var failedPages: [AgentMemoryWikiPage] = []

        for var page in pages {
            do {
                try await transport.recordEvent(payloadBuilder.recordEventPayload(for: page))
                page.lastMemoryMCPSyncAt = now()
                page.memoryMCPSyncError = nil
                syncedPages.append(page)
            } catch {
                page.memoryMCPSyncError = error.localizedDescription
                failedPages.append(page)
            }
            updatedPages.append(page)
        }

        return AgentMemoryWikiMemorySyncResult(
            pages: updatedPages,
            syncedPages: syncedPages,
            failedPages: failedPages
        )
    }
}
