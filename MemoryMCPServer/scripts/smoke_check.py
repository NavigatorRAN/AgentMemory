#!/usr/bin/env python3
"""Smoke-check a Memory MCP HTTP endpoint."""
from __future__ import annotations

import argparse
import json
import urllib.request
from typing import Any


class MCPClient:
    def __init__(self, endpoint: str) -> None:
        self.endpoint = endpoint
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
                    "clientInfo": {"name": "memory-mcp-smoke", "version": "1.0"},
                },
            },
            session=False,
        )
        self.session_id = headers.get("mcp-session-id")
        if not self.session_id:
            raise RuntimeError(f"Missing mcp-session-id: {data!r}")
        self._post({"jsonrpc": "2.0", "method": "notifications/initialized", "params": {}})

    def call_tool(self, name: str, arguments: dict[str, Any]) -> dict[str, Any]:
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
        with urllib.request.urlopen(request, timeout=30) as response:
            return response.read(), {key.lower(): value for key, value in response.headers.items()}


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--endpoint", default="http://192.168.1.26:8006/mcp")
    parser.add_argument("--wiki-slug", default="memory-mcp")
    parser.add_argument("--write-event", action="store_true")
    args = parser.parse_args()

    client = MCPClient(args.endpoint)
    client.connect()
    checks: dict[str, Any] = {}
    if args.write_event:
        checks["record_event"] = client.call_tool(
            "record_event",
            {
                "content": "Memory MCP deployment smoke check completed.",
                "entities": ["memory-mcp", "agentmemory"],
                "tags": ["smoke-check", "deployment"],
                "agent": "CODEX",
            },
        )
    checks["search_wiki"] = client.call_tool("search_wiki", {"query": "memory-mcp", "limit": 3})
    checks["get_wiki_page"] = client.call_tool("get_wiki_page", {"slug": args.wiki_slug})
    checks["memory_graph"] = client.call_tool("memory_graph", {"limit": 10})
    print(json.dumps(checks, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
