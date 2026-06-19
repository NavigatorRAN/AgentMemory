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

public struct RAGExportStatus: Codable, Equatable, Sendable {
    public var jobID: Int
    public var exportedAt: Date
    public var collection: String

    public init(jobID: Int, exportedAt: Date, collection: String) {
        self.jobID = jobID
        self.exportedAt = exportedAt
        self.collection = collection
    }
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
    public var customTags: [String]
    public var attemptCount: Int
    public var lastAttemptAt: Date?
    public var ragExport: RAGExportStatus?

    public init(
        id: UUID = UUID(),
        displayName: String,
        rawInput: String,
        createdAt: Date = Date(),
        sourceType: SourceType = .unknown,
        status: QueueStatus = .queued,
        proposedOutcomes: [MemoryOutcome] = [],
        confidence: Double = 0,
        failureReason: String? = nil,
        customTags: [String] = [],
        attemptCount: Int = 0,
        lastAttemptAt: Date? = nil,
        ragExport: RAGExportStatus? = nil
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
        self.customTags = customTags
        self.attemptCount = attemptCount
        self.lastAttemptAt = lastAttemptAt
        self.ragExport = ragExport
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case displayName
        case rawInput
        case createdAt
        case sourceType
        case status
        case proposedOutcomes
        case confidence
        case failureReason
        case customTags
        case attemptCount
        case lastAttemptAt
        case ragExport
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.rawInput = try container.decode(String.self, forKey: .rawInput)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.sourceType = try container.decode(SourceType.self, forKey: .sourceType)
        self.status = try container.decode(QueueStatus.self, forKey: .status)
        self.proposedOutcomes = try container.decode([MemoryOutcome].self, forKey: .proposedOutcomes)
        self.confidence = try container.decode(Double.self, forKey: .confidence)
        self.failureReason = try container.decodeIfPresent(String.self, forKey: .failureReason)
        self.customTags = try container.decodeIfPresent([String].self, forKey: .customTags) ?? []
        self.attemptCount = try container.decodeIfPresent(Int.self, forKey: .attemptCount) ?? 0
        self.lastAttemptAt = try container.decodeIfPresent(Date.self, forKey: .lastAttemptAt)
        self.ragExport = try container.decodeIfPresent(RAGExportStatus.self, forKey: .ragExport)
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

    mutating func markProcessingAttempt(at date: Date = Date()) {
        attemptCount += 1
        lastAttemptAt = date
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

public enum BatchRunStatus: String, Codable, Equatable, Sendable {
    case complete
    case failed
}

public struct BatchRun: Identifiable, Codable, Equatable, Sendable {
    public var id: UUID
    public var startedAt: Date
    public var completedAt: Date
    public var status: BatchRunStatus
    public var queuedItemCount: Int
    public var completedItemCount: Int
    public var reviewItemCount: Int
    public var failedItemCount: Int
    public var summary: String

    public init(
        id: UUID = UUID(),
        startedAt: Date,
        completedAt: Date,
        status: BatchRunStatus,
        queuedItemCount: Int,
        completedItemCount: Int,
        reviewItemCount: Int,
        failedItemCount: Int,
        summary: String
    ) {
        self.id = id
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.status = status
        self.queuedItemCount = queuedItemCount
        self.completedItemCount = completedItemCount
        self.reviewItemCount = reviewItemCount
        self.failedItemCount = failedItemCount
        self.summary = summary
    }
}

public struct RAGExportRun: Identifiable, Codable, Equatable, Sendable {
    public var id: UUID
    public var startedAt: Date
    public var completedAt: Date
    public var exportedCount: Int
    public var skippedCount: Int
    public var failedCount: Int
    public var failures: [RAGBatchExportFailure]
    public var summary: String

    public init(
        id: UUID = UUID(),
        startedAt: Date,
        completedAt: Date,
        exportedCount: Int,
        skippedCount: Int,
        failedCount: Int,
        failures: [RAGBatchExportFailure],
        summary: String
    ) {
        self.id = id
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.exportedCount = exportedCount
        self.skippedCount = skippedCount
        self.failedCount = failedCount
        self.failures = failures
        self.summary = summary
    }
}

public struct AgentMemorySnapshot: Codable, Equatable, Sendable {
    public var version: Int
    public var items: [CaptureItem]
    public var rules: [IngestionRule]
    public var archivedSources: [ArchivedSource]
    public var morningBriefs: [MorningBrief]
    public var batchRuns: [BatchRun]
    public var ragExportRuns: [RAGExportRun]

    public init(
        version: Int = 1,
        items: [CaptureItem] = [],
        rules: [IngestionRule] = [],
        archivedSources: [ArchivedSource] = [],
        morningBriefs: [MorningBrief] = [],
        batchRuns: [BatchRun] = [],
        ragExportRuns: [RAGExportRun] = []
    ) {
        self.version = version
        self.items = items
        self.rules = rules
        self.archivedSources = archivedSources
        self.morningBriefs = morningBriefs
        self.batchRuns = batchRuns
        self.ragExportRuns = ragExportRuns
    }

    private enum CodingKeys: String, CodingKey {
        case version
        case items
        case rules
        case archivedSources
        case morningBriefs
        case batchRuns
        case ragExportRuns
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decodeIfPresent(Int.self, forKey: .version) ?? 1
        self.items = try container.decodeIfPresent([CaptureItem].self, forKey: .items) ?? []
        self.rules = try container.decodeIfPresent([IngestionRule].self, forKey: .rules) ?? []
        self.archivedSources = try container.decodeIfPresent([ArchivedSource].self, forKey: .archivedSources) ?? []
        self.morningBriefs = try container.decodeIfPresent([MorningBrief].self, forKey: .morningBriefs) ?? []
        self.batchRuns = try container.decodeIfPresent([BatchRun].self, forKey: .batchRuns) ?? []
        self.ragExportRuns = try container.decodeIfPresent([RAGExportRun].self, forKey: .ragExportRuns) ?? []
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
