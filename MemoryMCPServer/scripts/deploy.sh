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
  .venv/bin/pip install --no-index --no-build-isolation --no-deps -e .
  .venv/bin/memory-mcp-index --status
  sudo systemctl restart memory-mcp.service
  systemctl is-active memory-mcp.service
"

echo "Running endpoint smoke checks at ${ENDPOINT}"
python3 scripts/smoke_check.py --endpoint "${ENDPOINT}" --write-event

echo "Deployment complete. Remote backup: /tmp/memory-mcp-backup-${STAMP}.tgz"
