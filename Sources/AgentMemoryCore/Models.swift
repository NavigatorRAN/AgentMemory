import Foundation

public enum SourceType: String, Codable, CaseIterable, Sendable {
    case url
    case video
    case pdf
    case image
    case text
    case codeOrLog
    case emailOrCalendar
    case folder
    case mixedBatch
    case unknown
}

public enum MemoryOutcome: String, Codable, CaseIterable, Sendable {
    case event
    case entity
    case link
    case decision
    case gotcha
    case task
    case reference
}

public enum QueueStatus: String, Codable, CaseIterable, Sendable {
    case queued
    case classifying
    case extracting
    case analyzing
    case writingMemory
    case exportingToRAG
    case complete
    case needsReview
    case failed
    case skipped
    case paused
}

public struct CaptureItem: Identifiable, Codable, Equatable, Sendable {
    public var id: UUID
    public var displayName: String
    public var rawInput: String
    public var createdAt: Date
    public var sourceType: SourceType
    public var status: QueueStatus
    public var proposedOutcomes: [MemoryOutcome]
    public var confidence: Double
    public var failureReason: String?

    public init(
        id: UUID = UUID(),
        displayName: String,
        rawInput: String,
        createdAt: Date = Date(),
        sourceType: SourceType = .unknown,
        status: QueueStatus = .queued,
        proposedOutcomes: [MemoryOutcome] = [],
        confidence: Double = 0,
        failureReason: String? = nil
    ) {
        self.id = id
        self.displayName = displayName
        self.rawInput = rawInput
        self.createdAt = createdAt
        self.sourceType = sourceType
        self.status = status
        self.proposedOutcomes = proposedOutcomes
        self.confidence = confidence
        self.failureReason = failureReason
    }
}

public enum ProcessingAction: String, Codable, Sendable {
    case autoWriteMemory
    case needsReview
    case archiveOnly
    case exportToRAG
}

public struct IngestionRule: Identifiable, Codable, Equatable, Sendable {
    public var id: UUID
    public var name: String
    public var sourceType: SourceType
    public var matchText: String?
    public var workspace: String
    public var actions: [ProcessingAction]

    public init(
        id: UUID = UUID(),
        name: String,
        sourceType: SourceType,
        matchText: String? = nil,
        workspace: String,
        actions: [ProcessingAction]
    ) {
        self.id = id
        self.name = name
        self.sourceType = sourceType
        self.matchText = matchText
        self.workspace = workspace
        self.actions = actions
    }
}

public struct RoutingDecision: Equatable, Sendable {
    public var workspace: String
    public var actions: [ProcessingAction]
    public var matchedRuleName: String?
}

public extension CaptureItem {
    var canAutoWrite: Bool {
        confidence >= 0.85
            && !proposedOutcomes.isEmpty
            && !proposedOutcomes.contains(.link)
    }
}
