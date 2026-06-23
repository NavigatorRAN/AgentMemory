import Foundation

public struct CodeGraphRAGCommunityBuilder: Sendable {
    public init() {}

    public func reports(from index: CodeGraphRAGIndex) -> [CodeGraphRAGCommunityReport] {
        let unitsByCommunity = Dictionary(grouping: index.textUnits, by: communityName)

        return unitsByCommunity.keys.sorted().map { name in
            let units = (unitsByCommunity[name] ?? []).sorted { $0.relativePath < $1.relativePath }
            let files = units.map(\.relativePath)
            let fileSet = Set(files)
            let symbols = index.symbols
                .filter { fileSet.contains($0.relativePath) }
                .map(\.name)
                .stableUnique()
            let relationships = index.relationships
                .filter { relationship in
                    fileSet.contains(relationship.source)
                        || fileSet.contains(relationship.target)
                        || symbols.contains(relationship.target)
                }
                .sorted { lhs, rhs in
                    if lhs.kind.rawValue == rhs.kind.rawValue {
                        return lhs.target < rhs.target
                    }
                    return lhs.kind.rawValue < rhs.kind.rawValue
                }
            let claims = claims(for: name, units: units, symbols: symbols, relationships: relationships)

            return CodeGraphRAGCommunityReport(
                name: name,
                summary: "\(name) contains \(files.count) files, \(symbols.count) symbols, and \(relationships.count) graph relationships.",
                keyFiles: files,
                keySymbols: symbols,
                claims: claims,
                relationships: relationships
            )
        }
    }

    private func communityName(for unit: CodeGraphRAGTextUnit) -> String {
        if unit.relativePath.hasPrefix("Sources/") {
            return firstPathComponents(unit.relativePath, count: 2)
        }
        if unit.relativePath.hasPrefix("Tests/") {
            return firstPathComponents(unit.relativePath, count: 2)
        }
        if unit.relativePath.hasPrefix("docs/") || unit.language == "markdown" {
            return "Docs"
        }
        if unit.relativePath.hasPrefix("script/") {
            return "Scripts"
        }
        return firstPathComponents(unit.relativePath, count: 1)
    }

    private func firstPathComponents(_ path: String, count: Int) -> String {
        let parts = path.split(separator: "/").prefix(count).map(String.init)
        return parts.isEmpty ? path : parts.joined(separator: "/")
    }

    private func claims(
        for name: String,
        units: [CodeGraphRAGTextUnit],
        symbols: [String],
        relationships: [CodeGraphRAGRelationship]
    ) -> [String] {
        var claims: [String] = []
        let imports = relationships.filter { $0.kind == .imports }.map(\.target).stableUnique()
        for imported in imports {
            claims.append("This community imports \(imported).")
        }

        let testedSymbols = relationships.filter { $0.kind == .tests }.compactMap(\.detail).stableUnique()
        for testedSymbol in testedSymbols {
            claims.append("Tests reference \(testedSymbol).")
        }

        if !symbols.isEmpty {
            claims.append("Primary symbols include \(symbols.prefix(5).joined(separator: ", ")).")
        }

        if claims.isEmpty {
            claims.append("\(name) has source text available for local graph retrieval.")
        }

        return claims
    }
}

private extension Array where Element == String {
    func stableUnique() -> [String] {
        var seen: Set<String> = []
        var result: [String] = []
        for value in self where !seen.contains(value) {
            seen.insert(value)
            result.append(value)
        }
        return result
    }
}
