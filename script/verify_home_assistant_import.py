#!/usr/bin/env python3
"""Audit and verify the Home Assistant documentation import outputs.

This is intentionally read-only by default. It inspects the local resumable
state file, staged RAG markdown, optional RAG queue stats, and optional live
Memory MCP search results. Use --write-wiki to build the associated collection
wiki markdown after an import or metadata refresh.
"""

from __future__ import annotations

import argparse
import json
import pathlib
import sys
import urllib.request
from typing import Any

SCRIPT_DIR = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))

from deep_import_apple_docs_to_rag import RAGSSHClient  # noqa: E402
from import_web_pages_to_memory import (  # noqa: E402
    ImportState,
    audit_import_outputs,
    build_collection_wiki_markdown,
    slug,
)


DEFAULT_ENDPOINT = "http://192.168.1.26:8006/mcp"
DEFAULT_COLLECTION = "home-assistant-docs"
DEFAULT_STATE = ".web-pages-home-assistant-state.json"
DEFAULT_LOG = ".web-pages-home-assistant.log.jsonl"
DEFAULT_RAG_DIR = ".web-pages-home-assistant-rag"
DEFAULT_WIKI_TITLE = "Home Assistant Documentation Import"


class MCPToolClient:
    def __init__(self, endpoint: str, *, timeout: int = 20) -> None:
        self.endpoint = endpoint
        self.timeout = timeout
        self.session_id: str | None = None
        self.request_id = 1

    def connect(self) -> None:
        data, headers = self._post(
            {
                "jsonrpc": "2.0",
                "id": self._next_id(),
                "method": "initialize",
                "params": {
                    "protocolVersion": "2024-11-05",
                    "capabilities": {},
                    "clientInfo": {"name": "home-assistant-import-verifier", "version": "1.0"},
                },
            },
            session=False,
        )
        self.session_id = headers.get("mcp-session-id")
        if not self.session_id:
            raise RuntimeError(f"Memory MCP did not return mcp-session-id: {data!r}")
        self._post({"jsonrpc": "2.0", "method": "notifications/initialized", "params": {}})

    def call_tool(self, name: str, arguments: dict[str, Any]) -> Any:
        data, _ = self._post(
            {
                "jsonrpc": "2.0",
                "id": self._next_id(),
                "method": "tools/call",
                "params": {"name": name, "arguments": arguments},
            }
        )
        payload = json.loads(data.decode("utf-8"))
        result = payload.get("result", {})
        if result.get("isError"):
            raise RuntimeError(payload)
        return result.get("structuredContent") or result

    def record_event(self, *, content: str, entities: list[str], tags: list[str]) -> Any:
        return self.call_tool(
            "record_event",
            {
                "agent": "CODEX",
                "content": content,
                "entities": entities,
                "tags": tags,
            },
        )

    def _next_id(self) -> int:
        value = self.request_id
        self.request_id += 1
        return value

    def _post(self, body: dict[str, Any], *, session: bool = True) -> tuple[bytes, dict[str, str]]:
        headers = {"Content-Type": "application/json", "Accept": "application/json"}
        if session and self.session_id:
            headers["mcp-session-id"] = self.session_id
        request = urllib.request.Request(
            self.endpoint,
            data=json.dumps(body).encode("utf-8"),
            headers=headers,
            method="POST",
        )
        with urllib.request.urlopen(request, timeout=self.timeout) as response:
            return response.read(), {key.lower(): value for key, value in response.headers.items()}


def rag_queue_stats(args: argparse.Namespace) -> dict[str, int]:
    client = RAGSSHClient(
        host=args.rag_host,
        user=args.rag_user,
        identity=args.rag_identity,
        staging_dir=args.rag_staging_dir,
        ingest_dir=args.rag_ingest_dir,
        collection=args.collection,
    )
    return client.stats()


def memory_search_checks(client: MCPToolClient, queries: list[str], limit: int) -> dict[str, Any]:
    checks: dict[str, Any] = {"search_wiki": {}, "search_events": {}}
    for query in queries:
        try:
            checks["search_wiki"][query] = client.call_tool("search_wiki", {"query": query, "limit": limit})
        except Exception as error:  # noqa: BLE001
            checks["search_wiki"][query] = {"error": str(error)}
        try:
            checks["search_events"][query] = client.call_tool("search_events", {"query": query, "limit": limit})
        except Exception as error:  # noqa: BLE001
            checks["search_events"][query] = {"error": str(error)}
    return checks


