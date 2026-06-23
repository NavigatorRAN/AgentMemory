import XCTest
@testable import AgentMemoryCore

final class AgentMemoryConfigTests: XCTestCase {
    func testDefaultConfigKeepsLiveWritesDisabled() {
        let config = AgentMemoryConfig()

        XCTAssertEqual(config.agentName, "CODEX")
        XCTAssertEqual(config.memoryMCPEndpoint, AgentMemoryConfig.defaultMemoryMCPEndpoint)
        XCTAssertEqual(config.memoryMCPEndpointURL?.absoluteString, AgentMemoryConfig.defaultMemoryMCPEndpoint)
        XCTAssertTrue(config.automaticWikiRefreshEnabled)
        XCTAssertTrue(config.wikiMemorySyncEnabled)
        XCTAssertEqual(config.codeGraphRAGRepositoryPath, "")
        XCTAssertFalse(config.liveMemoryWritesEnabled)
        XCTAssertEqual(config.ragHost, "192.168.1.107")
        XCTAssertEqual(config.ragUser, "veronika")
        XCTAssertEqual(config.ragIdentityPath, "~/.ssh/id_rsa_hermes")
        XCTAssertEqual(config.ragCollection, "agentmemory")
        XCTAssertFalse(config.ragExportEnabled)
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

    func testConfigBuildsRAGSSHQueueConfig() {
        let config = AgentMemoryConfig(
            ragHost: "192.168.1.107",
            ragUser: "veronika",
            ragIdentityPath: "~/.ssh/id_rsa_hermes",
            ragCollection: "agentmemory",
            ragExportEnabled: true
        )

        let ragConfig = config.ragSSHQueueConfig(homeDirectory: "/Users/matt")

        XCTAssertEqual(ragConfig?.host, "192.168.1.107")
        XCTAssertEqual(ragConfig?.user, "veronika")
        XCTAssertEqual(ragConfig?.identityPath, "/Users/matt/.ssh/id_rsa_hermes")
    }

    func testConfigRejectsIncompleteRAGSettings() {
        let config = AgentMemoryConfig(ragHost: "", ragExportEnabled: true)

        XCTAssertNil(config.ragSSHQueueConfig(homeDirectory: "/Users/matt"))
    }

    func testDiskStoreReturnsDefaultConfigWhenMissing() throws {
        let root = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let store = AgentMemoryDiskStore(root: root)

        XCTAssertEqual(try store.loadConfig(), AgentMemoryConfig())
    }

    func testConfigDecodesOlderJSONWithWikiDefaultsEnabled() throws {
        let json = """
        {
          "memoryMCPEndpoint" : "http://127.0.0.1:8006/mcp",
          "agentName" : "CODEX",
          "liveMemoryWritesEnabled" : false,
          "ragHost" : "192.168.1.107",
          "ragUser" : "veronika",
          "ragIdentityPath" : "~/.ssh/id_rsa_hermes",
          "ragCollection" : "agentmemory",
          "ragExportEnabled" : false
        }
        """.data(using: .utf8)!

        let config = try JSONDecoder.agentMemory.decode(AgentMemoryConfig.self, from: json)

        XCTAssertTrue(config.automaticWikiRefreshEnabled)
        XCTAssertTrue(config.wikiMemorySyncEnabled)
        XCTAssertEqual(config.codeGraphRAGRepositoryPath, "")
    }
}
