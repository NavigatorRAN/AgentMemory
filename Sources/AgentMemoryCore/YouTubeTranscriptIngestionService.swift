import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public protocol YouTubeTranscriptFetching: Sendable {
    func fetchWatchHTML(url: URL) async throws -> String
    func fetchTranscriptData(url: URL) async throws -> Data
}

public struct URLSessionYouTubeTranscriptFetcher: YouTubeTranscriptFetching {
    public enum FetchError: Error, Equatable {
        case unreadableBody
    }

    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func fetchWatchHTML(url: URL) async throws -> String {
        let (data, _) = try await session.data(from: url)
        guard let html = String(data: data, encoding: .utf8) else {
            throw FetchError.unreadableBody
        }

        return html
    }

    public func fetchTranscriptData(url: URL) async throws -> Data {
        let (data, _) = try await session.data(from: url)
        return data
    }
}

public struct YouTubeTranscriptIngestionService: Sendable {
    private let archive: SourceArchive
    private let fetcher: YouTubeTranscriptFetching
    private let videoIDParser: YouTubeVideoIDParser
    private let manifestParser: YouTubeCaptionManifestParser
    private let transcriptParser: YouTubeTranscriptParser

    public init(
        archive: SourceArchive,
        fetcher: YouTubeTranscriptFetching,
        videoIDParser: YouTubeVideoIDParser = YouTubeVideoIDParser(),
        manifestParser: YouTubeCaptionManifestParser = YouTubeCaptionManifestParser(),
        transcriptParser: YouTubeTranscriptParser = YouTubeTranscriptParser()
    ) {
        self.archive = archive
        self.fetcher = fetcher
        self.videoIDParser = videoIDParser
        self.manifestParser = manifestParser
        self.transcriptParser = transcriptParser
    }

    public func fetchQueuedTranscripts(in snapshot: AgentMemorySnapshot) async -> AgentMemorySnapshot {
        var updated = snapshot

        for index in updated.items.indices where updated.items[index].status == .queued {
            guard let videoID = videoIDParser.videoID(from: updated.items[index].rawInput) else {
                continue
            }

            do {
                updated.items[index].status = .extracting
                let originalInput = updated.items[index].rawInput
                let watchURL = URL(string: "https://www.youtube.com/watch?v=\(videoID)")!
                let html = try await fetcher.fetchWatchHTML(url: watchURL)
                let tracks = try manifestParser.captionTracks(from: html)
                let transcriptData = try await fetcher.fetchTranscriptData(url: tracks[0].baseURL)
                let transcript = try transcriptParser.transcript(from: transcriptData)

                updated.items[index].displayName = "YouTube video \(videoID) transcript"
                updated.items[index].rawInput = "Source: \(originalInput)\n\nTranscript:\n\(transcript)"
                updated.items[index].sourceType = .video
                updated.items[index].proposedOutcomes = [.reference]
                updated.items[index].confidence = 0.72
                updated.items[index].customTags = stableUnique(updated.items[index].customTags + ["youtube", "transcript"])
                updated.items[index].status = .needsReview
                updated.items[index].failureReason = nil

                if !updated.archivedSources.contains(where: { $0.itemID == updated.items[index].id }) {
                    updated.archivedSources.append(try archive.archive(item: updated.items[index]))
                }
            } catch {
                updated.items[index].status = .failed
                updated.items[index].failureReason = "YouTube transcript failed: \(error.localizedDescription)"
            }
        }

        return updated
    }

    private func stableUnique(_ values: [String]) -> [String] {
        var seen: Set<String> = []
        var result: [String] = []

        for value in values where !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }

        return result
    }
}
