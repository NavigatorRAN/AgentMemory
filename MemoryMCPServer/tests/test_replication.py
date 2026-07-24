from __future__ import annotations

import json
import sqlite3

import pytest
import frontmatter

from memory_mcp.revisions import (
    ImmutableObject,
    MemoryRevision,
    canonical_json_bytes,
    sha256_id,
)
from memory_mcp.storage import Storage
from memory_mcp import queries


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


def _sealed_envelope(
    source_node_id: str,
    items: list[tuple[MemoryRevision, ImmutableObject]],
    *,
    from_cursor: int = 0,
) -> dict:
    revisions = []
    objects = {}
    for offset, (revision, value) in enumerate(items, start=1):
        encoded = revision.to_dict()
        encoded["sequence"] = from_cursor + offset
        revisions.append(encoded)
        objects[value.object_id] = value.to_dict()
    envelope = {
        "schema_version": 1,
        "source_node_id": source_node_id,
        "from_cursor": from_cursor,
        "to_cursor": from_cursor + len(items),
        "has_more": False,
        "revisions": revisions,
        "objects": objects,
        "contracts": [],
    }
    envelope["envelope_id"] = sha256_id(canonical_json_bytes(envelope))
    return envelope


def _journal_state(storage: Storage) -> tuple:
    journal = storage.revision_journal
    return (
        journal.journal_path.read_bytes(),
        journal.heads_path.read_bytes(),
        journal.conflicts_path.read_bytes(),
        tuple(sorted(str(path.relative_to(journal.replication_dir)) for path in journal.objects_dir.rglob("*.json"))),
        tuple(sorted(str(path.relative_to(journal.replication_dir)) for path in journal.revisions_dir.rglob("*.json"))),
    )


