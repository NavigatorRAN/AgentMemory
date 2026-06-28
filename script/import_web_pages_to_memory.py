#!/usr/bin/env python3
"""Bulk-import arbitrary web pages into AgentMemory / Memory MCP.

The importer is intentionally source-backed and bounded. It writes concise
durable page cards into Memory MCP and stages fuller page text as local
markdown that can later be queued into RAG.
"""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import html
import json
import pathlib
import re
import socket
import subprocess
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from collections import Counter
from dataclasses import dataclass
from html.parser import HTMLParser
from typing import Any

SCRIPT_DIR = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))

from import_apple_docs_to_memory import MemoryMCPClient, slug, stable_unique, unique_lines  # noqa: E402
from deep_import_apple_docs_to_rag import RAGSSHClient  # noqa: E402


DEFAULT_STATE = ".web-pages-memory-import-state.json"
DEFAULT_LOG = ".web-pages-memory-import.log.jsonl"
DEFAULT_RAG_DIR = ".web-pages-rag-staging"
REQUIRED_RECORD_METADATA_KEYS = (
    "source_handle",
    "source_section",
    "content_hash",
    "chunk_profile",
    "import_run_id",
    "rag_path",
)
REQUIRED_RAG_METADATA_KEYS = (
    "source_url",
    "final_url",
    "canonical_url",
    "source_handle",
    "source_section",
    "collection",
    "doc_type",
    "language",
    "import_run_id",
    "content_hash",
    "chunk_profile",
)
EXCLUDED_PATH_PARTS = (
    "/actions",
    "/activity",
    "/api-viewer",
    "/blog",
    "/community",
    "/discussions",
    "/issues",
    "/login",
    "/pulls",
    "/releases",
    "/security",
    "/sponsors",
    "/_compare",
    "/_edit",
    "/_history",
    "/_new",
)
LANGUAGE_SEGMENTS = {
    "af",
    "am",
    "ar",
    "az",
    "be",
    "bg",
    "bn",
    "bs",
    "ca",
    "cs",
    "cy",
    "da",
    "de",
    "el",
    "es",
    "et",
    "eu",
    "fa",
    "fi",
    "fr",
    "ga",
    "gl",
    "gu",
    "he",
    "hi",
    "hr",
    "hu",
    "hy",
    "id",
    "is",
    "it",
    "ja",
    "ka",
    "kk",
    "km",
    "kn",
    "ko",
    "lo",
    "lt",
    "lv",
    "mk",
    "ml",
    "mn",
    "mr",
    "ms",
    "my",
    "nb",
    "ne",
    "nl",
    "nn",
    "no",
    "pa",
    "pl",
    "pt",
    "ro",
    "ru",
    "si",
    "sk",
    "sl",
    "sq",
    "sr",
    "sv",
    "sw",
    "ta",
    "te",
    "th",
    "tr",
    "uk",
    "ur",
    "uz",
    "vi",
    "zh",
    "zh-cn",
    "zh-hans",
    "zh-hant",
    "zh-tw",
}
GITHUB_DOC_FILENAMES = {
    "code_of_conduct.md",
    "contributing.md",
    "license.md",
    "readme.md",
    "security.md",
}
SKIPPED_DOCUMENT_EXTENSIONS = (".epub", ".pdf")
ORIGINAL_GETADDRINFO = socket.getaddrinfo


def is_non_english_language_segment(segment: str) -> bool:
    normalized = segment.lower()
    if normalized in LANGUAGE_SEGMENTS:
        return True
    base, separator, suffix = normalized.partition("-")
    return bool(separator and suffix and base in LANGUAGE_SEGMENTS)


@dataclass(frozen=True)
class URLInput:
    url: str
    label: str = ""


@dataclass(frozen=True)
class WebPage:
    requested_url: str
    final_url: str
    canonical_url: str
    title: str
    description: str
    content_type: str
    text: str
    fetched_at: str


class ImportState:
    def __init__(
        self,
        *,
        discovered: dict[str, dict[str, Any]] | None = None,
        completed: set[str] | None = None,
        failed: dict[str, str] | None = None,
        skipped: dict[str, str] | None = None,
        records: dict[str, dict[str, Any]] | None = None,
    ) -> None:
        self.discovered = discovered or {}
        self.completed = completed or set()
        self.failed = failed or {}
        self.skipped = skipped or {}
        self.records = records or {}

    @classmethod
    def load(cls, path: pathlib.Path) -> "ImportState":
        if not path.exists():
            return cls()
        data = json.loads(path.read_text(encoding="utf-8"))
        return cls(
            discovered=dict(data.get("discovered", {})),
            completed=set(data.get("completed", [])),
            failed=dict(data.get("failed", {})),
            skipped=dict(data.get("skipped", {})),
            records=dict(data.get("records", {})),
        )

    def save(self, path: pathlib.Path) -> None:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(
            json.dumps(
                {
                    "discovered": self.discovered,
                    "completed": sorted(self.completed),
                    "failed": self.failed,
                    "skipped": self.skipped,
                    "records": self.records,
                },
                indent=2,
                sort_keys=True,
            ),
            encoding="utf-8",
        )

    def is_completed(self, url: str) -> bool:
        return url in self.completed

    def mark_discovered(self, url: str, record: dict[str, Any]) -> None:
        self.discovered[url] = record

    def mark_completed(self, url: str, record: dict[str, Any]) -> None:
        self.completed.add(url)
        self.failed.pop(url, None)
        self.skipped.pop(url, None)
        self.records[url] = record

    def mark_failed(self, url: str, reason: str) -> None:
        self.failed[url] = reason

    def mark_skipped(self, url: str, reason: str) -> None:
        self.skipped[url] = reason


class PageExtractor(HTMLParser):
    def __init__(self, base_url: str) -> None:
        super().__init__(convert_charrefs=True)
        self.base_url = base_url
        self.title_parts: list[str] = []
        self.description = ""
        self.canonical_url = ""
        self.text_parts: list[str] = []
        self._tag_stack: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        tag = tag.lower()
        self._tag_stack.append(tag)
        attr_map = {key.lower(): value or "" for key, value in attrs}
        if tag == "meta":
            name = (attr_map.get("name") or attr_map.get("property") or "").lower()
            if name in {"description", "og:description", "twitter:description"} and attr_map.get("content"):
                self.description = html.unescape(attr_map["content"]).strip()
        if tag == "link" and attr_map.get("rel", "").lower() == "canonical" and attr_map.get("href"):
            self.canonical_url = urllib.parse.urljoin(self.base_url, attr_map["href"])
        if tag in {"p", "div", "section", "article", "h1", "h2", "h3", "li", "br"}:
            self.text_parts.append("\n")

    def handle_endtag(self, tag: str) -> None:
        tag = tag.lower()
        for index in range(len(self._tag_stack) - 1, -1, -1):
            if self._tag_stack[index] == tag:
                del self._tag_stack[index:]
                break
        if tag in {"p", "div", "section", "article", "h1", "h2", "h3", "li"}:
            self.text_parts.append("\n")

    def handle_data(self, data: str) -> None:
        if not data.strip():
            return
        if any(tag in {"script", "style", "noscript", "svg", "nav", "header", "footer"} for tag in self._tag_stack):
            return
        if self._tag_stack and self._tag_stack[-1] == "title":
            self.title_parts.append(data)
            return
        self.text_parts.append(data)
        self.text_parts.append(" ")

    @property
    def title(self) -> str:
        return normalize_space(" ".join(self.title_parts))

    @property
    def text(self) -> str:
        return unique_lines(normalize_line_breaks("".join(self.text_parts)))


