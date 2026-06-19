import Foundation

public struct RuleEngine: Sendable {
    public var rules: [IngestionRule]

    public init(rules: [IngestionRule]) {
        self.rules = rules
    }

    public func route(item: CaptureItem) -> RoutingDecision {
        for rule in rules where rule.sourceType == item.sourceType {
            if let matchText = rule.matchText {
                guard item.rawInput.localizedCaseInsensitiveContains(matchText) else {
                    continue
                }
            }

            return RoutingDecision(
                workspace: rule.workspace,
                actions: rule.actions,
                matchedRuleName: rule.name
            )
        }

        return RoutingDecision(
            workspace: "Inbox",
            actions: [.needsReview],
            matchedRuleName: nil
        )
    }
}
