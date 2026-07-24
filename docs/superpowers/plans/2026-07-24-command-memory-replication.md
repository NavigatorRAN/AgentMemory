# Command Memory Replication Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development to implement this plan task-by-task with fresh implementation and review gates.

**Goal:** Extend Memory MCP with authenticated, revision-aware, conflict-safe replication between the Mac-local command authority and the home node.

**Architecture:** Markdown remains canonical and SQLite remains rebuildable. Add immutable content-addressed objects, stable node identities, parent-addressed entity revisions, append-only event exchange, resumable cursors, tombstones, and explicit conflicts. Buzz reaches the home node only through a pinned SSH tunnel and an authenticated loopback replication endpoint.

**Tech Stack:** Python 3.11+, FastMCP, SQLite, ULID, SHA-256, pytest, Swift 6 transport tests.

## Binding constraints

- Application authentication is mandatory for every replication endpoint.
- Append-only events merge automatically; stable entity changes are revisions with parent IDs.
- Divergent stable revisions create conflicts; last-write-wins is prohibited.
- Conflicted fields are excluded from unattended recall until explicit resolution.
- Delivery is bounded, resumable, idempotent, audited, and tombstone-aware.
- No replication request accepts a caller-supplied filesystem path.
- The Mac node accepts local writes immediately and synchronises asynchronously.

## Tasks

1. Add canonical immutable-object, revision, envelope, cursor, conflict, tombstone, and node-identity types with hash and lineage tests.
2. Add an atomic revision journal beside the canonical vault and rebuildable SQLite projections without breaking existing Markdown tools.
3. Add constant-time capability authentication, bounded replication HTTP endpoints, cursor acknowledgement, duplicate handling, conflict inspection/resolution, backup, and restore.
4. Add a loopback-only replication CLI supporting pull, push, resume, interrupted delivery, tombstones, and redacted diagnostics.
5. Run the full Memory MCP pytest suite, index rebuild tests, affected Swift tests, smoke fixtures, independent review, and recovery exercises before deployment.

The coordinating Buzz acceptance plan is
`NavigatorRAN/buzz:docs/superpowers/plans/2026-07-24-hmas-supply-command-console-phase-3.md`.
