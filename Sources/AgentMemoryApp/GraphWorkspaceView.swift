import AgentMemoryCore
import SwiftUI

struct GraphWorkspaceView: View {
    @Bindable var viewModel: AgentMemoryViewModel

    var body: some View {
        HSplitView {
            graphStage
                .frame(minWidth: 520)
            graphInspector
                .frame(minWidth: 260, idealWidth: 320, maxWidth: 380)
        }
        .task {
            if viewModel.canSearchMemoryMCP && !viewModel.hasMemoryGraphData {
                viewModel.refreshMemoryMCPGraphOverview()
            }
        }
    }

    private var graphStage: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Memory Graph")
                        .font(.largeTitle.bold())
                    Text("GraphRAG-inspired map of Memory MCP entities, events, sources, and evidence paths.")
                        .foregroundStyle(.secondary)
                }
                Spacer()
                if viewModel.selectedMemoryGraphNodeID != nil {
                    Button("Clear Focus") {
                        viewModel.clearMemoryGraphFocus()
                    }
                }
            }
            .padding([.top, .horizontal], 24)

            if viewModel.focusedMemoryGraph.nodes.isEmpty {
                WorkspaceEmptyState(
                    title: "No graph data loaded",
                    message: "Refresh the Memory MCP overview, or run a search to narrow the graph.",
                    systemImage: "point.3.connected.trianglepath.dotted"
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                graphCanvas(scene: viewModel.memoryGraphScene, selectedNodeID: viewModel.selectedMemoryGraphNodeID)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.quaternary.opacity(0.35), in: RoundedRectangle(cornerRadius: 8))
                    .padding([.horizontal, .bottom], 24)
            }
        }
    }

    private var graphInspector: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                WorkspacePanel(title: "Graph Overview") {
                    HStack(spacing: 10) {
                        WorkspaceMetric(title: "Nodes", value: viewModel.focusedMemoryGraph.nodes.count)
                        WorkspaceMetric(title: "Edges", value: viewModel.focusedMemoryGraph.edges.count)
                    }
                    HStack(spacing: 10) {
                        WorkspaceMetric(title: "Scene", value: viewModel.memoryGraphScene.nodes.count)
                        WorkspaceMetric(title: "Search", value: viewModel.memorySearchResults.count)
                    }
                }

                if let summary = viewModel.selectedMemoryGraphSummary {
                    WorkspacePanel(title: "Selected Node") {
                        Label(summary.label, systemImage: graphNodeIcon(for: summary.kind))
                            .font(.headline)
                        if let subtitle = summary.subtitle {
                            Text(subtitle)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        Text("Showing immediate neighbors across \(relationshipCountText(summary.connectedEdgeCount)).")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                }

                WorkspacePanel(title: "Graph Nodes") {
                    ForEach(viewModel.memoryGraphScene.nodes, id: \.id) { node in
                        Button {
                            viewModel.focusMemoryGraphNode(node.id)
                        } label: {
                            VStack(alignment: .leading, spacing: 4) {
                                Label(node.label, systemImage: graphNodeIcon(for: node.kind))
                                    .font(.headline)
                                    .lineLimit(2)
                                if let subtitle = node.subtitle {
                                    Text(subtitle)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        .lineLimit(2)
                                }
                                Text(scenePositionSummary(for: node.position))
                                    .font(.caption2)
                                    .foregroundStyle(.tertiary)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(8)
                            .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(18)
        }
    }

    private func graphCanvas(scene: MemoryMCPGraphScene, selectedNodeID: String?) -> some View {
        GeometryReader { geometry in
            Canvas { context, size in
                let projection = MemoryMCPGraphViewportProjector().project(
                    scene,
                    width: size.width,
                    height: size.height,
                    padding: 40
                )
                for segment in projection.edgeSegments {
                    var path = Path()
                    path.move(to: CGPoint(x: segment.source.x, y: segment.source.y))
                    path.addLine(to: CGPoint(x: segment.target.x, y: segment.target.y))
                    context.stroke(path, with: .color(.secondary.opacity(0.26)), lineWidth: 1)
                }

                let markers = MemoryMCPGraphViewportNodeMarkerBuilder().markers(
                    from: projection,
                    selectedNodeID: selectedNodeID
                )

                for marker in markers {
                    if let selectionRingRadius = marker.selectionRingRadius {
                        let ringRect = CGRect(
                            x: marker.point.x - selectionRingRadius,
                            y: marker.point.y - selectionRingRadius,
                            width: selectionRingRadius * 2,
                            height: selectionRingRadius * 2
                        )
                        context.stroke(
                            Path(ellipseIn: ringRect),
                            with: .color(.accentColor.opacity(0.9)),
                            lineWidth: 2
                        )
                    }

                    let rect = CGRect(
                        x: marker.point.x - marker.radius,
                        y: marker.point.y - marker.radius,
                        width: marker.radius * 2,
                        height: marker.radius * 2
                    )
                    context.fill(
                        Path(ellipseIn: rect),
                        with: .color(graphNodeColor(for: marker.kind).opacity(0.86))
                    )
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .contentShape(Rectangle())
            .gesture(
                SpatialTapGesture()
                    .onEnded { value in
                        let projection = MemoryMCPGraphViewportProjector().project(
                            scene,
                            width: geometry.size.width,
                            height: geometry.size.height,
                            padding: 40
                        )
                        let tapPoint = MemoryMCPGraphPoint2D(
                            x: value.location.x,
                            y: value.location.y
                        )
                        let hit = MemoryMCPGraphViewportHitTester().hitNode(
                            in: projection,
                            point: tapPoint,
                            radius: 16
                        )

                        if let nodeID = hit?.nodeID {
                            viewModel.focusMemoryGraphNode(nodeID)
                        } else {
                            viewModel.clearMemoryGraphFocus()
                        }
                    }
            )
        }
    }

    private func scenePositionSummary(for point: MemoryMCPGraphPoint3D) -> String {
        let x = point.x.formatted(.number.precision(.fractionLength(1)))
        let y = point.y.formatted(.number.precision(.fractionLength(1)))
        let z = point.z.formatted(.number.precision(.fractionLength(1)))
        return "x \(x), y \(y), z \(z)"
    }

    private func graphNodeIcon(for kind: MemoryMCPGraphNode.Kind) -> String {
        switch kind {
        case .entity:
            return "circle.hexagongrid"
        case .event:
            return "clock"
        case .wiki:
            return "doc.text"
        case .unknown:
            return "questionmark.circle"
        }
    }

    private func relationshipCountText(_ count: Int) -> String {
        count == 1 ? "1 relationship" : "\(count) relationships"
    }

    private func graphNodeColor(for kind: MemoryMCPGraphNode.Kind) -> Color {
        switch kind {
        case .entity:
            return .blue
        case .event:
            return .orange
        case .wiki:
            return .green
        case .unknown:
            return .secondary
        }
    }
}
