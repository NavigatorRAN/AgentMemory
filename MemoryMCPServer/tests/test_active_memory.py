from __future__ import annotations

from memory_mcp.queries import recall_active_memory, recall_memory_history
from memory_mcp.storage import Storage


def _project(
    storage: Storage,
    source_event_id: str,
    content: str,
    *,
    timestamp: str,
    memory_key: str = "navigation.briefing-order",
    status: str = "active",
    supersedes: list[str] | None = None,
    scope: str = "command-team-shared",
    owner_id: str = "owner-1",
    team_id: str | None = "command-team",
    specialist_id: str | None = None,
) -> None:
    storage.record_projected_event(
        source_event_id=source_event_id,
        timestamp=timestamp,
        agent="CODEX",
        event_type="command_experience",
        content=content,
        metadata={
            "memory_key": memory_key,
            "status": status,
            "supersedes": supersedes or [],
            "scope": scope,
            "owner_id": owner_id,
            "team_id": team_id,
            "specialist_id": specialist_id,
            "confidence": 0.8,
            "source_event_id": source_event_id,
            "source_created_at": timestamp,
        },
    )


def _active(storage: Storage, **overrides):
    values = {
        "query": "briefing",
        "owner_id": "owner-1",
        "team_id": "command-team",
        "specialist_id": "navigation",
        "limit": 10,
        "as_of": None,
    }
    values.update(overrides)
    return recall_active_memory(storage, **values)


def test_active_view_returns_latest_active_leaf_and_preserves_history(tmp_path):
    storage = Storage(tmp_path)
    _project(
        storage,
        "event-original",
        "Original briefing sequence",
        timestamp="2026-08-16T08:00:00+00:00",
        status="corrected",
    )
    _project(
        storage,
        "event-correction",
        "Corrected briefing sequence",
        timestamp="2026-08-16T09:00:00+00:00",
        supersedes=["event-original"],
    )
    _project(
        storage,
        "event-inactive",
        "Inactive briefing draft",
        timestamp="2026-08-16T10:00:00+00:00",
        status="inactive",
    )

    active = _active(storage)
    history = recall_memory_history(
        storage,
        memory_key="navigation.briefing-order",
        owner_id="owner-1",
        limit=10,
    )

    assert active["diagnostics"] == []
    assert [record["source_event_id"] for record in active["records"]] == [
        "event-correction"
    ]
    assert [record["source_event_id"] for record in history] == [
        "event-inactive",
        "event-correction",
        "event-original",
    ]


def test_active_view_enforces_private_and_team_scopes(tmp_path):
    storage = Storage(tmp_path)
    _project(
        storage,
        "event-team",
        "Shared briefing lesson",
        timestamp="2026-08-16T08:00:00+00:00",
        memory_key="shared.briefing",
    )
    _project(
        storage,
        "event-navigation",
        "Private briefing lesson",
        timestamp="2026-08-16T09:00:00+00:00",
        memory_key="private.briefing",
        scope="specialist-private",
        team_id=None,
        specialist_id="navigation",
    )

    navigation = _active(storage)
    operations = _active(storage, specialist_id="operations")
    other_team = _active(storage, team_id="other-team")

    assert {record["source_event_id"] for record in navigation["records"]} == {
        "event-team",
        "event-navigation",
    }
    assert [record["source_event_id"] for record in operations["records"]] == [
        "event-team"
    ]
    assert [record["source_event_id"] for record in other_team["records"]] == [
        "event-navigation"
    ]


def test_active_view_honours_as_of_time(tmp_path):
    storage = Storage(tmp_path)
    _project(
        storage,
        "event-original",
        "Original briefing sequence",
        timestamp="2026-08-16T08:00:00+00:00",
    )
    _project(
        storage,
        "event-correction",
        "Corrected briefing sequence",
        timestamp="2026-08-16T10:00:00+00:00",
        supersedes=["event-original"],
    )

    result = _active(storage, as_of="2026-08-16T09:00:00+00:00")

    assert [record["source_event_id"] for record in result["records"]] == [
        "event-original"
    ]


def test_active_view_fails_closed_for_cycle(tmp_path):
    storage = Storage(tmp_path)
    _project(
        storage,
        "event-a",
        "Briefing A",
        timestamp="2026-08-16T08:00:00+00:00",
        supersedes=["event-b"],
    )
    _project(
        storage,
        "event-b",
        "Briefing B",
        timestamp="2026-08-16T09:00:00+00:00",
        supersedes=["event-a"],
    )

    result = _active(storage)

    assert result["records"] == []
    assert result["diagnostics"][0]["code"] == "supersession_cycle"


def test_active_view_fails_closed_for_invisible_supersession_reference(tmp_path):
    storage = Storage(tmp_path)
    _project(
        storage,
        "event-private",
        "Private briefing source",
        timestamp="2026-08-16T08:00:00+00:00",
        scope="specialist-private",
        team_id=None,
        specialist_id="operations",
    )
    _project(
        storage,
        "event-shared",
        "Shared briefing correction",
        timestamp="2026-08-16T09:00:00+00:00",
        supersedes=["event-private"],
    )

    result = _active(storage, specialist_id="navigation")

    assert result["records"] == []
    assert result["diagnostics"][0]["code"] == "invisible_supersession_reference"
