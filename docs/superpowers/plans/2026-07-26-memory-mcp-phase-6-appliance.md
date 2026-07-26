# Memory MCP Phase 6 Appliance Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Produce a reviewed immutable CPython 3.12 Memory MCP appliance with authenticated readiness, deterministic identity, and disposable backup/restore proof.

**Architecture:** Build a non-root OCI image from a digest-pinned Python base and hash-locked wheels, emit a canonical appliance manifest, and exercise it through a parameterized Compose harness using disposable volumes. Existing Phase 3 replication and command-memory behavior remains unchanged.

**Tech Stack:** CPython 3.12, setuptools/pip hash locks, Docker/Compose, pytest, Bash.

## Global Constraints

- Base is accepted Memory Phase 3 replication commit `69e23ecf85a1aec26c52004683faaeba4dcddeee`.
- Python base is an exact CPython `3.12.x` OCI digest; mutable tags cannot pass assurance.
- Dependencies install with `--require-hashes`; the appliance performs no dependency resolution at build or startup.
- Runtime uses a fixed non-root UID/GID, read-only root filesystem, dropped capabilities, `no-new-privileges`, and bounded writable volumes.
- Readiness authenticates and verifies the exact configured node ID.
- The manifest is content-free and binds source revision, Python version, lock digest, and OCI image digest.
- Existing replication, attestation, authentication, tombstone, conflict, and current-head behavior must remain green.

---

### Task 1: Hash-locked immutable image and manifest

**Files:**
- Create: `MemoryMCPServer/requirements/runtime.lock`
- Create: `MemoryMCPServer/docker/Dockerfile`
- Create: `MemoryMCPServer/docker/entrypoint.sh`
- Create: `MemoryMCPServer/src/memory_mcp/appliance_manifest.py`
- Create: `MemoryMCPServer/tests/test_appliance_manifest.py`
- Modify: `MemoryMCPServer/pyproject.toml`

**Interfaces:**
- Produces: `build_appliance_manifest(source_revision, python_version, lock_digest, image_digest)`.
- Produces: console script `memory-mcp-appliance-manifest`.

- [ ] **Step 1: Write failing manifest tests**

Prove exact lowercase Git/SHA-256 formats, canonical sorted JSON, rejection of
mutable image references, control characters, extra keys, and deterministic
output.

- [ ] **Step 2: Run and verify failure**

Run:

```bash
cd MemoryMCPServer
python3 -m pytest tests/test_appliance_manifest.py -q
```

Expected: module import fails.

- [ ] **Step 3: Implement the manifest and locked image**

Generate `runtime.lock` with hashes for the project runtime dependencies. The
Dockerfile must use:

```dockerfile
ARG PYTHON_IMAGE
FROM ${PYTHON_IMAGE}
RUN python -m pip install --no-cache-dir --require-hashes -r /build/runtime.lock
USER 10001:10001
ENTRYPOINT ["/opt/memory-mcp/entrypoint.sh"]
CMD ["memory-mcp"]
```

The build wrapper, not the Dockerfile, rejects a `PYTHON_IMAGE` lacking
`@sha256:<64 lowercase hex>`.

- [ ] **Step 4: Run manifest tests and build syntax checks**

Run:

```bash
cd MemoryMCPServer
python3 -m pytest tests/test_appliance_manifest.py -q
python3 -m compileall -q src
```

Expected: pass.

- [ ] **Step 5: Commit**

```bash
git add MemoryMCPServer
git commit -m "feat(memory): define immutable appliance"
```

### Task 2: Disposable Compose, readiness, backup, and restore

**Files:**
- Create: `MemoryMCPServer/docker/compose.appliance.yml`
- Create: `MemoryMCPServer/scripts/build_appliance.sh`
- Create: `MemoryMCPServer/scripts/check_appliance.sh`
- Create: `MemoryMCPServer/scripts/backup_appliance.sh`
- Create: `MemoryMCPServer/scripts/restore_appliance.sh`
- Create: `MemoryMCPServer/tests/test_appliance_scripts.py`
- Create: `MemoryMCPServer/docs/appliance.md`

**Interfaces:**
- Produces: `build_appliance.sh`, `check_appliance.sh`, `backup_appliance.sh`, and `restore_appliance.sh`.
- Consumes: `MEMORY_APPLIANCE_PROJECT`, literal-loopback port, protected token/attestation files, expected node ID, and exact image/base digests.

- [ ] **Step 1: Write failing script tests**

With fake docker/openssl/tar binaries prove rejection of invalid project IDs,
mutable images, non-loopback ports, symlinked secrets, weak modes, wrong node
readiness, archive traversal/symlinks, checksum mismatch, cross-project
restore, and mutation before validation.

- [ ] **Step 2: Run and verify failure**

Run:

```bash
cd MemoryMCPServer
python3 -m pytest tests/test_appliance_scripts.py -q
```

Expected: scripts are absent.

- [ ] **Step 3: Implement hardened disposable runtime**

Compose must set `read_only: true`, `cap_drop: [ALL]`,
`security_opt: [no-new-privileges:true]`, `user: "10001:10001"`, `tmpfs:
/tmp`, a project-scoped vault, and only `127.0.0.1:<port>:8006`.
Readiness uses an authenticated `/replication/readiness` request and exact
node-ID equality.

- [ ] **Step 4: Implement exact backup and staged restore**

Backups contain a versioned manifest, canonical vault archive, checksums,
appliance manifest, and project identity. Restore validates every byte and
archive member in staging, proves disposable readiness, then atomically swaps
the volume. Retain the prior volume for rollback.

- [ ] **Step 5: Run appliance and full server gates**

Run:

```bash
cd MemoryMCPServer
python3 -m pytest -q
bash scripts/check_appliance.sh --hermetic
```

Expected: all pass on a disposable project.

- [ ] **Step 6: Commit**

```bash
git add MemoryMCPServer
git commit -m "test(memory): prove appliance recovery"
```
