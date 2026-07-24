from __future__ import annotations

import os
import subprocess
import sys
import venv
from pathlib import Path


PROJECT_ROOT = Path(__file__).resolve().parents[1]
DEPLOY = PROJECT_ROOT / "scripts/deploy.sh"
ENSURE = PROJECT_ROOT / "scripts/ensure_dependencies.sh"
PREFLIGHT = PROJECT_ROOT / "scripts/preflight_dependencies.py"


def _run_preflight(python: Path) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        [str(python), str(PREFLIGHT)],
        cwd=PROJECT_ROOT,
        capture_output=True,
        text=True,
        check=False,
    )


def _write_fake_python(project: Path) -> tuple[Path, Path]:
    python = project / ".venv/bin/python"
    python.parent.mkdir(parents=True)
    state = project / "repaired"
    log = project / "pip-arguments.txt"
    python.write_text(
        """#!/usr/bin/env bash
set -euo pipefail
if [ "${1:-}" = "-m" ] && [ "${2:-}" = "pip" ]; then
  printf '%s\\n' "$*" > "${FAKE_PIP_LOG}"
  touch "${FAKE_REPAIRED_STATE}"
  exit 0
fi
count=0
if [ -f "${FAKE_PREFLIGHT_COUNT}" ]; then
  count="$(cat "${FAKE_PREFLIGHT_COUNT}")"
fi
printf '%s\\n' "$((count + 1))" > "${FAKE_PREFLIGHT_COUNT}"
if [ -f "${FAKE_REPAIRED_STATE}" ] || [ "${FAKE_PREFLIGHT_OK:-false}" = "true" ]; then
  exit 0
fi
echo 'FastMCP is missing or unsupported' >&2
exit 1
""",
        encoding="utf-8",
    )
    python.chmod(0o755)
    return state, log


def _ensure_environment(project: Path, state: Path, log: Path) -> dict[str, str]:
    return {
        **os.environ,
        "FAKE_REPAIRED_STATE": str(state),
        "FAKE_PIP_LOG": str(log),
        "FAKE_PREFLIGHT_COUNT": str(project / "preflight-count.txt"),
        "MEMORY_MCP_DEPENDENCY_WHEELHOUSE": str(project / "wheelhouse"),
    }


def test_dependency_preflight_rejects_missing_fastmcp(tmp_path: Path) -> None:
    environment = tmp_path / "missing"
    venv.EnvBuilder(with_pip=False).create(environment)

    result = _run_preflight(environment / "bin/python")

    assert result.returncode != 0
    assert "FastMCP" in result.stderr


def test_dependency_preflight_rejects_obsolete_fastmcp(tmp_path: Path) -> None:
    environment = tmp_path / "old"
    venv.EnvBuilder(with_pip=False).create(environment)
    site_packages = next((environment / "lib").glob("python*/site-packages"))
    package = site_packages / "fastmcp"
    package.mkdir()
    (package / "__init__.py").write_text(
        "class FastMCP:\n    pass\n",
        encoding="utf-8",
    )
    metadata = site_packages / "fastmcp-0.4.0.dist-info"
    metadata.mkdir()
    (metadata / "METADATA").write_text(
        "Metadata-Version: 2.1\nName: fastmcp\nVersion: 0.4.0\n",
        encoding="utf-8",
    )

    result = _run_preflight(environment / "bin/python")

    assert result.returncode != 0
    assert "0.4.0" in result.stderr
    assert ">=3.2.4,<4" in result.stderr


def test_supported_environment_skips_dependency_install(tmp_path: Path) -> None:
    project = tmp_path / "project"
    state, log = _write_fake_python(project)
    environment = _ensure_environment(project, state, log)
    environment["FAKE_PREFLIGHT_OK"] = "true"

    result = subprocess.run(
        ["bash", str(ENSURE), str(project)],
        env=environment,
        capture_output=True,
        text=True,
        check=False,
    )

    assert result.returncode == 0
    assert not log.exists()
    assert "already satisfies" in result.stdout


def test_unsupported_environment_fails_closed_without_reviewed_upgrade(
    tmp_path: Path,
) -> None:
    project = tmp_path / "project"
    state, log = _write_fake_python(project)
    wheelhouse = project / "wheelhouse"
    wheelhouse.mkdir()
    environment = _ensure_environment(project, state, log)
    environment["MEMORY_MCP_ALLOW_DEPENDENCY_UPGRADE"] = "false"

    result = subprocess.run(
        ["bash", str(ENSURE), str(project)],
        env=environment,
        capture_output=True,
        text=True,
        check=False,
    )

    assert result.returncode != 0
    assert not log.exists()
    assert "before service restart" in result.stderr


def test_reviewed_offline_wheelhouse_repairs_then_rechecks_preflight(
    tmp_path: Path,
) -> None:
    project = tmp_path / "project"
    state, log = _write_fake_python(project)
    wheelhouse = project / "wheelhouse"
    wheelhouse.mkdir()
    environment = _ensure_environment(project, state, log)
    environment["MEMORY_MCP_ALLOW_DEPENDENCY_UPGRADE"] = "true"

    result = subprocess.run(
        ["bash", str(ENSURE), str(project)],
        env=environment,
        capture_output=True,
        text=True,
        check=False,
    )

    assert result.returncode == 0
    assert state.exists()
    assert (project / "preflight-count.txt").read_text(encoding="utf-8") == "2\n"
    arguments = log.read_text(encoding="utf-8")
    assert "--no-index" in arguments
    assert "--find-links" in arguments
    assert "--no-deps" not in arguments
    assert "revalidated" in result.stdout


def test_deploy_gates_restart_on_dependency_preflight() -> None:
    source = DEPLOY.read_text(encoding="utf-8")

    assert "scripts/ensure_dependencies.sh" in source
    assert source.index("scripts/ensure_dependencies.sh") < source.index(
        "systemctl restart memory-mcp.service"
    )
    assert "--no-deps" not in source
    assert "import memory_mcp.index_cli" not in source
    assert "rsync -a --delete --exclude '.venv' --exclude 'wheelhouse'" in source
    assert "if [ ! -x .venv/bin/python ]; then" in source


def test_deployment_shell_scripts_parse() -> None:
    for script in (DEPLOY, ENSURE):
        subprocess.run(["bash", "-n", str(script)], check=True)


def test_current_interpreter_passes_dependency_preflight() -> None:
    result = _run_preflight(Path(sys.executable))

    assert result.returncode == 0, result.stderr
    assert "FastMCP" in result.stdout
