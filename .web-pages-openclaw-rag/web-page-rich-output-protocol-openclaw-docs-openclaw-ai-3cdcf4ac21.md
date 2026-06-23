# Rich output protocol - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/reference/rich-output-protocol
- Final URL: https://docs.openclaw.ai/reference/rich-output-protocol
- Canonical URL: https://docs.openclaw.ai/reference/rich-output-protocol
- Fetched at: 2026-06-23T14:56:33Z
- Content type: text/html; charset=utf-8

## Description

Rich output protocol for structured media, embeds, audio hints, and replies

## Extracted Text

Close
Reference Technical reference
Assistant output can carry a small set of delivery/render directives:
structured mediaUrl / mediaUrls fields for attachment delivery
[[audio_as_voice]] for audio presentation hints
[[reply_to_current]] / [[reply_to:<id>]] for reply metadata
[embed ...] for Control UI rich rendering
Remote media attachments must be public https: URLs. Plain http: ,
loopback, link-local, private, and internal hostnames are ignored as attachment
directives; server-side media fetchers still enforce their own network guards.
Local media attachments can use absolute paths, workspace-relative paths, or
home-relative ~/ paths. They still pass through the agent file-read policy and
media type checks before delivery.
Warning
Do not emit text commands for attachments from tools, plugins, streaming blocks,
browser output, or message actions. Use structured media fields instead.
Valid message-tool payload:
json Copy code { "message" : "Here is your image." , "mediaUrl" : "/workspace/image.png" }
Legacy final assistant reply text may still be normalized for compatibility, but
it is not a general plugin/tool protocol.
Plain Markdown image syntax stays text by default. Channels that intentionally
map Markdown image replies to media attachments opt in at their outbound
adapter; Telegram does this so ![alt](url) can still become a media reply.
These directives are separate. Structured media fields and reply/voice tags are
delivery metadata; [embed ...] is the web-only rich render path.
When block streaming is enabled, media must be carried on structured payload
fields. If the same media URL is sent in a streamed block and repeated in the
final assistant payload, OpenClaw delivers the attachment once and strips the
duplicate from the final payload.
[embed ...]
[embed ...] is the only agent-facing rich render syntax for the Control UI.
Self-closing example:
text Copy code [embed ref="cv_123" title="Status" /]
Rules:
[view ...] is no longer valid for new output.
Embed shortcodes render in the assistant message surface only.
Only URL-backed embeds are rendered. Use ref="..." or url="..." .
Block-form inline HTML embed shortcodes are not rendered.
The web UI strips the shortcode from visible text and renders the embed inline.
Structured media is not an embed alias and should not be used for rich embed rendering.
Stored rendering shape
The normalized/stored assistant content block is a structured canvas item:
json Copy code { "type" : "canvas" , "preview" : { "kind" : "canvas" , "surface" : "assistant_message" , "render" : "url" , "viewId" : "cv_123" , "url" : "/__openclaw__/canvas/documents/cv_123/index.html" , "title" : "Status" , "preferredHeight" : 320 } }
Stored/rendered rich blocks use this canvas shape directly. present_view is not recognized.
Related
RPC adapters
Typebox
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
