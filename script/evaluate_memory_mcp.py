#!/usr/bin/env python3
"""Run a small source-safe eval suite against the live Memory MCP endpoint."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import pathlib
import time
import urllib.request
from typing import Any


DEFAULT_ENDPOINT = "http://192.168.1.26:8006/mcp"
DEFAULT_REPORT_JSON = ".memory-mcp-eval-report.json"
DEFAULT_REPORT_MD = ".memory-mcp-eval-report.md"

DEFAULT_EVALS: list[dict[str, Any]] = [
    {
        "name": "wiki-memory-mcp",
        "tool": "search_wiki",
        "arguments": {"query": "memory-mcp", "limit": 5},
        "expect": {"min_count": 1, "text_contains": "Memory MCP"},
    },
    {
        "name": "wiki-page-memory-mcp",
        "tool": "get_wiki_page",
        "arguments": {"slug": "memory-mcp"},
        "expect": {"text_contains": "Memory MCP"},
    },
    {
        "name": "events-home-assistant",
        "tool": "search_events",
        "arguments": {"query": "Home Assistant", "limit": 5},
        "expect": {"min_count": 1, "text_contains": "Home Assistant"},
    },
    {
        "name": "graph-home-assistant-focus",
        "tool": "memory_graph",
        "arguments": {"query": "home-assistant", "limit": 50},
        "expect": {"min_nodes": 1, "summary_key": "total_node_count"},
    },
    {
        "name": "metrics-index-ready",
        "tool": "memory_metrics",
        "arguments": {},
        "expect": {"index_ready": True},
    },
]


def utc_now() -> str:
    return dt.datetime.now(dt.timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")


class MCPClient:
    def __init__(self, endpoint: str) -> None:
        self.endpoint = endpoint
        self.session_id = ""
        self.request_id = 1

    def connect(self) -> None:
        response, headers = self._post(
            {
                "jsonrpc": "2.0",
                "id": self._next_id(),
                "method": "initialize",
                "params": {
                    "protocolVersion": "2024-11-05",
                    "capabilities": {},
                    "clientInfo": {"name": "MemoryMCPEval", "version": "1.0"},
                },
            },
            session=False,
        )
        self.session_id = headers.get("mcp-session-id", "")
        if not self.session_id:
            raise RuntimeError(f"missing mcp-session-id: {response!r}")
        self._post({"jsonrpc": "2.0", "method": "notifications/initialized", "params": {}})

    def call_tool(self, name: str, arguments: dict[str, Any]) -> dict[str, Any]:
        response, _ = self._post(
            {
                "jsonrpc": "2.0",
                "id": self._next_id(),
                "method": "tools/call",
                "params": {"name": name, "arguments": arguments},
            }
        )
        parsed = json.loads(response.decode("utf-8"))
        if parsed.get("result", {}).get("isError"):
            raise RuntimeError(parsed)
        return parsed.get("result", {}).get("structuredContent") or {}

    def record_event(self, content: str, entities: list[str], tags: list[str]) -> str:
        result = self.call_tool(
            "record_event",
            {
                "agent": "CODEX",
                "content": content,
                "entities": entities,
                "tags": tags,
            },
        )
        return str(result.get("id") or "")

    def _post(self, body: dict[str, Any], *, session: bool = True) -> tuple[bytes, dict[str, str]]:
        headers = {"Content-Type": "application/json", "Accept": "application/json, text/event-stream"}
        if session and self.session_id:
            headers["mcp-session-id"] = self.session_id
        request = urllib.request.Request(self.endpoint, data=json.dumps(body).encode("utf-8"), headers=headers)
        with urllib.request.urlopen(request, timeout=60) as response:
            return response.read(), dict(response.headers.items())

    def _next_id(self) -> int:
        self.request_id += 1
        return self.request_id


def result_payload(structured: Any) -> Any:
    if isinstance(structured, dict) and "result" in structured:
        return structured["result"]
    return structured


def text_blob(value: Any) -> str:
    return json.dumps(value, sort_keys=True)


def score_eval(payload: Any, expect: dict[str, Any]) -> tuple[bool, list[str]]:
    failures: list[str] = []
    if "min_count" in expect:
        count = len(payload) if isinstance(payload, list) else 0
        if count < int(expect["min_count"]):
            failures.append(f"expected at least {expect['min_count']} result(s), got {count}")
    if "text_contains" in expect and str(expect["text_contains"]) not in text_blob(payload):
        failures.append(f"expected text containing {expect['text_contains']!r}")
    if "min_nodes" in expect:
        nodes = payload.get("nodes", []) if isinstance(payload, dict) else []
        if len(nodes) < int(expect["min_nodes"]):
            failures.append(f"expected at least {expect['min_nodes']} graph node(s), got {len(nodes)}")
    if "summary_key" in expect:
        summary = payload.get("summary", {}) if isinstance(payload, dict) else {}
        if expect["summary_key"] not in summary:
            failures.append(f"expected graph summary key {expect['summary_key']!r}")
    if expect.get("index_ready"):
        index = payload.get("index", {}) if isinstance(payload, dict) else {}
        if index.get("ready") is not True:
            failures.append("expected memory_metrics.index.ready true")
    return not failures, failures


def run_eval(client: MCPClient, case: dict[str, Any]) -> dict[str, Any]:
    start = time.perf_counter()
    try:
        structured = client.call_tool(case["tool"], case.get("arguments", {}))
        payload = result_payload(structured)
        passed, failures = score_eval(payload, case.get("expect", {}))
        return {
            "name": case["name"],
            "tool": case["tool"],
            "passed": passed,
            "failures": failures,
            "elapsed_ms": round((time.perf_counter() - start) * 1000, 2),
        }
    except Exception as error:  # noqa: BLE001
        return {
            "name": case["name"],
            "tool": case["tool"],
            "passed": False,
            "failures": [str(error)],
            "elapsed_ms": round((time.perf_counter() - start) * 1000, 2),
        }


def markdown_report(report: dict[str, Any]) -> str:
    lines = [
        "# Memory MCP Eval Report",
        "",
        f"- Endpoint: {report['endpoint']}",
        f"- Generated at: {report['generated_at']}",
        f"- Passed: {report['passed_count']} / {report['case_count']}",
        "",
        "## Cases",
        "",
    ]
    for case in report["cases"]:
        status = "PASS" if case["passed"] else "FAIL"
        lines.append(f"- {status} `{case['name']}` via `{case['tool']}` ({case['elapsed_ms']} ms)")
        for failure in case["failures"]:
            lines.append(f"  - {failure}")
    return "\n".join(lines).strip() + "\n"


def record_summary_event(client: MCPClient, report: dict[str, Any], json_path: pathlib.Path, markdown_path: pathlib.Path) -> str:
    failed = [case["name"] for case in report["cases"] if not case["passed"]]
    content = "\n".join(
        [
            "Memory MCP eval suite finished.",
            "",
            f"Endpoint: {report['endpoint']}",
            f"Passed: {report['passed_count']} / {report['case_count']}",
            f"Failed cases: {', '.join(failed) if failed else 'none'}",
            f"JSON report: {json_path}",
            f"Markdown report: {markdown_path}",
        ]
    )
    return client.record_event(
        content=content,
        entities=["memory-mcp", "agentmemory", "memory-mcp-evals"],
        tags=["eval", "memory-mcp", "observability", "phase-5"],
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--endpoint", default=DEFAULT_ENDPOINT)
    parser.add_argument("--report-json", default=DEFAULT_REPORT_JSON)
    parser.add_argument("--report-md", default=DEFAULT_REPORT_MD)
    parser.add_argument("--record-event", action="store_true")
    args = parser.parse_args()

    client = MCPClient(args.endpoint)
    client.connect()
    cases = [run_eval(client, case) for case in DEFAULT_EVALS]
    report = {
        "endpoint": args.endpoint,
        "generated_at": utc_now(),
        "case_count": len(cases),
        "passed_count": sum(1 for case in cases if case["passed"]),
        "cases": cases,
    }
    json_path = pathlib.Path(args.report_json)
    markdown_path = pathlib.Path(args.report_md)
    json_path.write_text(json.dumps(report, indent=2, sort_keys=True), encoding="utf-8")
    markdown_path.write_text(markdown_report(report), encoding="utf-8")
    if args.record_event:
        report["memory_event_id"] = record_summary_event(client, report, json_path, markdown_path)
        json_path.write_text(json.dumps(report, indent=2, sort_keys=True), encoding="utf-8")
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0 if report["passed_count"] == report["case_count"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
