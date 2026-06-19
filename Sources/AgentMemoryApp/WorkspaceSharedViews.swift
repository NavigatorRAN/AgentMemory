import AgentMemoryCore
import SwiftUI

struct WorkspaceMetric: View {
    var title: String
    var value: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(value.formatted())
                .font(.title2.bold())
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(1)
        }
        .frame(minWidth: 96, alignment: .leading)
        .padding(10)
        .background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
    }
}

struct WorkspacePanel<Content: View>: View {
    var title: String
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.quaternary.opacity(0.55), in: RoundedRectangle(cornerRadius: 8))
    }
}

struct WorkspaceEmptyState: View {
    var title: String
    var message: String
    var systemImage: String

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: systemImage)
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Text(title)
                .font(.headline)
            Text(message)
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, minHeight: 180)
    }
}

func attemptSummary(for item: CaptureItem) -> String {
    guard let lastAttemptAt = item.lastAttemptAt else {
        return "\(item.attemptCount) attempts"
    }

    return "\(item.attemptCount) attempts, last \(lastAttemptAt.formatted(date: .abbreviated, time: .shortened))"
}

func ragExportSummary(for item: CaptureItem) -> String {
    guard let ragExport = item.ragExport else {
        return "Not exported"
    }

    var parts = [
        "Job #\(ragExport.jobID)",
        ragExport.collection,
        ragExport.exportedAt.formatted(date: .abbreviated, time: .shortened)
    ]

    if let remoteStatus = ragExport.remoteStatus {
        parts.append(remoteStatus)
    }

    if let chunksUpserted = ragExport.chunksUpserted {
        parts.append("\(chunksUpserted) chunks")
    }

    if let docID = ragExport.docID {
        parts.append(docID)
    }

    return parts.joined(separator: " | ")
}
