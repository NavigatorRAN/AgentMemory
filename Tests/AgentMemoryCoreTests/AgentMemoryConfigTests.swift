import XCTest
@testable import AgentMemoryCore

final class AgentMemoryConfigTests: XCTestCase {
    func testDefaultConfigKeepsLiveWritesDisabled() {
        let config = AgentMemoryConfig()

        XCTAssertEqual(config.agentName, "CODEX")
        XCTAssertEqual(config.memoryMCPEndpoint, "")
        XCTAssertFalse(config.liveMemoryWritesEnabled)
    }

    func testDiskStoreSavesAndLoadsConfig() throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let store = AgentMemoryDiskStore(root: root)
        let config = AgentMemoryConfig(
            memoryMCPEndpoint: "http://127.0.0.1:8006/mcp",
            agentName: "CODEX",
            liveMemoryWritesEnabled: true
        )

        try store.saveConfig(config)
        let loaded = try store.loadConfig()

        XCTAssertEqual(loaded, config)
        XCTAssertTrue(FileManager.default.fileExists(atPath: store.configURL.path))
    }

    func testDiskStoreReturnsDefaultConfigWhenMissing() throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let store = AgentMemoryDiskStore(root: root)

        XCTAssertEqual(try store.loadConfig(), AgentMemoryConfig())
    }
}
