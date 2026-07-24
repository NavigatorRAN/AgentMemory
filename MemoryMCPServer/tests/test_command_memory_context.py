from __future__ import annotations

import json
from datetime import datetime
from pathlib import Path

import frontmatter
import pytest

import memory_mcp.command_context as command_context_module
from memory_mcp.command_context import (
    MAX_COMMAND_CONTEXT_CANDIDATES,
    MAX_COMMAND_CONTEXT_CONTENT_BYTES,
    MAX_COMMAND_CONTEXT_HEADS_BYTES,
    MAX_COMMAND_CONTEXT_RESPONSE_BYTES,
    MAX_COMMAND_CONTEXT_SCANNED_EVENTS,
    _bounded_revision_sequences,
    _candidate_event_ids,
    command_memory_context,
)
from memory_mcp.contracts import (
    validate_buzz_memory_revision,
    validate_buzz_replication_envelope,
)
from memory_mcp.revisions import (
    ImmutableObject,
    MemoryRevision,
    canonical_json_bytes,
)
from memory_mcp.storage import Storage


def _record(
    storage: Storage,
    content: str,
    *,
    entities: list[str] | None = None,
    event_date: str = "2020-01-02T03:04:05+00:00",
) -> dict:
    return storage.record_event(
        content=content,
        entities=entities or ["Memory MCP"],
        event_date=event_date,
        tags=["evidence"],
        agent="CODEX",
    )


def _event_descendant(
    storage: Storage,
    *,
    event_id: str,
    parent_id: str,
    node_id: str,
    content: str,
    created_at: str,
) -> tuple[MemoryRevision, ImmutableObject]:
    event_date = "2020-01-02T03:04:05+00:00"
    recorded_at = "2020-01-02T03:04:06+00:00"
    post = frontmatter.Post(
        content,
        id=event_id,
        event_date=event_date,
        recorded_at=recorded_at,
        entities=["memory-mcp"],
        tags=["evidence"],
        agent="CODEX",
    )
    value = ImmutableObject.create(
        kind="event",
        payload={
            "id": event_id,
            "event_date": event_date,
            "recorded_at": recorded_at,
            "entities": ["memory-mcp"],
            "tags": ["evidence"],
            "agent": "CODEX",
            "content": content,
            "markdown": frontmatter.dumps(post),
        },
    )
    revision = MemoryRevision.create(
        node_id=node_id,
        subject_type="event",
        subject_id=event_id,
        object_id=value.object_id,
        parent_ids=[parent_id],
        created_at=created_at,
    )
    return revision, value


def _canonical_files(storage: Storage) -> dict[str, bytes]:
    return {
        str(path.relative_to(storage.root)): path.read_bytes()
        for root in (
            storage.events_dir,
            storage.entities_dir,
            storage.revision_journal.replication_dir,
        )
        for path in Path(root).rglob("*")
        if path.is_file()
    }


def test_command_memory_context_returns_exact_verified_read_only_evidence(
    tmp_path,
) -> None:
    storage = Storage(tmp_path / "vault", node_id="node:mac-command")
    recorded = _record(
        storage,
        "Historical machinery evidence from the Mac node.",
        entities=["Memory MCP", "Machinery"],
    )
    before = _canonical_files(storage)

    result = command_memory_context(
        storage,
        entity="memory-mcp",
        query=None,
        since=None,
        until=None,
        limit=10,
    )

    assert set(result) == {
        "schema",
        "tool_policy",
        "serving_node_id",
        "retrieved_at",
        "total",
        "results",
    }
    assert result["schema"] == "memory-evidence-v1"
    assert result["tool_policy"] == {
        "mode": "read_only",
        "retrieved_content": "untrusted_evidence",
        "instruction_effect": "none",
    }
    assert result["serving_node_id"] == "node:mac-command"
    assert datetime.fromisoformat(result["retrieved_at"]).tzinfo is not None
    assert result["total"] == 1
    evidence = result["results"][0]
    assert set(evidence) == {
        "untrusted_evidence",
        "revision",
        "replication_envelope",
        "conflicted_fields",
        "quoted_text",
        "citation",
    }
    assert evidence["untrusted_evidence"] is True
    assert evidence["conflicted_fields"] == []
    assert evidence["quoted_text"] == "Historical machinery evidence from the Mac node."
    revision = evidence["revision"]
    assert revision["entityId"] == recorded["id"]
    assert revision["content"]["content"] == evidence["quoted_text"]
    assert validate_buzz_memory_revision(revision)
    envelope = evidence["replication_envelope"]
    assert envelope["payload"] == revision
    assert validate_buzz_replication_envelope(envelope)
    assert evidence["citation"] == {
        "event_id": revision["eventId"],
        "revision_hash": revision["hashes"]["revision"],
        "node_id": revision["nodeId"],
        "timestamp": revision["timestamp"],
    }
    assert _canonical_files(storage) == before


