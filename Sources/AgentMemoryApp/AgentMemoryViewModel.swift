import AgentMemoryCore
import Foundation
import Observation

enum CaptureSidebarFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case review = "Review"

    var id: String { rawValue }
}

@MainActor
@Observable
final class AgentMemoryViewModel {
    var snapshot: AgentMemorySnapshot
    var config: AgentMemoryConfig
    var captureText: String = ""
    var captureTitle: String = ""
    var selectedItemID: CaptureItem.ID?
    var sidebarFilter: CaptureSidebarFilter = .all
    var sidebarSearchQuery: String = "" {
        didSet {
            normalizeSelection(preferReview: sidebarFilter == .review)
        }
    }
    var memorySearchQuery: String = ""
    var memorySearchResults: [MemoryMCPSearchEvent] = []
    var memoryEntityDetail: MemoryMCPEntityDetail?
    var memoryEntityResults: [MemoryMCPEntitySummary] = []
    var selectedMemoryGraphNodeID: String?
    var statusMessage: String = "Ready"

    private let store: AgentMemoryDiskStore
    private let processingServiceOverride: CaptureProcessingService?
    private let retryPolicy = RetryPolicy()

    init(
        store: AgentMemoryDiskStore,
        initialSnapshot: AgentMemorySnapshot = AgentMemorySnapshot(),
        initialConfig: AgentMemoryConfig = AgentMemoryConfig(),
        processingService: CaptureProcessingService? = nil
    ) {
        self.store = store
        self.snapshot = initialSnapshot
        self.config = initialConfig
        self.processingServiceOverride = processingService
    }

    convenience init() {
        let root = (try? AgentMemoryDiskStore.defaultAppSupportRoot()) ?? FileManager.default.temporaryDirectory.appendingPathComponent("AgentMemory", isDirectory: true)
        self.init(store: AgentMemoryDiskStore(root: root), initialSnapshot: AgentMemoryViewModel.sampleSnapshot)
        load()
        loadConfig()
        if snapshot.items.isEmpty {
            snapshot = AgentMemoryViewModel.sampleSnapshot
            save()
        }
        normalizeSelection(preferReview: true)
    }

    var brief: MorningBrief {
        MorningBriefBuilder().build(from: snapshot.items)
    }

    var reviewItems: [CaptureItem] {
        snapshot.items.filter { $0.status == .needsReview }
    }

    var sidebarItems: [CaptureItem] {
        let filteredItems: [CaptureItem]
        switch sidebarFilter {
        case .all:
            filteredItems = snapshot.items
        case .review:
            filteredItems = reviewItems
        }

        return CaptureSearch().filter(filteredItems, query: sidebarSearchQuery)
    }

    var selectedItem: CaptureItem? {
        guard let selectedItemID else {
            return snapshot.items.first
        }

        return snapshot.items.first { $0.id == selectedItemID }
    }

    var selectedArchivedSource: ArchivedSource? {
        guard let selectedItem else {
            return nil
        }

        return snapshot.archivedSources.first { $0.itemID == selectedItem.id }
    }

    var selectedArchivedSourcePreview: String {
        guard let selectedArchivedSource else {
            return "No archived source preview available."
        }

        return ArchivedSourcePreviewReader().preview(for: selectedArchivedSource)
    }

    var selectedReviewPayloadPreview: String {
        guard let item = selectedItem else {
            return "Select a capture to review."
        }

        let archivedSource = snapshot.archivedSources.first { $0.itemID == item.id }
        let payload = MemoryMCPPayloadBuilder(agent: config.resolvedAgentName)
            .recordEventPayload(for: item, archivedSource: archivedSource)

        return [
            "Agent: \(payload.agent)",
            "Entities: \(payload.entities.joined(separator: ", "))",
            "Tags: \(payload.tags.joined(separator: ", "))",
            "",
            payload.content
        ].joined(separator: "\n")
    }

    var selectedReviewExplanations: [String] {
        guard let selectedItem else {
            return []
        }

        return ReviewExplanationBuilder().explanations(for: selectedItem)
    }

    var canRetrySelectedItem: Bool {
        guard let selectedItem else {
            return false
        }

        return retryPolicy.canRetry(selectedItem)
    }

