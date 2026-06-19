import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct AppleDocumentationTechnology: Identifiable, Equatable, Sendable {
    public var id: String { identifier }
    public var title: String
    public var identifier: String
    public var documentationURL: URL
    public var dataURL: URL
    public var tags: [String]
    public var languages: [String]

    public init(
        title: String,
        identifier: String,
        documentationURL: URL,
        dataURL: URL,
        tags: [String] = [],
        languages: [String] = []
    ) {
        self.title = title
        self.identifier = identifier
        self.documentationURL = documentationURL
        self.dataURL = dataURL
        self.tags = tags
        self.languages = languages
    }
}

public struct AppleDocumentationReference: Equatable, Sendable {
    public var title: String
    public var identifier: String
    public var documentationURL: URL
    public var dataURL: URL
    public var abstract: String
    public var kind: String?
    public var role: String?

    public init(
        title: String,
        identifier: String,
        documentationURL: URL,
        dataURL: URL,
        abstract: String = "",
        kind: String? = nil,
        role: String? = nil
    ) {
        self.title = title
        self.identifier = identifier
        self.documentationURL = documentationURL
        self.dataURL = dataURL
        self.abstract = abstract
        self.kind = kind
        self.role = role
    }
}

public struct AppleDocumentationPage: Equatable, Sendable {
    public var title: String
    public var identifier: String
    public var documentationURL: URL
    public var abstract: String
    public var bodyText: String
    public var references: [AppleDocumentationReference]

    public init(
        title: String,
        identifier: String,
        documentationURL: URL,
        abstract: String,
        bodyText: String,
        references: [AppleDocumentationReference]
    ) {
        self.title = title
        self.identifier = identifier
        self.documentationURL = documentationURL
        self.abstract = abstract
        self.bodyText = bodyText
        self.references = references
    }
}

public protocol AppleDocumentationFetching: Sendable {
    func fetchTechnologies() async throws -> [AppleDocumentationTechnology]
    func fetchPage(dataURL: URL) async throws -> AppleDocumentationPage
}

public struct URLSessionAppleDocumentationFetcher: AppleDocumentationFetching {
    public enum FetchError: Error, Equatable {
        case nonHTTPResponse
        case unsuccessfulStatus(Int)
        case unreadableJSON
        case unsupportedDocumentationPath(String)
    }

    public static let baseURL = URL(string: "https://developer.apple.com")!
    public static let catalogURL = URL(string: "https://developer.apple.com/tutorials/data/documentation/technologies.json")!

    private let session: URLSession
    private let decoder = JSONDecoder()

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func fetchTechnologies() async throws -> [AppleDocumentationTechnology] {
        let data = try await fetchData(from: Self.catalogURL)
        let response = try decoder.decode(AppleDocumentationCatalogResponse.self, from: data)
        return response.sections.flatMap { section in
            section.groups.flatMap { group in
                group.technologies.compactMap { technology in
                    guard technology.destination?.isActive != false,
                          let identifier = technology.destination?.identifier,
                          let path = Self.documentationPath(fromIdentifier: identifier)
                    else {
                        return nil
                    }

                    return AppleDocumentationTechnology(
                        title: technology.title,
                        identifier: identifier,
                        documentationURL: Self.baseURL.appendingPathComponent(path),
                        dataURL: Self.dataURL(forDocumentationPath: path),
                        tags: technology.tags ?? [],
                        languages: technology.languages ?? []
                    )
                }
            }
        }
        .sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
    }

    public func fetchPage(dataURL: URL) async throws -> AppleDocumentationPage {
        let data = try await fetchData(from: dataURL)
        guard let object = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw FetchError.unreadableJSON
        }

