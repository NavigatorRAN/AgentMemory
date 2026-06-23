# Docs - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/cli/docs
- Final URL: https://docs.openclaw.ai/cli/docs
- Canonical URL: https://docs.openclaw.ai/cli/docs
- Fetched at: 2026-06-23T14:37:37Z
- Content type: text/html; charset=utf-8

## Description

CLI reference for `openclaw docs` (search the live docs index)

## Extracted Text

Close
Reference CLI commands
openclaw docs
Search the live OpenClaw docs index from the terminal. The command calls OpenClaw's Cloudflare-hosted docs search API and renders the results in your terminal.
Usage
bash Copy code openclaw docs # print docs entrypoint and example search openclaw docs <query...> # search the live docs index
Arguments:
Argument Description [query...] Free-form search query. Multi-word queries are joined with spaces and sent as one.
Examples
bash Copy code openclaw docs browser existing-session openclaw docs sandbox allowHostControl openclaw docs gateway token secretref
With no query, openclaw docs prints the docs entrypoint URL plus a sample search command instead of running a search.
How it works
openclaw docs calls https://docs.openclaw.ai/api/search and renders the JSON results. The search call uses a fixed 30 second timeout.
Output
In a rich (TTY) terminal, results render as a heading followed by a bullet list. Each bullet shows the page title, the linked docs URL, and a short snippet on the next line. Empty results print "No results.".
In non-rich output (piped, --no-color , scripts), the same data renders as Markdown:
markdown Copy code # Docs search: < query > - [ Title ]( https://docs.openclaw.ai/... ) - snippet - [ Title ]( https://docs.openclaw.ai/... ) - snippet
Exit codes
Code Meaning 0 Search succeeded (including zero-result responses). 1 The hosted docs search API call failed; stderr is printed inline.
Related
CLI reference
Live docs
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
