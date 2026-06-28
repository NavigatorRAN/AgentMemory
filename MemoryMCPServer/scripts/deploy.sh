#!/usr/bin/env bash
set -euo pipefail

SERVER="${MEMORY_MCP_SERVER:-matt@192.168.1.26}"
SSH_KEY="${MEMORY_MCP_SSH_KEY:-$HOME/.ssh/id_rsa_hermes}"
REMOTE_DIR="${MEMORY_MCP_REMOTE_DIR:-/opt/memory-mcp}"
ENDPOINT="${MEMORY_MCP_ENDPOINT:-http://192.168.1.26:8006/mcp}"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
REMOTE_STAGE="/tmp/memory-mcp-deploy-${STAMP}"

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
  rsync -a --delete --exclude '.venv' '${REMOTE_STAGE}/' '${REMOTE_DIR}/'
  cd '${REMOTE_DIR}'
  python3 -m venv .venv
  if .venv/bin/python -c 'import memory_mcp.index_cli' >/dev/null 2>&1; then
    echo 'Existing venv imports staged source; skipping package reinstall.'
  else
    .venv/bin/pip install --no-index --no-build-isolation --no-deps -e .
  fi
  .venv/bin/python -m memory_mcp.index_cli --status
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
