import Foundation

public struct SourceArchive: Sendable {
    public var root: URL

    public init(root: URL) {
        self.root = root
    }

    public func archive(item: CaptureItem) throws -> ArchivedSource {
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let itemDirectory = root.appendingPathComponent(item.id.uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: itemDirectory, withIntermediateDirectories: true)

        let sourceURL = itemDirectory.appendingPathComponent("source.txt")
        try item.rawInput.data(using: .utf8)?.write(to: sourceURL)

        return ArchivedSource(
            itemID: item.id,
            displayName: item.displayName,
            archivedPath: sourceURL.path,
            sourceType: item.sourceType,
            createdAt: Date()
        )
    }
}
