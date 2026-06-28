#!/usr/bin/env python3

from __future__ import annotations

import json
import pathlib
import tempfile
import unittest

from import_web_pages_to_memory import (
    ImportState,
    URLInput,
    audit_import_outputs,
    build_collection_wiki_markdown,
    build_memory_content,
    build_rag_markdown,
    chunk_profile_for_page,
    discover_documentation_urls,
    documentation_score_for_url,
    enqueue_rag_markdown,
    extract_page,
    extract_links,
    in_allowed_scope,
    load_url_inputs,
    parse_sitemap_urls,
    parse_markdown_frontmatter,
    rag_metadata_for_page,
    redirect_target,
    resolve_host_with_dns_server,
    should_skip_fetched_page,
    source_handle_for_url,
    state_record_for_page,
    safe_rag_filename,
    update_markdown_frontmatter,
    upgrade_legacy_import_metadata,
    validate_import_record,
    validate_rag_metadata,
    write_log,
)


class WebPageImporterTests(unittest.TestCase):
    def test_load_url_inputs_preserves_labels_and_ignores_comments(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "urls.txt"
            path.write_text(
                "\n".join(
                    [
                        "# notes",
                        "https://example.com/one",
                        "Custom label | https://example.com/two",
                        "https://example.com/three | Alternate label",
                        "",
                    ]
                ),
                encoding="utf-8",
            )

            entries = load_url_inputs(["https://example.com/direct"], path)

        self.assertEqual([entry.url for entry in entries], [
            "https://example.com/direct",
            "https://example.com/one",
            "https://example.com/two",
            "https://example.com/three",
        ])
        self.assertEqual(entries[2].label, "Custom label")
        self.assertEqual(entries[3].label, "Alternate label")

    def test_extract_page_prefers_metadata_and_removes_script_noise(self) -> None:
        html = b"""
        <html><head>
          <title>Example Page</title>
          <link rel="canonical" href="https://example.com/canonical">
          <meta name="description" content="A short useful description.">
          <script>window.noisy = true;</script>
        </head><body>
          <nav>Navigation should not dominate.</nav>
          <h1>Readable Heading</h1>
          <p>First paragraph with enough useful detail for a durable summary.</p>
          <p>Second paragraph adds implementation detail for RAG.</p>
        </body></html>
        """

        page = extract_page(
            requested_url="https://example.com/source",
            final_url="https://example.com/final",
            content_type="text/html; charset=utf-8",
            raw=html,
            max_text_chars=10_000,
        )

        self.assertEqual(page.title, "Example Page")
        self.assertEqual(page.canonical_url, "https://example.com/canonical")
        self.assertIn("A short useful description.", page.description)
        self.assertIn("Readable Heading", page.text)
        self.assertIn("First paragraph", page.text)
        self.assertNotIn("window.noisy", page.text)

    def test_extract_links_normalizes_relative_urls_and_filters_fragments(self) -> None:
        html = b"""
        <html><body>
          <a href="/docs/start">Start</a>
          <a href="install#docker">Install</a>
          <a href="#local">Local fragment</a>
          <a href="mailto:test@example.com">Email</a>
        </body></html>
        """

        links = extract_links("https://docs.example.com/docs/index", html, "text/html")

        self.assertEqual(
            links,
            [
                "https://docs.example.com/docs/start",
                "https://docs.example.com/docs/install",
            ],
        )
        self.assertEqual(extract_links("https://docs.example.com", b'<a href="/">Home</a>', "text/html"), ["https://docs.example.com"])

    def test_in_allowed_scope_defaults_to_seed_path_and_same_host(self) -> None:
        seed = "https://docs.example.com/docs/proxy/docker_quick_start"

        self.assertTrue(in_allowed_scope("https://docs.example.com/docs/proxy/config", seed, []))
        self.assertTrue(in_allowed_scope("https://docs.example.com/docs/other", seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/blog/release", seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/fa/install", seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/docs/de/install", seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/docs/zh-Hans/install", seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/docs/api-viewer/index.html", seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/docs/manual.pdf", seed, []))
        self.assertFalse(in_allowed_scope("https://other.example.com/docs/other", seed, []))
        self.assertTrue(in_allowed_scope("https://other.example.com/docs/other", seed, ["https://other.example.com/docs/"]))
        self.assertFalse(in_allowed_scope("https://docs.example.com/docs/issues/123", seed, []))

        root_seed = "https://docs.example.com"
        self.assertTrue(in_allowed_scope("https://docs.example.com/channels", root_seed, []))
        self.assertTrue(in_allowed_scope("https://docs.example.com/ci", root_seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/fa/channels", root_seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/ja-JP/channels", root_seed, []))
        self.assertFalse(in_allowed_scope("https://docs.example.com/nl/channels", root_seed, []))

    def test_in_allowed_scope_keeps_github_repo_crawl_documentation_focused(self) -> None:
        seed = "https://github.com/dani-garcia/vaultwarden"

        self.assertTrue(in_allowed_scope("https://github.com/dani-garcia/vaultwarden", seed, []))
        self.assertTrue(in_allowed_scope("https://github.com/dani-garcia/vaultwarden/wiki", seed, []))
        self.assertTrue(in_allowed_scope("https://github.com/dani-garcia/vaultwarden/blob/main/README.md", seed, []))
        self.assertTrue(in_allowed_scope("https://github.com/dani-garcia/vaultwarden/tree/main/docs", seed, []))
        self.assertFalse(in_allowed_scope("https://github.com/dani-garcia/vaultwarden/wiki/Home/_edit", seed, []))
        self.assertFalse(in_allowed_scope("https://github.com/dani-garcia/vaultwarden/activity", seed, []))
        self.assertFalse(in_allowed_scope("https://github.com/dani-garcia/vaultwarden/blob/main/Cargo.toml", seed, []))

    def test_discover_documentation_urls_walks_page_by_page_with_depth_and_cap(self) -> None:
        pages = {
            "https://docs.example.com/docs/index": b"""
                <a href="/docs/install">Install</a>
                <a href="/docs/config">Config</a>
                <a href="/blog/nope">Blog</a>
            """,
            "https://docs.example.com/docs/install": b"""<a href="/docs/install/docker">Docker</a>""",
            "https://docs.example.com/docs/config": b"""<a href="/docs/config/env">Env</a>""",
            "https://docs.example.com/docs/install/docker": b"""Docker details""",
        }

        def fake_fetch(url: str) -> tuple[bytes, str, str]:
            return pages[url], url, "text/html"

        entries = discover_documentation_urls(
            [URLInput("https://docs.example.com/docs/index", "Example Docs")],
            max_depth=1,
            max_pages_per_seed=10,
            allowed_prefixes=[],
            include_sitemap=False,
            fetch=fake_fetch,
        )

        self.assertEqual([entry.url for entry in entries], [
            "https://docs.example.com/docs/index",
            "https://docs.example.com/docs/install",
            "https://docs.example.com/docs/config",
        ])
        self.assertEqual(entries[0].label, "Example Docs")
        self.assertEqual(entries[1].label, "")

    def test_parse_sitemap_urls_extracts_locs(self) -> None:
        raw = b"""
        <urlset>
          <url><loc>https://docs.example.com/docs/a</loc></url>
          <url><loc>https://docs.example.com/docs/b#section</loc></url>
        </urlset>
        """

        self.assertEqual(parse_sitemap_urls(raw), [
            "https://docs.example.com/docs/a",
            "https://docs.example.com/docs/b",
        ])

    def test_redirect_target_resolves_relative_location(self) -> None:
        self.assertEqual(
            redirect_target("https://docs.example.com/docs/page", "/docs/page/"),
            "https://docs.example.com/docs/page/",
        )

    def test_resolve_host_with_dns_server_parses_dig_output(self) -> None:
        def fake_command(args: list[str]) -> str:
            self.assertEqual(args[:3], ["dig", "+short", "@1.1.1.1"])
            return "cname.example.net.\n203.0.113.42\n"

        self.assertEqual(resolve_host_with_dns_server("docs.example.com", "1.1.1.1", command=fake_command), "203.0.113.42")

    def test_memory_content_is_concise_and_source_backed(self) -> None:
        page = extract_page(
            requested_url="https://example.com/source",
            final_url="https://example.com/final",
            content_type="text/plain",
            raw=("Title line\n\n" + "important detail " * 400).encode("utf-8"),
            max_text_chars=20_000,
        )

        content = build_memory_content(
            page=page,
            label="Example Label",
            rag_path=".web-pages-rag-staging/example.md",
            rag_job_id=42,
            max_summary_chars=700,
        )

        self.assertIn("Web page import record", content)
        self.assertIn("Requested URL: https://example.com/source", content)
        self.assertIn("Final URL: https://example.com/final", content)
        self.assertIn("Source handle: web:example-com:", content)
        self.assertIn("Document type: web-documentation", content)
        self.assertIn("Language: en", content)
        self.assertIn("RAG detail path: .web-pages-rag-staging/example.md", content)
        self.assertIn("RAG job ID: 42", content)
        self.assertLess(len(content), 1900)

    def test_should_skip_fetched_page_rejects_github_wiki_create_page(self) -> None:
        page = extract_page(
            requested_url="https://github.com/example/project/wiki/Missing",
            final_url="https://github.com/example/project/wiki/Missing",
            content_type="text/html",
            raw="<html><head><title>Create new page · example/project Wiki · GitHub</title></head><body>Create new page</body></html>".encode("utf-8"),
            max_text_chars=10_000,
        )

        self.assertEqual(should_skip_fetched_page(page), "github wiki page does not exist")

    def test_should_skip_fetched_page_rejects_binary_document_formats(self) -> None:
        page = extract_page(
            requested_url="https://docs.example.com/manual.pdf",
            final_url="https://docs.example.com/manual.pdf",
            content_type="application/pdf",
            raw=b"%PDF-1.7",
            max_text_chars=10_000,
        )

        self.assertEqual(should_skip_fetched_page(page), "binary document format is not handled by this text importer")

    def test_rag_markdown_preserves_provenance_and_fuller_text(self) -> None:
        page = extract_page(
            requested_url="https://example.com/source",
            final_url="https://example.com/final",
            content_type="text/plain",
            raw=b"Heading\n\nDetailed implementation note.",
            max_text_chars=10_000,
        )

        markdown = build_rag_markdown(
            page=page,
            label="",
            max_chars=10_000,
            collection="product-documentation-example",
            import_run_id="run-1",
            chunk_profile="reference-docs",
        )

        self.assertTrue(markdown.startswith("---\n"))
        self.assertIn("# Heading", markdown)
        self.assertIn('collection: "product-documentation-example"', markdown)
        self.assertIn('import_run_id: "run-1"', markdown)
        self.assertIn('chunk_profile: "reference-docs"', markdown)
        self.assertIn("Requested URL: https://example.com/source", markdown)
        self.assertIn("Final URL: https://example.com/final", markdown)
        self.assertIn("Detailed implementation note.", markdown)

    def test_markdown_frontmatter_round_trips_simple_metadata(self) -> None:
        markdown = build_rag_markdown(
            page=extract_page(
                requested_url="https://example.com/source",
                final_url="https://example.com/final",
                content_type="text/plain",
                raw=b"Heading\n\nBody",
                max_text_chars=10_000,
            ),
            label="",
            max_chars=10_000,
            collection="example-docs",
            import_run_id="run-1",
            chunk_profile="web-docs",
        )

        metadata = parse_markdown_frontmatter(markdown)

        self.assertEqual(metadata["collection"], "example-docs")
        self.assertEqual(metadata["import_run_id"], "run-1")
        self.assertEqual(metadata["language"], "en")

    def test_validation_accepts_current_import_record_and_rag_metadata(self) -> None:
        page = extract_page(
            requested_url="https://docs.example.com/docs/start",
            final_url="https://docs.example.com/docs/start",
            content_type="text/plain",
            raw=b"Start\n\nUseful documentation body.",
            max_text_chars=10_000,
        )

        with tempfile.TemporaryDirectory() as directory:
            rag_path = pathlib.Path(directory) / "start.md"
            record = state_record_for_page(
                page=page,
                label="",
                collection="example-docs",
                import_run_id="run-1",
                chunk_profile="web-docs",
                rag_path=rag_path,
                rag_job_id=42,
                memory_event_id="event-1",
                wiki_slug="example-docs",
            )

        metadata = rag_metadata_for_page(
            page=page,
            collection="example-docs",
            import_run_id="run-1",
            chunk_profile="web-docs",
            memory_event_id="event-1",
            wiki_slug="example-docs",
        )

        self.assertEqual(validate_import_record(record), [])
        self.assertEqual(validate_rag_metadata(metadata), [])

    def test_validation_flags_bad_hash_and_language(self) -> None:
        record = {
            "source_handle": "not-web",
            "source_section": "docs-start",
            "content_hash": "hash",
            "chunk_profile": "unknown",
            "import_run_id": "run-1",
            "rag_path": "rag/start.md",
        }
        metadata = {
            "source_url": "https://docs.example.com/docs/start",
            "final_url": "https://docs.example.com/docs/start",
            "canonical_url": "https://docs.example.com/docs/start",
            "source_handle": "not-web",
            "source_section": "docs-start",
            "collection": "example-docs",
            "doc_type": "unknown",
            "language": "fr",
            "import_run_id": "run-1",
            "content_hash": "hash",
            "chunk_profile": "unknown",
        }

        self.assertIn("content_hash must be sha256 hex", validate_import_record(record))
        self.assertIn("language must be en", validate_rag_metadata(metadata))

    def test_update_markdown_frontmatter_patches_memory_event_id(self) -> None:
        markdown = build_rag_markdown(
            page=extract_page(
                requested_url="https://example.com/source",
                final_url="https://example.com/final",
                content_type="text/plain",
                raw=b"Heading\n\nBody",
                max_text_chars=10_000,
            ),
            label="",
            max_chars=10_000,
            collection="example-docs",
            import_run_id="run-1",
            chunk_profile="web-docs",
        )
        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "page.md"
            path.write_text(markdown, encoding="utf-8")

            changed = update_markdown_frontmatter(path, {"memory_event_id": "event-1"})
            metadata = parse_markdown_frontmatter(path.read_text(encoding="utf-8"))

        self.assertTrue(changed)
        self.assertEqual(metadata["memory_event_id"], "event-1")

    def test_audit_import_outputs_flags_legacy_records_and_frontmatter(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            rag_dir = root / "rag"
            rag_dir.mkdir()
            (rag_dir / "legacy.md").write_text("# Legacy\n\nNo frontmatter", encoding="utf-8")
            (rag_dir / "current.md").write_text(
                build_rag_markdown(
                    page=extract_page(
                        requested_url="https://docs.example.com/docs/start",
                        final_url="https://docs.example.com/docs/start",
                        content_type="text/plain",
                        raw=b"Start\n\nConfiguration option reference.",
                        max_text_chars=10_000,
                    ),
                    label="",
                    max_chars=10_000,
                    collection="example-docs",
                    import_run_id="run-1",
                    chunk_profile="reference-docs",
                ),
                encoding="utf-8",
            )
            state = ImportState()
            state.mark_completed("https://legacy.example.com", {"title": "Legacy"})
            state.mark_completed(
                "https://docs.example.com/docs/start",
                {
                    "title": "Start",
                    "source_handle": "web:docs-example-com:abc",
                    "source_section": "docs-start",
                    "content_hash": "hash",
                    "chunk_profile": "reference-docs",
                    "import_run_id": "run-1",
                    "rag_path": str(rag_dir / "current.md"),
                },
            )

            audit = audit_import_outputs(state=state, rag_dir=rag_dir)

        self.assertEqual(audit["state"]["completed"], 2)
        self.assertEqual(audit["record_metadata"]["complete_records"], 1)
        self.assertEqual(audit["record_metadata"]["missing_counts"]["source_handle"], 1)
        self.assertEqual(audit["rag_metadata"]["markdown_count"], 2)
        self.assertEqual(audit["rag_metadata"]["with_frontmatter"], 1)
        self.assertEqual(audit["rag_metadata"]["missing_frontmatter"], 1)
        self.assertEqual(audit["chunk_profiles"]["reference-docs"], 1)
        self.assertEqual(audit["doc_types"]["reference"], 1)
        self.assertEqual(audit["validation"]["record_issue_count"], 2)
        sampled_issues = [
            issue
            for sample in audit["validation"]["record_issue_samples"]
            for issue in sample["issues"]
        ]
        self.assertIn("content_hash must be sha256 hex", sampled_issues)

    def test_collection_wiki_markdown_summarizes_import_and_rag_health(self) -> None:
        state = ImportState()
        state.mark_completed(
            "https://docs.example.com/docs/start",
            {
                "title": "Start",
                "source_handle": "web:docs-example-com:abc",
                "source_section": "docs-start",
                "content_hash": "hash",
                "chunk_profile": "web-docs",
                "import_run_id": "run-1",
                "rag_path": "rag/current.md",
            },
        )
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            rag_dir = root / "rag"
            rag_dir.mkdir()
            audit = audit_import_outputs(state=state, rag_dir=rag_dir)
            markdown = build_collection_wiki_markdown(
                title="Example Documentation Import",
                collection="example-docs",
                state_path=root / "state.json",
                log_path=root / "import.log.jsonl",
                rag_dir=rag_dir,
                audit=audit,
                memory_endpoint="http://memory.example/mcp",
                rag_stats={"done": 10, "failed": 1},
            )

        self.assertIn("# Example Documentation Import", markdown)
        self.assertIn("example-docs has 1 completed pages", markdown)
        self.assertIn("- Memory MCP endpoint: http://memory.example/mcp", markdown)
        self.assertIn("## RAG Queue", markdown)
        self.assertIn("- done: 10", markdown)

    def test_upgrade_legacy_import_metadata_backfills_state_and_frontmatter(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = pathlib.Path(directory)
            rag_dir = root / "rag"
            rag_dir.mkdir()
            rag_path = rag_dir / "legacy.md"
            rag_path.write_text(
                "\n".join(
                    [
                        "# Legacy Doc",
                        "",
                        "Source-backed web page detail staged by AgentMemory bulk web importer.",
                        "",
                        "- Requested URL: https://docs.example.com/docs/start",
                        "- Final URL: https://docs.example.com/docs/start",
                        "- Canonical URL: https://docs.example.com/docs/start/",
                        "- Fetched at: 2026-01-01T00:00:00Z",
                        "- Content type: text/html; charset=UTF-8",
                        "",
                        "## Description",
                        "",
                        "Helpful setup docs.",
                        "",
                        "## Extracted Text",
                        "",
                        "Configuration option reference details.",
                    ]
                ),
                encoding="utf-8",
            )
            state_path = root / "state.json"
            state = ImportState()
            state.mark_completed(
                "https://docs.example.com/docs/start",
                {
                    "title": "Legacy Doc",
                    "final_url": "https://docs.example.com/docs/start",
                    "canonical_url": "https://docs.example.com/docs/start/",
                    "rag_path": str(rag_path),
                    "rag_job_id": 42,
                    "fetched_at": "2026-01-01T00:00:00Z",
                },
            )

            result = upgrade_legacy_import_metadata(
                state=state,
                state_path=state_path,
                rag_dir=rag_dir,
                collection="example-docs",
                import_run_id="legacy-backfill",
            )
            upgraded = ImportState.load(state_path)
            markdown = rag_path.read_text(encoding="utf-8")
            metadata = parse_markdown_frontmatter(markdown)

        self.assertEqual(result["upgraded_records"], 1)
        self.assertEqual(result["upgraded_markdown"], 1)
        record = upgraded.records["https://docs.example.com/docs/start"]
        self.assertEqual(record["import_run_id"], "legacy-backfill")
        self.assertEqual(record["source_section"], "docs-start")
        self.assertEqual(metadata["collection"], "example-docs")
        self.assertEqual(metadata["chunk_profile"], "reference-docs")
        self.assertIn("# Legacy Doc", markdown)

    def test_source_metadata_helpers_are_stable(self) -> None:
        page = extract_page(
            requested_url="https://docs.example.com/docs/api/config",
            final_url="https://docs.example.com/docs/api/config",
            content_type="text/plain",
            raw=b"API endpoint request response parameter.",
            max_text_chars=10_000,
        )

        self.assertTrue(source_handle_for_url(page.final_url).startswith("web:docs-example-com:"))
        self.assertGreater(
            documentation_score_for_url("https://docs.example.com/docs/install"),
            documentation_score_for_url("https://docs.example.com/blog/release"),
        )
        self.assertEqual(chunk_profile_for_page(page, "auto"), "api-docs")
        metadata = rag_metadata_for_page(
            page=page,
            collection="product-documentation-example",
            import_run_id="run-1",
            chunk_profile="api-docs",
        )
        self.assertEqual(metadata["source_section"], "docs-api")
        self.assertEqual(metadata["doc_type"], "api-reference")
        self.assertEqual(metadata["language"], "en")

    def test_state_and_log_are_incremental_json_files(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            state_path = pathlib.Path(directory) / "state.json"
            log_path = pathlib.Path(directory) / "import.log.jsonl"

            state = ImportState.load(state_path)
            state.mark_completed("https://example.com/source", {"title": "Example"})
            state.save(state_path)
            write_log(log_path, "completed", "https://example.com/source", "stored", title="Example")

            reloaded = ImportState.load(state_path)
            log_entry = json.loads(log_path.read_text(encoding="utf-8").strip())

        self.assertTrue(reloaded.is_completed("https://example.com/source"))
        self.assertEqual(reloaded.records["https://example.com/source"]["title"], "Example")
        self.assertEqual(log_entry["event"], "completed")
        self.assertEqual(log_entry["url"], "https://example.com/source")

    def test_enqueue_rag_markdown_uses_filename_content_and_tags(self) -> None:
        class FakeRAGClient:
            def __init__(self) -> None:
                self.calls = []

            def enqueue_markdown(self, filename: str, content: str, tags: list[str]) -> int:
                self.calls.append((filename, content, tags))
                return 123

        with tempfile.TemporaryDirectory() as directory:
            path = pathlib.Path(directory) / "example.md"
            path.write_text("# Example\n\nContent", encoding="utf-8")
            client = FakeRAGClient()

            job_id = enqueue_rag_markdown(client, path, ["web-page-import", "example"])

        self.assertEqual(job_id, 123)
        self.assertEqual(client.calls, [("example.md", "# Example\n\nContent", ["web-page-import", "example"])])

    def test_safe_rag_filename_truncates_long_titles_and_keeps_digest(self) -> None:
        filename = safe_rag_filename("word " * 400, "https://docs.example.com/assets/files/llms-full.txt")

        self.assertLessEqual(len(filename), 180)
        self.assertTrue(filename.endswith(".md"))
        self.assertIn("docs-example-com", filename)


if __name__ == "__main__":
    unittest.main()
