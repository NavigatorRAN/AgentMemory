#!/usr/bin/env python3
"""Bulk-import Apple Developer Documentation technology pages into Memory MCP.

The importer is intentionally an index, not a raw mirror. It writes one Memory
MCP event per Apple documentation technology, preserving source URLs,
identifiers, abstracts, overview text, topic sections, and first-level reference
metadata so future agents can search and navigate Apple's docs safely.
"""

from __future__ import annotations

import argparse
import json
import pathlib
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from dataclasses import dataclass
from typing import Any


APPLE_BASE = "https://developer.apple.com"
CATALOG_URL = f"{APPLE_BASE}/tutorials/data/documentation/technologies.json"


@dataclass(frozen=True)
class Technology:
    title: str
    identifier: str
    doc_path: str
    doc_url: str
    data_url: str
    tags: tuple[str, ...]
    languages: tuple[str, ...]
    external: bool = False


class MemoryMCPClient:
    def __init__(self, endpoint: str) -> None:
        self.endpoint = endpoint
        self.session_id: str | None = None
        self.request_id = 1

    def connect(self) -> None:
        body = {
            "jsonrpc": "2.0",
            "id": self._next_id(),
            "method": "initialize",
            "params": {
                "protocolVersion": "2024-11-05",
                "capabilities": {},
                "clientInfo": {"name": "AgentMemoryAppleDocsImporter", "version": "1.0"},
            },
        }
        data, headers = self._post(body, session=False)
        self.session_id = headers.get("mcp-session-id")
        if not self.session_id:
            raise RuntimeError(f"Memory MCP did not return mcp-session-id: {data!r}")
        self._post({"jsonrpc": "2.0", "method": "notifications/initialized", "params": {}})

    def record_event(self, *, content: str, entities: list[str], tags: list[str]) -> dict[str, Any]:
        body = {
            "jsonrpc": "2.0",
            "id": self._next_id(),
            "method": "tools/call",
            "params": {
                "name": "record_event",
                "arguments": {
                    "agent": "CODEX",
                    "content": content,
                    "entities": entities,
                    "tags": tags,
                },
            },
        }
        data, _ = self._post(body)
        parsed = json.loads(data.decode("utf-8"))
        if parsed.get("result", {}).get("isError"):
            raise RuntimeError(parsed)
        return parsed

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
        with urllib.request.urlopen(request, timeout=120) as response:
            return response.read(), {key.lower(): value for key, value in response.headers.items()}


def fetch_json(url: str) -> dict[str, Any]:
    request = urllib.request.Request(url, headers={"Accept": "application/json"})
    with urllib.request.urlopen(request, timeout=45) as response:
        return json.loads(response.read().decode("utf-8"))


def documentation_path(identifier: str) -> str | None:
    marker = "/documentation/"
    index = identifier.lower().find(marker)
    if index == -1:
        return None
    return identifier[index:].lower()


def data_url_for_path(path: str) -> str:
    return f"{APPLE_BASE}/tutorials/data/{path.removeprefix('/')}.json"


def load_catalog() -> list[Technology]:
    catalog = fetch_json(CATALOG_URL)
    technologies: list[Technology] = []
    for section in catalog.get("sections", []):
        for group in section.get("groups", []):
            for technology in group.get("technologies", []):
                destination = technology.get("destination") or {}
                identifier = destination.get("identifier") or ""
                if destination.get("isActive") is False:
                    continue
                path = documentation_path(identifier)
                external = False
                doc_url: str
                data_url: str
                if identifier.startswith("http://") or identifier.startswith("https://"):
                    parsed = urllib.parse.urlparse(identifier)
                    doc_url = identifier
                    path = parsed.path or "/documentation/external"
                    data_url = ""
                    external = True
                elif path:
                    doc_url = f"{APPLE_BASE}{path}"
                    data_url = data_url_for_path(path)
                else:
                    continue
                technologies.append(
                    Technology(
                        title=technology.get("title") or path.rsplit("/", 1)[-1],
                        identifier=identifier,
                        doc_path=path,
                        doc_url=doc_url,
                        data_url=data_url,
                        tags=tuple(technology.get("tags") or ()),
                        languages=tuple(technology.get("languages") or ()),
                        external=external,
                    )
                )
    return sorted(technologies, key=lambda item: item.title.lower())