        return try AppleDocumentationPageParser().page(from: object)
    }

    public static func dataURL(forDocumentationPath path: String) -> URL {
        let normalizedPath = path.hasPrefix("/") ? String(path.dropFirst()) : path
        return baseURL
            .appendingPathComponent("tutorials/data")
            .appendingPathComponent(normalizedPath)
            .appendingPathExtension("json")
    }

    public static func documentationPath(fromIdentifier identifier: String) -> String? {
        guard let range = identifier.range(of: "/documentation/", options: [.caseInsensitive]) else {
            return nil
        }

        let suffix = identifier[range.lowerBound...]
        return String(suffix).lowercased()
    }

    private func fetchData(from url: URL) async throws -> Data {
        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw FetchError.nonHTTPResponse
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw FetchError.unsuccessfulStatus(httpResponse.statusCode)
        }

        return data
    }
}

public struct AppleDocumentationIngestionOptions: Equatable, Sendable {
    public var maxChildPagesPerRoot: Int

    public init(maxChildPagesPerRoot: Int = 25) {
        self.maxChildPagesPerRoot = max(0, maxChildPagesPerRoot)
    }
}

public struct AppleDocumentationIngestionService: Sendable {
    private let archive: SourceArchive
    private let fetcher: AppleDocumentationFetching
    private let options: AppleDocumentationIngestionOptions

    public init(
        archive: SourceArchive,
        fetcher: AppleDocumentationFetching,
        options: AppleDocumentationIngestionOptions = AppleDocumentationIngestionOptions()
    ) {
        self.archive = archive
        self.fetcher = fetcher
        self.options = options
    }

    public func fetchQueuedAppleDocumentation(in snapshot: AgentMemorySnapshot) async -> AgentMemorySnapshot {
        var updated = snapshot
        var knownURLs = Set(updated.items.compactMap { Self.appleDocumentationURL(from: $0.rawInput)?.absoluteString })

        for index in updated.items.indices where updated.items[index].status == .queued {
            guard let sourceURL = Self.appleDocumentationURL(from: updated.items[index].rawInput),
                  updated.items[index].customTags.contains("apple-docs")
            else {
                continue
            }

            do {
                updated.items[index].status = .extracting
                let page = try await fetcher.fetchPage(dataURL: Self.dataURL(for: sourceURL))
                apply(page: page, sourceURL: sourceURL, to: &updated.items[index], rootTitle: page.title)
                try archiveItemIfNeeded(updated.items[index], in: &updated)

                let childReferences = page.references
                    .filter { Self.appleDocumentationURL(from: $0.documentationURL.absoluteString) != nil }
                    .prefix(options.maxChildPagesPerRoot)

                for reference in childReferences {
                    guard !knownURLs.contains(reference.documentationURL.absoluteString) else {
                        continue
                    }

                    knownURLs.insert(reference.documentationURL.absoluteString)
                    do {
                        let childPage = try await fetcher.fetchPage(dataURL: reference.dataURL)
                        var childItem = CaptureItem(
                            displayName: childPage.title,
                            rawInput: reference.documentationURL.absoluteString,
                            sourceType: .url,
                            customTags: appleDocumentationTags(for: childPage, rootTitle: page.title)
                        )
                        apply(page: childPage, sourceURL: reference.documentationURL, to: &childItem, rootTitle: page.title)
                        updated.items.append(childItem)
                        try archiveItemIfNeeded(childItem, in: &updated)
                    } catch {
                        updated.items.append(
                            CaptureItem(
                                displayName: reference.title,
                                rawInput: reference.documentationURL.absoluteString,
                                sourceType: .url,
                                status: .failed,
                                failureReason: "Apple documentation fetch failed: \(error.localizedDescription)",
                                customTags: ["apple-docs", "apple-developer", "apple-docs-child"]
                            )
                        )
                    }
                }
            } catch {
                updated.items[index].status = .failed
                updated.items[index].failureReason = "Apple documentation fetch failed: \(error.localizedDescription)"
            }
        }

        return updated
    }

    public static func appleDocumentationURL(from value: String) -> URL? {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let url = URL(string: trimmed),
              url.host == "developer.apple.com",
              url.path.lowercased().hasPrefix("/documentation/")
        else {
            return nil
        }

        return url
    }