def test_command_memory_context_fails_explicitly_when_heads_exceed_bound(
    tmp_path,
) -> None:
    storage = Storage(tmp_path / "vault", node_id="node:mac-command")
    recorded = _record(storage, "Valid evidence behind oversized heads state.")
    revision_id = storage.revision_journal._heads()[f"event:{recorded['id']}"][0]
    heads = storage.revision_journal._heads()
    for index in range(50_000):
        heads[f"event:padding-{index:05d}"] = [revision_id]
    storage.revision_journal.heads_path.write_text(
        json.dumps(heads, separators=(",", ":"), sort_keys=True) + "\n",
        encoding="utf-8",
    )
    assert (
        storage.revision_journal.heads_path.stat().st_size
        > MAX_COMMAND_CONTEXT_HEADS_BYTES
    )

    with pytest.raises(ValueError, match="heads state exceeds evidence bound"):
        command_memory_context(
            storage,
            entity="memory-mcp",
            query=None,
            since=None,
            until=None,
            limit=1,
        )


def test_command_memory_context_preserves_imported_origin_and_old_timestamp(
    tmp_path,
) -> None:
    home = Storage(tmp_path / "home", node_id="node:home-command")
    recorded = _record(home, "Initial historical evidence from home.")
    base_head = home.revision_journal._heads()[f"event:{recorded['id']}"][0]
    historical, value = _event_descendant(
        home,
        event_id=recorded["id"],
        parent_id=base_head,
        node_id="node:home-command",
        content="Historical evidence preserved from home.",
        created_at="2020-01-02T03:04:05+00:00",
    )
    home.revision_journal.accept_revision(historical, value, materialize=True)
    mac = Storage(tmp_path / "mac", node_id="node:mac-command")
    mac.revision_journal.import_envelope(
        home.revision_journal.export_envelope(cursor=0, limit=10)
    )

    result = command_memory_context(
        mac,
        entity=None,
        query="historical evidence",
        since=None,
        until=None,
        limit=5,
    )

    assert result["serving_node_id"] == "node:mac-command"
    assert result["total"] == 1
    evidence = result["results"][0]
    assert evidence["revision"]["nodeId"] == "node:home-command"
    assert evidence["revision"]["timestamp"] == "2020-01-02T03:04:05+00:00"
    assert evidence["replication_envelope"]["nodeId"] == "node:home-command"
    assert evidence["citation"]["node_id"] == "node:home-command"
    assert evidence["citation"]["timestamp"] == "2020-01-02T03:04:05+00:00"
    assert result["retrieved_at"] != evidence["citation"]["timestamp"]


def test_command_memory_context_uses_current_head_and_intersects_filters(
    tmp_path,
) -> None:
    storage = Storage(tmp_path / "vault", node_id="node:mac-command")
    recorded = _record(
        storage,
        "Old machinery status.",
        entities=["Memory MCP", "Machinery"],
    )
    _record(
        storage,
        "Machinery status for another entity.",
        entities=["Unrelated"],
        event_date="2020-01-03T03:04:05+00:00",
    )
    base_head = storage.revision_journal._heads()[f"event:{recorded['id']}"][0]
    current, value = _event_descendant(
        storage,
        event_id=recorded["id"],
        parent_id=base_head,
        node_id="node:home-command",
        content="Current machinery status.",
        created_at="2020-01-04T03:04:05+00:00",
    )
    storage.revision_journal.accept_revision(current, value, materialize=True)

    result = command_memory_context(
        storage,
        entity="memory-mcp",
        query="current machinery",
        since="2019-01-01T00:00:00+00:00",
        until="2021-01-01T00:00:00+00:00",
        limit=5,
    )

    assert result["total"] == 1
    evidence = result["results"][0]
    assert evidence["quoted_text"] == "Current machinery status."
    assert evidence["revision"]["eventId"] == current.revision_id
    assert evidence["revision"]["nodeId"] == "node:home-command"


def test_command_memory_context_excludes_conflicts_empty_and_oversized_content(
    tmp_path,
) -> None:
    storage = Storage(tmp_path / "vault", node_id="node:mac-command")
    valid = _record(
        storage,
        "Evidence record that remains safe.",
        event_date="2020-01-05T03:04:05+00:00",
    )
    _record(
        storage,
        " ",
        event_date="2020-01-04T03:04:05+00:00",
    )
    _record(
        storage,
        "x" * (MAX_COMMAND_CONTEXT_CONTENT_BYTES + 1),
        event_date="2020-01-03T03:04:05+00:00",
    )
    conflicted = _record(
        storage,
        "Conflicted evidence record.",
        event_date="2020-01-02T03:04:05+00:00",
    )
    base_head = storage.revision_journal._heads()[f"event:{conflicted['id']}"][0]
    first, first_value = _event_descendant(
        storage,
        event_id=conflicted["id"],
        parent_id=base_head,
        node_id="node:home-command",
        content="Home branch evidence.",
        created_at="2020-01-06T03:04:05+00:00",
    )
    second, second_value = _event_descendant(
        storage,
        event_id=conflicted["id"],
        parent_id=base_head,
        node_id="node:peer-command",
        content="Peer branch evidence.",
        created_at="2020-01-06T03:04:06+00:00",
    )
    storage.revision_journal.accept_revision(first, first_value, materialize=False)
    storage.revision_journal.accept_revision(second, second_value, materialize=False)

    result = command_memory_context(
        storage,
        entity="memory-mcp",
        query=None,
        since=None,
        until=None,
        limit=20,
    )

    assert result["total"] == 1
    assert result["results"][0]["revision"]["entityId"] == valid["id"]
    assert result["results"][0]["conflicted_fields"] == []
    assert len(canonical_json_bytes(result)) <= MAX_COMMAND_CONTEXT_RESPONSE_BYTES


