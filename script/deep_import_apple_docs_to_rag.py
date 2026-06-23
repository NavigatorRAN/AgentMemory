#!/usr/bin/env python3
"""Deep-import selected Apple Developer Documentation areas into the RAG queue.

This complements import_apple_docs_to_memory.py. Memory MCP keeps the map; this
script stages detailed source-backed Apple doc pages into the RAG ingestion
queue so future agents can retrieve API-level detail without browsing.
"""

from __future__ import annotations

import argparse
import json
import pathlib
import shutil
import subprocess
import sys
import tempfile
import time
from dataclasses import dataclass
from typing import Any

SCRIPT_DIR = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))

from import_apple_docs_to_memory import (  # noqa: E402
    APPLE_BASE,
    MemoryMCPClient,
    Technology,
    collect_text,
    data_url_for_path,
    fetch_json,
    identifier_string,
    load_catalog,
    reference_items,
    slug,
    stable_unique,
    topic_sections,
    unique_lines,
)


DEFAULT_TOPICS = [
    "Foundation Models",
    "Core AI",
    "App Intents",
    "SwiftUI",
    "SwiftData",
    "Xcode",
    "StoreKit",
    "CloudKit",
]


@dataclass(frozen=True)
class RAGJob:
    title: str
    source_url: str
    job_id: int


def page_title(page: dict[str, Any], fallback: str) -> str:
    metadata = page.get("metadata") or {}
    return str(metadata.get("title") or fallback)


def page_source_url(page: dict[str, Any], fallback: str) -> str:
    identifier = identifier_string(page.get("identifier"))
    if "/documentation/" in identifier.lower():
        path = identifier[identifier.lower().find("/documentation/") :].lower()
        return f"{APPLE_BASE}{path}"
    return fallback


def page_markdown(
    *,
    topic_title: str,
    source_url: str,
    data_url: str,
    page: dict[str, Any],
    fallback_title: str,
    max_text_chars: int,
    max_references: int,
) -> str:
    title = page_title(page, fallback_title)
    identifier = identifier_string(page.get("identifier"))
    abstract = unique_lines("\n".join(collect_text(page.get("abstract"))), max_chars=2400)
    body = unique_lines(
        "\n".join(collect_text(page.get("primaryContentSections")) + collect_text(page.get("sections"))),
        max_chars=max_text_chars,
    )
    refs = reference_items(page)
    topics = topic_sections(page, refs, max_refs_per_topic=30)

    lines = [
        f"# {title}",
        "",
        "Apple Developer Documentation deep import for AgentMemory RAG.",
        "",
        f"- Topic: {topic_title}",
        f"- Source URL: {source_url}",
        f"- Data URL: {data_url}",
    ]
    if identifier:
        lines.append(f"- Identifier: {identifier}")
    if abstract:
        lines.extend(["", "## Abstract", "", abstract])
    if body:
        lines.extend(["", "## Documentation Text", "", body])
    if topics:
        lines.extend(["", "## Topic Sections", "", topics])
    if refs:
        lines.extend(["", f"## Related Documentation ({min(len(refs), max_references)} of {len(refs)})", ""])
        for ref in refs[:max_references]:
            suffix = f" - {ref['abstract']}" if ref["abstract"] else ""
            lines.append(f"- [{ref['title']}]({ref['url']}){suffix}")
    return "\n".join(lines).strip() + "\n"


def page_data_url_from_source_url(source_url: str) -> str | None:
    if not source_url.startswith(f"{APPLE_BASE}/documentation/"):
        return None
    path = source_url.removeprefix(APPLE_BASE)
    return data_url_for_path(path)


def command(args: list[str], *, quiet: bool = False) -> str:
    result = subprocess.run(args, text=True, capture_output=True, check=False)
    if result.returncode != 0:
        message = result.stderr.strip() or result.stdout.strip()
        raise RuntimeError(f"{' '.join(args)} failed: {message}")
    if not quiet and result.stderr.strip():
        print(result.stderr.strip(), file=sys.stderr)
    return result.stdout


def shell_quote(value: str) -> str:
    return "'" + value.replace("'", "'\"'\"'") + "'"


