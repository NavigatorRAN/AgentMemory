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
        save()
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
        save()
    }

    func processNext() {
        Task {
            do {
                snapshot = try await makeProcessingService().processNext(in: snapshot)
                statusMessage = config.liveMemoryWritesEnabled
                    ? "Processed next queued item with live Memory MCP writes enabled."
                    : "Processed next queued item with mock memory writes."
                save()
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
                save()
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
                save()
            } catch {
                statusMessage = "Batch setup failed: \(error.localizedDescription)"
            }
        }
    }

    func save() {
        do {
            try store.save(snapshot)
            statusMessage = "Saved local state."
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
