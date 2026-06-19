import XCTest
@testable import AgentMemoryCore

final class RetryPolicyTests: XCTestCase {
    func testDefaultPolicyAllowsRetryBeforeAttemptLimit() {
        let policy = RetryPolicy()
        let item = CaptureItem(
            displayName: "Failed article",
            rawInput: "https://example.com/article",
            status: .failed,
            attemptCount: 2
        )

        XCTAssertTrue(policy.canRetry(item))
    }

    func testDefaultPolicyBlocksRetryAtAttemptLimit() {
        let policy = RetryPolicy()
        let item = CaptureItem(
            displayName: "Failed article",
            rawInput: "https://example.com/article",
            status: .failed,
            attemptCount: 3
        )

        XCTAssertFalse(policy.canRetry(item))
        XCTAssertEqual(policy.exhaustedReason(for: item), "Retry limit reached after 3 attempts.")
    }

    func testPolicyOnlyRetriesRecoverableStatuses() {
        let policy = RetryPolicy()
        let complete = CaptureItem(displayName: "Complete", rawInput: "done", status: .complete, attemptCount: 1)
        let review = CaptureItem(displayName: "Review", rawInput: "review", status: .needsReview, attemptCount: 1)
        let skipped = CaptureItem(displayName: "Skipped", rawInput: "skip", status: .skipped, attemptCount: 1)

        XCTAssertFalse(policy.canRetry(complete))
        XCTAssertFalse(policy.canRetry(review))
        XCTAssertTrue(policy.canRetry(skipped))
    }
}
