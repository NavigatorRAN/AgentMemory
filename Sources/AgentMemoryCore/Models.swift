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

public struct ArchivedSource: Codable, Equatable, Sendable {
    public var itemID: UUID
    public var displayName: String
    public var archivedPath: String
    public var sourceType: SourceType
    public var createdAt: Date
    public var originalPath: String?
    public var byteSize: Int64?

    public init(
        itemID: UUID,
        displayName: String,
        archivedPath: String,
        sourceType: SourceType,
        createdAt: Date,
        originalPath: String? = nil,
        byteSize: Int64? = nil
    ) {
        self.itemID = itemID
        self.displayName = displayName
        self.archivedPath = archivedPath
        self.sourceType = sourceType
        self.createdAt = createdAt
        self.originalPath = originalPath
        self.byteSize = byteSize
    }
}

public struct MorningBrief: Codable, Equatable, Sendable {
    public var processedCount: Int
    public var completedCount: Int
    public var needsReviewCount: Int
    public var failedCount: Int
    public var newEntities: [String]
    public var graphChanges: [String]
    public var exceptions: [String]
}

public struct AgentMemorySnapshot: Codable, Equatable, Sendable {
    public var version: Int
    public var items: [CaptureItem]
    public var rules: [IngestionRule]
    public var archivedSources: [ArchivedSource]
    public var morningBriefs: [MorningBrief]

    public init(
        version: Int = 1,
        items: [CaptureItem] = [],
        rules: [IngestionRule] = [],
        archivedSources: [ArchivedSource] = [],
        morningBriefs: [MorningBrief] = []
    ) {
        self.version = version
        self.items = items
        self.rules = rules
        self.archivedSources = archivedSources
        self.morningBriefs = morningBriefs
    }
}

public extension JSONEncoder {
    static var agentMemory: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        return encoder
    }
}

public extension JSONDecoder {
    static var agentMemory: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
