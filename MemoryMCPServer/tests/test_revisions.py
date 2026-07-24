from __future__ import annotations

import json
from pathlib import Path

import pytest

from memory_mcp.revisions import (
    ImmutableObject,
    MemoryRevision,
    NodeIdentity,
    canonical_json_bytes,
)
from memory_mcp.contracts import (
    BUZZ_MEMORY_REVISION_KEYS,
    BUZZ_REPLICATION_ENVELOPE_KEYS,
    to_buzz_memory_revision,
    to_buzz_replication_envelope,
    validate_buzz_memory_revision,
    validate_buzz_replication_envelope,
)


def test_immutable_objects_are_content_addressed_and_canonical():
    first = ImmutableObject.create(
        kind="entity",
        payload={"metadata": {"type": "service", "aliases": ["memory"]}, "content": "Body"},
    )
    second = ImmutableObject.create(
        kind="entity",
        payload={"content": "Body", "metadata": {"aliases": ["memory"], "type": "service"}},
    )

    assert first.object_id == second.object_id
    assert first.canonical_bytes == second.canonical_bytes
    assert first.object_id.startswith("sha256:")
    assert json.loads(first.canonical_bytes)["kind"] == "entity"


def test_canonical_json_rejects_non_finite_values():
    with pytest.raises(ValueError, match="finite"):
        canonical_json_bytes({"score": float("nan")})


def test_revision_hash_is_canonical_and_parent_order_is_deterministic():
    first = MemoryRevision.create(
        node_id="node:mac",
        subject_type="entity",
        subject_id="memory-mcp",
        object_id="sha256:" + "a" * 64,
        parent_ids=["sha256:" + "c" * 64, "sha256:" + "b" * 64],
        created_at="2026-07-24T10:00:00+00:00",
    )
    second = MemoryRevision.create(
        node_id="node:mac",
        subject_type="entity",
        subject_id="memory-mcp",
        object_id="sha256:" + "a" * 64,
        parent_ids=["sha256:" + "b" * 64, "sha256:" + "c" * 64],
        created_at="2026-07-24T10:00:00+00:00",
    )

    assert first.revision_id == second.revision_id
    assert first.parent_ids == tuple(sorted(first.parent_ids))
    assert first.verify()


def test_revision_validates_event_ids_and_hashes():
    with pytest.raises(ValueError, match="ULID"):
        MemoryRevision.create(
            node_id="node:mac",
            subject_type="event",
            subject_id="not-a-ulid",
            object_id="sha256:" + "a" * 64,
            parent_ids=[],
            created_at="2026-07-24T10:00:00+00:00",
        )

    revision = MemoryRevision.create(
        node_id="node:mac",
        subject_type="event",
        subject_id="01K10QH8AF7M8N8VP1KX3J4H5T",
        object_id="sha256:" + "a" * 64,
        parent_ids=[],
        created_at="2026-07-24T10:00:00+00:00",
    )
    tampered = revision.to_dict()
    tampered["object_id"] = "sha256:" + "f" * 64

    assert not MemoryRevision.from_dict(tampered).verify()


def test_node_identity_is_stable_and_operator_value_must_match(tmp_path):
    first = NodeIdentity.load_or_create(tmp_path, configured_node_id="node:macbook")
    second = NodeIdentity.load_or_create(tmp_path)

    assert first == second
    assert first.node_id == "node:macbook"

    with pytest.raises(ValueError, match="does not match"):
        NodeIdentity.load_or_create(tmp_path, configured_node_id="node:other")


def test_buzz_cross_repo_contract_fixture_has_exact_v1_wire_keys_and_official_default():
    fixture_path = Path(__file__).parent / "fixtures" / "buzz_memory_contract_v1.json"
    fixture = json.loads(fixture_path.read_text(encoding="utf-8"))

    assert set(fixture["memoryRevision"]) == BUZZ_MEMORY_REVISION_KEYS
    assert set(fixture["replicationEnvelope"]) == BUZZ_REPLICATION_ENVELOPE_KEYS
    assert validate_buzz_memory_revision(fixture["memoryRevision"])
    assert validate_buzz_replication_envelope(fixture["replicationEnvelope"])
    assert fixture["memoryRevision"]["classification"] == "OFFICIAL"
    assert fixture["replicationEnvelope"]["classification"] == "OFFICIAL"


