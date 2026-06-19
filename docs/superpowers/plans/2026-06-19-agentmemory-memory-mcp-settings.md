# AgentMemory Memory MCP Settings Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add Memory MCP endpoint configuration and a URLSession-backed transport skeleton so AgentMemory can be pointed at a live Memory MCP server in a future enablement slice.

**Architecture:** Keep Memory MCP connection settings in a Codable app config stored alongside the snapshot. Add a macOS Settings scene for endpoint URL, enable-live-writes toggle, and agent name. Add a URLSession-based transport that posts a `record_event` shaped JSON payload to a configured endpoint, tested with a custom URLProtocol. The app will still default to mock writes unless live writes are explicitly enabled in config.

**Tech Stack:** Swift 6, SwiftUI Settings scene, Codable JSON config, URLSession, XCTest.

---

## File Structure

- `Sources/AgentMemoryCore/AgentMemoryConfig.swift`: New config model.
- `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`: Load/save config JSON.
- `Sources/AgentMemoryCore/MemoryMCPHTTPTransport.swift`: URLSession transport skeleton.
- `Tests/AgentMemoryCoreTests/AgentMemoryConfigTests.swift`: Config persistence tests.
- `Tests/AgentMemoryCoreTests/MemoryMCPHTTPTransportTests.swift`: HTTP transport request tests.
- `Sources/AgentMemoryApp/AgentMemorySettingsView.swift`: macOS settings UI.
- `Sources/AgentMemoryApp/AgentMemoryApp.swift`: Add Settings scene.
- `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`: Load config and expose it to settings.
- `README.md`: Note settings/transport boundary.

---

### Task 1: Config Persistence

**Files:**
- Create: `Sources/AgentMemoryCore/AgentMemoryConfig.swift`
- Modify: `Sources/AgentMemoryCore/AgentMemoryDiskStore.swift`
- Create: `Tests/AgentMemoryCoreTests/AgentMemoryConfigTests.swift`

- [x] **Step 1: Add config tests**

Create `Tests/AgentMemoryCoreTests/AgentMemoryConfigTests.swift`:

```swift
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
```

- [x] **Step 2: Implement config model**

Create `Sources/AgentMemoryCore/AgentMemoryConfig.swift`:

```swift
import Foundation

public struct AgentMemoryConfig: Codable, Equatable, Sendable {
    public var memoryMCPEndpoint: String
    public var agentName: String
    public var liveMemoryWritesEnabled: Bool

    public init(
        memoryMCPEndpoint: String = "",
        agentName: String = "CODEX",
        liveMemoryWritesEnabled: Bool = false
    ) {
        self.memoryMCPEndpoint = memoryMCPEndpoint
        self.agentName = agentName
        self.liveMemoryWritesEnabled = liveMemoryWritesEnabled
    }
}
```

- [x] **Step 3: Add disk store config APIs**

Add to `AgentMemoryDiskStore`:

```swift
    public var configURL: URL {
        root.appendingPathComponent("agent-memory-config.json")
    }
```

Add methods:

```swift
    public func loadConfig() throws -> AgentMemoryConfig {
        guard FileManager.default.fileExists(atPath: configURL.path) else {
            return AgentMemoryConfig()
        }

        let data = try Data(contentsOf: configURL)
        return try JSONDecoder.agentMemory.decode(AgentMemoryConfig.self, from: data)
    }

    public func saveConfig(_ config: AgentMemoryConfig) throws {
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        let data = try JSONEncoder.agentMemory.encode(config)
        let temporaryURL = root.appendingPathComponent("agent-memory-config.json.tmp")
        try data.write(to: temporaryURL, options: .atomic)

        if FileManager.default.fileExists(atPath: configURL.path) {
            _ = try FileManager.default.replaceItemAt(configURL, withItemAt: temporaryURL)
        } else {
            try FileManager.default.moveItem(at: temporaryURL, to: configURL)
        }
    }
```

- [x] **Step 4: Verify config tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter AgentMemoryConfigTests`

Expected: PASS.

- [x] **Step 5: Commit**

```bash
git add Sources/AgentMemoryCore/AgentMemoryConfig.swift Sources/AgentMemoryCore/AgentMemoryDiskStore.swift Tests/AgentMemoryCoreTests/AgentMemoryConfigTests.swift
git commit -m "Add Memory MCP config persistence"
```

---

### Task 2: URLSession Transport Skeleton

**Files:**
- Create: `Sources/AgentMemoryCore/MemoryMCPHTTPTransport.swift`
- Create: `Tests/AgentMemoryCoreTests/MemoryMCPHTTPTransportTests.swift`

- [x] **Step 1: Add HTTP transport tests**

Create `Tests/AgentMemoryCoreTests/MemoryMCPHTTPTransportTests.swift`:

```swift
import XCTest
@testable import AgentMemoryCore