class RAGSSHClient:
    def __init__(
        self,
        *,
        host: str,
        user: str,
        identity: str,
        staging_dir: str,
        ingest_dir: str,
        collection: str,
    ) -> None:
        self.host = host
        self.user = user
        self.identity = pathlib.Path(identity).expanduser()
        self.staging_dir = staging_dir
        self.ingest_dir = ingest_dir
        self.collection = collection

    def enqueue_markdown(self, filename: str, content: str, tags: list[str]) -> int:
        with tempfile.TemporaryDirectory(prefix="apple-docs-rag-") as directory:
            local_path = pathlib.Path(directory) / filename
            local_path.write_text(content, encoding="utf-8")
            remote_path = f"{self.staging_dir}/{filename}"
            ssh_prefix = [
                "-i",
                str(self.identity),
                "-o",
                "IdentitiesOnly=yes",
                "-o",
                "BatchMode=yes",
            ]
            command(
                [
                    "/usr/bin/scp",
                    *ssh_prefix,
                    str(local_path),
                    f"{self.user}@{self.host}:{remote_path}",
                ],
                quiet=True,
            )
            enqueue_script = (
                "import queue_db; "
                f"print(queue_db.enqueue({json.dumps(remote_path)}, {json.dumps(self.collection)}, {json.dumps(tags)}))"
            )
            output = command(
                [
                    "/usr/bin/ssh",
                    *ssh_prefix,
                    f"{self.user}@{self.host}",
                    f"cd {shell_quote(self.ingest_dir)} && ./.venv/bin/python -c {shell_quote(enqueue_script)}",
                ],
                quiet=True,
            )
            return int(output.strip())

    def stats(self) -> dict[str, int]:
        ssh_prefix = [
            "-i",
            str(self.identity),
            "-o",
            "IdentitiesOnly=yes",
            "-o",
            "BatchMode=yes",
        ]
        output = command(
            [
                "/usr/bin/ssh",
                *ssh_prefix,
                f"{self.user}@{self.host}",
                "cd "
                + shell_quote(self.ingest_dir)
                + " && ./.venv/bin/python -c "
                + shell_quote("import json, queue_db; queue_db.init_db(); print(json.dumps(queue_db.stats()))"),
            ],
            quiet=True,
        )
        return json.loads(output)


def topic_matches(catalog: list[Technology], names: list[str]) -> list[Technology]:
    by_title = {technology.title.lower(): technology for technology in catalog}
    result: list[Technology] = []
    for name in names:
        technology = by_title.get(name.lower())
        if technology is None:
            matches = [item for item in catalog if name.lower() in item.title.lower()]
            if not matches:
                raise RuntimeError(f"Apple documentation topic not found: {name}")
            technology = matches[0]
        result.append(technology)
    return result


def load_state(path: pathlib.Path) -> set[str]:
    if not path.exists():
        return set()
    return set(json.loads(path.read_text(encoding="utf-8")).get("completed", []))


