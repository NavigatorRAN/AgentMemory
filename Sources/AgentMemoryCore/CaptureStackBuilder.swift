import Foundation

public struct CaptureStackBuilder: Sendable {
    private let sourceClassifier: SourceClassifier
    private let youtubeParser: YouTubeVideoIDParser

    public init(
        sourceClassifier: SourceClassifier = SourceClassifier(),
        youtubeParser: YouTubeVideoIDParser = YouTubeVideoIDParser()
    ) {
        self.sourceClassifier = sourceClassifier
        self.youtubeParser = youtubeParser
    }

    public func items(fromTextStack text: String) -> [CaptureItem] {
        text
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .map { rawInput in
                CaptureItem(
                    displayName: suggestedTitle(for: rawInput),
                    rawInput: rawInput,
                    sourceType: sourceClassifier.classify(rawInput: rawInput)
                )
            }
    }

    public func items(fromFileURLs urls: [URL]) -> [CaptureItem] {
        urls.map { url in
            CaptureItem(displayName: url.lastPathComponent, rawInput: url.path)
        }
    }

    private func suggestedTitle(for rawInput: String) -> String {
        if let videoID = youtubeParser.videoID(from: rawInput) {
            return "YouTube video \(videoID)"
        }

        if let url = URL(string: rawInput), let host = url.host {
            return host
        }

        return String(rawInput.prefix(40))
    }
}