final class MemoryMCPHTTPTransportTests: XCTestCase {
    override func tearDown() {
        super.tearDown()
        RecordingURLProtocol.requestHandler = nil
    }

    func testTransportPostsRecordEventPayload() async throws {
        let endpoint = URL(string: "http://127.0.0.1:8006/mcp")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [RecordingURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let transport = MemoryMCPHTTPTransport(endpoint: endpoint, session: session)
        let payload = MemoryMCPRecordEventPayload(
            agent: "CODEX",
            content: "Captured decision",
            entities: ["agentmemory"],
            tags: ["capture"]
        )

        RecordingURLProtocol.requestHandler = { request in
            XCTAssertEqual(request.url, endpoint)
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
            let body = try XCTUnwrap(request.httpBodyStreamData)
            let decoded = try JSONDecoder.agentMemory.decode(MemoryMCPHTTPTransport.RecordEventRequest.self, from: body)
            XCTAssertEqual(decoded.tool, "record_event")
            XCTAssertEqual(decoded.payload, payload)
            return (HTTPURLResponse(url: endpoint, statusCode: 200, httpVersion: nil, headerFields: nil)!, Data())
        }

        try await transport.recordEvent(payload)
    }

    func testTransportThrowsForNonSuccessStatus() async {
        let endpoint = URL(string: "http://127.0.0.1:8006/mcp")!
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [RecordingURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let transport = MemoryMCPHTTPTransport(endpoint: endpoint, session: session)

        RecordingURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(url: endpoint, statusCode: 500, httpVersion: nil, headerFields: nil)!, Data("bad".utf8))
        }

        await XCTAssertThrowsErrorAsync(
            try await transport.recordEvent(
                MemoryMCPRecordEventPayload(agent: "CODEX", content: "content", entities: [], tags: [])
            )
        )
    }
}

private final class RecordingURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    override class func canInit(with request: URLRequest) -> Bool { true }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest { request }

    override func startLoading() {
        guard let handler = Self.requestHandler else {
            client?.urlProtocol(self, didFailWithError: URLError(.badServerResponse))
            return
        }

        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}

private extension URLRequest {
    var httpBodyStreamData: Data? {
        guard let stream = httpBodyStream else {
            return httpBody
        }

        stream.open()
        defer { stream.close() }

        var data = Data()
        let bufferSize = 1024
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: bufferSize)
        defer { buffer.deallocate() }

        while stream.hasBytesAvailable {
            let count = stream.read(buffer, maxLength: bufferSize)
            if count <= 0 { break }
            data.append(buffer, count: count)
        }

        return data
    }
}

