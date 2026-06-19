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

        let rawURL = URL(fileURLWithPath: item.rawInput)
        if FileManager.default.fileExists(atPath: rawURL.path) {
            let destinationURL = itemDirectory.appendingPathComponent(rawURL.lastPathComponent)
            if FileManager.default.fileExists(atPath: destinationURL.path) {
                try FileManager.default.removeItem(at: destinationURL)
            }
            try FileManager.default.copyItem(at: rawURL, to: destinationURL)
            let attributes = try FileManager.default.attributesOfItem(atPath: destinationURL.path)
            let byteSize = attributes[.size] as? NSNumber

            return ArchivedSource(
                itemID: item.id,
                displayName: item.displayName,
                archivedPath: destinationURL.path,
                sourceType: item.sourceType,
                createdAt: Date(),
                originalPath: rawURL.path,
                byteSize: byteSize?.int64Value
            )
        }

        let sourceURL = itemDirectory.appendingPathComponent("source.txt")
        let data = Data(item.rawInput.utf8)
        try data.write(to: sourceURL)

        return ArchivedSource(
            itemID: item.id,
            displayName: item.displayName,
            archivedPath: sourceURL.path,
            sourceType: item.sourceType,
            createdAt: Date(),
            byteSize: Int64(data.count)
        )
    }
}