    var canExportSelectedItemToRAG: Bool {
        selectedItem != nil && selectedItem?.ragExport == nil && config.ragExportEnabled
    }

    var canExportCompletedItemsToRAG: Bool {
        config.ragExportEnabled && snapshot.items.contains { $0.status == .complete && $0.ragExport == nil }
    }

    var canTestRAGConnection: Bool {
        config.ragSSHQueueConfig() != nil
    }

    var canRefreshRAGJobStatuses: Bool {
        config.ragSSHQueueConfig() != nil && snapshot.items.contains { $0.ragExport?.jobID != nil }
    }

    var canSearchMemoryMCP: Bool {
        config.memoryMCPEndpointURL != nil
    }

    var memoryGraph: MemoryMCPGraph {
        MemoryMCPGraphBuilder().build(
            events: memorySearchResults,
            entityDetail: memoryEntityDetail,
            entitySummaries: memoryEntityResults
        )
    }

    var memoryGraphScene: MemoryMCPGraphScene {
        MemoryMCPGraphSceneBuilder().build(from: focusedMemoryGraph)
    }

    var focusedMemoryGraph: MemoryMCPGraph {
        MemoryMCPGraphFocusBuilder().focusedGraph(
            from: memoryGraph,
            selectedNodeID: selectedMemoryGraphNodeID
        )
    }

    func focusMemoryGraphNode(_ nodeID: String) {
        selectedMemoryGraphNodeID = nodeID
    }

    func clearMemoryGraphFocus() {
        selectedMemoryGraphNodeID = nil
    }

    func addCapture() {
        let rawInput = captureText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !rawInput.isEmpty else {
            statusMessage = "Add capture text or a URL first."
            return
        }

        let title = captureTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        var item = CaptureStackBuilder().items(fromTextStack: rawInput).first ?? CaptureItem(displayName: suggestedTitle(for: rawInput), rawInput: rawInput)
        if !title.isEmpty {
            item.displayName = title
        }

        snapshot.items.append(item)
        captureText = ""
        captureTitle = ""
        statusMessage = "Added \(item.displayName)."
        persistSnapshot()
        normalizeSelection(preferReview: false)
    }

    func addTextStack(_ text: String) {
        let items = CaptureStackBuilder().items(fromTextStack: text)
        addBatch(items, sourceLabel: "text stack")
    }

    func addFileURLs(_ urls: [URL]) {
        let items = CaptureStackBuilder().items(fromFileURLs: urls)
        addBatch(items, sourceLabel: "file stack")
    }

    private func addBatch(_ items: [CaptureItem], sourceLabel: String) {
        guard !items.isEmpty else {
            statusMessage = "No captures found in \(sourceLabel)."
            return
        }

        snapshot.items.append(contentsOf: items)
        statusMessage = "Added \(items.count) captures from \(sourceLabel)."
        persistSnapshot()
        normalizeSelection(preferReview: false)
    }

    func processNext() {
        Task {
            do {
                snapshot = try await makeProcessingService().processNext(in: snapshot)
                statusMessage = config.liveMemoryWritesEnabled
                    ? "Processed next queued item with live Memory MCP writes enabled."
                    : "Processed next queued item with mock memory writes."
                persistSnapshot()
                normalizeSelection(preferReview: true)
            } catch {
                statusMessage = "Processing setup failed: \(error.localizedDescription)"
            }
        }
    }

    func processAllQueued() {
        Task {
            do {
                snapshot = try await makeProcessingService().processAllQueued(in: snapshot)
                statusMessage = config.liveMemoryWritesEnabled
                    ? "Processed queued captures with live Memory MCP writes enabled."
                    : "Processed queued captures with mock memory writes."
                persistSnapshot()
            } catch {
                statusMessage = "Processing setup failed: \(error.localizedDescription)"
            }
        }
    }

    func runQueuedBatch() {
        Task {
            do {
                snapshot = try await makeProcessingService().processQueuedBatch(in: snapshot)
                if let latestRun = snapshot.batchRuns.last {
                    statusMessage = "Batch run finished: \(latestRun.summary)"
                } else {
                    statusMessage = "Batch run finished."
                }
                persistSnapshot()
                normalizeSelection(preferReview: true)
            } catch {
                statusMessage = "Batch setup failed: \(error.localizedDescription)"
            }
        }
    }

