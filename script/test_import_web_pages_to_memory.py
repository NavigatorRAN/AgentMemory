#!/usr/bin/env python3

from __future__ import annotations

import json
import pathlib
import tempfile
import unittest

from import_web_pages_to_memory import (
    ImportState,
    URLInput,
    build_memory_content,
    build_rag_markdown,
    discover_documentation_urls,
    enqueue_rag_markdown,
    extract_page,
    extract_links,
    in_allowed_scope,
    load_url_inputs,
    parse_sitemap_urls,
    redirect_target,
    resolve_host_with_dns_server,
    should_skip_fetched_page,
    safe_rag_filename,
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
            "https://docs.example.com/docs/config",
            "https://docs.example.com/docs/install",
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
        self.assertIn("RAG detail path: .web-pages-rag-staging/example.md", content)
        self.assertIn("RAG job ID: 42", content)
        self.assertLess(len(content), 1500)

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

        markdown = build_rag_markdown(page=page, label="", max_chars=10_000)

        self.assertIn("# Heading", markdown)
        self.assertIn("Requested URL: https://example.com/source", markdown)
        self.assertIn("Final URL: https://example.com/final", markdown)
        self.assertIn("Detailed implementation note.", markdown)

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
