import Foundation

public struct CodeGraphRAGIndexer: Sendable {
    public init() {}

    public func indexRepository(at root: URL, name: String? = nil) throws -> CodeGraphRAGIndex {
        let repositoryName = name ?? root.lastPathComponent
        let files = try sourceFiles(under: root)
        let textUnits = try files.map { fileURL in
            let relativePath = self.relativePath(for: fileURL, root: root)
            let text = try String(contentsOf: fileURL)
            return CodeGraphRAGTextUnit(
                id: relativePath,
                relativePath: relativePath,
                language: language(for: fileURL),
                text: text,
                lineCount: text.split(separator: "\n", omittingEmptySubsequences: false).count
            )
        }

        let symbols = textUnits.flatMap(extractSymbols)
        let relationships = relationships(from: textUnits, symbols: symbols)

        return CodeGraphRAGIndex(
            repositoryName: repositoryName,
            rootPath: root.path,
            textUnits: textUnits,
            symbols: symbols.sorted { lhs, rhs in
                if lhs.relativePath == rhs.relativePath {
                    return lhs.line < rhs.line
                }
                return lhs.relativePath < rhs.relativePath
            },
            relationships: relationships.sorted { lhs, rhs in
                if lhs.source == rhs.source {
                    return lhs.target < rhs.target
                }
                return lhs.source < rhs.source
            }
        )
    }

    private func sourceFiles(under root: URL) throws -> [URL] {
        let keys: [URLResourceKey] = [.isDirectoryKey, .isRegularFileKey, .fileSizeKey]
        guard let enumerator = FileManager.default.enumerator(
            at: root,
            includingPropertiesForKeys: keys,
            options: [.skipsHiddenFiles]
        ) else {
            return []
        }

        var urls: [URL] = []
        for case let url as URL in enumerator {
            let values = try url.resourceValues(forKeys: Set(keys))
            if values.isDirectory == true {
                if shouldSkipDirectory(url.lastPathComponent) {
                    enumerator.skipDescendants()
                }
                continue
            }

            guard values.isRegularFile == true,
                  isSupportedSource(url),
                  (values.fileSize ?? 0) <= 1_000_000
            else {
                continue
            }

            urls.append(url)
        }

        return urls.sorted { relativePath(for: $0, root: root) < relativePath(for: $1, root: root) }
    }

    private func shouldSkipDirectory(_ name: String) -> Bool {
        [".git", ".build", "dist", "DerivedData", "__pycache__"].contains(name)
            || name.hasSuffix(".app")
    }

    private func isSupportedSource(_ url: URL) -> Bool {
        switch url.pathExtension.lowercased() {
        case "swift", "py", "md", "markdown", "sh", "zsh", "bash":
            true
        default:
            false
        }
    }

    private func language(for url: URL) -> String {
        switch url.pathExtension.lowercased() {
        case "swift":
            "swift"
        case "py":
            "python"
        case "md", "markdown":
            "markdown"
        case "sh", "zsh", "bash":
            "shell"
        default:
            "text"
        }
    }

    private func relativePath(for url: URL, root: URL) -> String {
        let rootPath = root.standardizedFileURL.path
        let filePath = url.standardizedFileURL.path
        guard filePath.hasPrefix(rootPath) else {
            return url.lastPathComponent
        }
        return String(filePath.dropFirst(rootPath.count))
            .trimmingCharacters(in: CharacterSet(charactersIn: "/"))
    }

    private func extractSymbols(from textUnit: CodeGraphRAGTextUnit) -> [CodeGraphRAGSymbol] {
        textUnit.text
            .split(separator: "\n", omittingEmptySubsequences: false)
            .enumerated()
            .compactMap { offset, line in
                symbol(from: String(line), language: textUnit.language, relativePath: textUnit.relativePath, lineNumber: offset + 1)
            }
    }