    func fetchQueuedWebPages() {
        Task {
            let service = WebPageIngestionService(
                archive: SourceArchive(root: store.sourceArchiveRoot),
                fetcher: URLSessionWebPageFetcher()
            )
            snapshot = await service.fetchQueuedWebPages(in: snapshot)
            let reviewCount = snapshot.items.filter { $0.status == .needsReview && $0.customTags.contains("web") }.count
            statusMessage = "Fetched web pages. \(reviewCount) web captures are ready for review."
            persistSnapshot()
            normalizeSelection(preferReview: true)
        }
    }

    func fetchQueuedYouTubeTranscripts() {
        Task {
            let service = YouTubeTranscriptIngestionService(
                archive: SourceArchive(root: store.sourceArchiveRoot),
                fetcher: URLSessionYouTubeTranscriptFetcher()
            )
            snapshot = await service.fetchQueuedTranscripts(in: snapshot)
            let reviewCount = snapshot.items.filter { $0.status == .needsReview && $0.customTags.contains("youtube") }.count
            statusMessage = "Fetched YouTube transcripts. \(reviewCount) YouTube captures are ready for review."
            persistSnapshot()
            normalizeSelection(preferReview: true)
        }
    }

    func exportSelectedItemToRAG() {
        guard let selectedItem else {
            statusMessage = "Select a capture to export to RAG."
            return
        }

        guard selectedItem.ragExport == nil else {
            statusMessage = "\(selectedItem.displayName) is already exported to RAG."
            return
        }

        Task {
            do {
                guard let ragConfig = config.ragSSHQueueConfig() else {
                    statusMessage = "RAG export settings are incomplete."
                    return
                }

                let collection = config.resolvedRAGCollection
                let document = RAGQueueExportBuilder(defaultCollection: collection).document(for: selectedItem)
                let writer = RAGQueueWriter(
                    transport: RAGSSHQueueTransport(
                        config: ragConfig
                    )
                )
                let jobID = try await writer.enqueue(document)
                if let index = snapshot.items.firstIndex(where: { $0.id == selectedItem.id }) {
                    snapshot.items[index].ragExport = RAGExportStatus(
                        jobID: jobID,
                        exportedAt: Date(),
                        collection: collection
                    )
                    persistSnapshot()
                }
                statusMessage = "Exported \(selectedItem.displayName) to RAG queue as job #\(jobID)."
            } catch {
                statusMessage = "RAG export failed: \(error.localizedDescription)"
            }
        }
    }

    func testRAGConnection() {
        guard let ragConfig = config.ragSSHQueueConfig() else {
            statusMessage = "RAG export settings are incomplete."
            return
        }

        Task {
            do {
                let check = try await RAGSSHQueueTransport(config: ragConfig).checkConnection()
                statusMessage = "RAG connection OK: staging \(check.stagingDirectory), ingest \(check.ingestDirectory)."
            } catch {
                statusMessage = "RAG connection failed: \(error.localizedDescription)"
            }
        }
    }

    func exportCompletedItemsToRAG() {
        guard let ragConfig = config.ragSSHQueueConfig() else {
            statusMessage = "RAG export settings are incomplete."
            return
        }

        Task {
            do {
                let startedAt = Date()
                let exporter = RAGBatchExporter(
                    defaultCollection: config.resolvedRAGCollection,
                    transport: RAGSSHQueueTransport(config: ragConfig)
                )
                let result = try await exporter.exportCompletedItems(in: snapshot.items)
                let summary = "Exported \(result.exportedCount) completed captures to RAG. \(result.skippedCount) skipped, \(result.failedCount) failed."
                snapshot.items = result.items
                snapshot.ragExportRuns.append(
                    RAGExportRun(
                        startedAt: startedAt,
                        completedAt: Date(),
                        exportedCount: result.exportedCount,
                        skippedCount: result.skippedCount,
                        failedCount: result.failedCount,
                        failures: result.failures,
                        summary: summary
                    )
                )
                persistSnapshot()
                statusMessage = summary
                normalizeSelection(preferReview: sidebarFilter == .review)
            } catch {
                statusMessage = "RAG batch export failed: \(error.localizedDescription)"
            }
        }
    }

