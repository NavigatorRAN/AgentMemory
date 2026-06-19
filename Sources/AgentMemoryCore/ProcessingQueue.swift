import Foundation

public actor ProcessingQueue {
    public private(set) var items: [CaptureItem]

    private let sourceClassifier: SourceClassifier
    private let outcomeClassifier: OutcomeClassifier
    private let ruleEngine: RuleEngine
    private let memoryWriter: MemoryWriting

    public init(
        items: [CaptureItem] = [],
        sourceClassifier: SourceClassifier,
        outcomeClassifier: OutcomeClassifier,
        ruleEngine: RuleEngine,
        memoryWriter: MemoryWriting
    ) {
        self.items = items
        self.sourceClassifier = sourceClassifier
        self.outcomeClassifier = outcomeClassifier
        self.ruleEngine = ruleEngine
        self.memoryWriter = memoryWriter
    }

    public func enqueue(rawInput: String, displayName: String) {
        items.append(CaptureItem(displayName: displayName, rawInput: rawInput))
    }

    public func processNext() async {
        guard let index = items.firstIndex(where: { $0.status == .queued }) else {
            return
        }

        items[index].markProcessingAttempt()
        items[index].status = .classifying
        items[index].sourceType = sourceClassifier.classify(rawInput: items[index].rawInput)

        items[index].status = .analyzing
        items[index].proposedOutcomes = outcomeClassifier.classify(text: items[index].rawInput)
        items[index].confidence = confidence(for: items[index])

        let decision = ruleEngine.route(item: items[index])

        if items[index].canAutoWrite || decision.actions.contains(.autoWriteMemory) {
            items[index].status = .writingMemory
            do {
                try await memoryWriter.write(item: items[index])
                items[index].status = .complete
            } catch {
                items[index].status = .failed
                items[index].failureReason = "Memory write failed: \(error)"
            }
        } else {
            items[index].status = .needsReview
        }
    }

    public func pauseAll() {
        for index in items.indices where items[index].status == .queued {
            items[index].status = .paused
        }
    }

    public func resumePaused() {
        for index in items.indices where items[index].status == .paused {
            items[index].status = .queued
        }
    }

    public func snapshotItems() -> [CaptureItem] {
        items
    }

    private func confidence(for item: CaptureItem) -> Double {
        if item.proposedOutcomes.contains(.decision) || item.proposedOutcomes.contains(.gotcha) {
            return 0.9
        }

        if item.sourceType == .unknown {
            return 0.4
        }

        return 0.72
    }
}