    public static func dataURL(for documentationURL: URL) -> URL {
        URLSessionAppleDocumentationFetcher.dataURL(forDocumentationPath: documentationURL.path)
    }

    private func apply(page: AppleDocumentationPage, sourceURL: URL, to item: inout CaptureItem, rootTitle: String) {
        item.displayName = page.title
        item.rawInput = Self.captureText(for: page, sourceURL: sourceURL, rootTitle: rootTitle)
        item.sourceType = .url
        item.proposedOutcomes = [.reference, .entity, .link]
        item.confidence = 0.8
        item.customTags = stableUnique(item.customTags + appleDocumentationTags(for: page, rootTitle: rootTitle))
        item.status = .needsReview
        item.failureReason = nil
    }

    private static func captureText(for page: AppleDocumentationPage, sourceURL: URL, rootTitle: String) -> String {
        var lines = [
            "Apple Developer Documentation",
            "",
            "Root: \(rootTitle)",
            "Title: \(page.title)",
            "Source URL: \(sourceURL.absoluteString)",
            "Identifier: \(page.identifier)"
        ]

        if !page.abstract.isEmpty {
            lines += ["", "Abstract:", page.abstract]
        }

        if !page.bodyText.isEmpty {
            lines += ["", "Content:", page.bodyText]
        }

        if !page.references.isEmpty {
            lines += ["", "Related documentation:"]
            lines += page.references.prefix(50).map { reference in
                let abstract = reference.abstract.isEmpty ? "" : " - \(reference.abstract)"
                return "- \(reference.title): \(reference.documentationURL.absoluteString)\(abstract)"
            }
        }

        return lines.joined(separator: "\n")
    }

    private func archiveItemIfNeeded(_ item: CaptureItem, in snapshot: inout AgentMemorySnapshot) throws {
        guard !snapshot.archivedSources.contains(where: { $0.itemID == item.id }) else {
            return
        }

        snapshot.archivedSources.append(try archive.archive(item: item))
    }

    private func appleDocumentationTags(for page: AppleDocumentationPage, rootTitle: String) -> [String] {
        stableUnique([
            "apple-docs",
            "apple-developer",
            "developer-apple-com",
            slug(rootTitle),
            slug(page.title)
        ])
    }

    private func stableUnique(_ values: [String]) -> [String] {
        var seen: Set<String> = []
        var result: [String] = []

        for value in values where !value.isEmpty && !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }

        return result
    }

    private func slug(_ value: String) -> String {
        let allowed = CharacterSet.alphanumerics
        let mapped = value.lowercased().unicodeScalars.map { scalar -> Character in
            allowed.contains(scalar) ? Character(scalar) : "-"
        }

        let collapsed = String(mapped)
            .split(separator: "-")
            .joined(separator: "-")
        return collapsed.isEmpty ? "apple-doc" : collapsed
    }
}

public struct AppleDocumentationPageParser: Sendable {
    public enum ParserError: Error, Equatable {
        case missingMetadata
        case missingDocumentationURL
    }

    public init() {}

    public func page(from object: [String: Any]) throws -> AppleDocumentationPage {
        guard let metadata = object["metadata"] as? [String: Any] else {
            throw ParserError.missingMetadata
        }

        let identifier = object["identifier"] as? String
            ?? metadata["externalID"] as? String
            ?? metadata["title"] as? String
            ?? "apple-documentation"
        let title = metadata["title"] as? String
            ?? metadata["navigatorTitle"].flatMap { firstText(in: $0) }
            ?? identifier
        let path = (object["references"] as? [String: Any])?[identifier].flatMap { referenceURLPath(from: $0) }
            ?? documentationPath(fromIdentifier: identifier)
        guard let path else {
            throw ParserError.missingDocumentationURL
        }

        let abstract = joinedText(from: object["abstract"])
        let references = references(from: object["references"] as? [String: Any] ?? [:])
        let bodyText = bodyText(from: object, references: references)

        return AppleDocumentationPage(
            title: title,
            identifier: identifier,
            documentationURL: URLSessionAppleDocumentationFetcher.baseURL.appendingPathComponent(path),
            abstract: abstract,
            bodyText: bodyText,
            references: references
        )
    }

