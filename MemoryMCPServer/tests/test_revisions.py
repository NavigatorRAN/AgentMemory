from __future__ import annotations

import json

import pytest

from memory_mcp.revisions import (
    ImmutableObject,
    MemoryRevision,
    NodeIdentity,
    canonical_json_bytes,
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