    private func symbol(from line: String, language: String, relativePath: String, lineNumber: Int) -> CodeGraphRAGSymbol? {
        let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
        switch language {
        case "swift":
            if let name = firstMatch(in: trimmed, pattern: #"^(?:public\s+|private\s+|final\s+|open\s+|internal\s+|fileprivate\s+)*(?:struct|class|enum|protocol|actor)\s+([A-Za-z_][A-Za-z0-9_]*)"#) {
                return CodeGraphRAGSymbol(name: name, kind: .type, relativePath: relativePath, line: lineNumber)
            }
            if let name = firstMatch(in: trimmed, pattern: #"^(?:public\s+|private\s+|static\s+|class\s+|mutating\s+|async\s+|throws\s+)*func\s+([A-Za-z_][A-Za-z0-9_]*)"#) {
                return CodeGraphRAGSymbol(name: name, kind: .function, relativePath: relativePath, line: lineNumber)
            }
        case "python":
            if let name = firstMatch(in: trimmed, pattern: #"^class\s+([A-Za-z_][A-Za-z0-9_]*)"#) {
                return CodeGraphRAGSymbol(name: name, kind: .type, relativePath: relativePath, line: lineNumber)
            }
            if let name = firstMatch(in: trimmed, pattern: #"^def\s+([A-Za-z_][A-Za-z0-9_]*)"#) {
                return CodeGraphRAGSymbol(name: name, kind: .function, relativePath: relativePath, line: lineNumber)
            }
        case "markdown":
            if let name = firstMatch(in: trimmed, pattern: #"^#+\s+(.+)$"#) {
                return CodeGraphRAGSymbol(name: name, kind: .heading, relativePath: relativePath, line: lineNumber)
            }
        case "shell":
            if let name = firstMatch(in: trimmed, pattern: #"^([A-Za-z_][A-Za-z0-9_]*)\(\)\s*\{"#) {
                return CodeGraphRAGSymbol(name: name, kind: .function, relativePath: relativePath, line: lineNumber)
            }
        default:
            break
        }
        return nil
    }

    private func relationships(from textUnits: [CodeGraphRAGTextUnit], symbols: [CodeGraphRAGSymbol]) -> [CodeGraphRAGRelationship] {
        var relationships: Set<CodeGraphRAGRelationship> = []

        for symbol in symbols {
            relationships.insert(
                CodeGraphRAGRelationship(
                    source: symbol.relativePath,
                    target: symbol.name,
                    kind: .contains,
                    detail: symbol.kind.rawValue
                )
            )
        }

        for textUnit in textUnits {
            for imported in imports(in: textUnit) {
                relationships.insert(
                    CodeGraphRAGRelationship(source: textUnit.relativePath, target: imported, kind: .imports, detail: nil)
                )
            }
        }

        let sourceSymbols = symbols.filter { !$0.relativePath.hasPrefix("Tests/") && $0.kind == .type }
        let sourcePathsBySymbol = Dictionary(uniqueKeysWithValues: sourceSymbols.map { ($0.name, $0.relativePath) })
        for testUnit in textUnits where testUnit.relativePath.hasPrefix("Tests/") {
            for (symbolName, sourcePath) in sourcePathsBySymbol where testUnit.text.contains(symbolName) {
                relationships.insert(
                    CodeGraphRAGRelationship(source: testUnit.relativePath, target: sourcePath, kind: .tests, detail: symbolName)
                )
            }
        }

        return Array(relationships)
    }

    private func imports(in textUnit: CodeGraphRAGTextUnit) -> [String] {
        textUnit.text
            .split(separator: "\n", omittingEmptySubsequences: true)
            .compactMap { line in
                switch textUnit.language {
                case "swift":
                    firstMatch(in: String(line).trimmingCharacters(in: .whitespacesAndNewlines), pattern: #"^import\s+([A-Za-z_][A-Za-z0-9_]*)"#)
                case "python":
                    firstMatch(in: String(line).trimmingCharacters(in: .whitespacesAndNewlines), pattern: #"^(?:from|import)\s+([A-Za-z_][A-Za-z0-9_\.]*)"#)
                default:
                    nil
                }
            }
    }

    private func firstMatch(in value: String, pattern: String) -> String? {
        guard let regex = try? NSRegularExpression(pattern: pattern) else {
            return nil
        }
        let range = NSRange(value.startIndex..<value.endIndex, in: value)
        guard let match = regex.firstMatch(in: value, range: range),
              match.numberOfRanges > 1,
              let matchRange = Range(match.range(at: 1), in: value)
        else {
            return nil
        }
        return String(value[matchRange])
    }
}