def test_internal_revision_adapts_to_exact_buzz_contract_with_exact_hash_lineage():
    value = ImmutableObject.create(
        kind="entity",
        payload={
            "name": "hmas-supply",
            "content": "Available",
            "frontmatter": {"type": "ship"},
        },
    )
    parent = "sha256:" + "a" * 64
    revision = MemoryRevision.create(
        node_id="node:command-node-1",
        subject_type="entity",
        subject_id="hmas-supply",
        object_id=value.object_id,
        parent_ids=[parent],
        created_at="2026-07-24T04:30:00+00:00",
    )

    wire_revision = to_buzz_memory_revision(revision, value, cursor=2)
    envelope = to_buzz_replication_envelope(wire_revision)

    assert set(wire_revision) == BUZZ_MEMORY_REVISION_KEYS
    assert wire_revision["classification"] == "OFFICIAL"
    assert wire_revision["entityId"] == "hmas-supply"
    assert wire_revision["eventId"] == revision.revision_id
    assert wire_revision["parentRevisionIds"] == [parent]
    assert wire_revision["hashes"] == {
        "content": value.object_id,
        "revision": revision.revision_id,
    }
    assert wire_revision["cursor"] == "2"
    assert wire_revision["content"] == value.payload
    assert validate_buzz_memory_revision(wire_revision)

    assert set(envelope) == BUZZ_REPLICATION_ENVELOPE_KEYS
    assert envelope["payload"] == wire_revision
    assert envelope["parentRevisionIds"] == [revision.revision_id]
    assert envelope["hashes"]["payload"] == revision.revision_id
    assert envelope["classification"] == "OFFICIAL"
    assert validate_buzz_replication_envelope(envelope)


def test_buzz_tombstone_adapter_has_null_content_and_matching_metadata():
    value = ImmutableObject.create(
        kind="tombstone",
        payload={
            "target_type": "entity",
            "target_id": "hmas-supply",
            "deleted_at": "2026-07-24T04:30:00+00:00",
            "retain_until": "2026-10-22T04:30:00+00:00",
            "prior_object_id": "sha256:" + "a" * 64,
        },
    )
    revision = MemoryRevision.create(
        node_id="node:command-node-1",
        subject_type="entity",
        subject_id="hmas-supply",
        object_id=value.object_id,
        parent_ids=["sha256:" + "b" * 64],
        created_at="2026-07-24T04:30:00+00:00",
    )

    adapted = to_buzz_memory_revision(revision, value, cursor=3)

    assert adapted["tombstone"] is True
    assert adapted["content"] is None
    assert validate_buzz_memory_revision(adapted)


def test_buzz_bounded_json_depth_matches_typescript_64_65_boundary():
    fixture_path = Path(__file__).parent / "fixtures" / "buzz_memory_contract_v1.json"
    base = json.loads(fixture_path.read_text(encoding="utf-8"))["memoryRevision"]

    boundary: object = "leaf"
    for _ in range(64):
        boundary = [boundary]
    over_boundary = [boundary]

    assert validate_buzz_memory_revision({**base, "content": boundary})
    assert not validate_buzz_memory_revision({**base, "content": over_boundary})
    value = ImmutableObject.create(kind="entity", payload={"nested": over_boundary})
    revision = MemoryRevision.create(
        node_id="node:command-node-1",
        subject_type="entity",
        subject_id="hmas-supply",
        object_id=value.object_id,
        parent_ids=[],
        created_at="2026-07-24T04:30:00+00:00",
    )
    with pytest.raises(ValueError, match="represented"):
        to_buzz_memory_revision(revision, value, cursor=1)


def test_buzz_bounded_json_nodes_match_typescript_10000_10001_boundary():
    fixture_path = Path(__file__).parent / "fixtures" / "buzz_memory_contract_v1.json"
    base = json.loads(fixture_path.read_text(encoding="utf-8"))["memoryRevision"]

    boundary = [0] * 9_999
    over_boundary = [0] * 10_000

    assert validate_buzz_memory_revision({**base, "content": boundary})
    assert not validate_buzz_memory_revision({**base, "content": over_boundary})
    assert not validate_buzz_memory_revision(
        {**base, "content": "x" * (4 * 1024 * 1024)}
    )
