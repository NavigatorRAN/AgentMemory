import Foundation

public struct YouTubeCaptionTrack: Equatable, Sendable {
    public var baseURL: URL
    public var languageCode: String
    public var displayName: String

    public init(baseURL: URL, languageCode: String, displayName: String) {
        self.baseURL = baseURL
        self.languageCode = languageCode
        self.displayName = displayName
    }
}

public enum YouTubeCaptionManifestError: Error, Equatable {
    case missingCaptionTracks
    case malformedCaptionTracks
}

public struct YouTubeCaptionManifestParser: Sendable {
    public init() {}

    public func captionTracks(from html: String) throws -> [YouTubeCaptionTrack] {
        guard let arrayJSON = extractCaptionTracksArray(from: html) else {
            throw YouTubeCaptionManifestError.missingCaptionTracks
        }

        let decoder = JSONDecoder()
        let decodedTracks = try decoder.decode([DecodedCaptionTrack].self, from: Data(arrayJSON.utf8))
        let tracks = decodedTracks.compactMap(\.track)

        guard !tracks.isEmpty else {
            throw YouTubeCaptionManifestError.malformedCaptionTracks
        }

        return tracks
    }

    private func extractCaptionTracksArray(from html: String) -> String? {
        guard let keyRange = html.range(of: #""captionTracks""#),
              let arrayStart = html[keyRange.upperBound...].firstIndex(of: "[")
        else {
            return nil
        }

        var depth = 0
        var isInsideString = false
        var isEscaped = false
        var index = arrayStart

        while index < html.endIndex {
            let character = html[index]

            if isEscaped {
                isEscaped = false
            } else if character == "\\" {
                isEscaped = true
            } else if character == "\"" {
                isInsideString.toggle()
            } else if !isInsideString {
                if character == "[" {
                    depth += 1
                } else if character == "]" {
                    depth -= 1
                    if depth == 0 {
                        return String(html[arrayStart...index])
                    }
                }
            }

            index = html.index(after: index)
        }

        return nil
    }
}

private struct DecodedCaptionTrack: Decodable {
    var baseUrl: String
    var languageCode: String
    var name: DecodedCaptionName?

    var track: YouTubeCaptionTrack? {
        guard let url = URL(string: baseUrl) else {
            return nil
        }

        return YouTubeCaptionTrack(
            baseURL: url,
            languageCode: languageCode,
            displayName: name?.simpleText ?? languageCode
        )
    }
}

private struct DecodedCaptionName: Decodable {
    var simpleText: String?
}
