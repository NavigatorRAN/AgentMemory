import Foundation

public struct RetryPolicy: Equatable, Sendable {
    public var maxAttempts: Int
    public var retryableStatuses: Set<QueueStatus>

    public init(
        maxAttempts: Int = 3,
        retryableStatuses: Set<QueueStatus> = [.failed, .skipped, .paused]
    ) {
        self.maxAttempts = maxAttempts
        self.retryableStatuses = retryableStatuses
    }

    public func canRetry(_ item: CaptureItem) -> Bool {
        retryableStatuses.contains(item.status) && item.attemptCount < maxAttempts
    }

    public func exhaustedReason(for item: CaptureItem) -> String? {
        guard retryableStatuses.contains(item.status), item.attemptCount >= maxAttempts else {
            return nil
        }

        return "Retry limit reached after \(item.attemptCount) attempts."
    }
}
