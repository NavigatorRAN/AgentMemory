# PDF tool - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/pdf
- Final URL: https://docs.openclaw.ai/tools/pdf
- Canonical URL: https://docs.openclaw.ai/tools/pdf
- Fetched at: 2026-06-23T14:58:07Z
- Content type: text/html; charset=utf-8

## Description

Analyze one or more PDF documents with native provider support and extraction fallback

## Extracted Text

Close
Capabilities Tools
pdf analyzes one or more PDF documents and returns text.
Quick behavior:
Native provider mode for Anthropic and Google model providers.
Extraction fallback mode for other providers (extract text first, then page images when needed).
Supports single ( pdf ) or multi ( pdfs ) input, max 10 PDFs per call.
Availability
The tool is only registered when OpenClaw can resolve a PDF-capable model config for the agent:
agents.defaults.pdfModel
fallback to agents.defaults.imageModel
fallback to the agent's resolved session/default model
if native-PDF providers are auth-backed, prefer them ahead of generic image fallback candidates
If no usable model can be resolved, the pdf tool is not exposed.
Availability notes:
The fallback chain is auth-aware. A configured provider/model only counts if
OpenClaw can actually authenticate that provider for the agent.
Native PDF providers are currently Anthropic and Google .
If the resolved session/default provider already has a configured vision/PDF
model, the PDF tool reuses that before falling back to other auth-backed
providers.
Input reference
One PDF path or URL.
Multiple PDF paths or URLs, up to 10 total.
Analysis prompt.
Page filter like 1-5 or 1,3,7-9 .
Password for encrypted PDFs in extraction fallback mode.
Optional model override in provider/model form.
Per-PDF size cap in MB. Defaults to agents.defaults.pdfMaxBytesMb or 10 .
Input notes:
pdf and pdfs are merged and deduplicated before loading.
If no PDF input is provided, the tool errors.
pages is parsed as 1-based page numbers, deduped, sorted, and clamped to the configured max pages.
password applies to every PDF in the request and is only used by extraction fallback mode.
maxBytesMb defaults to agents.defaults.pdfMaxBytesMb or 10 .
Supported PDF references
local file path (including ~ expansion)
file:// URL
http:// and https:// URL
OpenClaw-managed inbound refs such as media://inbound/<id>
Reference notes:
Other URI schemes (for example ftp:// ) are rejected with unsupported_pdf_reference .
In sandbox mode, remote http(s) URLs are rejected.
With workspace-only file policy enabled, local file paths outside allowed roots are rejected.
Managed inbound refs and replayed paths under OpenClaw's inbound media store are allowed with workspace-only file policy.
Execution modes
Native provider mode
Native mode is used for provider anthropic and google .
The tool sends raw PDF bytes directly to provider APIs.
Native mode limits:
pages is not supported. If set, the tool returns an error.
password is not supported. Use a non-native model to analyze encrypted PDFs.
Multi-PDF input is supported; each PDF is sent as a native document block /
inline PDF part before the prompt.
Extraction fallback mode
Fallback mode is used for non-native providers.
Flow:
Extract text from selected pages (up to agents.defaults.pdfMaxPages , default 20 ).
If extracted text length is below 200 chars, render selected pages to PNG images and include them.
Send extracted content plus prompt to the selected model.
Fallback details:
Page image extraction uses a pixel budget of 4,000,000 .
Encrypted PDFs can be opened with the top-level password parameter.
If the target model does not support image input and there is no extractable text, the tool errors.
If text extraction succeeds but image extraction would require vision on a
text-only model, OpenClaw drops the rendered images and continues with the
extracted text.
Extraction fallback uses the bundled document-extract plugin. The plugin owns
clawpdf , which provides text extraction and image rendering through PDFium
WebAssembly.
Config
json5 Copy code { agents : { defaults : { pdfModel : { primary : "anthropic/claude-opus-4-6" , fallbacks : [ "openai/gpt-5.4-mini" ], }, pdfMaxBytesMb : 10 , pdfMaxPages : 20 , }, }, }
See Configuration Reference for full field details.
Output details
The tool returns text in content[0].text and structured metadata in details .
Common details fields:
model : resolved model ref ( provider/model )
native : true for native provider mode, false for fallback
attempts : fallback attempts that failed before success
Path fields:
single PDF input: details.pdf
multiple PDF inputs: details.pdfs[] with pdf entries
sandbox path rewrite metadata (when applicable): rewrittenFrom
Error behavior
Missing PDF input: throws pdf required: provide a path or URL to a PDF document
Too many PDFs: returns structured error in details.error = "too_many_pdfs"
Unsupported reference scheme: returns details.error = "unsupported_pdf_reference"
Native mode with pages : throws clear pages is not supported with native PDF providers error
Examples
Single PDF:
json Copy code { "pdf" : "/tmp/report.pdf" , "prompt" : "Summarize this report in 5 bullets" }
Multiple PDFs:
json Copy code { "pdfs" : [ "/tmp/q1.pdf" , "/tmp/q2.pdf" ] , "prompt" : "Compare risks and timeline changes across both documents" }
Page-filtered fallback model:
json Copy code { "pdf" : "https://example.com/report.pdf" , "pages" : "1-3,7" , "model" : "openai/gpt-5.4-mini" , "prompt" : "Extract only customer-impacting incidents" }
Encrypted PDF with extraction fallback:
json Copy code { "pdf" : "/tmp/locked.pdf" , "password" : "example-password" , "model" : "openai/gpt-5.4-mini" , "prompt" : "Summarize this contract" }
Related
Tools Overview - all available agent tools
Configuration Reference - pdfMaxBytesMb and pdfMaxPages config
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
