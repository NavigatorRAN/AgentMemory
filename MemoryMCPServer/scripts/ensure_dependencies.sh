#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="${1:?Usage: ensure_dependencies.sh <project-dir>}"
PYTHON="${PROJECT_DIR}/.venv/bin/python"
PREFLIGHT="${PROJECT_DIR}/scripts/preflight_dependencies.py"
ALLOW_UPGRADE="${MEMORY_MCP_ALLOW_DEPENDENCY_UPGRADE:-false}"
WHEELHOUSE="${MEMORY_MCP_DEPENDENCY_WHEELHOUSE:-}"

if [[ ! -x "${PYTHON}" ]]; then
  echo "Memory MCP dependency preflight failed: ${PYTHON} is unavailable; stopping before service restart." >&2
  exit 1
fi

if "${PYTHON}" "${PREFLIGHT}"; then
  echo "Installed environment already satisfies the reviewed Memory MCP runtime; skipping dependency install."
  exit 0
fi

if [[ "${ALLOW_UPGRADE}" != "true" ]]; then
  echo "Dependency repair is not explicitly approved; stopping before service restart." >&2
  echo "Set MEMORY_MCP_ALLOW_DEPENDENCY_UPGRADE=true with a complete reviewed offline wheelhouse." >&2
  exit 1
fi
if [[ -z "${WHEELHOUSE}" || ! -d "${WHEELHOUSE}" ]]; then
  echo "Reviewed dependency wheelhouse is unavailable; stopping before service restart." >&2
  exit 1
fi

echo "Repairing Memory MCP dependencies from reviewed offline wheelhouse ${WHEELHOUSE}."
"${PYTHON}" -m pip install \
  --disable-pip-version-check \
  --no-index \
  --find-links "${WHEELHOUSE}" \
  --upgrade \
  --force-reinstall \
  -e "${PROJECT_DIR}"

"${PYTHON}" "${PREFLIGHT}"
echo "Memory MCP dependencies repaired and revalidated before service restart."