    func refreshRAGJobStatuses() {
        guard let ragConfig = config.ragSSHQueueConfig() else {
            statusMessage = "RAG export settings are incomplete."
            return
        }

        let jobIDs = snapshot.items.compactMap { $0.ragExport?.jobID }
        guard !jobIDs.isEmpty else {
            statusMessage = "No RAG jobs recorded yet."
            return
        }

        Task {
            do {
                let statuses = try await RAGSSHQueueTransport(config: ragConfig).fetchJobStatuses(jobIDs: jobIDs)
                let refreshedAt = Date()
                let statusesByID = Dictionary(uniqueKeysWithValues: statuses.map { ($0.id, $0) })
                for index in snapshot.items.indices {
                    guard let jobID = snapshot.items[index].ragExport?.jobID,
                          let status = statusesByID[jobID]
                    else {
                        continue
                    }

                    snapshot.items[index].ragExport?.remoteStatus = status.status
                    snapshot.items[index].ragExport?.remoteError = status.error
                    snapshot.items[index].ragExport?.attempts = status.attempts
                    snapshot.items[index].ragExport?.chunksUpserted = status.chunksUpserted
                    snapshot.items[index].ragExport?.docID = status.docID
                    snapshot.items[index].ragExport?.lastStatusRefreshAt = refreshedAt
                }
                persistSnapshot()
                let counts = Dictionary(grouping: statuses, by: \.status)
                    .mapValues(\.count)
                    .sorted { $0.key < $1.key }
                    .map { "\($0.key): \($0.value)" }
                    .joined(separator: ", ")
                statusMessage = counts.isEmpty ? "No matching RAG jobs found." : "RAG queue status: \(counts)."
            } catch {
                statusMessage = "RAG status refresh failed: \(error.localizedDescription)"
            }
        }
    }

    func approveSelectedReviewItem() {
        guard let selectedItemID,
              let index = snapshot.items.firstIndex(where: { $0.id == selectedItemID })
        else {
            statusMessage = "Select a review item first."
            return
        }

        Task {
            do {
                snapshot.items[index].status = .writingMemory
                persistSnapshot()
                let writer = try MemoryWriterResolver.writer(
                    config: config,
                    archivedSources: snapshot.archivedSources
                )
                try await writer.write(item: snapshot.items[index])
                snapshot.items[index].status = .complete
                snapshot.items[index].failureReason = nil
                statusMessage = "Approved and wrote \(snapshot.items[index].displayName)."
                persistSnapshot()
                selectNextReviewItem()
            } catch {
                snapshot.items[index].status = .failed
                snapshot.items[index].failureReason = "Review write failed: \(error.localizedDescription)"
                statusMessage = "Review write failed: \(error.localizedDescription)"
                persistSnapshot()
            }
        }
    }

    func skipSelectedReviewItem() {
        guard let selectedItemID,
              let index = snapshot.items.firstIndex(where: { $0.id == selectedItemID })
        else {
            statusMessage = "Select a review item first."
            return
        }

        snapshot.items[index].status = .skipped
        snapshot.items[index].failureReason = nil
        statusMessage = "Skipped \(snapshot.items[index].displayName)."
        persistSnapshot()
        selectNextReviewItem()
    }

    func retrySelectedItem() {
        guard let selectedItemID,
              let index = snapshot.items.firstIndex(where: { $0.id == selectedItemID })
        else {
            statusMessage = "Select an item to retry."
            return
        }

        guard retryPolicy.canRetry(snapshot.items[index]) else {
            statusMessage = retryPolicy.exhaustedReason(for: snapshot.items[index]) ?? "\(snapshot.items[index].displayName) is not retryable."
            return
        }

        snapshot.items[index].status = .queued
        snapshot.items[index].failureReason = nil
        statusMessage = "Queued \(snapshot.items[index].displayName) for retry."
        persistSnapshot()
        normalizeSelection(preferReview: true)
    }

