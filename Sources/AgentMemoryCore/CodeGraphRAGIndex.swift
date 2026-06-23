import Foundation

public struct CodeGraphRAGIndex: Equatable, Sendable {
    public var repositoryName: String
    public var rootPath: String
    public var textUnits: [CodeGraphRAGTextUnit]
    public var symbols: [CodeGraphRAGSymbol]
    public var relationships: [CodeGraphRAGRelationship]

    public init(
        repositoryName: String,
        rootPath: String,
        textUnits: [CodeGraphRAGTextUnit],
        symbols: [CodeGraphRAGSymbol],
        relationships: [CodeGraphRAGRelationship]
    ) {
        self.repositoryName = repositoryName
        self.rootPath = rootPath
        self.textUnits = textUnits
        self.symbols = symbols
        self.relationships = relationships
    }
}

public struct CodeGraphRAGTextUnit: Equatable, Sendable {
    public var id: String
    public var relativePath: String
    public var language: String
    public var text: String
    public var lineCount: Int

    public init(id: String, relativePath: String, language: String, text: String, lineCount: Int) {
        self.id = id
        self.relativePath = relativePath
        self.language = language
        self.text = text
        self.lineCount = lineCount
    }
}

public struct CodeGraphRAGSymbol: Equatable, Hashable, Sendable {
    public enum Kind: String, Equatable, Hashable, Sendable {
        case type
        case function
        case heading
    }

    public var name: String
    public var kind: Kind
    public var relativePath: String
    public var line: Int

    public init(name: String, kind: Kind, relativePath: String, line: Int) {
        self.name = name
        self.kind = kind
        self.relativePath = relativePath
        self.line = line
    }
}

public struct CodeGraphRAGRelationship: Equatable, Hashable, Sendable {
    public enum Kind: String, Equatable, Hashable, Sendable {
        case contains
        case imports
        case tests
    }

    public var source: String
    public var target: String
    public var kind: Kind
    public var detail: String?

    public init(source: String, target: String, kind: Kind, detail: String?) {
        self.source = source
        self.target = target
        self.kind = kind
        self.detail = detail
    }
}

public struct CodeGraphRAGCommunityReport: Equatable, Sendable {
    public var name: String
    public var summary: String
    public var keyFiles: [String]
    public var keySymbols: [String]
    public var claims: [String]
    public var relationships: [CodeGraphRAGRelationship]

    public init(
        name: String,
        summary: String,
        keyFiles: [String],
        keySymbols: [String],
        claims: [String],
        relationships: [CodeGraphRAGRelationship]
    ) {
        self.name = name
        self.summary = summary
        self.keyFiles = keyFiles
        self.keySymbols = keySymbols
        self.claims = claims
        self.relationships = relationships
    }
}