def build_summary_event(
    *,
    collection: str,
    state_path: pathlib.Path,
    log_path: pathlib.Path,
    rag_dir: pathlib.Path,
    wiki_output: str,
    audit: dict[str, Any],
    rag_stats: dict[str, int] | None,
) -> str:
    state_counts = audit["state"]
    rag_metadata = audit["rag_metadata"]
    lines = [
        "Home Assistant documentation import verification completed.",
        "",
        f"Collection: {collection}",
        f"Completed pages: {state_counts['completed']}",
        f"Skipped pages: {state_counts['skipped']}",
        f"Failed pages: {state_counts['failed']}",
        f"State records with full Phase 3A metadata: {audit['record_metadata']['complete_records']} of {state_counts['records']}",
        f"RAG markdown with frontmatter: {rag_metadata['with_frontmatter']} of {rag_metadata['markdown_count']}",
        f"State file: {state_path}",
        f"Log file: {log_path}",
        f"RAG staging directory: {rag_dir}",
    ]
    if wiki_output:
        lines.append(f"Associated wiki markdown: {wiki_output}")
    if rag_stats is not None:
        lines.append(f"RAG queue stats: {json.dumps(rag_stats, sort_keys=True)}")
    return "\n".join(lines)


def run(args: argparse.Namespace) -> int:
    state_path = pathlib.Path(args.state)
    log_path = pathlib.Path(args.log)
    rag_dir = pathlib.Path(args.rag_dir)
    state = ImportState.load(state_path)
    audit = audit_import_outputs(state=state, rag_dir=rag_dir, sample_limit=args.sample_limit)

    checks: dict[str, Any] = {"audit": audit}
    rag_stats = None
    if args.include_rag_stats:
        rag_stats = rag_queue_stats(args)
        checks["rag_queue"] = rag_stats

    wiki_output = ""
    if args.write_wiki:
        wiki_path = pathlib.Path(args.write_wiki)
        wiki_path.parent.mkdir(parents=True, exist_ok=True)
        wiki_path.write_text(
            build_collection_wiki_markdown(
                title=args.wiki_title,
                collection=args.collection,
                state_path=state_path,
                log_path=log_path,
                rag_dir=rag_dir,
                audit=audit,
                memory_endpoint=args.endpoint,
                rag_stats=rag_stats,
            ),
            encoding="utf-8",
        )
        wiki_output = str(wiki_path)
        checks["wiki_output"] = wiki_output

    memory_checks = None
    memory_client = None
    if not args.no_live_memory:
        memory_client = MCPToolClient(args.endpoint, timeout=args.mcp_timeout)
        memory_client.connect()
        queries = args.query or [args.collection, "Home Assistant"]
        memory_checks = memory_search_checks(memory_client, queries, args.search_limit)
        checks["memory"] = memory_checks

    if args.record_event:
        if memory_client is None:
            memory_client = MCPToolClient(args.endpoint, timeout=args.mcp_timeout)
            memory_client.connect()
        memory_client.record_event(
            content=build_summary_event(
                collection=args.collection,
                state_path=state_path,
                log_path=log_path,
                rag_dir=rag_dir,
                wiki_output=wiki_output,
                audit=audit,
                rag_stats=rag_stats,
            ),
            entities=[
                "agentmemory",
                "memory-mcp",
                "home-assistant",
                args.collection,
                slug(args.wiki_title),
            ],
            tags=[
                "agentmemory",
                "web-page-import",
                "home-assistant",
                "phase-3a",
                "import-verification",
            ],
        )
        checks["record_event"] = "written"

    if args.output:
        output_path = pathlib.Path(args.output)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(json.dumps(checks, indent=2, sort_keys=True), encoding="utf-8")

    print(json.dumps(checks, indent=2, sort_keys=True))
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--endpoint", default=DEFAULT_ENDPOINT)
    parser.add_argument("--collection", default=DEFAULT_COLLECTION)
    parser.add_argument("--state", default=DEFAULT_STATE)
    parser.add_argument("--log", default=DEFAULT_LOG)
    parser.add_argument("--rag-dir", default=DEFAULT_RAG_DIR)
    parser.add_argument("--wiki-title", default=DEFAULT_WIKI_TITLE)
    parser.add_argument("--write-wiki", default="", help="Optional markdown path for the associated collection wiki page.")
    parser.add_argument("--output", default="", help="Optional JSON path for the full verification result.")
    parser.add_argument("--sample-limit", type=int, default=8)
    parser.add_argument("--query", action="append", default=[], help="Memory MCP search query. May be repeated.")
    parser.add_argument("--search-limit", type=int, default=3)
    parser.add_argument("--mcp-timeout", type=int, default=20)
    parser.add_argument("--no-live-memory", action="store_true")
    parser.add_argument("--record-event", action="store_true")
    parser.add_argument("--include-rag-stats", action="store_true")
    parser.add_argument("--rag-host", default="192.168.1.107")
    parser.add_argument("--rag-user", default="veronika")
    parser.add_argument("--rag-identity", default="~/.ssh/id_rsa_hermes")
    parser.add_argument("--rag-staging-dir", default="/opt/rag/uploads-staging")
    parser.add_argument("--rag-ingest-dir", default="/opt/rag/ingest")
    return run(parser.parse_args())


if __name__ == "__main__":
    raise SystemExit(main())