def identifier_string(value: Any) -> str:
    if isinstance(value, str):
        return value
    if isinstance(value, dict):
        return str(value.get("url") or "")
    return ""


def collect_text(value: Any) -> list[str]:
    if isinstance(value, dict):
        result: list[str] = []
        text = value.get("text")
        if isinstance(text, str):
            result.append(text)
        for nested in value.values():
            result.extend(collect_text(nested))
        return result
    if isinstance(value, list):
        result: list[str] = []
        for nested in value:
            result.extend(collect_text(nested))
        return result
    return []


def unique_lines(text: str, *, max_chars: int | None = None) -> str:
    seen: set[str] = set()
    lines: list[str] = []
    for raw_line in text.splitlines():
        line = re.sub(r"\s+", " ", raw_line).strip()
        if not line or line in seen:
            continue
        seen.add(line)
        lines.append(line)
    result = "\n".join(lines)
    if max_chars is not None and len(result) > max_chars:
        return result[:max_chars].rstrip() + "\n..."
    return result


def reference_items(page: dict[str, Any]) -> list[dict[str, str]]:
    refs: list[dict[str, str]] = []
    for key, value in (page.get("references") or {}).items():
        if not isinstance(value, dict):
            continue
        path = value.get("url") or ""
        title = value.get("title") or ""
        if not path.lower().startswith("/documentation/") or not title:
            continue
        refs.append(
            {
                "identifier": str(value.get("identifier") or key),
                "title": str(title),
                "url": f"{APPLE_BASE}{path}",
                "abstract": unique_lines("\n".join(collect_text(value.get("abstract"))), max_chars=350),
                "kind": str(value.get("kind") or ""),
                "role": str(value.get("role") or ""),
            }
        )
    return sorted(refs, key=lambda item: item["title"].lower())


def topic_sections(page: dict[str, Any], refs: list[dict[str, str]], *, max_refs_per_topic: int) -> str:
    refs_by_identifier = {item["identifier"]: item for item in refs}
    sections: list[str] = []
    for section in page.get("topicSections") or []:
        title = section.get("title") or section.get("anchor") or "Topic"
        lines = [str(title)]
        count = 0
        for identifier in section.get("identifiers") or []:
            ref = refs_by_identifier.get(identifier)
            if not ref:
                continue
            abstract = f" - {ref['abstract']}" if ref["abstract"] else ""
            lines.append(f"- {ref['title']}: {ref['url']}{abstract}")
            count += 1
            if count >= max_refs_per_topic:
                break
        sections.append("\n".join(lines))
    return "\n\n".join(sections)


def slug(value: str) -> str:
    cleaned = re.sub(r"[^a-z0-9]+", "-", value.lower()).strip("-")
    return cleaned or "apple-doc"


def stable_unique(values: list[str]) -> list[str]:
    seen: set[str] = set()
    result: list[str] = []
    for value in values:
        if value and value not in seen:
            seen.add(value)
            result.append(value)
    return result


def record_content(
    technology: Technology,
    page: dict[str, Any],
    refs: list[dict[str, str]],
    *,
    max_references: int,
    max_text_chars: int,
) -> str:
    metadata = page.get("metadata") or {}
    identifier = identifier_string(page.get("identifier")) or technology.identifier
    title = metadata.get("title") or technology.title
    abstract = unique_lines("\n".join(collect_text(page.get("abstract"))), max_chars=1200)
    overview = unique_lines(
        "\n".join(collect_text(page.get("primaryContentSections")) + collect_text(page.get("sections"))),
        max_chars=max_text_chars,
    )
    topics = topic_sections(page, refs, max_refs_per_topic=20)
    reference_lines = []
    for ref in refs[:max_references]:
        abstract_suffix = f" - {ref['abstract']}" if ref["abstract"] else ""
        reference_lines.append(f"- {ref['title']}: {ref['url']}{abstract_suffix}")

    lines = [
        "Apple Developer Documentation index record",
        "",
        f"Technology: {title}",
        f"Source URL: {technology.doc_url}",
        f"Data URL: {technology.data_url}",
        f"Identifier: {identifier}",
    ]
    if technology.languages:
        lines.append(f"Languages: {', '.join(technology.languages)}")
    if technology.tags:
        lines.append(f"Catalog tags: {', '.join(technology.tags)}")
    if abstract:
        lines.extend(["", "Abstract:", abstract])
    if overview:
        lines.extend(["", "Overview:", overview])
    if topics:
        lines.extend(["", "Topic sections:", topics])
    if reference_lines:
        lines.extend(["", f"First-level documentation references ({min(len(refs), max_references)} of {len(refs)}):"])
        lines.extend(reference_lines)
    return "\n".join(lines)