    func retryAllFailedItems() {
        var retryCount = 0
        var exhaustedCount = 0
        for index in snapshot.items.indices where snapshot.items[index].status == .failed {
            if retryPolicy.canRetry(snapshot.items[index]) {
                snapshot.items[index].status = .queued
                snapshot.items[index].failureReason = nil
                retryCount += 1
            } else {
                exhaustedCount += 1
            }
        }

        if retryCount == 0 && exhaustedCount == 0 {
            statusMessage = "No failed captures to retry."
        } else if exhaustedCount > 0 {
            statusMessage = "Queued \(retryCount) failed captures for retry. \(exhaustedCount) reached the retry limit."
        } else {
            statusMessage = "Queued \(retryCount) failed captures for retry."
        }

        persistSnapshot()
        normalizeSelection(preferReview: true)
    }

    func selectNextReviewItem() {
        selectedItemID = reviewItems.first?.id ?? snapshot.items.first?.id
    }

    func setSidebarFilter(_ filter: CaptureSidebarFilter) {
        sidebarFilter = filter
        normalizeSelection(preferReview: filter == .review)
    }

    func selectedItemTitleBindingValue() -> String {
        selectedItem?.displayName ?? ""
    }

    func updateSelectedItemTitle(_ title: String) {
        guard let selectedItemID,
              let index = snapshot.items.firstIndex(where: { $0.id == selectedItemID })
        else {
            return
        }

        snapshot.items[index].displayName = title
    }

    func selectedItemRawInputBindingValue() -> String {
        selectedItem?.rawInput ?? ""
    }

    func updateSelectedItemRawInput(_ rawInput: String) {
        guard let selectedItemID,
              let index = snapshot.items.firstIndex(where: { $0.id == selectedItemID })
        else {
            return
        }

        snapshot.items[index].rawInput = rawInput
    }

    func selectedItemHasOutcome(_ outcome: MemoryOutcome) -> Bool {
        selectedItem?.proposedOutcomes.contains(outcome) ?? false
    }

    func setSelectedItemOutcome(_ outcome: MemoryOutcome, isEnabled: Bool) {
        guard let selectedItemID,
              let index = snapshot.items.firstIndex(where: { $0.id == selectedItemID })
        else {
            return
        }

        if isEnabled {
            if !snapshot.items[index].proposedOutcomes.contains(outcome) {
                snapshot.items[index].proposedOutcomes.append(outcome)
            }
        } else {
            snapshot.items[index].proposedOutcomes.removeAll { $0 == outcome }
        }
    }

    func selectedItemCustomTagsBindingValue() -> String {
        selectedItem?.customTags.joined(separator: ", ") ?? ""
    }

    func updateSelectedItemCustomTags(_ tagsText: String) {
        guard let selectedItemID,
              let index = snapshot.items.firstIndex(where: { $0.id == selectedItemID })
        else {
            return
        }

        snapshot.items[index].customTags = tagsText
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }

    func saveSelectedReviewEdits() {
        guard let selectedItem else {
            statusMessage = "Select a review item first."
            return
        }

        statusMessage = "Saved review edits for \(selectedItem.displayName)."
        persistSnapshot()
    }

    func save() {
        persistSnapshot(successMessage: "Saved local state.")
    }

    private func persistSnapshot(successMessage: String? = nil) {
        do {
            try store.save(snapshot)
            if let successMessage {
                statusMessage = successMessage
            }
        } catch {
            statusMessage = "Save failed: \(error.localizedDescription)"
        }
    }

    func load() {
        do {
            snapshot = try store.load()
            statusMessage = "Loaded local state."
            normalizeSelection(preferReview: true)
        } catch {
            statusMessage = "Load failed: \(error.localizedDescription)"
        }
    }

    func saveConfig() {
        do {
            try store.saveConfig(config)
            statusMessage = "Saved Memory MCP settings."
        } catch {
            statusMessage = "Settings save failed: \(error.localizedDescription)"
        }
    }

    func loadConfig() {
        do {
            config = try store.loadConfig()
        } catch {
            statusMessage = "Settings load failed: \(error.localizedDescription)"
        }
    }

