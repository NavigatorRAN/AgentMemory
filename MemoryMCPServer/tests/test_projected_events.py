from __future__ import annotations

import json

import pytest

from memory_mcp.storage import Storage


def _project(storage: Storage, **overrides):
    payload = {
        "source_event_id": "buzz-event-001",
        "timestamp": "2026-08-16T10:00:00+00:00",
        "agent": "CODEX",
        "event_type": "command_experience",
        "content": "Navigation preference confirmed by the CO.",
        "metadata": {
            "memory_key": "navigation.briefing-order",
            "status": "active",
            "scope": "command-team-shared",
            "owner_id": "owner-1",
            "team_id": "command-team",
        },
    }
    payload.update(overrides)
    return storage.record_projected_event(**payload)


def test_duplicate_projection_is_idempotent_across_restart(tmp_path):
    first_storage = Storage(tmp_path)

    first = _project(first_storage)
    duplicate = _project(first_storage)
    after_restart = _project(Storage(tmp_path))

    assert first["created"] is True
    assert duplicate == {
        "event_id": first["event_id"],
        "created": False,
        "payload_hash": first["payload_hash"],
    }
    assert after_restart == duplicate
    assert len(list((tmp_path / "events").rglob("*.md"))) == 1


def test_conflicting_payload_for_source_event_id_is_rejected(tmp_path):
    storage = Storage(tmp_path)
    _project(storage)

    with pytest.raises(ValueError, match="conflicting projection"):
        _project(storage, content="Different content for the same Buzz event.")

    assert len(list((tmp_path / "events").rglob("*.md"))) == 1


@pytest.mark.parametrize("source_event_id", ["", "   ", None])
def test_projection_requires_a_stable_source_event_id(tmp_path, source_event_id):
    storage = Storage(tmp_path)

    with pytest.raises(ValueError, match="source_event_id"):
        _project(storage, source_event_id=source_event_id)


def test_projection_index_rebuilds_from_authoritative_event_files(tmp_path):
    storage = Storage(tmp_path)
    first = _project(storage)
    index_path = tmp_path / ".index" / "projected-events.json"
    index_path.write_text(json.dumps({"wrong": {"event_id": "bad"}}), encoding="utf-8")

    rebuilt_storage = Storage(tmp_path)
    duplicate = _project(rebuilt_storage)

    assert duplicate["created"] is False
    assert duplicate["event_id"] == first["event_id"]
    persisted = json.loads(index_path.read_text(encoding="utf-8"))
    assert set(persisted) == {"buzz-event-001"}