def test_candidate_selection_bounds_full_scan_and_incremental_storage() -> None:
    class SyntheticStorage:
        def __init__(self) -> None:
            self.yielded = 0

        def iter_events(self):
            for index in range(MAX_COMMAND_CONTEXT_SCANNED_EVENTS + 500):
                self.yielded += 1
                yield {
                    "id": f"event-{index:06d}",
                    "event_date": "2020-01-02T03:04:05+00:00",
                    "entities": ["memory-mcp"],
                    "content": "bounded evidence",
                }

    storage = SyntheticStorage()
    selected = _candidate_event_ids(
        storage,
        target="memory-mcp",
        needle="evidence",
        since_at=None,
        until_at=None,
    )

    assert storage.yielded == MAX_COMMAND_CONTEXT_SCANNED_EVENTS
    assert len(selected) == MAX_COMMAND_CONTEXT_CANDIDATES
    assert len(set(selected)) == len(selected)


def test_command_memory_context_resolves_current_head_after_100k_entries(
    tmp_path,
) -> None:
    storage = Storage(tmp_path / "vault", node_id="node:mac-command")
    recorded = _record(storage, "Evidence beyond the old journal scan boundary.")
    target_revision_id = storage.revision_journal._heads()[
        f"event:{recorded['id']}"
    ][0]
    with storage.revision_journal.journal_path.open("w", encoding="utf-8") as handle:
        for sequence in range(1, 100_001):
            handle.write(
                f'{{"revision_id":"sha256:{sequence:064x}",'
                f'"sequence":{sequence}}}\n'
            )
        handle.write(
            f'{{"revision_id":"{target_revision_id}","sequence":100001}}\n'
        )

    result = command_memory_context(
        storage,
        entity="memory-mcp",
        query=None,
        since=None,
        until=None,
        limit=1,
    )

    assert result["total"] == 1
    assert result["results"][0]["revision"]["eventId"] == target_revision_id
    assert result["results"][0]["revision"]["cursor"] == "100001"


def test_revision_sequence_lookup_fails_when_current_head_is_not_in_journal(
    tmp_path,
) -> None:
    storage = Storage(tmp_path / "vault", node_id="node:mac-command")
    storage.revision_journal.journal_path.write_text(
        '{"revision_id":"sha256:' + ("1" * 64) + '","sequence":1}\n',
        encoding="utf-8",
    )

    with pytest.raises(ValueError, match="current head revision is missing"):
        _bounded_revision_sequences(
            storage.revision_journal,
            {"sha256:" + ("2" * 64)},
        )


def test_revision_sequence_lookup_fails_explicitly_at_scan_bound(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path,
) -> None:
    storage = Storage(tmp_path / "vault", node_id="node:mac-command")
    storage.revision_journal.journal_path.write_text(
        "\n".join(
            [
                '{"revision_id":"sha256:' + ("1" * 64) + '","sequence":1}',
                '{"revision_id":"sha256:' + ("2" * 64) + '","sequence":2}',
            ]
        )
        + "\n",
        encoding="utf-8",
    )
    monkeypatch.setattr(
        command_context_module,
        "MAX_COMMAND_CONTEXT_SCANNED_REVISIONS",
        1,
    )

    with pytest.raises(ValueError, match="evidence scan bound"):
        _bounded_revision_sequences(
            storage.revision_journal,
            {"sha256:" + ("2" * 64)},
        )


@pytest.mark.parametrize(
    "arguments",
    [
        {"entity": None, "query": None, "limit": 10},
        {"entity": "", "query": " ", "limit": 10},
        {"entity": "x" * 257, "query": None, "limit": 10},
        {"entity": None, "query": "x" * 4097, "limit": 10},
        {"entity": "memory-mcp", "query": None, "limit": 0},
        {"entity": "memory-mcp", "query": None, "limit": 21},
        {"entity": "memory-mcp", "query": None, "limit": True},
    ],
)
def test_command_memory_context_rejects_unbounded_arguments(arguments) -> None:
    storage = object.__new__(Storage)

    with pytest.raises(ValueError):
        command_memory_context(
            storage,
            entity=arguments["entity"],
            query=arguments["query"],
            since=None,
            until=None,
            limit=arguments["limit"],
        )
