import Foundation

public struct CaptureStackBuilder: Sendable {
    public init() {}

    public func items(fromTextStack text: String) -> [CaptureItem] {
        text
            .components(separatedBy: .newlines)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .map { rawInput in
                CaptureItem(displayName: suggestedTitle(for: rawInput), rawInput: rawInput)
            }
    }

    public func items(fromFileURLs urls: [URL]) -> [CaptureItem] {
        urls.map { url in
            CaptureItem(displayName: url.lastPathComponent, rawInput: url.path)
        }
    }

    private func suggestedTitle(for rawInput: String) -> String {
        if let url = URL(string: rawInput), let host = url.host {
            return host
        }

        return String(rawInput.prefix(40))
    }
}
