#!/usr/bin/env python3
"""Fail-closed deployment preflight for Memory MCP runtime dependencies."""

from __future__ import annotations

import re
import sys
from importlib import metadata
from pathlib import Path


SUPPORTED_FASTMCP = ">=3.2.4,<4"
MIN_FASTMCP = (3, 2, 4)
MAX_FASTMCP_MAJOR = 4
_STABLE_VERSION = re.compile(
    r"^(\d+)\.(\d+)\.(\d+)(?:\.post\d+)?(?:\+[a-zA-Z0-9.-]+)?$"
)


def _fail(message: str) -> int:
    print(f"Memory MCP dependency preflight failed: {message}", file=sys.stderr)
    return 1


def _fastmcp_release() -> tuple[str, tuple[int, int, int]]:
    try:
        installed = metadata.version("fastmcp")
    except metadata.PackageNotFoundError as error:
        raise RuntimeError(
            f"FastMCP is missing; required {SUPPORTED_FASTMCP}"
        ) from error
    match = _STABLE_VERSION.fullmatch(installed)
    if match is None:
        raise RuntimeError(
            f"FastMCP {installed} is not a reviewed stable release; "
            f"required {SUPPORTED_FASTMCP}"
        )
    release = tuple(int(part) for part in match.groups())
    if release < MIN_FASTMCP or release[0] >= MAX_FASTMCP_MAJOR:
        raise RuntimeError(
            f"FastMCP {installed} is unsupported; required {SUPPORTED_FASTMCP}"
        )
    return installed, release


def _require_runtime_apis(project_root: Path) -> None:
    try:
        from fastmcp import FastMCP
        from fastmcp.server.auth import AccessToken, TokenVerifier
        import frontmatter
        import httpx
        import memory_mcp
        from ulid import ULID
        from starlette.middleware import Middleware

        from memory_mcp import index_cli, mcp_auth
    except (ImportError, ModuleNotFoundError) as error:
        raise RuntimeError(
            f"required FastMCP authentication API is unavailable: {type(error).__name__}"
        ) from error

    package_path = Path(memory_mcp.__file__).resolve()
    expected_source = (project_root / "src/memory_mcp").resolve()
    if not package_path.is_relative_to(expected_source):
        raise RuntimeError("installed memory_mcp is not bound to the staged source")

    required_fastmcp_methods = ("custom_route", "http_app", "run", "tool")
    missing = [
        method
        for method in required_fastmcp_methods
        if not callable(getattr(FastMCP, method, None))
    ]
    if missing:
        raise RuntimeError(
            f"required FastMCP APIs are unavailable: {', '.join(sorted(missing))}"
        )
    if (
        not issubclass(mcp_auth.MemoryMcpTokenVerifier, TokenVerifier)
        or AccessToken is None
        or Middleware is None
        or ULID is None
        or frontmatter is None
        or httpx is None
        or not callable(index_cli.main)
    ):
        raise RuntimeError("required FastMCP authentication API is incompatible")


def main() -> int:
    project_root = Path(__file__).resolve().parents[1]
    try:
        installed, _ = _fastmcp_release()
        _require_runtime_apis(project_root)
    except (OSError, RuntimeError, TypeError, ValueError) as error:
        return _fail(str(error))
    print(
        f"Memory MCP dependency preflight passed: FastMCP {installed} "
        "and required auth APIs."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
