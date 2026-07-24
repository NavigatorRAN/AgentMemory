#!/usr/bin/env bash
set -euo pipefail

SERVER="${MEMORY_MCP_SERVER:-matt@192.168.1.26}"
SSH_KEY="${MEMORY_MCP_SSH_KEY:-$HOME/.ssh/id_rsa_hermes}"
REMOTE_DIR="${MEMORY_MCP_REMOTE_DIR:-/opt/memory-mcp}"
ENDPOINT="${MEMORY_MCP_ENDPOINT:-http://192.168.1.26:8006/mcp}"
REMOTE_INDEX_DIR="${MEMORY_MCP_REMOTE_INDEX_DIR:-${REMOTE_DIR}/.index}"
REMOTE_WHEELHOUSE="${MEMORY_MCP_REMOTE_WHEELHOUSE:-${REMOTE_DIR}/wheelhouse}"
ALLOW_DEPENDENCY_UPGRADE="${MEMORY_MCP_ALLOW_DEPENDENCY_UPGRADE:-false}"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
REMOTE_STAGE="/tmp/memory-mcp-deploy-${STAMP}"

if [[ ! "${REMOTE_WHEELHOUSE}" =~ ^/[A-Za-z0-9._/-]+$ ]]; then
  echo "MEMORY_MCP_REMOTE_WHEELHOUSE must be an absolute path with safe characters." >&2
  exit 2
fi
if [[ "${ALLOW_DEPENDENCY_UPGRADE}" != "true" && "${ALLOW_DEPENDENCY_UPGRADE}" != "false" ]]; then
  echo "MEMORY_MCP_ALLOW_DEPENDENCY_UPGRADE must be true or false." >&2
  exit 2
fi

cd "$(dirname "$0")/.."

echo "Staging Memory MCP server package to ${SERVER}:${REMOTE_STAGE}"
ssh -i "${SSH_KEY}" -o BatchMode=yes "${SERVER}" "mkdir -p '${REMOTE_STAGE}'"
rsync -az --delete \
  -e "ssh -i ${SSH_KEY} -o BatchMode=yes" \
  --exclude '.venv' \
  --exclude '*.pyc' \
  --exclude '__pycache__' \
  ./ "${SERVER}:${REMOTE_STAGE}/"

echo "Installing staged package into ${REMOTE_DIR}"
ssh -i "${SSH_KEY}" -o BatchMode=yes "${SERVER}" "set -euo pipefail
  if [ -d '${REMOTE_DIR}' ]; then
    tar -C \"\$(dirname '${REMOTE_DIR}')\" -czf '/tmp/memory-mcp-backup-${STAMP}.tgz' \"\$(basename '${REMOTE_DIR}')\"
  fi
  rsync -a --delete --exclude '.venv' --exclude 'wheelhouse' '${REMOTE_STAGE}/' '${REMOTE_DIR}/'
  cd '${REMOTE_DIR}'
  mkdir -p '${REMOTE_INDEX_DIR}'
  if [ ! -x .venv/bin/python ]; then
    python3 -m venv .venv
  fi
  MEMORY_MCP_DEPENDENCY_WHEELHOUSE='${REMOTE_WHEELHOUSE}' \
  MEMORY_MCP_ALLOW_DEPENDENCY_UPGRADE='${ALLOW_DEPENDENCY_UPGRADE}' \
    bash scripts/ensure_dependencies.sh '${REMOTE_DIR}'
  export MEMORY_INDEX_ROOT='${REMOTE_INDEX_DIR}'
  .venv/bin/python -m memory_mcp.index_cli --status
  if sudo -n true 2>/dev/null; then
    sudo -n mkdir -p /etc/systemd/system/memory-mcp.service.d
    printf '%s\n' \
      '[Service]' \
      'Environment="MEMORY_INDEX_ROOT=${REMOTE_INDEX_DIR}"' \
      'ReadWritePaths=${REMOTE_INDEX_DIR}' \
      | sudo -n tee /etc/systemd/system/memory-mcp.service.d/index-root.conf >/dev/null
    sudo -n systemctl daemon-reload
  fi
  if sudo -n systemctl restart memory-mcp.service 2>/dev/null; then
    echo 'Restarted memory-mcp.service through systemd.'
  else
    echo 'sudo restart unavailable; signaling user-owned memory-mcp process.'
    pid=\"\$(pgrep -u \"\$(id -u)\" -x memory-mcp | head -n 1)\"
    if [ -z \"\${pid}\" ]; then
      echo 'No user-owned memory-mcp process found to restart.' >&2
      exit 1
    fi
    kill -KILL \"\${pid}\"
    sleep 5
    if ! systemctl is-active memory-mcp.service >/dev/null 2>&1; then
      echo 'systemd did not restart the service; starting the same command as the service user.'
      MEMORY_VAULT_ROOT=/mnt/aishareddrive/family-agents/memory \
      MEMORY_INDEX_ROOT='${REMOTE_INDEX_DIR}' \
      MEMORY_HOST=0.0.0.0 \
      MEMORY_PORT=8006 \
      nohup '${REMOTE_DIR}/.venv/bin/memory-mcp' > /tmp/memory-mcp-manual.log 2>&1 &
      sleep 2
    fi
  fi
  systemctl is-active memory-mcp.service || pgrep -u \"\$(id -u)\" -x memory-mcp >/dev/null
"

echo "Running endpoint smoke checks at ${ENDPOINT}"
python3 scripts/smoke_check.py --endpoint "${ENDPOINT}" --write-event

echo "Deployment complete. Remote backup: /tmp/memory-mcp-backup-${STAMP}.tgz"