private func XCTAssertThrowsErrorAsync(
    _ expression: @autoclosure () async throws -> Void,
    file: StaticString = #filePath,
    line: UInt = #line
) async {
    do {
        try await expression()
        XCTFail("Expected error", file: file, line: line)
    } catch {
        // Expected.
    }
}
```

- [x] **Step 2: Implement HTTP transport**

Create `Sources/AgentMemoryCore/MemoryMCPHTTPTransport.swift`:

```swift
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct MemoryMCPHTTPTransport: MemoryMCPTransporting {
    public struct RecordEventRequest: Codable, Equatable, Sendable {
        public var tool: String
        public var payload: MemoryMCPRecordEventPayload
    }

    public enum TransportError: Error, Equatable {
        case nonHTTPResponse
        case unsuccessfulStatus(Int)
    }

    private let endpoint: URL
    private let session: URLSession

    public init(endpoint: URL, session: URLSession = .shared) {
        self.endpoint = endpoint
        self.session = session
    }

    public func recordEvent(_ payload: MemoryMCPRecordEventPayload) async throws {
        var request = URLRequest(url: endpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder.agentMemory.encode(
            RecordEventRequest(tool: "record_event", payload: payload)
        )

        let (_, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw TransportError.nonHTTPResponse
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw TransportError.unsuccessfulStatus(httpResponse.statusCode)
        }
    }
}
```

- [x] **Step 3: Verify HTTP transport tests**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test --filter MemoryMCPHTTPTransportTests`

Expected: PASS.

- [x] **Step 4: Commit**

```bash
git add Sources/AgentMemoryCore/MemoryMCPHTTPTransport.swift Tests/AgentMemoryCoreTests/MemoryMCPHTTPTransportTests.swift
git commit -m "Add Memory MCP HTTP transport skeleton"
```

---

### Task 3: Settings Scene

**Files:**
- Create: `Sources/AgentMemoryApp/AgentMemorySettingsView.swift`
- Modify: `Sources/AgentMemoryApp/AgentMemoryViewModel.swift`
- Modify: `Sources/AgentMemoryApp/AgentMemoryApp.swift`

- [x] **Step 1: Add config to view model**

Add to `AgentMemoryViewModel`:

```swift
    var config: AgentMemoryConfig
```

Change the initializer signature to:

```swift
    init(
        store: AgentMemoryDiskStore,
        initialSnapshot: AgentMemorySnapshot = AgentMemorySnapshot(),
        initialConfig: AgentMemoryConfig = AgentMemoryConfig(),
        processingService: CaptureProcessingService? = nil
    ) {
        self.store = store
        self.snapshot = initialSnapshot
        self.config = initialConfig
        self.processingService = processingService ?? CaptureProcessingService(
            archive: SourceArchive(root: store.sourceArchiveRoot),
            memoryWriter: MockMemoryWriter()
        )
    }
```

In the convenience initializer, after `load()`, call `loadConfig()`.

Add methods:

```swift
    func saveConfig() {
        do {
            try store.saveConfig(config)
            statusMessage = "Saved Memory MCP settings."
        } catch {
            statusMessage = "Settings save failed: \(error.localizedDescription)"
        }
    }

    func loadConfig() {
        do {
            config = try store.loadConfig()
        } catch {
            statusMessage = "Settings load failed: \(error.localizedDescription)"
        }
    }
```

- [x] **Step 2: Add settings view**

Create `Sources/AgentMemoryApp/AgentMemorySettingsView.swift`:

```swift
import SwiftUI

struct AgentMemorySettingsView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        Form {
            Section("Memory MCP") {
                TextField("Endpoint URL", text: $viewModel.config.memoryMCPEndpoint)
                    .textFieldStyle(.roundedBorder)
                TextField("Agent name", text: $viewModel.config.agentName)
                    .textFieldStyle(.roundedBorder)
                Toggle("Enable live Memory MCP writes", isOn: $viewModel.config.liveMemoryWritesEnabled)
                Button("Save Settings") {
                    viewModel.saveConfig()
                }
            }

            Section("Status") {
                Text(viewModel.config.liveMemoryWritesEnabled ? "Live writes enabled" : "Live writes disabled")
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .frame(width: 460)
    }
}
```

- [x] **Step 3: Add Settings scene**

Modify `AgentMemoryApp.swift`:

```swift
import SwiftUI

@main
struct AgentMemoryApp: App {
    @State private var viewModel = AgentMemoryViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }

        Settings {
            AgentMemorySettingsView(viewModel: viewModel)
        }
    }
}
```

Modify `ContentView` so its stored model is injected:

```swift
    @Bindable var viewModel: AgentMemoryViewModel
```

Remove the local `@State private var viewModel = AgentMemoryViewModel()` line.

- [x] **Step 4: Verify app builds**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: PASS.

- [x] **Step 5: Commit**

```bash
git add Sources/AgentMemoryApp/AgentMemoryViewModel.swift Sources/AgentMemoryApp/AgentMemorySettingsView.swift Sources/AgentMemoryApp/AgentMemoryApp.swift Sources/AgentMemoryApp/ContentView.swift
git commit -m "Add Memory MCP settings scene"
```

---

### Task 4: README And PR

**Files:**
- Modify: `README.md`
- Modify: `docs/superpowers/plans/2026-06-19-agentmemory-memory-mcp-settings.md`

- [x] **Step 1: Update README**

Add to the current build slice list:

```markdown
- Memory MCP endpoint settings and HTTP transport skeleton
```

- [x] **Step 2: Mark plan complete**

Change completed checklist items in this plan from `- [ ]` to `- [x]`.

- [x] **Step 3: Final verification**

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift test`

Expected: all tests pass.

Run: `DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer swift build`

Expected: build succeeds.

- [x] **Step 4: Commit docs**

```bash
git add README.md docs/superpowers/plans/2026-06-19-agentmemory-memory-mcp-settings.md
git commit -m "Document Memory MCP settings"
```

- [x] **Step 5: Push and open PR**

```bash
git push -u origin codex/agentmemory-memory-mcp-settings
```

Open a draft PR titled `[codex] Add Memory MCP settings`.

---

## Self-Review

Spec coverage:

- Endpoint config: persisted config and macOS settings scene.
- Live transport boundary: URLSession HTTP skeleton with tests.
- Safety: live writes default off and the app still uses mock processing until an explicit enablement slice connects config to processing.
- MCP protocol fidelity: this is a transport-shaped skeleton; full MCP initialize/session semantics remain a future slice.

Placeholder scan: all implementation steps include exact code and verification commands.

Type consistency: `AgentMemoryConfig`, `MemoryMCPHTTPTransport`, and settings view model APIs are introduced before use.
