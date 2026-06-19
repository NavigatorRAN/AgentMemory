import AgentMemoryCore
import SwiftUI

struct ContentView: View {
    @State private var snapshot: AgentMemorySnapshot = ContentView.sampleSnapshot

    private static var sampleSnapshot: AgentMemorySnapshot {
        AgentMemorySnapshot(
            items: [
                CaptureItem(
                    displayName: "WWDC workflow URL",
                    rawInput: "https://developer.apple.com/videos/play/wwdc2026/101",
                    sourceType: .video,
                    status: .complete,
                    proposedOutcomes: [.decision, .reference],
                    confidence: 0.9
                ),
                CaptureItem(
                    displayName: "Terminal failure log",
                    rawInput: "fatal error: Memory MCP unreachable",
                    sourceType: .codeOrLog,
                    status: .needsReview,
                    proposedOutcomes: [.gotcha, .reference],
                    confidence: 0.74
                ),
                CaptureItem(
                    displayName: "Mixed source stack",
                    rawInput: "/Users/matthewwarren/Desktop/research-stack",
                    sourceType: .mixedBatch,
                    status: .queued,
                    proposedOutcomes: [],
                    confidence: 0
                )
            ],
            rules: [
                IngestionRule(
                    name: "WWDC videos",
                    sourceType: .video,
                    matchText: "developer.apple.com/videos",
                    workspace: "WWDC26",
                    actions: [.autoWriteMemory, .exportToRAG]
                )
            ]
        )
    }

    private var brief: MorningBrief {
        MorningBriefBuilder().build(from: snapshot.items)
    }

    var body: some View {
        NavigationSplitView {
            List {
                Section("Capture Inbox") {
                    ForEach(snapshot.items) { item in
                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.displayName)
                                .font(.headline)
                            HStack {
                                Text(item.sourceType.rawValue)
                                Text(item.status.rawValue)
                            }
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("AgentMemory")
        } detail: {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    header
                    queueSummary
                    morningBrief
                    graphPlaceholder
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Agent Memory Ingestion Hub")
                .font(.largeTitle.bold())
            Text("Capture mixed data stacks, route them through rules and confidence gates, then write curated memory to Memory MCP.")
                .foregroundStyle(.secondary)
        }
    }

    private var queueSummary: some View {
        Grid(alignment: .leading, horizontalSpacing: 18, verticalSpacing: 10) {
            GridRow {
                metric("Processed", brief.processedCount)
                metric("Completed", brief.completedCount)
                metric("Review", brief.needsReviewCount)
                metric("Failed", brief.failedCount)
            }
        }
    }

    private func metric(_ title: String, _ value: Int) -> some View {
        VStack(alignment: .leading) {
            Text("\(value)")
                .font(.title.bold())
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(minWidth: 110, alignment: .leading)
        .padding()
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
    }

    private var morningBrief: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Morning Brief")
                .font(.title2.bold())

            ForEach(brief.exceptions, id: \.self) { exception in
                Label(exception, systemImage: "exclamationmark.triangle")
            }

            ForEach(brief.graphChanges, id: \.self) { change in
                Label(change, systemImage: "point.3.connected.trianglepath.dotted")
            }
        }
    }

    private var graphPlaceholder: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Graph Changes")
                .font(.title2.bold())
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.quaternary)
                    .frame(height: 220)
                Text("3D graph renderer lands after the core queue and memory-write path.")
                    .foregroundStyle(.secondary)
            }
        }
    }
}
