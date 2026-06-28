"""Command-line helpers for the derived Memory MCP query index."""
from __future__ import annotations

import argparse
import json
import os
from pathlib import Path

from .storage import Storage


DEFAULT_VAULT_ROOT = os.environ.get(
    "MEMORY_VAULT_ROOT",
    "/mnt/aishareddrive/family-agents/memory",
)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--vault-root",
        default=DEFAULT_VAULT_ROOT,
        help="Memory vault root. Defaults to MEMORY_VAULT_ROOT or the production vault path.",
    )
    parser.add_argument(
        "--status",
        action="store_true",
        help="Report whether the derived SQLite index exists and has been rebuilt.",
    )
    args = parser.parse_args()

    storage = Storage(Path(args.vault_root))
    if args.status:
        payload = {
            "ready": storage.query_index.is_ready(),
            "db_path": str(storage.query_index.db_path),
        }
    else:
        payload = storage.rebuild_query_index()
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
