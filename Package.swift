// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "AgentMemory",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "AgentMemoryCore", targets: ["AgentMemoryCore"]),
        .executable(name: "AgentMemory", targets: ["AgentMemoryApp"])
    ],
    targets: [
        .target(name: "AgentMemoryCore"),
        .executableTarget(
            name: "AgentMemoryApp",
            dependencies: ["AgentMemoryCore"]
        ),
        .testTarget(
            name: "AgentMemoryCoreTests",
            dependencies: ["AgentMemoryCore"]
        )
    ]
)