    func testMemoryMCPConnection() {
        Task {
            do {
                guard config.liveMemoryWritesEnabled else {
                    statusMessage = "Enable live Memory MCP writes before sending a test event."
                    return
                }

                guard let endpoint = config.memoryMCPEndpointURL else {
                    statusMessage = "Enter a valid http or https Memory MCP endpoint."
                    return
                }

                let payload = MemoryMCPRecordEventPayload(
                    agent: config.resolvedAgentName,
                    content: "AgentMemory settings test write from macOS app.",
                    entities: ["agentmemory", "memory-mcp-desktop-app"],
                    tags: ["agentmemory", "settings", "test-write"]
                )
                try await MemoryMCPHTTPTransport(endpoint: endpoint).recordEvent(payload)
                statusMessage = "Memory MCP test write sent."
            } catch {
                statusMessage = "Memory MCP test write failed: \(error.localizedDescription)"
            }
        }
    }

    func searchMemoryMCP() {
        let query = memorySearchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else {
            statusMessage = "Enter a Memory MCP search query."
            memorySearchResults = []
            memoryEntityDetail = nil
            memoryEntityResults = []
            selectedMemoryGraphNodeID = nil
            return
        }

        guard let endpoint = config.memoryMCPEndpointURL else {
            statusMessage = "Enter a valid http or https Memory MCP endpoint."
            memorySearchResults = []
            memoryEntityDetail = nil
            memoryEntityResults = []
            selectedMemoryGraphNodeID = nil
            return
        }

        Task {
            do {
                let results = try await MemoryMCPHTTPTransport(endpoint: endpoint).searchEvents(query: query, limit: 10)
                memorySearchResults = results
                selectedMemoryGraphNodeID = nil
                memoryEntityDetail = nil
                memoryEntityResults = []
                statusMessage = results.isEmpty
                    ? "Memory MCP search found no events."
                    : "Memory MCP search found \(results.count) events."
            } catch {
                memorySearchResults = []
                memoryEntityDetail = nil
                memoryEntityResults = []
                selectedMemoryGraphNodeID = nil
                statusMessage = "Memory MCP search failed: \(error.localizedDescription)"
            }
        }
    }

    func recallMemoryMCPEntity() {
        let entity = memorySearchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !entity.isEmpty else {
            statusMessage = "Enter a Memory MCP entity name."
            memorySearchResults = []
            memoryEntityDetail = nil
            memoryEntityResults = []
            selectedMemoryGraphNodeID = nil
            return
        }

        guard let endpoint = config.memoryMCPEndpointURL else {
            statusMessage = "Enter a valid http or https Memory MCP endpoint."
            memorySearchResults = []
            memoryEntityDetail = nil
            memoryEntityResults = []
            selectedMemoryGraphNodeID = nil
            return
        }

        Task {
            do {
                let results = try await MemoryMCPHTTPTransport(endpoint: endpoint).recallEvents(forEntity: entity, limit: 10)
                memorySearchResults = results
                selectedMemoryGraphNodeID = nil
                memoryEntityDetail = nil
                memoryEntityResults = []
                statusMessage = results.isEmpty
                    ? "Memory MCP recall found no events for \(entity)."
                    : "Memory MCP recall found \(results.count) events for \(entity)."
            } catch {
                memorySearchResults = []
                memoryEntityDetail = nil
                memoryEntityResults = []
                selectedMemoryGraphNodeID = nil
                statusMessage = "Memory MCP recall failed: \(error.localizedDescription)"
            }
        }
    }

