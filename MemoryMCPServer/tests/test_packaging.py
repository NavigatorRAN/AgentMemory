from __future__ import annotations

import tomllib
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parents[1]


def test_fastmcp_dependency_declares_the_minimum_tested_v3_api_window() -> None:
    metadata = tomllib.loads(
        (PROJECT_ROOT / "pyproject.toml").read_text(encoding="utf-8")
    )
    dependencies = metadata["project"]["dependencies"]
    fastmcp_dependencies = [
        dependency
        for dependency in dependencies
        if dependency.lower().startswith("fastmcp")
    ]

    assert fastmcp_dependencies == ["fastmcp>=3.2.4,<4"]
