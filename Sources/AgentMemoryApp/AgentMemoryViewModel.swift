import AgentMemoryCore
import Foundation
import Observation

@MainActor
@Observable
final class AgentMemoryViewModel {
    var snapshot: AgentMemorySnapshot
    var captureText: String = ""
    var captureTitle: String = ""
    var statusMessage: String = "Ready"

    private let store: AgentMemoryDiskStore
    private let processingService: CaptureProcessingService

    init(
        store: AgentMemoryDiskStore,
        initialSnapshot: AgentMemorySnapshot = AgentMemorySnapshot(),
        processingService: CaptureProcessingService? = nil
    ) {
        self.store = store
        self.snapshot = initialSnapshot
        self.processingService = processingService ?? CaptureProcessingService(
            archive: SourceArchive(root: store.sourceArchiveRoot),
            memoryWriter: MockMemoryWriter()
        )
    }

    convenience init() {
        let root = (try? AgentMemoryDiskStore.defaultAppSupportRoot()) ?? FileManager.default.temporaryDirectory.appendingPathComponent("AgentMemory", isDirectory: true)
        self.init(store: AgentMemoryDiskStore(root: root), initialSnapshot: AgentMemoryViewModel.sampleSnapshot)
        load()
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
            snapshot = await processingService.processNext(in: snapshot)
            statusMessage = "Processed next queued item and archived source."
            save()
        }
    }

    func processAllQueued() {
        Task {
            snapshot = await processingService.processAllQueued(in: snapshot)
            statusMessage = "Processed queued captures and archived sources."
            save()
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
