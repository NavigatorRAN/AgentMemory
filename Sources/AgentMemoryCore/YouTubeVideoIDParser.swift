import Foundation

public struct YouTubeVideoIDParser: Sendable {
    public init() {}

    public func videoID(from rawInput: String) -> String? {
        guard let components = URLComponents(string: rawInput.trimmingCharacters(in: .whitespacesAndNewlines)),
              let host = components.host?.lowercased()
        else {
            return nil
        }

        if host == "youtu.be" {
            return firstPathSegment(from: components)
        }

        guard host == "youtube.com" || host.hasSuffix(".youtube.com") else {
            return nil
        }

        if components.path == "/watch" {
            return components.queryItems?.first { $0.name == "v" }?.value
        }

        if components.path.hasPrefix("/shorts/") || components.path.hasPrefix("/embed/") {
            return firstPathSegment(from: components, dropping: 1)
        }

        return nil
    }

    private func firstPathSegment(from components: URLComponents, dropping count: Int = 0) -> String? {
        let segments = components.path
            .split(separator: "/")
            .dropFirst(count)
            .map(String.init)

        return segments.first
    }
}
