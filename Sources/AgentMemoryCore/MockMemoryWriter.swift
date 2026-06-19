import Foundation

public protocol MemoryWriting: Sendable {
    func write(item: CaptureItem) async throws
}

public struct MockMemoryWriter: MemoryWriting {
    public init() {}

    public func write(item: CaptureItem) async throws {
        if item.rawInput.localizedCaseInsensitiveContains("force write failure") {
            throw MemoryWriterError.rejectedFixture
        }
    }
}

public enum MemoryWriterError: Error, Equatable {
    case rejectedFixture
}
