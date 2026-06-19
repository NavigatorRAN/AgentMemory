import Foundation

public enum YouTubeTranscriptParserError: Error, Equatable {
    case emptyTranscript
    case malformedTranscript
}

public struct YouTubeTranscriptParser: Sendable {
    public init() {}

    public func transcript(from data: Data) throws -> String {
        let delegate = TranscriptXMLDelegate()
        let parser = XMLParser(data: data)
        parser.delegate = delegate

        guard parser.parse() else {
            throw YouTubeTranscriptParserError.malformedTranscript
        }

        let lines = delegate.lines
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        guard !lines.isEmpty else {
            throw YouTubeTranscriptParserError.emptyTranscript
        }

        return lines.joined(separator: "\n")
    }
}

private final class TranscriptXMLDelegate: NSObject, XMLParserDelegate {
    private(set) var lines: [String] = []
    private var currentText = ""
    private var isInsideTextElement = false

    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String: String] = [:]
    ) {
        if elementName == "text" {
            isInsideTextElement = true
            currentText = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        guard isInsideTextElement else {
            return
        }

        currentText += string
    }

    func parser(
        _ parser: XMLParser,
        didEndElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?
    ) {
        guard elementName == "text" else {
            return
        }

        lines.append(currentText)
        isInsideTextElement = false
        currentText = ""
    }
}