    func loadMemoryMCPEntityDetail() {
        let entity = memorySearchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !entity.isEmpty else {
            statusMessage = "Enter a Memory MCP entity name."
            memorySearchResults = []
            memoryEntityDetail = nil
            memoryEntityResults = []
            selectedMemoryGraphNodeID = nil
            return
        }

        guard let endpoint = config.memoryMCPEndpointURL else {
            statusMessage = "Enter a valid http or https Memory MCP endpoint."
            memorySearchResults = []
            memoryEntityDetail = nil
            memoryEntityResults = []
            selectedMemoryGraphNodeID = nil
            return
        }

        Task {
            do {
                let detail = try await MemoryMCPHTTPTransport(endpoint: endpoint).getEntity(named: entity)
                memoryEntityDetail = detail
                selectedMemoryGraphNodeID = nil
                memoryEntityResults = []
                memorySearchResults = detail.recentEvents.map {
                    MemoryMCPSearchEvent(
                        id: $0.id,
                        eventDate: $0.eventDate,
                        recordedAt: $0.recordedAt,
                        entities: $0.entities,
                        tags: $0.tags,
                        agent: $0.agent,
                        content: $0.content ?? "Metadata-only recent event.",
                        path: $0.path
                    )
                }
                statusMessage = "Loaded Memory MCP entity \(detail.displayName)."
            } catch {
                memorySearchResults = []
                memoryEntityDetail = nil
                memoryEntityResults = []
                selectedMemoryGraphNodeID = nil
                statusMessage = "Memory MCP entity load failed: \(error.localizedDescription)"
            }
        }
    }

    func listMemoryMCPEntities() {
        let prefix = memorySearchQuery.trimmingCharacters(in: .whitespacesAndNewlines)

        guard let endpoint = config.memoryMCPEndpointURL else {
            statusMessage = "Enter a valid http or https Memory MCP endpoint."
            memorySearchResults = []
            memoryEntityDetail = nil
            memoryEntityResults = []
            selectedMemoryGraphNodeID = nil
            return
        }

        Task {
            do {
                let entities = try await MemoryMCPHTTPTransport(endpoint: endpoint).listEntities(prefix: prefix.isEmpty ? nil : prefix)
                memoryEntityResults = entities
                selectedMemoryGraphNodeID = nil
                memoryEntityDetail = nil
                memorySearchResults = []
                statusMessage = entities.isEmpty
                    ? "Memory MCP entity list found no matches."
                    : "Memory MCP entity list found \(entities.count) matches."
            } catch {
                memorySearchResults = []
                memoryEntityDetail = nil
                memoryEntityResults = []
                selectedMemoryGraphNodeID = nil
                statusMessage = "Memory MCP entity list failed: \(error.localizedDescription)"
            }
        }
    }

    private func makeProcessingService() throws -> CaptureProcessingService {
        if let processingServiceOverride {
            return processingServiceOverride
        }

        return CaptureProcessingService(
            archive: SourceArchive(root: store.sourceArchiveRoot),
            memoryWriter: try MemoryWriterResolver.writer(
                config: config,
                archivedSources: snapshot.archivedSources
            )
        )
    }

    private func normalizeSelection(preferReview: Bool) {
        if preferReview, let reviewItem = reviewItems.first {
            selectedItemID = reviewItem.id
            return
        }

        if let selectedItemID,
           snapshot.items.contains(where: { $0.id == selectedItemID }) {
            return
        }

        selectedItemID = snapshot.items.first?.id
    }

    private func suggestedTitle(for rawInput: String) -> String {
        if let url = URL(string: rawInput), let host = url.host {
            return host
        }

        return String(rawInput.prefix(40))
    }

    static var sampleSnapshot: AgentMemorySnapshot {
        AgentMemorySnapshot(
            items: [
                CaptureItem(
                    displayName: "WWDC workflow URL",
                    rawInput: "https://developer.apple.com/videos/play/wwdc2026/101",
                    sourceType: .video,
                    status: .complete,
                    proposedOutcomes: [.decision, .reference],
                    confidence: 0.9
                ),
                CaptureItem(
                    displayName: "Terminal failure log",
                    rawInput: "fatal error: Memory MCP unreachable",
                    sourceType: .codeOrLog,
                    status: .needsReview,
                    proposedOutcomes: [.gotcha, .reference],
                    confidence: 0.74
                ),
                CaptureItem(
                    displayName: "Mixed source stack",
                    rawInput: "/Users/matthewwarren/Desktop/research-stack",
                    sourceType: .mixedBatch,
                    status: .queued,
                    proposedOutcomes: [],
                    confidence: 0
                )
            ],
            rules: [
                IngestionRule(
                    name: "WWDC videos",
                    sourceType: .video,
                    matchText: "developer.apple.com/videos",
                    workspace: "WWDC26",
                    actions: [.autoWriteMemory, .exportToRAG]
                )
            ]
        )
    }
}
