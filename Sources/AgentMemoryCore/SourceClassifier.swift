import Foundation

public struct SourceClassifier: Sendable {
    private let youtubeParser: YouTubeVideoIDParser

    public init(youtubeParser: YouTubeVideoIDParser = YouTubeVideoIDParser()) {
        self.youtubeParser = youtubeParser
    }

    public func classify(rawInput: String) -> SourceType {
        let value = rawInput.trimmingCharacters(in: .whitespacesAndNewlines)
        let lowercased = value.lowercased()

        if youtubeParser.videoID(from: value) != nil {
            return .video
        }

        if lowercased.hasPrefix("http://") || lowercased.hasPrefix("https://") {
            return .url
        }

        if lowercased.hasSuffix(".pdf") {
            return .pdf
        }

        if [".png", ".jpg", ".jpeg", ".heic", ".tiff"].contains(where: lowercased.hasSuffix) {
            return .image
        }

        if lowercased.contains("fatal error")
            || lowercased.contains("exception")
            || lowercased.contains("traceback")
            || lowercased.contains("connection refused") {
            return .codeOrLog
        }

        return value.isEmpty ? .unknown : .text
    }
}
