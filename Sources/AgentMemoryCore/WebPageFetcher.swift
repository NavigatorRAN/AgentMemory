import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct FetchedWebPage: Equatable, Sendable {
    public var url: URL
    public var title: String
    public var text: String

    public init(url: URL, title: String, text: String) {
        self.url = url
        self.title = title
        self.text = text
    }
}

public protocol WebPageFetching: Sendable {
    func fetch(url: URL) async throws -> FetchedWebPage
}

public struct URLSessionWebPageFetcher: WebPageFetching {
    public enum FetchError: Error, Equatable {
        case nonHTTPResponse
        case unsuccessfulStatus(Int)
        case unreadableBody
    }

    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func fetch(url: URL) async throws -> FetchedWebPage {
        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw FetchError.nonHTTPResponse
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw FetchError.unsuccessfulStatus(httpResponse.statusCode)
        }

        guard let html = String(data: data, encoding: .utf8) else {
            throw FetchError.unreadableBody
        }

        return FetchedWebPage(
            url: url,
            title: title(from: html) ?? url.host ?? url.absoluteString,
            text: text(from: html)
        )
    }

    private func title(from html: String) -> String? {
        guard let range = html.range(of: #"<title[^>]*>(.*?)</title>"#, options: [.regularExpression, .caseInsensitive]) else {
            return nil
        }

        let title = html[range]
            .replacingOccurrences(of: #"<[^>]+>"#, with: "", options: .regularExpression)
            .trimmingCharacters(in: .whitespacesAndNewlines)
        return title.isEmpty ? nil : decodeBasicEntities(title)
    }

    private func text(from html: String) -> String {
        let withoutScripts = html
            .replacingOccurrences(of: #"<script[\s\S]*?</script>"#, with: " ", options: [.regularExpression, .caseInsensitive])
            .replacingOccurrences(of: #"<style[\s\S]*?</style>"#, with: " ", options: [.regularExpression, .caseInsensitive])
        let withoutTags = withoutScripts.replacingOccurrences(of: #"<[^>]+>"#, with: " ", options: .regularExpression)
        let collapsed = withoutTags.replacingOccurrences(of: #"\s+"#, with: " ", options: .regularExpression)
        return decodeBasicEntities(collapsed).trimmingCharacters(in: .whitespacesAndNewlines)
    }

    private func decodeBasicEntities(_ text: String) -> String {
        text
            .replacingOccurrences(of: "&amp;", with: "&")
            .replacingOccurrences(of: "&lt;", with: "<")
            .replacingOccurrences(of: "&gt;", with: ">")
            .replacingOccurrences(of: "&quot;", with: "\"")
            .replacingOccurrences(of: "&#39;", with: "'")
            .replacingOccurrences(of: "&nbsp;", with: " ")
    }
}
