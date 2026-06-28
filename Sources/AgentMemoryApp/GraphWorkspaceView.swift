import AgentMemoryCore
import SwiftUI

struct GraphWorkspaceView: View {
    @Bindable var viewModel: AgentMemoryViewModel
    @State private var graphYaw = 0.0
    @State private var graphPitch = -0.32
    @State private var graphZoom = 1.0
    @State private var graphAutoRotates = true
    @GestureState private var graphDrag: CGSize = .zero
    @GestureState private var graphMagnification = 1.0

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
                HStack(spacing: 8) {
                    Button {
                        graphZoom = max(0.45, graphZoom - 0.15)
                    } label: {
                        Image(systemName: "minus.magnifyingglass")
                    }
                    .help("Zoom out")

                    Slider(value: $graphZoom, in: 0.45...3.5)
                        .frame(width: 120)

                    Button {
                        graphZoom = min(3.5, graphZoom + 0.15)
                    } label: {
                        Image(systemName: "plus.magnifyingglass")
                    }
                    .help("Zoom in")

                    Button {
                        graphAutoRotates.toggle()
                    } label: {
                        Image(systemName: graphAutoRotates ? "pause.circle" : "play.circle")
                    }
                    .help(graphAutoRotates ? "Pause rotation" : "Resume rotation")
                }
                .buttonStyle(.borderless)
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
                        WorkspaceMetric(title: "Groups", value: graphCommunityCount)
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
                    ForEach(inspectorNodes, id: \.id) { node in
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
                                Text(node.community)
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
            TimelineView(.animation) { timeline in
                Canvas { context, size in
                    let projection = MemoryMCPGraphViewportProjector().project(
                        scene,
                        width: size.width,
                        height: size.height,
                        padding: 44,
                        camera: camera(for: timeline.date)
                    )
                    let markers = MemoryMCPGraphViewportNodeMarkerBuilder().markers(
                        from: projection,
                        selectedNodeID: selectedNodeID
                    )
                    let markerByID = Dictionary(uniqueKeysWithValues: markers.map { ($0.id, $0) })
                    let visibleEdges = visibleEdgeSegments(
                        projection.edgeSegments,
                        markerByID: markerByID,
                        selectedNodeID: selectedNodeID
                    )

                    for segment in visibleEdges {
                        guard let source = markerByID[segment.sourceID],
                              let target = markerByID[segment.targetID]
                        else {
                            continue
                        }
                        var path = Path()
                        path.move(to: CGPoint(x: segment.source.x, y: segment.source.y))
                        path.addLine(to: CGPoint(x: segment.target.x, y: segment.target.y))
                        let opacity = selectedNodeID == nil
                            ? 0.045 + (min(source.importance, target.importance) * 0.08)
                            : 0.2 + (max(source.importance, target.importance) * 0.18)
                        context.stroke(
                            path,
                            with: .color(graphCommunityColor(for: source.communityIndex).opacity(opacity)),
                            lineWidth: selectedNodeID == nil ? 0.55 : 1.1
                        )
                    }

                    for marker in markers.sorted(by: { $0.depth < $1.depth }) {
                        let color = graphCommunityColor(for: marker.communityIndex)
                        if let selectionRingRadius = marker.selectionRingRadius {
                            let ringRect = CGRect(
                                x: marker.point.x - selectionRingRadius,
                                y: marker.point.y - selectionRingRadius,
                                width: selectionRingRadius * 2,
                                height: selectionRingRadius * 2
                            )
                            context.stroke(
                                Path(ellipseIn: ringRect),
                                with: .color(.accentColor.opacity(0.95)),
                                lineWidth: 2.4
                            )
                        }

                        let depthOpacity = 0.48 + (min(max((marker.depth + 180) / 360, 0), 1) * 0.42)
                        let rect = CGRect(
                            x: marker.point.x - marker.radius,
                            y: marker.point.y - marker.radius,
                            width: marker.radius * 2,
                            height: marker.radius * 2
                        )
                        context.fill(
                            Path(ellipseIn: rect),
                            with: .color(color.opacity(depthOpacity))
                        )
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .drawingGroup()
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 2)
                    .updating($graphDrag) { value, state, _ in
                        state = value.translation
                    }
                    .onEnded { value in
                        graphYaw += Double(value.translation.width) * 0.006
                        graphPitch = clampedPitch(graphPitch + (Double(value.translation.height) * 0.006))
                    }
            )
            .simultaneousGesture(
                MagnificationGesture()
                    .updating($graphMagnification) { value, state, _ in
                        state = value
                    }
                    .onEnded { value in
                        graphZoom = max(0.45, min(3.5, graphZoom * value))
                    }
            )
            .simultaneousGesture(
                SpatialTapGesture()
                    .onEnded { value in
                        let projection = MemoryMCPGraphViewportProjector().project(
                            scene,
                            width: geometry.size.width,
                            height: geometry.size.height,
                            padding: 44,
                            camera: camera(for: Date())
                        )
                        let tapPoint = MemoryMCPGraphPoint2D(
                            x: value.location.x,
                            y: value.location.y
                        )
                        let hit = MemoryMCPGraphViewportHitTester().hitNode(
                            in: projection,
                            point: tapPoint,
                            radius: 18
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

    private var graphCommunityCount: Int {
        Set(viewModel.memoryGraphScene.nodes.map(\.community)).count
    }

    private var inspectorNodes: [MemoryMCPGraphSceneNode] {
        Array(viewModel.memoryGraphScene.nodes.sorted { lhs, rhs in
            if lhs.importance == rhs.importance {
                return lhs.label < rhs.label
            }
            return lhs.importance > rhs.importance
        }.prefix(300))
    }

    private func camera(for date: Date) -> MemoryMCPGraphCamera {
        let automaticYaw = graphAutoRotates && viewModel.selectedMemoryGraphNodeID == nil
            ? date.timeIntervalSinceReferenceDate * 0.035
            : 0
        return MemoryMCPGraphCamera(
            yaw: graphYaw + automaticYaw + (Double(graphDrag.width) * 0.006),
            pitch: clampedPitch(graphPitch + (Double(graphDrag.height) * 0.006)),
            zoom: graphZoom * graphMagnification
        )
    }

    private func visibleEdgeSegments(
        _ segments: [MemoryMCPGraphViewportEdgeSegment],
        markerByID: [String: MemoryMCPGraphViewportNodeMarker],
        selectedNodeID: String?
    ) -> [MemoryMCPGraphViewportEdgeSegment] {
        if let selectedNodeID {
            return Array(segments.filter {
                $0.sourceID == selectedNodeID || $0.targetID == selectedNodeID
            }.prefix(1_200))
        }

        let importantNodeIDs = Set(markerByID.values
            .sorted { lhs, rhs in
                if lhs.importance == rhs.importance {
                    return lhs.id < rhs.id
                }
                return lhs.importance > rhs.importance
            }
            .prefix(220)
            .map(\.id))

        return Array(segments.filter {
            importantNodeIDs.contains($0.sourceID) || importantNodeIDs.contains($0.targetID)
        }.prefix(2_400))
    }

    private func clampedPitch(_ value: Double) -> Double {
        max(-1.15, min(1.15, value))
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

    private func graphCommunityColor(for index: Int) -> Color {
        let palette: [Color] = [
            .cyan,
            .pink,
            .yellow,
            .green,
            .purple,
            .orange,
            .blue,
            .mint,
            .red,
            .teal,
            .indigo,
            Color(red: 0.86, green: 0.42, blue: 0.08),
            Color(red: 0.42, green: 0.72, blue: 0.24),
            Color(red: 0.74, green: 0.44, blue: 0.96),
            Color(red: 0.98, green: 0.48, blue: 0.70),
            Color(red: 0.25, green: 0.68, blue: 0.88)
        ]
        return palette[abs(index) % palette.count]
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
