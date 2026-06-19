import Foundation

public struct ArchivedSourcePreviewReader: Sendable {
    public init() {}

    public func preview(for source: ArchivedSource, limit: Int = 4_000) -> String {
        guard limit > 0 else {
            return ""
        }

        let url = URL(fileURLWithPath: source.archivedPath)
        guard let data = try? Data(contentsOf: url),
              let text = String(data: data, encoding: .utf8)
        else {
            return "Archived source file is not readable."
        }

        guard text.count > limit else {
            return text
        }

        let endIndex = text.index(text.startIndex, offsetBy: limit)
        return "\(String(text[..<endIndex]))\n\n[Preview truncated]"
    }
}
