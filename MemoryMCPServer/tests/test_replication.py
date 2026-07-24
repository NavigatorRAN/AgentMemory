from __future__ import annotations

import sqlite3

import pytest

from memory_mcp.revisions import ImmutableObject, MemoryRevision
from memory_mcp.storage import Storage


def _record(storage: Storage, text: str) -> dict:
    return storage.record_event(
        content=text,
        entities=["Memory MCP"],
        event_date="2026-07-24T10:00:00+00:00",
        tags=["replication"],
        agent="CODEX",
    )


def _sync(source: Storage, target: Storage, cursor: int = 0, limit: int = 50):
    envelope = source.revision_journal.export_envelope(cursor=cursor, limit=limit)
    result = target.revision_journal.import_envelope(envelope)
    return envelope, result


def test_local_writes_create_immutable_journal_objects_and_unique_event_ids(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")

    first = _record(storage, "First event")
    second = _record(storage, "Second event")

    assert first["id"] != second["id"]
    assert storage.revision_journal.revision_count == 2
    page = storage.revision_journal.export_envelope(cursor=0, limit=10)
    assert [item["subject_id"] for item in page["revisions"]] == [first["id"], second["id"]]
    for revision in page["revisions"]:
        object_path = storage.revision_journal.object_path(revision["object_id"])
        assert object_path.is_file()
        before = object_path.stat().st_mtime_ns
        storage.revision_journal.store_object(
            ImmutableObject.from_dict(page["objects"][revision["object_id"]])
        )
        assert object_path.stat().st_mtime_ns == before


def test_parent_validation_rejects_missing_revision(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    obj = ImmutableObject.create(
        kind="entity",
        payload={"name": "memory-mcp", "content": "Body", "frontmatter": {}},
    )
    revision = MemoryRevision.create(
        node_id="node:remote",
        subject_type="entity",
        subject_id="memory-mcp",
        object_id=obj.object_id,
        parent_ids=["sha256:" + "b" * 64],
        created_at="2026-07-24T10:00:00+00:00",
    )

    with pytest.raises(ValueError, match="parent"):
        storage.revision_journal.accept_revision(revision, obj)


def test_cursor_order_pagination_and_acknowledgement_are_bounded_and_resumable(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac", max_replication_items=2)
    for index in range(5):
        _record(storage, f"Event {index}")

    first = storage.revision_journal.export_envelope(cursor=0, limit=50)
    second = storage.revision_journal.export_envelope(cursor=first["to_cursor"], limit=50)

    assert len(first["revisions"]) == 2
    assert first["has_more"] is True
    assert first["to_cursor"] == 2
    assert [item["sequence"] for item in first["revisions"]] == [1, 2]
    assert [item["sequence"] for item in second["revisions"]] == [3, 4]

    acknowledgement = storage.revision_journal.acknowledge("node:home", second["to_cursor"])
    assert acknowledgement == {"peer_node_id": "node:home", "cursor": 4}
    assert storage.revision_journal.acknowledge("node:home", 3)["cursor"] == 4

    reopened = Storage(tmp_path / "vault")
    assert reopened.revision_journal.acknowledged_cursor("node:home") == 4


def test_append_only_events_merge_and_duplicate_delivery_is_idempotent(tmp_path):
    source = Storage(tmp_path / "source", node_id="node:source")
    target = Storage(tmp_path / "target", node_id="node:target")
    recorded = _record(source, "Replicated event")

    envelope, first = _sync(source, target)
    _, duplicate = _sync(source, target)

    assert first["accepted"] == 1
    assert duplicate["duplicates"] == 1
    assert [event["id"] for event in target.iter_events()] == [recorded["id"]]
    assert next(target.iter_events())["content"] == "Replicated event"
    assert target.revision_journal.revision_count == 1
    assert envelope["source_node_id"] == "node:source"


def test_entity_descendant_advances_without_conflict(tmp_path):
    source = Storage(tmp_path / "source", node_id="node:source")
    target = Storage(tmp_path / "target", node_id="node:target")
    source.upsert_entity("Memory MCP", "Version one", {"type": "service"}, "create")
    first, _ = _sync(source, target)

    source.upsert_entity("Memory MCP", "Version two", {"type": "service"}, "replace")
    _, result = _sync(source, target, cursor=first["to_cursor"])

    assert result["accepted"] == 1
    assert result["conflicts"] == 0
    assert target.read_entity("memory-mcp")["content"] == "Version two"
    assert target.revision_journal.list_conflicts() == []


def test_divergent_entities_create_conflict_without_last_write_wins(tmp_path):
    source = Storage(tmp_path / "source", node_id="node:source")
    target = Storage(tmp_path / "target", node_id="node:target")
    source.upsert_entity("Memory MCP", "Common", {"type": "service", "owner": "team"}, "create")
    initial, _ = _sync(source, target)

    source.upsert_entity(
        "Memory MCP", "Source branch", {"type": "service", "owner": "source"}, "replace"
    )
    target.upsert_entity(
        "Memory MCP", "Target branch", {"type": "service", "owner": "target"}, "replace"
    )
    source_update = source.revision_journal.export_envelope(
        cursor=initial["to_cursor"], limit=10
    )
    result = target.revision_journal.import_envelope(source_update)

    assert result["conflicts"] == 1
    assert target.read_entity("memory-mcp", include_conflicts=True)["content"] == "Target branch"
    unattended = target.read_entity("memory-mcp")
    assert "content" not in unattended
    assert "owner" not in unattended["frontmatter"]
    assert unattended["conflicted_fields"] == ["content", "metadata.owner"]

    conflict = target.revision_journal.list_conflicts()[0]
    assert len(conflict["revision_ids"]) == 2
    assert {branch["node_id"] for branch in conflict["branches"]} == {
        "node:source",
        "node:target",
    }


def test_explicit_resolution_merges_all_branches_and_restores_projection(tmp_path):
    source = Storage(tmp_path / "source", node_id="node:source")
    target = Storage(tmp_path / "target", node_id="node:target")
    source.upsert_entity("Memory MCP", "Common", {"owner": "team"}, "create")
    initial, _ = _sync(source, target)
    source.upsert_entity("Memory MCP", "Source", {"owner": "source"}, "replace")
    target.upsert_entity("Memory MCP", "Target", {"owner": "target"}, "replace")
    _sync(source, target, cursor=initial["to_cursor"])
    conflict = target.revision_journal.list_conflicts()[0]
    target_branch = next(
        branch for branch in conflict["branches"] if branch["node_id"] == "node:target"
    )

    resolution = target.revision_journal.resolve_conflict(
        subject_type="entity",
        subject_id="memory-mcp",
        chosen_revision_id=target_branch["revision_id"],
    )

    assert set(resolution["parent_ids"]) == set(conflict["revision_ids"])
    assert target.revision_journal.list_conflicts() == []
    assert target.read_entity("memory-mcp")["content"] == "Target"
    assert target.read_entity("memory-mcp")["frontmatter"]["owner"] == "target"


def test_tombstone_is_replicated_idempotent_retained_and_restorable_from_backup(tmp_path):
    source = Storage(
        tmp_path / "source",
        node_id="node:source",
        tombstone_retention_days=30,
    )
    target = Storage(tmp_path / "target", node_id="node:target")
    source.upsert_entity("Memory MCP", "Recover me", {"type": "service"}, "create")
    initial, _ = _sync(source, target)
    backup = source.revision_journal.create_backup()

    tombstone = source.revision_journal.tombstone("entity", "memory-mcp")
    assert source.read_entity("memory-mcp") is None
    assert tombstone["retain_until"] > tombstone["deleted_at"]
    envelope = source.revision_journal.export_envelope(
        cursor=initial["to_cursor"], limit=10
    )
    first = target.revision_journal.import_envelope(envelope)
    duplicate = target.revision_journal.import_envelope(envelope)

    assert first["accepted"] == 1
    assert duplicate["duplicates"] == 1
    assert target.read_entity("memory-mcp") is None

    restored = source.revision_journal.restore_backup(backup["backup_id"])
    assert restored["restored_files"] >= 1
    assert source.read_entity("memory-mcp")["content"] == "Recover me"


def test_revision_projection_is_rebuilt_into_sqlite_from_canonical_journal(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    _record(storage, "Indexed revision")
    storage.upsert_entity("Memory MCP", "Canonical", {"type": "service"}, "create")

    storage.rebuild_query_index()

    with sqlite3.connect(storage.query_index.db_path) as connection:
        revisions = connection.execute("SELECT COUNT(*) FROM memory_revisions").fetchone()[0]
        objects = connection.execute("SELECT COUNT(*) FROM memory_objects").fetchone()[0]
    assert revisions == 2
    assert objects == 2