def external_record_content(technology: Technology) -> str:
    lines = [
        "Apple Developer Documentation external index record",
        "",
        f"Technology: {technology.title}",
        f"Source URL: {technology.doc_url}",
        f"Identifier: {technology.identifier}",
        "",
        "Note:",
        "This catalog entry points to Apple-linked documentation outside the standard developer.apple.com JSON documentation endpoint.",
    ]
    if technology.languages:
        lines.append(f"Languages: {', '.join(technology.languages)}")
    if technology.tags:
        lines.append(f"Catalog tags: {', '.join(technology.tags)}")
    return "\n".join(lines)


def load_state(path: pathlib.Path) -> set[str]:
    if not path.exists():
        return set()
    with path.open("r", encoding="utf-8") as handle:
        data = json.load(handle)
    return set(data.get("completed", []))


def save_state(path: pathlib.Path, completed: set[str]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8") as handle:
        json.dump({"completed": sorted(completed)}, handle, indent=2)


def run(args: argparse.Namespace) -> int:
    completed = load_state(pathlib.Path(args.state))
    technologies = load_catalog()
    if args.filter:
        technologies = [item for item in technologies if args.filter.lower() in item.title.lower()]
    if args.limit:
        technologies = technologies[: args.limit]

    print(f"Apple documentation technologies to consider: {len(technologies)}")
    client = None
    if not args.dry_run:
        client = MemoryMCPClient(args.endpoint)
        client.connect()

    failures: list[str] = []
    for index, technology in enumerate(technologies, start=1):
        if technology.identifier in completed:
            print(f"[{index}/{len(technologies)}] skip {technology.title}")
            continue

        try:
            if technology.external:
                content = external_record_content(technology)
                refs = []
                print(f"[{index}/{len(technologies)}] record external {technology.title}")
            else:
                page = fetch_json(technology.data_url)
                refs = reference_items(page)
                content = record_content(
                    technology,
                    page,
                    refs,
                    max_references=args.max_references,
                    max_text_chars=args.max_text_chars,
                )
                print(f"[{index}/{len(technologies)}] record {technology.title} refs={len(refs)}")
            if client:
                client.record_event(
                    content=content,
                    entities=stable_unique(
                        [
                            "apple-developer-documentation",
                            "apple-docs",
                            f"apple-docs-{slug(technology.title)}",
                        ]
                    ),
                    tags=stable_unique(
                        [
                            "apple-docs",
                            "apple-developer",
                            "developer-documentation",
                            "documentation-index",
                            slug(technology.title),
                        ]
                        + [slug(value) for value in technology.tags]
                    ),
                )
            if not args.dry_run:
                completed.add(technology.identifier)
                save_state(pathlib.Path(args.state), completed)
            time.sleep(args.delay)
        except (urllib.error.URLError, TimeoutError, RuntimeError, json.JSONDecodeError) as error:
            message = f"{technology.title}: {error}"
            print(f"FAILED {message}", file=sys.stderr)
            failures.append(message)
            time.sleep(args.delay)

    if failures:
        print("\nFailures:")
        for failure in failures:
            print(f"- {failure}")
    print(f"Completed records: {len(completed)}")
    return 1 if failures else 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--endpoint", default="http://192.168.1.26:8006/mcp")
    parser.add_argument("--state", default=".apple-docs-memory-import-state.json")
    parser.add_argument("--delay", type=float, default=0.25)
    parser.add_argument("--limit", type=int, default=0)
    parser.add_argument("--filter", default="")
    parser.add_argument("--max-references", type=int, default=160)
    parser.add_argument("--max-text-chars", type=int, default=6000)
    parser.add_argument("--dry-run", action="store_true")
    return run(parser.parse_args())


if __name__ == "__main__":
    raise SystemExit(main())
