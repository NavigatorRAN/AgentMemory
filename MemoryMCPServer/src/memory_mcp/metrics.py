"""Small in-process metrics for Memory MCP tool calls."""
from __future__ import annotations

import time
from contextlib import contextmanager
from threading import Lock
from typing import Any, Iterator


_lock = Lock()
_tools: dict[str, dict[str, Any]] = {}
_index_fallbacks: dict[str, dict[str, Any]] = {}


@contextmanager
def measure_tool(name: str) -> Iterator[None]:
    start = time.perf_counter()
    ok = False
    try:
        yield
        ok = True
    finally:
        elapsed_ms = (time.perf_counter() - start) * 1000
        with _lock:
            bucket = _tools.setdefault(
                name,
                {
                    "calls": 0,
                    "errors": 0,
                    "total_ms": 0.0,
                    "last_ms": 0.0,
                    "max_ms": 0.0,
                },
            )
            bucket["calls"] += 1
            if not ok:
                bucket["errors"] += 1
            bucket["total_ms"] += elapsed_ms
            bucket["last_ms"] = elapsed_ms
            bucket["max_ms"] = max(bucket["max_ms"], elapsed_ms)


def record_index_fallback(tool: str, error: BaseException) -> None:
    with _lock:
        bucket = _index_fallbacks.setdefault(
            tool,
            {
                "count": 0,
                "last_error_type": None,
                "last_error": None,
            },
        )
        bucket["count"] += 1
        bucket["last_error_type"] = type(error).__name__
        bucket["last_error"] = str(error)[:500]


def snapshot() -> dict[str, Any]:
    with _lock:
        tools = {
            name: {
                **values,
                "avg_ms": values["total_ms"] / values["calls"] if values["calls"] else 0.0,
            }
            for name, values in sorted(_tools.items())
        }
        index_fallbacks = {
            name: dict(values)
            for name, values in sorted(_index_fallbacks.items())
        }
    return {"tools": tools, "index_fallbacks": index_fallbacks}