def save_state(path: pathlib.Path, completed: set[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps({"completed": sorted(completed)}, indent=2), encoding="utf-8")


def collect_pages_for_topic(technology: Technology, *, max_child_pages: int) -> list[tuple[str, str, str]]:
    root_page = fetch_json(technology.data_url)
    pages = [(technology.title, technology.doc_url, technology.data_url)]
    refs = reference_items(root_page)
    for ref in refs[:max_child_pages]:
        data_url = page_data_url_from_source_url(ref["url"])
        if data_url:
            pages.append((ref["title"], ref["url"], data_url))
    return pages


def record_memory_card(
    *,
    memory_endpoint: str,
    technology: Technology,
    jobs: list[RAGJob],
    collection: str,
    dry_run: bool,
) -> None:
    if dry_run:
        return
    client = MemoryMCPClient(memory_endpoint)
    client.connect()
    lines = [
        "Apple Developer Documentation deep RAG import completed.",
        "",
        f"Topic: {technology.title}",
        f"Source URL: {technology.doc_url}",
        f"RAG collection: {collection}",
        f"Documents enqueued: {len(jobs)}",
        "",
        "RAG jobs:",
    ]
    lines.extend(f"- #{job.job_id}: {job.title} ({job.source_url})" for job in jobs[:120])
    client.record_event(
        content="\n".join(lines),
        entities=stable_unique(
            [
                "agentmemory",
                "apple-developer-documentation",
                "apple-docs-deep-rag",
                f"apple-docs-{slug(technology.title)}",
            ]
        ),
        tags=stable_unique(["agentmemory", "apple-docs", "rag", "deep-import", slug(technology.title)]),
    )


def run(args: argparse.Namespace) -> int:
    state_path = pathlib.Path(args.state)
    completed = load_state(state_path)
    topics = topic_matches(load_catalog(), args.topics)
    rag = RAGSSHClient(
        host=args.rag_host,
        user=args.rag_user,
        identity=args.rag_identity,
        staging_dir=args.rag_staging_dir,
        ingest_dir=args.rag_ingest_dir,
        collection=args.collection,
    )

    print(f"Initial RAG stats: {rag.stats() if not args.dry_run else '(dry run)'}")
    total_jobs = 0
    failures: list[str] = []
    for technology in topics:
        if technology.external:
            print(f"Skip external topic for deep RAG: {technology.title}")
            continue
        print(f"Topic: {technology.title}")
        jobs: list[RAGJob] = []
        try:
            pages = collect_pages_for_topic(technology, max_child_pages=args.max_child_pages)
        except Exception as error:  # noqa: BLE001
            failures.append(f"{technology.title}: page collection failed: {error}")
            continue

        for page_index, (fallback_title, source_url, data_url) in enumerate(pages, start=1):
            state_key = f"{technology.identifier}|{source_url}"
            if state_key in completed:
                print(f"  [{page_index}/{len(pages)}] skip {fallback_title}")
                continue
            try:
                page = fetch_json(data_url)
                canonical_source = page_source_url(page, source_url)
                title = page_title(page, fallback_title)
                filename = f"apple-docs-{slug(technology.title)}-{slug(title)}.md"
                content = page_markdown(
                    topic_title=technology.title,
                    source_url=canonical_source,
                    data_url=data_url,
                    page=page,
                    fallback_title=fallback_title,
                    max_text_chars=args.max_text_chars,
                    max_references=args.max_references,
                )
                tags = stable_unique(
                    [
                        "apple-docs",
                        "apple-developer",
                        "deep-import",
                        slug(technology.title),
                        slug(title),
                    ]
                )
                if args.dry_run:
                    job_id = -1
                    print(f"  [{page_index}/{len(pages)}] dry-run {title}")
                else:
                    job_id = rag.enqueue_markdown(filename, content, tags)
                    print(f"  [{page_index}/{len(pages)}] enqueued #{job_id} {title}")
                jobs.append(RAGJob(title=title, source_url=canonical_source, job_id=job_id))
                total_jobs += 1
                if not args.dry_run:
                    completed.add(state_key)
                    save_state(state_path, completed)
                time.sleep(args.delay)
            except Exception as error:  # noqa: BLE001
                failures.append(f"{technology.title} / {fallback_title}: {error}")
                print(f"  FAILED {fallback_title}: {error}", file=sys.stderr)
        record_memory_card(
            memory_endpoint=args.memory_endpoint,
            technology=technology,
            jobs=jobs,
            collection=args.collection,
            dry_run=args.dry_run,
        )

    print(f"Final RAG stats: {rag.stats() if not args.dry_run else '(dry run)'}")
    print(f"New jobs enqueued: {total_jobs}")
    if failures:
        print("Failures:")
        for failure in failures:
            print(f"- {failure}")
    return 1 if failures else 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--topics", nargs="+", default=DEFAULT_TOPICS)
    parser.add_argument("--collection", default="apple-developer-docs")
    parser.add_argument("--max-child-pages", type=int, default=40)
    parser.add_argument("--max-text-chars", type=int, default=24000)
    parser.add_argument("--max-references", type=int, default=120)
    parser.add_argument("--delay", type=float, default=0.2)
    parser.add_argument("--state", default=".apple-docs-rag-deep-import-state.json")
    parser.add_argument("--memory-endpoint", default="http://192.168.1.26:8006/mcp")
    parser.add_argument("--rag-host", default="192.168.1.107")
    parser.add_argument("--rag-user", default="veronika")
    parser.add_argument("--rag-identity", default="~/.ssh/id_rsa_hermes")
    parser.add_argument("--rag-staging-dir", default="/opt/rag/uploads-staging")
    parser.add_argument("--rag-ingest-dir", default="/opt/rag/ingest")
    parser.add_argument("--dry-run", action="store_true")
    return run(parser.parse_args())


if __name__ == "__main__":
    raise SystemExit(main())