def test_local_writes_create_immutable_journal_objects_and_unique_event_ids(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")

    first = _record(storage, "First event")
    second = _record(storage, "Second event")

    assert first["id"] != second["id"]
    assert storage.revision_journal.revision_count == 2
    page = storage.revision_journal.export_envelope(cursor=0, limit=10)
    assert [item["subject_id"] for item in page["revisions"]] == [first["id"], second["id"]]
    assert [item["payload"]["eventId"] for item in page["contracts"]] == [
        revision["revision_id"] for revision in page["revisions"]
    ]
    assert all(item["classification"] == "OFFICIAL" for item in page["contracts"])
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


@pytest.mark.parametrize(
    ("subject_type", "subject_id", "kind", "payload"),
    [
        (
            "event",
            "01K10QH8AF7M8N8VP1KX3J4H5T",
            "entity",
            {"name": "memory-mcp", "content": "Body", "frontmatter": {}},
        ),
        (
            "entity",
            "memory-mcp",
            "entity",
            {"name": "different", "content": "Body", "frontmatter": {}},
        ),
        (
            "entity",
            "memory-mcp",
            "tombstone",
            {
                "target_type": "entity",
                "target_id": "different",
                "deleted_at": "2026-07-24T10:00:00+00:00",
                "retain_until": "2026-10-22T10:00:00+00:00",
                "prior_object_id": "sha256:" + "a" * 64,
            },
        ),
    ],
)
def test_import_preflight_rejects_object_kind_and_subject_identity_mismatches(
    tmp_path,
    subject_type,
    subject_id,
    kind,
    payload,
):
    target = Storage(tmp_path / "target", node_id="node:target")
    value = ImmutableObject.create(kind=kind, payload=payload)
    revision = MemoryRevision.create(
        node_id="node:source",
        subject_type=subject_type,
        subject_id=subject_id,
        object_id=value.object_id,
        parent_ids=[],
        created_at="2026-07-24T10:00:00+00:00",
    )
    before = _journal_state(target)

    with pytest.raises(ValueError):
        target.revision_journal.import_envelope(
            _sealed_envelope("node:source", [(revision, value)])
        )

    assert _journal_state(target) == before


def test_import_preflight_rejects_revision_node_different_from_envelope_source(tmp_path):
    target = Storage(tmp_path / "target", node_id="node:target")
    value = ImmutableObject.create(
        kind="entity",
        payload={"name": "memory-mcp", "content": "Body", "frontmatter": {}},
    )
    revision = MemoryRevision.create(
        node_id="node:attacker",
        subject_type="entity",
        subject_id="memory-mcp",
        object_id=value.object_id,
        parent_ids=[],
        created_at="2026-07-24T10:00:00+00:00",
    )
    before = _journal_state(target)

    with pytest.raises(ValueError, match="source"):
        target.revision_journal.import_envelope(
            _sealed_envelope("node:source", [(revision, value)])
        )

    assert _journal_state(target) == before


def test_import_preflight_rejects_parent_from_different_subject(tmp_path):
    target = Storage(tmp_path / "target", node_id="node:target")
    target.upsert_entity("alpha", "A", {}, "create")
    target.upsert_entity("bravo", "B", {}, "create")
    bravo_head = target.revision_journal._heads()["entity:bravo"][0]
    value = ImmutableObject.create(
        kind="entity",
        payload={"name": "alpha", "content": "Changed", "frontmatter": {"entity": "alpha"}},
    )
    revision = MemoryRevision.create(
        node_id="node:source",
        subject_type="entity",
        subject_id="alpha",
        object_id=value.object_id,
        parent_ids=[bravo_head],
        created_at="2026-07-24T10:00:00+00:00",
    )
    before = _journal_state(target)

    with pytest.raises(ValueError, match="parent"):
        target.revision_journal.import_envelope(
            _sealed_envelope("node:source", [(revision, value)])
        )

    assert _journal_state(target) == before


def test_import_preflight_rejects_invalid_event_materialization_without_mutation(tmp_path):
    target = Storage(tmp_path / "target", node_id="node:target")
    subject_id = "01K10QH8AF7M8N8VP1KX3J4H5T"
    post = frontmatter.Post(
        "Body",
        id="01K10QH8AF7M8N8VP1KX3J4H5V",
        event_date="2026-07-24T10:00:00+00:00",
        recorded_at="2026-07-24T10:00:00+00:00",
        entities=["memory-mcp"],
        tags=[],
        agent="CODEX",
    )
    value = ImmutableObject.create(
        kind="event",
        payload={
            "id": subject_id,
            "event_date": "2026-07-24T10:00:00+00:00",
            "recorded_at": "2026-07-24T10:00:00+00:00",
            "entities": ["memory-mcp"],
            "tags": [],
            "agent": "CODEX",
            "content": "Body",
            "markdown": frontmatter.dumps(post),
        },
    )
    revision = MemoryRevision.create(
        node_id="node:source",
        subject_type="event",
        subject_id=subject_id,
        object_id=value.object_id,
        parent_ids=[],
        created_at="2026-07-24T10:00:00+00:00",
    )
    before = _journal_state(target)

    with pytest.raises(ValueError, match="material"):
        target.revision_journal.import_envelope(
            _sealed_envelope("node:source", [(revision, value)])
        )

    assert _journal_state(target) == before
    assert list(target.iter_events()) == []


def test_envelope_import_is_all_or_nothing_when_later_item_is_invalid(tmp_path):
    target = Storage(tmp_path / "target", node_id="node:target")
    event_id = "01K10QH8AF7M8N8VP1KX3J4H5T"
    post = frontmatter.Post(
        "Valid",
        id=event_id,
        event_date="2026-07-24T10:00:00+00:00",
        recorded_at="2026-07-24T10:00:00+00:00",
        entities=["memory-mcp"],
        tags=[],
        agent="CODEX",
    )
    valid_object = ImmutableObject.create(
        kind="event",
        payload={
            "id": event_id,
            "event_date": "2026-07-24T10:00:00+00:00",
            "recorded_at": "2026-07-24T10:00:00+00:00",
            "entities": ["memory-mcp"],
            "tags": [],
            "agent": "CODEX",
            "content": "Valid",
            "markdown": frontmatter.dumps(post),
        },
    )
    valid_revision = MemoryRevision.create(
        node_id="node:source",
        subject_type="event",
        subject_id=event_id,
        object_id=valid_object.object_id,
        parent_ids=[],
        created_at="2026-07-24T10:00:00+00:00",
    )
    invalid_object = ImmutableObject.create(
        kind="entity",
        payload={"name": "wrong", "content": "Invalid", "frontmatter": {}},
    )
    invalid_revision = MemoryRevision.create(
        node_id="node:source",
        subject_type="entity",
        subject_id="expected",
        object_id=invalid_object.object_id,
        parent_ids=[],
        created_at="2026-07-24T10:00:01+00:00",
    )
    before = _journal_state(target)

    with pytest.raises(ValueError):
        target.revision_journal.import_envelope(
            _sealed_envelope(
                "node:source",
                [
                    (valid_revision, valid_object),
                    (invalid_revision, invalid_object),
                ],
            )
        )

    assert _journal_state(target) == before
    assert list(target.iter_events()) == []


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
    source.upsert_entity(
        "Memory MCP",
        "Common",
        {"type": "service", "owner": "team", "display_name": "Shared"},
        "create",
    )
    initial, _ = _sync(source, target)

    source.upsert_entity(
        "Memory MCP",
        "Source branch",
        {"type": "source-type", "owner": "source", "display_name": "Source Name"},
        "replace",
    )
    target.upsert_entity(
        "Memory MCP",
        "Target branch",
        {"type": "target-type", "owner": "target", "display_name": "Target Name"},
        "replace",
    )
    source_update = source.revision_journal.export_envelope(
        cursor=initial["to_cursor"], limit=10
    )
    result = target.revision_journal.import_envelope(source_update)

    assert result["conflicts"] == 1
    assert target.read_entity("memory-mcp", include_conflicts=True)["content"] == "Target branch"
    unattended = target.read_entity("memory-mcp")
    assert "content" not in unattended
    assert "display_name" not in unattended
    assert "owner" not in unattended["frontmatter"]
    assert "display_name" not in unattended["frontmatter"]
    assert "type" not in unattended["frontmatter"]
    assert unattended["conflicted_fields"] == [
        "content",
        "metadata.display_name",
        "metadata.owner",
        "metadata.type",
    ]
    iterated = next(target.iter_entities())
    assert "content" not in iterated
    assert "display_name" not in iterated
    assert "type" not in iterated
    listed = queries.list_entities(target, prefix=None, type_filter=None)[0]
    assert "display_name" not in listed
    assert "type" not in listed

    target.rebuild_query_index()
    with sqlite3.connect(target.query_index.db_path) as connection:
        indexed = connection.execute(
            "SELECT display_name, type, content FROM entities WHERE name = 'memory-mcp'"
        ).fetchone()
    assert indexed == ("", "", "")

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


def test_backup_restore_captures_descendant_revision_matching_restored_markdown(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    storage.upsert_entity(
        "Memory MCP",
        "Version one",
        {"type": "service", "owner": "v1"},
        "create",
    )
    backup = storage.revision_journal.create_backup()
    storage.upsert_entity(
        "Memory MCP",
        "Version two",
        {"type": "service", "owner": "v2"},
        "replace",
    )
    version_two_head = storage.revision_journal._heads()["entity:memory-mcp"][0]

    storage.revision_journal.restore_backup(backup["backup_id"])

    restored = storage.read_entity("memory-mcp")
    restored_head = storage.revision_journal._heads()["entity:memory-mcp"]
    restored_revision = storage.revision_journal.get_revision(restored_head[0])
    restored_object = storage.revision_journal.get_object(restored_revision.object_id)
    assert restored["content"] == "Version one"
    assert restored["frontmatter"]["owner"] == "v1"
    assert restored_head == [restored_revision.revision_id]
    assert restored_revision.parent_ids == (version_two_head,)
    assert restored_object.kind == "entity"
    assert restored_object.payload["content"] == "Version one"
    assert restored_object.payload["frontmatter"]["owner"] == "v1"
    assert storage.revision_journal.list_conflicts() == []
    restored_count = storage.revision_journal.revision_count
    storage.revision_journal.restore_backup(backup["backup_id"])
    assert storage.revision_journal.revision_count == restored_count


def test_backup_restore_captures_changed_existing_event_as_descendant(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    recorded = storage.record_event(
        content="Stable title\nVersion one",
        entities=["Memory MCP"],
        event_date="2026-07-24T10:00:00+00:00",
        tags=["backup"],
        agent="CODEX",
    )
    backup = storage.revision_journal.create_backup()
    event_path = storage.events_dir / recorded["path"]
    version_two_post = frontmatter.load(event_path)
    version_two_post.content = "Stable title\nVersion two"
    version_two_markdown = frontmatter.dumps(version_two_post)
    storage._atomic_write_text(event_path, version_two_markdown)
    storage.revision_journal.capture_event(
        {
            "id": recorded["id"],
            "event_date": str(version_two_post.metadata["event_date"]),
            "recorded_at": str(version_two_post.metadata["recorded_at"]),
            "entities": list(version_two_post.metadata["entities"]),
            "tags": list(version_two_post.metadata["tags"]),
            "agent": version_two_post.metadata["agent"],
            "content": version_two_post.content,
        },
        version_two_markdown,
    )
    version_two_head = storage.revision_journal._heads()[
        f"event:{recorded['id']}"
    ][0]

    storage.revision_journal.restore_backup(backup["backup_id"])

    restored_head = storage.revision_journal._heads()[f"event:{recorded['id']}"]
    restored_revision = storage.revision_journal.get_revision(restored_head[0])
    restored_object = storage.revision_journal.get_object(restored_revision.object_id)
    assert next(storage.iter_events())["content"] == "Stable title\nVersion one"
    assert restored_revision.parent_ids == (version_two_head,)
    assert restored_object.payload["content"] == "Stable title\nVersion one"
    assert restored_object.payload["markdown"] == event_path.read_text(encoding="utf-8")

    target = Storage(tmp_path / "target", node_id="node:target")
    result = target.revision_journal.import_envelope(
        storage.revision_journal.export_envelope(cursor=0, limit=10)
    )
    assert result["conflicts"] == 0
    assert next(target.iter_events())["content"] == "Stable title\nVersion one"


def test_backup_restore_rolls_back_markdown_and_journal_atomically_on_capture_failure(
    tmp_path,
    monkeypatch,
):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    for name in ("Alpha", "Bravo"):
        storage.upsert_entity(name, f"{name} v1", {"owner": "v1"}, "create")
    backup = storage.revision_journal.create_backup()
    for name in ("Alpha", "Bravo"):
        storage.upsert_entity(name, f"{name} v2", {"owner": "v2"}, "replace")

    before = _journal_state(storage)
    before_markdown = {
        path: path.read_bytes()
        for path in sorted(storage.entities_dir.glob("*.md"))
    }
    real_accept = storage.revision_journal._accept_revision_locked
    calls = 0

    def fail_second_capture(revision, value, *, materialize):
        nonlocal calls
        calls += 1
        if calls == 2:
            raise OSError("injected restore capture failure")
        return real_accept(revision, value, materialize=materialize)

    monkeypatch.setattr(
        storage.revision_journal,
        "_accept_revision_locked",
        fail_second_capture,
    )

    with pytest.raises(OSError, match="injected"):
        storage.revision_journal.restore_backup(backup["backup_id"])

    assert _journal_state(storage) == before
    assert {
        path: path.read_bytes()
        for path in sorted(storage.entities_dir.glob("*.md"))
    } == before_markdown
    assert storage.read_entity("alpha")["content"] == "Alpha v2"
    assert storage.read_entity("bravo")["content"] == "Bravo v2"


def test_repeated_tombstone_call_returns_existing_revision_without_new_journal_entry(tmp_path):
    storage = Storage(tmp_path / "vault", node_id="node:mac")
    storage.upsert_entity("Memory MCP", "Delete once", {}, "create")

    first = storage.revision_journal.tombstone("entity", "memory-mcp")
    count = storage.revision_journal.revision_count
    second = storage.revision_journal.tombstone("entity", "memory-mcp")

    assert second == first
    assert storage.revision_journal.revision_count == count


def test_existing_markdown_is_backfilled_once_without_rewriting_canonical_files(tmp_path):
    root = tmp_path / "legacy"
    event_dir = root / "events" / "2026" / "07"
    entity_dir = root / "entities"
    event_dir.mkdir(parents=True)
    entity_dir.mkdir(parents=True)
    event_id = "01K10QH8AF7M8N8VP1KX3J4H5T"
    event_post = frontmatter.Post(
        "Legacy event",
        id=event_id,
        event_date="2026-07-24T10:00:00+00:00",
        recorded_at="2026-07-24T10:01:00+00:00",
        entities=["memory-mcp"],
        tags=["legacy"],
        agent="CODEX",
    )
    entity_post = frontmatter.Post(
        "Legacy entity",
        entity="memory-mcp",
        display_name="Memory MCP",
        type="service",
        first_seen="2026-07-20T00:00:00+00:00",
        aliases=[],
    )
    event_path = event_dir / f"24-{event_id[-8:].lower()}-legacy-event.md"
    entity_path = entity_dir / "memory-mcp.md"
    event_path.write_text(frontmatter.dumps(event_post), encoding="utf-8")
    entity_path.write_text(frontmatter.dumps(entity_post), encoding="utf-8")
    original_event = event_path.read_bytes()
    original_entity = entity_path.read_bytes()

    first = Storage(root, node_id="node:legacy")
    first_manifest = first.revision_journal.manifest()
    reopened = Storage(root, node_id="node:legacy")

    assert first_manifest["revision_count"] == 2
    assert reopened.revision_journal.revision_count == 2
    assert event_path.read_bytes() == original_event
    assert entity_path.read_bytes() == original_entity
    assert first.revision_journal.backfill_path.is_file()


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
