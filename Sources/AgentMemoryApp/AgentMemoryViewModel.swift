import AgentMemoryCore
import Foundation
import Observation

@MainActor
@Observable
final class AgentMemoryViewModel {
    var snapshot: AgentMemorySnapshot
    var config: AgentMemoryConfig
    var captureText: String = ""
    var captureTitle: String = ""
    var selectedItemID: CaptureItem.ID?
    var statusMessage: String = "Ready"

    private let store: AgentMemoryDiskStore
    private let processingServiceOverride: CaptureProcessingService?

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
    }

    var brief: MorningBrief {
        MorningBriefBuilder().build(from: snapshot.items)
    }

    var reviewItems: [CaptureItem] {
        snapshot.items.filter { $0.status == .needsReview }
    }

    var selectedItem: CaptureItem? {
        guard let selectedItemID else {
            return snapshot.items.first
        }

        return snapshot.items.first { $0.id == selectedItemID }
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

    func addCapture() {
        let rawInput = captureText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !rawInput.isEmpty else {
            statusMessage = "Add capture text or a URL first."
            return
        }

        let title = captureTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        let displayName = title.isEmpty ? suggestedTitle(for: rawInput) : title
        snapshot.items.append(CaptureItem(displayName: displayName, rawInput: rawInput))
        captureText = ""
        captureTitle = ""
        statusMessage = "Added \(displayName)."
        persistSnapshot()
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
    }

    func processNext() {
        Task {
            do {
                snapshot = try await makeProcessingService().processNext(in: snapshot)
                statusMessage = config.liveMemoryWritesEnabled
                    ? "Processed next queued item with live Memory MCP writes enabled."
                    : "Processed next queued item with mock memory writes."
                persistSnapshot()
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
            } catch {
                statusMessage = "Batch setup failed: \(error.localizedDescription)"
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