    private func bodyText(from object: [String: Any], references: [AppleDocumentationReference]) -> String {
        var sections: [String] = []

        for key in ["primaryContentSections", "sections"] {
            let text = joinedText(from: object[key])
            if !text.isEmpty {
                sections.append(text)
            }
        }

        if let topicSections = object["topicSections"] as? [[String: Any]] {
            let topicText = topicSections.compactMap { section -> String? in
                guard let title = section["title"] as? String else {
                    return nil
                }

                let identifiers = section["identifiers"] as? [String] ?? []
                let titles = identifiers.compactMap { identifier in
                    references.first { $0.identifier == identifier }?.title
                }
                guard !titles.isEmpty else {
                    return title
                }

                return ([title] + titles.map { "- \($0)" }).joined(separator: "\n")
            }
            if !topicText.isEmpty {
                sections.append(topicText.joined(separator: "\n\n"))
            }
        }

        return stableUniqueLines(sections.joined(separator: "\n\n"))
    }

    private func references(from object: [String: Any]) -> [AppleDocumentationReference] {
        object.compactMap { key, value in
            guard let reference = value as? [String: Any],
                  let urlPath = reference["url"] as? String,
                  urlPath.lowercased().hasPrefix("/documentation/"),
                  let title = reference["title"] as? String,
                  !title.isEmpty
            else {
                return nil
            }

            return AppleDocumentationReference(
                title: title,
                identifier: reference["identifier"] as? String ?? key,
                documentationURL: URLSessionAppleDocumentationFetcher.baseURL.appendingPathComponent(urlPath),
                dataURL: URLSessionAppleDocumentationFetcher.dataURL(forDocumentationPath: urlPath),
                abstract: joinedText(from: reference["abstract"]),
                kind: reference["kind"] as? String,
                role: reference["role"] as? String
            )
        }
        .sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
    }

    private func documentationPath(fromIdentifier identifier: String) -> String? {
        URLSessionAppleDocumentationFetcher.documentationPath(fromIdentifier: identifier)
    }

    private func referenceURLPath(from value: Any) -> String? {
        (value as? [String: Any])?["url"] as? String
    }

    private func firstText(in value: Any) -> String? {
        if let dict = value as? [String: Any], let text = dict["text"] as? String {
            return text
        }

        if let array = value as? [Any] {
            return array.compactMap(firstText(in:)).first
        }

        return nil
    }

    private func joinedText(from value: Any?) -> String {
        stableUniqueLines(collectText(from: value).joined(separator: "\n"))
    }

    private func collectText(from value: Any?) -> [String] {
        if let dict = value as? [String: Any] {
            var result: [String] = []
            if let text = dict["text"] as? String {
                result.append(text)
            }
            for nested in dict.values {
                result.append(contentsOf: collectText(from: nested))
            }
            return result
        }

        if let array = value as? [Any] {
            return array.flatMap { collectText(from: $0) }
        }

        return []
    }

    private func stableUniqueLines(_ text: String) -> String {
        var seen: Set<String> = []
        var result: [String] = []

        for line in text.components(separatedBy: .newlines) {
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty, !seen.contains(trimmed) else {
                continue
            }

            seen.insert(trimmed)
            result.append(trimmed)
        }

        return result.joined(separator: "\n")
    }
}

private struct AppleDocumentationCatalogResponse: Decodable {
    var sections: [Section]

    struct Section: Decodable {
        var groups: [Group]
    }

    struct Group: Decodable {
        var technologies: [Technology]
    }

    struct Technology: Decodable {
        var title: String
        var tags: [String]?
        var languages: [String]?
        var destination: Destination?
    }

    struct Destination: Decodable {
        var identifier: String
        var isActive: Bool?
    }
}