class LinkExtractor(HTMLParser):
    def __init__(self, base_url: str) -> None:
        super().__init__(convert_charrefs=True)
        self.base_url = base_url
        self.links: list[str] = []

    def handle_starttag(self, tag: str, attrs: list[tuple[str, str | None]]) -> None:
        if tag.lower() != "a":
            return
        attr_map = {key.lower(): value or "" for key, value in attrs}
        href = attr_map.get("href", "").strip()
        if not href or href.startswith("#"):
            return
        normalized = normalize_url(urllib.parse.urljoin(self.base_url, href))
        if normalized:
            self.links.append(normalized)


def normalize_space(value: str) -> str:
    return re.sub(r"\s+", " ", html.unescape(value)).strip()


def normalize_line_breaks(value: str) -> str:
    value = html.unescape(value)
    value = re.sub(r"[ \t\r\f\v]+", " ", value)
    value = re.sub(r"\n\s+", "\n", value)
    value = re.sub(r"\n{3,}", "\n\n", value)
    return value.strip()


def utc_now() -> str:
    return dt.datetime.now(dt.timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def resolve_host_with_dns_server(host: str, dns_server: str, *, command: Any | None = None) -> str:
    runner = command or (lambda args: subprocess.check_output(args, text=True, timeout=8))
    output = runner(["dig", "+short", f"@{dns_server}", host, "A"])
    for line in output.splitlines():
        value = line.strip()
        if re.match(r"^\d+\.\d+\.\d+\.\d+$", value):
            return value
    return ""


def install_dns_override(dns_server: str) -> None:
    cache: dict[str, str] = {}

    def getaddrinfo(host: str, port: Any, family: int = 0, type: int = 0, proto: int = 0, flags: int = 0) -> Any:
        try:
            return ORIGINAL_GETADDRINFO(host, port, family, type, proto, flags)
        except socket.gaierror:
            if not dns_server or re.match(r"^\d+\.\d+\.\d+\.\d+$", host):
                raise
            ip_address = cache.get(host)
            if not ip_address:
                ip_address = resolve_host_with_dns_server(host, dns_server)
                if ip_address:
                    cache[host] = ip_address
            if not ip_address:
                raise
            return ORIGINAL_GETADDRINFO(ip_address, port, family, type, proto, flags)

    socket.getaddrinfo = getaddrinfo


def normalize_url(url: str) -> str:
    parsed = urllib.parse.urlparse(url)
    if parsed.scheme not in {"http", "https"} or not parsed.netloc:
        return ""
    parsed = parsed._replace(fragment="")
    if parsed.path == "/":
        parsed = parsed._replace(path="")
    if parsed.path != "/" and parsed.path.endswith("/"):
        parsed = parsed._replace(path=parsed.path.rstrip("/"))
    return urllib.parse.urlunparse(parsed)


def parse_url_line(line: str) -> URLInput:
    parts = [part.strip() for part in line.split("|", 1)]
    if len(parts) == 1:
        return URLInput(url=parts[0])
    left, right = parts
    if left.startswith(("http://", "https://")):
        return URLInput(url=left, label=right)
    return URLInput(url=right, label=left)


def load_url_inputs(urls: list[str], url_file: pathlib.Path | None) -> list[URLInput]:
    entries = [parse_url_line(value) for value in urls if value.strip()]
    if url_file:
        for raw_line in url_file.read_text(encoding="utf-8").splitlines():
            line = raw_line.strip()
            if not line or line.startswith("#"):
                continue
            entries.append(parse_url_line(line))
    return entries


def validate_url(url: str) -> str | None:
    parsed = urllib.parse.urlparse(url)
    if parsed.scheme not in {"http", "https"} or not parsed.netloc:
        return "expected an absolute http(s) URL"
    return None


def fetch_raw_page(url: str, *, timeout: int, max_bytes: int = 2_000_000) -> tuple[bytes, str, str]:
    request = urllib.request.Request(
        url,
        headers={
            "Accept": "text/html, text/plain;q=0.9, */*;q=0.1",
            "User-Agent": "AgentMemoryWebPageImporter/1.0 (+Memory MCP; CODEX)",
        },
    )
    try:
        with urllib.request.urlopen(request, timeout=timeout) as response:
            return response.read(max_bytes), response.geturl(), response.headers.get("content-type", "text/html")
    except urllib.error.HTTPError as error:
        if error.code in {301, 302, 303, 307, 308}:
            target = redirect_target(url, error.headers.get("Location", ""))
            if target and target != url:
                return fetch_raw_page(target, timeout=timeout, max_bytes=max_bytes)
        raise


def redirect_target(current_url: str, location: str) -> str:
    if not location:
        return ""
    return urllib.parse.urljoin(current_url, location)


def extract_links(base_url: str, raw: bytes, content_type: str) -> list[str]:
    if "html" not in content_type.lower():
        return []
    try:
        text = raw.decode("utf-8", errors="replace")
    except LookupError:
        text = raw.decode(errors="replace")
    parser = LinkExtractor(base_url)
    parser.feed(text)
    seen: set[str] = set()
    result: list[str] = []
    for link in parser.links:
        if link not in seen:
            seen.add(link)
            result.append(link)
    return result


def parse_sitemap_urls(raw: bytes) -> list[str]:
    text = raw.decode("utf-8", errors="replace")
    urls: list[str] = []
    seen: set[str] = set()
    for match in re.finditer(r"<loc>\s*([^<]+?)\s*</loc>", text, flags=re.IGNORECASE):
        url = normalize_url(html.unescape(match.group(1)))
        if url and url not in seen:
            seen.add(url)
            urls.append(url)
    return urls


def documentation_score_for_url(url: str) -> int:
    parsed = urllib.parse.urlparse(url)
    haystack = f"{parsed.netloc}{parsed.path}".lower()
    score = 0
    for token, weight in {
        "docs": 6,
        "documentation": 6,
        "developer": 5,
        "guide": 4,
        "reference": 4,
        "api": 4,
        "manual": 3,
        "integration": 3,
        "install": 2,
        "configure": 2,
        "setup": 2,
        "tutorial": 2,
        "examples": 1,
    }.items():
        if token in haystack:
            score += weight
    for token in ("blog", "community", "news", "pricing", "careers", "sponsor"):
        if token in haystack:
            score -= 8
    path_depth = len([segment for segment in parsed.path.split("/") if segment])
    return score + min(path_depth, 4)


def source_handle_for_url(url: str) -> str:
    normalized = normalize_url(url) or url
    parsed = urllib.parse.urlparse(normalized)
    digest = hashlib.sha1(normalized.encode("utf-8")).hexdigest()[:12]
    return f"web:{slug(parsed.netloc)}:{digest}"


def source_section_for_url(url: str) -> str:
    parsed = urllib.parse.urlparse(url)
    parts = [part for part in parsed.path.split("/") if part]
    if not parts:
        return slug(parsed.netloc)
    if len(parts) == 1:
        return slug(parts[0])
    return slug("-".join(parts[:2]))


def content_hash_for_page(page: WebPage) -> str:
    return hashlib.sha256(page.text.encode("utf-8")).hexdigest()


def doc_type_for_profile(chunk_profile: str) -> str:
    return {
        "api-docs": "api-reference",
        "code-docs": "code-documentation",
        "reference-docs": "reference",
        "web-docs": "web-documentation",
    }.get(chunk_profile, "web-documentation")


def chunk_profile_for_page(page: WebPage, requested_profile: str) -> str:
    if requested_profile != "auto":
        return requested_profile
    text = f"{page.final_url}\n{page.title}\n{page.text[:4000]}".lower()
    if any(token in text for token in (" api ", "/api", "endpoint", "parameter", "request", "response")):
        return "api-docs"
    if any(token in text for token in ("```", "class ", "func ", "def ", "import ", "package ")):
        return "code-docs"
    if any(token in text for token in ("reference", "configuration", "option", "setting")):
        return "reference-docs"
    return "web-docs"


def rag_metadata_for_page(
    *,
    page: WebPage,
    collection: str,
    import_run_id: str,
    chunk_profile: str,
    memory_event_id: str = "",
    wiki_slug: str = "",
) -> dict[str, str]:
    final_or_canonical = page.canonical_url or page.final_url
    return {
        "source_url": page.requested_url,
        "final_url": page.final_url,
        "canonical_url": page.canonical_url,
        "source_handle": source_handle_for_url(final_or_canonical),
        "source_section": source_section_for_url(final_or_canonical),
        "collection": collection,
        "doc_type": doc_type_for_profile(chunk_profile),
        "language": "en",
        "import_run_id": import_run_id,
        "content_hash": content_hash_for_page(page),
        "memory_event_id": memory_event_id,
        "wiki_slug": wiki_slug,
        "chunk_profile": chunk_profile,
    }


def markdown_frontmatter(metadata: dict[str, str]) -> str:
    lines = ["---"]
    for key, value in metadata.items():
        escaped = str(value or "").replace('"', '\\"')
        lines.append(f'{key}: "{escaped}"')
    lines.append("---")
    return "\n".join(lines)


def parse_markdown_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        return {}
    end = text.find("\n---", 4)
    if end == -1:
        return {}
    metadata: dict[str, str] = {}
    for raw_line in text[4:end].splitlines():
        line = raw_line.strip()
        if not line or ":" not in line:
            continue
        key, value = line.split(":", 1)
        key = key.strip()
        value = value.strip()
        if not key:
            continue
        if len(value) >= 2 and value[0] == value[-1] == '"':
            value = value[1:-1].replace('\\"', '"')
        metadata[key] = value
    return metadata


def read_markdown_frontmatter(path: pathlib.Path) -> dict[str, str]:
    try:
        return parse_markdown_frontmatter(path.read_text(encoding="utf-8"))
    except (OSError, UnicodeDecodeError):
        return {}


def rag_markdown_files(directory: pathlib.Path) -> list[pathlib.Path]:
    if not directory.exists():
        return []
    return sorted(path for path in directory.glob("*.md") if path.is_file())


def metadata_missing_counts(records: list[dict[str, Any]], required_keys: tuple[str, ...]) -> dict[str, int]:
    counts = {key: 0 for key in required_keys}
    for record in records:
        for key in required_keys:
            if is_missing_metadata_value(record.get(key)):
                counts[key] += 1
    return counts


def is_missing_metadata_value(value: Any) -> bool:
    return value is None or value == ""


def audit_import_outputs(
    *,
    state: ImportState,
    rag_dir: pathlib.Path,
    sample_limit: int = 8,
) -> dict[str, Any]:
    records = list(state.records.values())
    record_missing = metadata_missing_counts(records, REQUIRED_RECORD_METADATA_KEYS)
    complete_record_count = sum(
        1
        for record in records
        if all(not is_missing_metadata_value(record.get(key)) for key in REQUIRED_RECORD_METADATA_KEYS)
    )

    markdown_files = rag_markdown_files(rag_dir)
    rag_metadata: list[tuple[pathlib.Path, dict[str, str]]] = [
        (path, read_markdown_frontmatter(path)) for path in markdown_files
    ]
    rag_missing = metadata_missing_counts([metadata for _, metadata in rag_metadata], REQUIRED_RAG_METADATA_KEYS)
    rag_with_frontmatter = sum(1 for _, metadata in rag_metadata if metadata)

    section_counter: Counter[str] = Counter()
    chunk_counter: Counter[str] = Counter()
    doc_type_counter: Counter[str] = Counter()
    run_counter: Counter[str] = Counter()
    collection_counter: Counter[str] = Counter()

    record_sections = 0
    record_chunks = 0
    record_runs = 0
    for record in records:
        if record.get("source_section"):
            section_counter[str(record["source_section"])] += 1
            record_sections += 1
        if record.get("chunk_profile"):
            chunk_counter[str(record["chunk_profile"])] += 1
            record_chunks += 1
        if record.get("import_run_id"):
            run_counter[str(record["import_run_id"])] += 1
            record_runs += 1
    rag_section_counter: Counter[str] = Counter()
    rag_chunk_counter: Counter[str] = Counter()
    rag_run_counter: Counter[str] = Counter()
    for _, metadata in rag_metadata:
        if metadata.get("source_section"):
            rag_section_counter[metadata["source_section"]] += 1
        if metadata.get("chunk_profile"):
            rag_chunk_counter[metadata["chunk_profile"]] += 1
        if metadata.get("doc_type"):
            doc_type_counter[metadata["doc_type"]] += 1
        if metadata.get("import_run_id"):
            rag_run_counter[metadata["import_run_id"]] += 1
        if metadata.get("collection"):
            collection_counter[metadata["collection"]] += 1
    if not record_sections:
        section_counter = rag_section_counter
    if not record_chunks:
        chunk_counter = rag_chunk_counter
    if not record_runs:
        run_counter = rag_run_counter

    missing_record_samples = [
        {
            "url": url,
            "title": record.get("title", ""),
            "missing": [
                key for key in REQUIRED_RECORD_METADATA_KEYS if is_missing_metadata_value(record.get(key))
            ],
        }
        for url, record in sorted(state.records.items())
        if any(is_missing_metadata_value(record.get(key)) for key in REQUIRED_RECORD_METADATA_KEYS)
    ][:sample_limit]
    missing_frontmatter_samples = [
        str(path)
        for path, metadata in rag_metadata
        if not metadata
    ][:sample_limit]

    return {
        "state": {
            "discovered": len(state.discovered),
            "completed": len(state.completed),
            "failed": len(state.failed),
            "skipped": len(state.skipped),
            "records": len(state.records),
        },
        "record_metadata": {
            "required_keys": list(REQUIRED_RECORD_METADATA_KEYS),
            "complete_records": complete_record_count,
            "missing_counts": record_missing,
        },
        "rag_metadata": {
            "required_keys": list(REQUIRED_RAG_METADATA_KEYS),
            "markdown_count": len(markdown_files),
            "with_frontmatter": rag_with_frontmatter,
            "missing_frontmatter": len(markdown_files) - rag_with_frontmatter,
            "missing_counts": rag_missing,
        },
        "top_source_sections": dict(section_counter.most_common(20)),
        "chunk_profiles": dict(chunk_counter.most_common()),
        "doc_types": dict(doc_type_counter.most_common()),
        "collections": dict(collection_counter.most_common()),
        "import_run_ids": dict(run_counter.most_common(20)),
        "samples": {
            "records_missing_metadata": missing_record_samples,
            "rag_markdown_missing_frontmatter": missing_frontmatter_samples,
        },
    }


def legacy_markdown_field(markdown: str, label: str) -> str:
    pattern = rf"^- {re.escape(label)}:\s*(.+?)\s*$"
    match = re.search(pattern, markdown, flags=re.MULTILINE)
    return match.group(1).strip() if match else ""


def legacy_markdown_section(markdown: str, heading: str) -> str:
    marker = f"## {heading}"
    start = markdown.find(marker)
    if start == -1:
        return ""
    start += len(marker)
    next_heading = markdown.find("\n## ", start)
    section = markdown[start:] if next_heading == -1 else markdown[start:next_heading]
    return section.strip()


def web_page_from_legacy_markdown(path: pathlib.Path, url: str, record: dict[str, Any]) -> WebPage | None:
    try:
        markdown = path.read_text(encoding="utf-8")
    except (OSError, UnicodeDecodeError):
        return None
    if parse_markdown_frontmatter(markdown):
        return None
    title_match = re.search(r"^#\s+(.+?)\s*$", markdown, flags=re.MULTILINE)
    title = title_match.group(1).strip() if title_match else str(record.get("title") or url)
    text = legacy_markdown_section(markdown, "Extracted Text")
    description = legacy_markdown_section(markdown, "Description")
    return WebPage(
        requested_url=legacy_markdown_field(markdown, "Requested URL") or url,
        final_url=legacy_markdown_field(markdown, "Final URL") or str(record.get("final_url") or url),
        canonical_url=legacy_markdown_field(markdown, "Canonical URL") or str(record.get("canonical_url") or ""),
        title=title,
        description=description,
        content_type=legacy_markdown_field(markdown, "Content type") or "text/html",
        text=text,
        fetched_at=legacy_markdown_field(markdown, "Fetched at") or str(record.get("fetched_at") or ""),
    )


def prepend_frontmatter_if_missing(path: pathlib.Path, metadata: dict[str, str], *, dry_run: bool) -> bool:
    markdown = path.read_text(encoding="utf-8")
    if parse_markdown_frontmatter(markdown):
        return False
    if not dry_run:
        path.write_text(f"{markdown_frontmatter(metadata)}\n\n{markdown}", encoding="utf-8")
    return True


def upgrade_legacy_import_metadata(
    *,
    state: ImportState,
    state_path: pathlib.Path,
    rag_dir: pathlib.Path,
    collection: str,
    import_run_id: str,
    dry_run: bool = False,
    limit: int = 0,
) -> dict[str, Any]:
    upgraded_records = 0
    upgraded_markdown = 0
    already_current = 0
    missing_rag_files: list[str] = []
    unreadable_rag_files: list[str] = []
    processed = 0

    for url, record in sorted(state.records.items()):
        if limit and processed >= limit:
            break
        processed += 1
        rag_path_value = str(record.get("rag_path") or "")
        if not rag_path_value:
            missing_rag_files.append(url)
            continue
        rag_path = pathlib.Path(rag_path_value)
        if not rag_path.is_absolute():
            rag_path = pathlib.Path.cwd() / rag_path
        if not rag_path.exists():
            alternative = rag_dir / pathlib.Path(rag_path_value).name
            rag_path = alternative if alternative.exists() else rag_path
        if not rag_path.exists():
            missing_rag_files.append(rag_path_value)
            continue

        existing_metadata = read_markdown_frontmatter(rag_path)
        if existing_metadata:
            updated_record = dict(record)
            for key in ("source_handle", "source_section", "content_hash", "chunk_profile", "import_run_id"):
                if existing_metadata.get(key):
                    updated_record[key] = existing_metadata[key]
            if updated_record != record:
                upgraded_records += 1
                if not dry_run:
                    state.records[url] = updated_record
            already_current += 1
            continue

        page = web_page_from_legacy_markdown(rag_path, url, record)
        if page is None:
            already_current += 1
            continue
        chunk_profile = str(record.get("chunk_profile") or chunk_profile_for_page(page, "auto"))
        metadata = rag_metadata_for_page(
            page=page,
            collection=collection,
            import_run_id=import_run_id,
            chunk_profile=chunk_profile,
        )
        try:
            if prepend_frontmatter_if_missing(rag_path, metadata, dry_run=dry_run):
                upgraded_markdown += 1
        except (OSError, UnicodeDecodeError):
            unreadable_rag_files.append(str(rag_path))
            continue

        updated_record = dict(record)
        updated_record.update(
            {
                "source_handle": metadata["source_handle"],
                "source_section": metadata["source_section"],
                "content_hash": metadata["content_hash"],
                "chunk_profile": metadata["chunk_profile"],
                "import_run_id": metadata["import_run_id"],
            }
        )
        if updated_record != record:
            upgraded_records += 1
            if not dry_run:
                state.records[url] = updated_record

    if not dry_run:
        state.save(state_path)

    return {
        "processed": processed,
        "upgraded_records": upgraded_records,
        "upgraded_markdown": upgraded_markdown,
        "already_current": already_current,
        "missing_rag_files": missing_rag_files[:20],
        "missing_rag_file_count": len(missing_rag_files),
        "unreadable_rag_files": unreadable_rag_files[:20],
        "unreadable_rag_file_count": len(unreadable_rag_files),
        "dry_run": dry_run,
        "import_run_id": import_run_id,
    }


def format_counter_lines(values: dict[str, Any], *, empty: str = "- none") -> list[str]:
    if not values:
        return [empty]
    return [f"- {key}: {value}" for key, value in values.items()]


def build_collection_wiki_markdown(
    *,
    title: str,
    collection: str,
    state_path: pathlib.Path,
    log_path: pathlib.Path,
    rag_dir: pathlib.Path,
    audit: dict[str, Any],
    generated_at: str | None = None,
    memory_endpoint: str = "",
    rag_stats: dict[str, int] | None = None,
) -> str:
    generated_at = generated_at or utc_now()
    state_counts = audit["state"]
    record_missing = audit["record_metadata"]["missing_counts"]
    rag_metadata = audit["rag_metadata"]
    rag_missing = rag_metadata["missing_counts"]
    summary = (
        f"{collection} has {state_counts['completed']} completed pages, "
        f"{state_counts['failed']} failures, and {rag_metadata['markdown_count']} staged RAG markdown files."
    )
    metadata = {
        "slug": slug(title),
        "title": title,
        "collection": collection,
        "generated_at": generated_at,
        "language": "en",
        "summary": summary,
    }
    lines = [
        markdown_frontmatter(metadata),
        "",
        f"# {title}",
        "",
        summary,
        "",
        "## Import State",
        "",
        f"- Discovered URLs: {state_counts['discovered']}",
        f"- Completed URLs: {state_counts['completed']}",
        f"- Skipped URLs: {state_counts['skipped']}",
        f"- Failed URLs: {state_counts['failed']}",
        f"- State file: {state_path}",
        f"- Log file: {log_path}",
        f"- RAG staging directory: {rag_dir}",
    ]
    if memory_endpoint:
        lines.append(f"- Memory MCP endpoint: {memory_endpoint}")

    lines.extend(
        [
            "",
            "## Metadata Health",
            "",
            f"- Complete state records: {audit['record_metadata']['complete_records']} of {state_counts['records']}",
            f"- RAG markdown with frontmatter: {rag_metadata['with_frontmatter']} of {rag_metadata['markdown_count']}",
            "",
            "State record missing counts:",
            *format_counter_lines(record_missing),
            "",
            "RAG frontmatter missing counts:",
            *format_counter_lines(rag_missing),
            "",
            "## Source Sections",
            "",
            *format_counter_lines(audit["top_source_sections"]),
            "",
            "## RAG Profiles",
            "",
            "Chunk profiles:",
            *format_counter_lines(audit["chunk_profiles"]),
            "",
            "Document types:",
            *format_counter_lines(audit["doc_types"]),
        ]
    )

    if rag_stats is not None:
        lines.extend(["", "## RAG Queue", "", *format_counter_lines({key: rag_stats[key] for key in sorted(rag_stats)})])

    lines.extend(
        [
            "",
            "## Retrieval Handles",
            "",
            f"- Collection: {collection}",
            f"- Wiki slug: {slug(title)}",
            "- Preferred Memory lookup: search_wiki for the collection name, then search_events for a source handle or page title.",
            "- Preferred RAG lookup: filter by collection, source_section, source_url, canonical_url, or content_hash.",
        ]
    )
    return "\n".join(lines).strip() + "\n"


def sitemap_candidates(seed_url: str) -> list[str]:
    parsed = urllib.parse.urlparse(seed_url)
    origin = urllib.parse.urlunparse((parsed.scheme, parsed.netloc, "", "", "", ""))
    candidates = [f"{origin}/sitemap.xml"]
    allowed = default_allowed_prefix(seed_url).rstrip("/")
    if allowed and allowed != origin:
        candidates.append(f"{allowed}/sitemap.xml")
    return stable_unique(candidates)


def default_allowed_prefix(seed_url: str) -> str:
    parsed = urllib.parse.urlparse(seed_url)
    segments = [segment for segment in parsed.path.split("/") if segment]
    if not segments:
        prefix = "/"
    elif segments[0].lower() == "docs":
        prefix = "/docs/"
    elif segments[0].lower().endswith("docs"):
        prefix = f"/{segments[0]}/"
    elif parsed.netloc.lower() == "github.com" and len(segments) >= 2:
        prefix = f"/{segments[0]}/{segments[1]}/"
    else:
        prefix = f"/{segments[0]}/"
    return urllib.parse.urlunparse((parsed.scheme, parsed.netloc, prefix, "", "", ""))


def is_github_documentation_url(url: str, seed_url: str) -> bool:
    parsed_seed = urllib.parse.urlparse(seed_url)
    parsed_url = urllib.parse.urlparse(url)
    if parsed_seed.netloc.lower() != "github.com" or parsed_url.netloc.lower() != "github.com":
        return True
    seed_parts = [part for part in parsed_seed.path.split("/") if part]
    url_parts = [part for part in parsed_url.path.split("/") if part]
    if len(seed_parts) < 2 or len(url_parts) < 2:
        return False
    if url_parts[:2] != seed_parts[:2]:
        return False
    remainder = url_parts[2:]
    if not remainder:
        return True
    if remainder[0] == "wiki":
        return True
    if len(remainder) >= 3 and remainder[0] in {"blob", "tree"}:
        repo_path = remainder[2:]
        if not repo_path:
            return False
        if repo_path[0] == "docs":
            return True
        if len(repo_path) == 1 and repo_path[0].lower() in GITHUB_DOC_FILENAMES:
            return True
    return False


def in_allowed_scope(url: str, seed_url: str, allowed_prefixes: list[str]) -> bool:
    normalized = normalize_url(url)
    if not normalized:
        return False
    path = urllib.parse.urlparse(normalized).path.lower()
    if path.endswith(SKIPPED_DOCUMENT_EXTENSIONS):
        return False
    if any(part in path for part in EXCLUDED_PATH_PARTS):
        return False
    if any(is_non_english_language_segment(segment) for segment in path.split("/") if segment):
        return False
    if not is_github_documentation_url(normalized, seed_url):
        return False
    prefixes = [normalize_url(prefix) for prefix in allowed_prefixes if normalize_url(prefix)]
    prefixes.append(default_allowed_prefix(seed_url).rstrip("/"))
    return any(normalized == prefix or normalized.startswith(prefix.rstrip("/") + "/") for prefix in prefixes)


def discover_documentation_urls(
    seed_entries: list[URLInput],
    *,
    max_depth: int,
    max_pages_per_seed: int,
    allowed_prefixes: list[str],
    include_sitemap: bool = True,
    timeout: int = 45,
    max_download_bytes: int = 2_000_000,
    delay: float = 0.0,
    fetch: Any | None = None,
) -> list[URLInput]:
    fetcher = fetch or (lambda url: fetch_raw_page(url, timeout=timeout, max_bytes=max_download_bytes))
    discovered: list[URLInput] = []
    global_seen: set[str] = set()

    for seed in seed_entries:
        seed_url = normalize_url(seed.url)
        if not seed_url:
            continue
        queue: list[tuple[str, int]] = [(seed_url, 0)]
        if include_sitemap:
            for sitemap_url in sitemap_candidates(seed_url):
                try:
                    raw, _, _ = fetcher(sitemap_url)
                except Exception:
                    continue
                sitemap_urls = sorted(
                    url
                    for url in parse_sitemap_urls(raw)
                    if in_allowed_scope(url, seed_url, allowed_prefixes)
                )
                queue.extend((url, max_depth) for url in sitemap_urls)
        seed_seen: set[str] = set()
        seed_count = 0
        while queue and seed_count < max_pages_per_seed:
            url, depth = queue.pop(0)
            if url in seed_seen:
                continue
            seed_seen.add(url)
            if url not in global_seen:
                discovered.append(URLInput(url=url, label=seed.label if url == seed_url else ""))
                global_seen.add(url)
            seed_count += 1
            if depth >= max_depth:
                continue
            try:
                raw, final_url, content_type = fetcher(url)
            except Exception as error:  # noqa: BLE001
                print(f"crawl failed {url}: {error}", file=sys.stderr)
                continue
            links = sorted(
                link
                for link in extract_links(final_url, raw, content_type)
                if in_allowed_scope(link, seed_url, allowed_prefixes) and link not in seed_seen
            )
            links = sorted(
                links,
                key=lambda link: (-documentation_score_for_url(link), link),
            )
            queue.extend((link, depth + 1) for link in links)
            if delay:
                time.sleep(delay)
        print(f"[crawl] {seed.label or seed_url}: discovered {seed_count} page(s)", flush=True)
    return discovered


def extract_page(
    *,
    requested_url: str,
    final_url: str,
    content_type: str,
    raw: bytes,
    max_text_chars: int,
) -> WebPage:
    charset = "utf-8"
    match = re.search(r"charset=([^;]+)", content_type, flags=re.IGNORECASE)
    if match:
        charset = match.group(1).strip()
    text = raw.decode(charset, errors="replace")
    if "html" in content_type.lower() or re.search(r"<html|<body|<title", text, re.IGNORECASE):
        parser = PageExtractor(final_url)
        parser.feed(text)
        body = parser.text
        title = parser.title or first_non_empty_line(body) or final_url
        description = normalize_space(parser.description)
        canonical_url = parser.canonical_url
    else:
        body = unique_lines(normalize_line_breaks(text))
        title = first_non_empty_line(body) or final_url
        description = ""
        canonical_url = ""
    if len(body) > max_text_chars:
        body = body[:max_text_chars].rstrip() + "\n..."
    return WebPage(
        requested_url=requested_url,
        final_url=final_url,
        canonical_url=canonical_url,
        title=title,
        description=description,
        content_type=content_type,
        text=body,
        fetched_at=utc_now(),
    )


def first_non_empty_line(value: str) -> str:
    for line in value.splitlines():
        cleaned = normalize_space(line)
        if cleaned:
            return cleaned[:120]
    return ""


def fetch_page(url: str, *, timeout: int, max_text_chars: int, max_download_bytes: int) -> WebPage:
    raw, final_url, content_type = fetch_raw_page(url, timeout=timeout, max_bytes=max_download_bytes)
    return extract_page(
        requested_url=url,
        final_url=final_url,
        content_type=content_type,
        raw=raw,
        max_text_chars=max_text_chars,
    )


def fetch_with_retries(
    url: str,
    *,
    retries: int,
    timeout: int,
    backoff: float,
    max_text_chars: int,
    max_download_bytes: int,
) -> WebPage:
    last_error: Exception | None = None
    for attempt in range(1, retries + 2):
        try:
            return fetch_page(
                url,
                timeout=timeout,
                max_text_chars=max_text_chars,
                max_download_bytes=max_download_bytes,
            )
        except (urllib.error.URLError, TimeoutError, OSError) as error:
            last_error = error
            if attempt > retries:
                break
            time.sleep(backoff * attempt)
    raise RuntimeError(f"failed after {retries + 1} attempt(s): {last_error}")


def summary_text(page: WebPage, *, max_summary_chars: int) -> str:
    candidates = []
    if page.description:
        candidates.append(page.description)
    if page.text:
        candidates.append(page.text)
    summary = unique_lines("\n".join(candidates), max_chars=max_summary_chars)
    return summary or "(No readable text extracted.)"


def should_skip_fetched_page(page: WebPage) -> str:
    parsed = urllib.parse.urlparse(page.final_url)
    if parsed.netloc.lower() == "github.com" and "/wiki/" in parsed.path and page.title.startswith("Create new page"):
        return "github wiki page does not exist"
    if parsed.path.lower().endswith(SKIPPED_DOCUMENT_EXTENSIONS):
        return "binary document format is not handled by this text importer"
    if page.content_type.lower().split(";", 1)[0].strip() in {"application/pdf", "application/epub+zip"}:
        return "binary document format is not handled by this text importer"
    return ""


def build_memory_content(
    *,
    page: WebPage,
    label: str,
    rag_path: str,
    rag_job_id: int | None,
    max_summary_chars: int,
    collection: str = "web-page-import",
    import_run_id: str = "",
    chunk_profile: str = "web-docs",
    source_handle: str = "",
    content_hash: str = "",
) -> str:
    title = label or page.title
    final_or_canonical = page.canonical_url or page.final_url
    source_handle = source_handle or source_handle_for_url(final_or_canonical)
    content_hash = content_hash or content_hash_for_page(page)
    lines = [
        "Web page import record",
        "",
        f"Title: {title}",
        f"Collection: {collection}",
        f"Import run ID: {import_run_id}" if import_run_id else "Import run ID: not recorded",
        f"Source handle: {source_handle}",
        f"Requested URL: {page.requested_url}",
        f"Final URL: {page.final_url}",
    ]
    if page.canonical_url:
        lines.append(f"Canonical URL: {page.canonical_url}")
    lines.extend(
        [
            f"Fetched at: {page.fetched_at}",
            f"Content type: {page.content_type}",
            f"Source section: {source_section_for_url(final_or_canonical)}",
            f"Document type: {doc_type_for_profile(chunk_profile)}",
            f"Language: en",
            f"Content hash: {content_hash}",
            f"Chunk profile: {chunk_profile}",
            f"RAG detail path: {rag_path}",
            f"RAG job ID: {rag_job_id}" if rag_job_id is not None else "RAG job ID: not enqueued",
            "",
            "Concise durable summary:",
            summary_text(page, max_summary_chars=max_summary_chars),
        ]
    )
    return "\n".join(lines)


def build_rag_markdown(
    *,
    page: WebPage,
    label: str,
    max_chars: int,
    collection: str = "web-page-import",
    import_run_id: str = "",
    chunk_profile: str = "web-docs",
    memory_event_id: str = "",
    wiki_slug: str = "",
) -> str:
    title = label or page.title
    body = page.text[:max_chars].rstrip()
    if len(page.text) > max_chars:
        body += "\n..."
    metadata = rag_metadata_for_page(
        page=page,
        collection=collection,
        import_run_id=import_run_id,
        chunk_profile=chunk_profile,
        memory_event_id=memory_event_id,
        wiki_slug=wiki_slug,
    )
    lines = [
        markdown_frontmatter(metadata),
        "",
        f"# {title}",
        "",
        "Source-backed web page detail staged by AgentMemory bulk web importer.",
        "",
        f"- Requested URL: {page.requested_url}",
        f"- Final URL: {page.final_url}",
    ]
    if page.canonical_url:
        lines.append(f"- Canonical URL: {page.canonical_url}")
    lines.extend(
        [
            f"- Fetched at: {page.fetched_at}",
            f"- Content type: {page.content_type}",
            f"- Source handle: {metadata['source_handle']}",
            f"- Source section: {metadata['source_section']}",
            f"- Document type: {metadata['doc_type']}",
            f"- Language: {metadata['language']}",
            f"- Import run ID: {metadata['import_run_id']}",
            f"- Content hash: {metadata['content_hash']}",
            f"- Chunk profile: {metadata['chunk_profile']}",
            "",
        ]
    )
    if page.description:
        lines.extend(["## Description", "", page.description, ""])
    lines.extend(["## Extracted Text", "", body])
    return "\n".join(lines).strip() + "\n"


def write_log(path: pathlib.Path, event: str, url: str, message: str, **fields: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    entry = {"ts": utc_now(), "event": event, "url": url, "message": message}
    entry.update(fields)
    with path.open("a", encoding="utf-8") as handle:
        handle.write(json.dumps(entry, sort_keys=True) + "\n")


def safe_rag_filename(title: str, final_url: str, *, max_length: int = 180) -> str:
    digest = hashlib.sha1(final_url.encode("utf-8")).hexdigest()[:10]
    host = slug(urllib.parse.urlparse(final_url).netloc)
    title_slug = slug(title)
    suffix = f"-{host}-{digest}.md"
    budget = max(20, max_length - len("web-page-") - len(suffix))
    return f"web-page-{title_slug[:budget].rstrip('-')}{suffix}"


def write_rag_markdown(
    directory: pathlib.Path,
    page: WebPage,
    label: str,
    *,
    max_chars: int,
    collection: str,
    import_run_id: str,
    chunk_profile: str,
) -> pathlib.Path:
    directory.mkdir(parents=True, exist_ok=True)
    filename = safe_rag_filename(label or page.title, page.final_url)
    path = directory / filename
    path.write_text(
        build_rag_markdown(
            page=page,
            label=label,
            max_chars=max_chars,
            collection=collection,
            import_run_id=import_run_id,
            chunk_profile=chunk_profile,
        ),
        encoding="utf-8",
    )
    return path


def enqueue_rag_markdown(rag_client: Any, path: pathlib.Path, tags: list[str]) -> int:
    return int(rag_client.enqueue_markdown(path.name, path.read_text(encoding="utf-8"), tags))


def record_page(
    client: MemoryMCPClient,
    *,
    page: WebPage,
    label: str,
    rag_path: str,
    rag_job_id: int | None,
    collection: str,
    import_run_id: str,
    chunk_profile: str,
) -> None:
    final_or_canonical = page.canonical_url or page.final_url
    content = build_memory_content(
        page=page,
        label=label,
        rag_path=rag_path,
        rag_job_id=rag_job_id,
        max_summary_chars=1800,
        collection=collection,
        import_run_id=import_run_id,
        chunk_profile=chunk_profile,
        source_handle=source_handle_for_url(final_or_canonical),
        content_hash=content_hash_for_page(page),
    )
    page_slug = slug(label or page.title)
    client.record_event(
        content=content,
        entities=stable_unique(["agentmemory", "memory-mcp", "web-page-import", f"web-page-{page_slug}", collection, source_handle_for_url(final_or_canonical)]),
        tags=stable_unique(["agentmemory", "web-page-import", "source-backed", "rag-staged", page_slug, slug(collection), chunk_profile, import_run_id]),
    )


def record_run_summary(
    client: MemoryMCPClient,
    *,
    total: int,
    completed: int,
    skipped: int,
    failed: int,
    state_path: pathlib.Path,
    log_path: pathlib.Path,
    rag_dir: pathlib.Path,
    collection: str,
    import_run_id: str,
) -> None:
    content = "\n".join(
        [
            "AgentMemory bulk web-page import run finished.",
            "",
            f"Collection: {collection}",
            f"Import run ID: {import_run_id}",
            f"Total inputs: {total}",
            f"Succeeded this run: {completed}",
            f"Skipped this run: {skipped}",
            f"Failed this run: {failed}",
            f"State file: {state_path}",
            f"Log file: {log_path}",
            f"RAG staging directory: {rag_dir}",
        ]
    )
    client.record_event(
        content=content,
        entities=stable_unique(["agentmemory", "memory-mcp", "web-page-import", collection]),
        tags=stable_unique(["agentmemory", "web-page-import", "import-summary", slug(collection), import_run_id]),
    )


def run(args: argparse.Namespace) -> int:
    if args.dns_server:
        install_dns_override(args.dns_server)
    state_path = pathlib.Path(args.state)
    log_path = pathlib.Path(args.log)
    rag_dir = pathlib.Path(args.rag_dir)
    state = ImportState.load(state_path)
    entries = load_url_inputs(args.url, pathlib.Path(args.url_file) if args.url_file else None)
    import_run_id = args.import_run_id or f"web-import-{utc_now().replace(':', '').replace('-', '')}"
    if args.upgrade_metadata_only:
        metadata_import_run_id = args.import_run_id or f"{slug(args.collection)}-legacy-backfill"
        upgrade = upgrade_legacy_import_metadata(
            state=state,
            state_path=state_path,
            rag_dir=rag_dir,
            collection=args.collection,
            import_run_id=metadata_import_run_id,
            dry_run=args.dry_run,
            limit=args.upgrade_limit,
        )
        audit = audit_import_outputs(state=state, rag_dir=rag_dir)
        result = {"upgrade": upgrade, "audit": audit}
        if args.wiki_output:
            wiki_path = pathlib.Path(args.wiki_output)
            wiki_path.parent.mkdir(parents=True, exist_ok=True)
            wiki_path.write_text(
                build_collection_wiki_markdown(
                    title=args.wiki_title or f"{args.collection} Import",
                    collection=args.collection,
                    state_path=state_path,
                    log_path=log_path,
                    rag_dir=rag_dir,
                    audit=audit,
                    memory_endpoint=args.endpoint,
                ),
                encoding="utf-8",
            )
            result["wiki_output"] = str(wiki_path)
        if args.audit_output:
            audit_path = pathlib.Path(args.audit_output)
            audit_path.parent.mkdir(parents=True, exist_ok=True)
            audit_path.write_text(json.dumps(result, indent=2, sort_keys=True), encoding="utf-8")
        print(json.dumps(result, indent=2, sort_keys=True))
        return 0
    if args.audit_only:
        audit = audit_import_outputs(state=state, rag_dir=rag_dir)
        rag_stats = None
        if args.include_rag_stats:
            rag_stats = RAGSSHClient(
                host=args.rag_host,
                user=args.rag_user,
                identity=args.rag_identity,
                staging_dir=args.rag_staging_dir,
                ingest_dir=args.rag_ingest_dir,
                collection=args.collection,
            ).stats()
            audit["rag_queue"] = rag_stats
        if args.wiki_output:
            wiki_path = pathlib.Path(args.wiki_output)
            wiki_path.parent.mkdir(parents=True, exist_ok=True)
            wiki_path.write_text(
                build_collection_wiki_markdown(
                    title=args.wiki_title or f"{args.collection} Import",
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
            audit["wiki_output"] = str(wiki_path)
        if args.audit_output:
            audit_path = pathlib.Path(args.audit_output)
            audit_path.parent.mkdir(parents=True, exist_ok=True)
            audit_path.write_text(json.dumps(audit, indent=2, sort_keys=True), encoding="utf-8")
        print(json.dumps(audit, indent=2, sort_keys=True))
        return 0
    if args.crawl and entries:
        print(
            f"Discovering documentation pages from {len(entries)} seed(s) "
            f"depth={args.crawl_depth} max_pages_per_seed={args.max_pages_per_seed}"
        )
        entries = discover_documentation_urls(
            entries,
            max_depth=args.crawl_depth,
            max_pages_per_seed=args.max_pages_per_seed,
            allowed_prefixes=args.allowed_prefix,
            include_sitemap=not args.no_sitemap,
            timeout=args.timeout,
            max_download_bytes=args.max_download_bytes,
            delay=args.crawl_delay,
        )
        print(f"Discovered pages: {len(entries)}")
        for entry in entries:
            state.mark_discovered(
                entry.url,
                {
                    "label": entry.label,
                    "documentation_score": documentation_score_for_url(entry.url),
                    "source_section": source_section_for_url(entry.url),
                },
            )
        if not args.dry_run:
            state.save(state_path)
    if args.limit:
        entries = entries[: args.limit]
    if not entries:
        print("No URLs provided. Use --url or --url-file.", file=sys.stderr)
        return 2

    client = None
    rag_client = None
    if not args.dry_run:
        client = MemoryMCPClient(args.endpoint)
        client.connect()
        if args.enqueue_rag:
            rag_client = RAGSSHClient(
                host=args.rag_host,
                user=args.rag_user,
                identity=args.rag_identity,
                staging_dir=args.rag_staging_dir,
                ingest_dir=args.rag_ingest_dir,
                collection=args.collection,
            )
            print(f"Initial RAG stats: {rag_client.stats()}")

    completed_this_run = 0
    skipped_this_run = 0
    failed_this_run = 0
    rag_jobs_this_run = 0

    print(f"Web pages to consider: {len(entries)}")
    for index, entry in enumerate(entries, start=1):
        url = entry.url
        label = entry.label
        validation_error = validate_url(url)
        if validation_error:
            print(f"[{index}/{len(entries)}] skip invalid {url}: {validation_error}")
            state.mark_skipped(url, validation_error)
            if not args.dry_run:
                state.save(state_path)
            write_log(log_path, "skipped", url, validation_error)
            skipped_this_run += 1
            continue
        if state.is_completed(url):
            print(f"[{index}/{len(entries)}] skip completed {url}")
            write_log(log_path, "skipped", url, "already completed")
            skipped_this_run += 1
            continue
        try:
            page = fetch_with_retries(
                url,
                retries=args.retries,
                timeout=args.timeout,
                backoff=args.retry_backoff,
                max_text_chars=args.fetch_max_chars,
                max_download_bytes=args.max_download_bytes,
            )
            fetched_skip_reason = should_skip_fetched_page(page)
            if fetched_skip_reason:
                print(f"[{index}/{len(entries)}] skip fetched {url}: {fetched_skip_reason}")
                state.mark_skipped(url, fetched_skip_reason)
                if not args.dry_run:
                    state.save(state_path)
                write_log(log_path, "skipped", url, fetched_skip_reason, title=page.title)
                skipped_this_run += 1
                continue
            chunk_profile = chunk_profile_for_page(page, args.chunk_profile)
            rag_path = write_rag_markdown(
                rag_dir,
                page,
                label,
                max_chars=args.rag_max_chars,
                collection=args.collection,
                import_run_id=import_run_id,
                chunk_profile=chunk_profile,
            )
            page_slug = slug(label or page.title)
            rag_tags = stable_unique(["web-page-import", slug(args.collection), page_slug, chunk_profile, import_run_id])
            rag_job_id = None
            print(f"[{index}/{len(entries)}] {'dry-run ' if args.dry_run else ''}record {label or page.title}")
            if rag_client:
                rag_job_id = enqueue_rag_markdown(rag_client, rag_path, rag_tags)
                rag_jobs_this_run += 1
                print(f"  enqueued RAG job #{rag_job_id}")
            if client:
                record_page(
                    client,
                    page=page,
                    label=label,
                    rag_path=str(rag_path),
                    rag_job_id=rag_job_id,
                    collection=args.collection,
                    import_run_id=import_run_id,
                    chunk_profile=chunk_profile,
                )
                state.mark_completed(
                    url,
                    {
                        "title": label or page.title,
                        "final_url": page.final_url,
                        "canonical_url": page.canonical_url,
                        "source_handle": source_handle_for_url(page.canonical_url or page.final_url),
                        "source_section": source_section_for_url(page.canonical_url or page.final_url),
                        "content_hash": content_hash_for_page(page),
                        "chunk_profile": chunk_profile,
                        "import_run_id": import_run_id,
                        "rag_path": str(rag_path),
                        "rag_job_id": rag_job_id,
                        "fetched_at": page.fetched_at,
                    },
                )
                state.save(state_path)
            write_log(
                log_path,
                "completed" if not args.dry_run else "dry-run",
                url,
                "processed",
                title=label or page.title,
                rag_path=str(rag_path),
                rag_job_id=rag_job_id,
                source_handle=source_handle_for_url(page.canonical_url or page.final_url),
                chunk_profile=chunk_profile,
                import_run_id=import_run_id,
            )
            completed_this_run += 1
            time.sleep(args.delay)
        except Exception as error:  # noqa: BLE001
            message = str(error)
            print(f"[{index}/{len(entries)}] FAILED {url}: {message}", file=sys.stderr)
            failed_this_run += 1
            state.mark_failed(url, message)
            if not args.dry_run:
                state.save(state_path)
            write_log(log_path, "failed", url, message)
            time.sleep(args.delay)

    if client and not args.no_run_summary:
        record_run_summary(
            client,
            total=len(entries),
            completed=completed_this_run,
            skipped=skipped_this_run,
            failed=failed_this_run,
            state_path=state_path,
            log_path=log_path,
            rag_dir=rag_dir,
            collection=args.collection,
            import_run_id=import_run_id,
        )

    print(f"Succeeded this run: {completed_this_run}")
    print(f"Skipped this run: {skipped_this_run}")
    print(f"Failed this run: {failed_this_run}")
    print(f"RAG jobs enqueued this run: {rag_jobs_this_run}")
    if rag_client:
        print(f"Final RAG stats: {rag_client.stats()}")
    print(f"State file: {state_path}")
    print(f"Log file: {log_path}")
    print(f"RAG staging directory: {rag_dir}")
    return 1 if failed_this_run else 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--url", action="append", default=[], help="URL to import. May be repeated.")
    parser.add_argument("--url-file", default="", help="Text file with one URL per line. Optional label format: Label | URL")
    parser.add_argument("--endpoint", default="http://192.168.1.26:8006/mcp")
    parser.add_argument("--collection", default="web-page-import")
    parser.add_argument("--import-run-id", default="", help="Stable run identifier recorded in Memory MCP and RAG metadata.")
    parser.add_argument("--state", default=DEFAULT_STATE)
    parser.add_argument("--log", default=DEFAULT_LOG)
    parser.add_argument("--rag-dir", default=DEFAULT_RAG_DIR)
    parser.add_argument("--audit-only", action="store_true", help="Inspect state/RAG outputs without importing URLs.")
    parser.add_argument("--audit-output", default="", help="Optional JSON path for --audit-only results.")
    parser.add_argument("--wiki-output", default="", help="Optional markdown path for an import collection wiki page.")
    parser.add_argument("--wiki-title", default="", help="Title for --wiki-output. Defaults to '<collection> Import'.")
    parser.add_argument("--include-rag-stats", action="store_true", help="Include RAG queue stats in --audit-only output.")
    parser.add_argument(
        "--upgrade-metadata-only",
        action="store_true",
        help="Backfill Phase 3A metadata into existing state/RAG markdown without fetching, Memory writes, or RAG enqueue.",
    )
    parser.add_argument("--upgrade-limit", type=int, default=0, help="Limit metadata backfill records for testing.")
    parser.add_argument("--delay", type=float, default=0.5)
    parser.add_argument("--retries", type=int, default=3)
    parser.add_argument("--retry-backoff", type=float, default=1.5)
    parser.add_argument("--timeout", type=int, default=45)
    parser.add_argument("--limit", type=int, default=0)
    parser.add_argument("--crawl", action="store_true", help="Discover same-scope documentation links from seed URLs before import.")
    parser.add_argument("--crawl-depth", type=int, default=4)
    parser.add_argument("--max-pages-per-seed", type=int, default=300)
    parser.add_argument("--crawl-delay", type=float, default=0.1)
    parser.add_argument("--allowed-prefix", action="append", default=[], help="Additional URL prefix allowed during crawling. May be repeated.")
    parser.add_argument("--no-sitemap", action="store_true", help="Skip sitemap.xml discovery during crawl.")
    parser.add_argument("--fetch-max-chars", type=int, default=200_000)
    parser.add_argument("--max-download-bytes", type=int, default=2_000_000)
    parser.add_argument("--dns-server", default="", help="Optional DNS server for importer-local fallback resolution, e.g. 1.1.1.1.")
    parser.add_argument("--rag-max-chars", type=int, default=80_000)
    parser.add_argument(
        "--chunk-profile",
        default="auto",
        choices=["auto", "web-docs", "api-docs", "code-docs", "reference-docs"],
        help="RAG staging profile. 'auto' selects a conservative profile from URL and page text.",
    )
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--no-run-summary", action="store_true")
    parser.add_argument("--enqueue-rag", action="store_true")
    parser.add_argument("--rag-host", default="192.168.1.107")
    parser.add_argument("--rag-user", default="veronika")
    parser.add_argument("--rag-identity", default="~/.ssh/id_rsa_hermes")
    parser.add_argument("--rag-staging-dir", default="/opt/rag/uploads-staging")
    parser.add_argument("--rag-ingest-dir", default="/opt/rag/ingest")
    return run(parser.parse_args())


if __name__ == "__main__":
    raise SystemExit(main())
