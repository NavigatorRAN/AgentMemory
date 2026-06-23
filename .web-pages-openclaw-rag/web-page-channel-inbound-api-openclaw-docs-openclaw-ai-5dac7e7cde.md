# Channel inbound API - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/plugins/sdk-channel-inbound
- Final URL: https://docs.openclaw.ai/plugins/sdk-channel-inbound
- Canonical URL: https://docs.openclaw.ai/plugins/sdk-channel-inbound
- Fetched at: 2026-06-23T14:54:22Z
- Content type: text/html; charset=utf-8

## Description

Inbound event helpers for channel plugins: context building, shared runner orchestration, session record, and prepared reply dispatch

## Extracted Text

Close
Reference Plugin maintainer reference
Channel plugins should model receive paths with inbound and message nouns:
text Copy code platform event -> inbound facts/context -> agent reply -> message delivery
Use openclaw/plugin-sdk/channel-inbound for inbound event normalization,
formatting, roots, and orchestration. Use
openclaw/plugin-sdk/channel-outbound for native
send, receipt, durable delivery, and live preview behavior.
Core Helpers
ts Copy code buildChannelInboundEventContext, runChannelInboundEvent, dispatchChannelInboundReply, } from "openclaw/plugin-sdk/channel-inbound" ;
buildChannelInboundEventContext(...) : project normalized channel facts into
the prompt/session context. Use channelContext to pass channel-owned
sender/chat metadata through to plugin hook ctx.channelContext ; augment
PluginHookChannelSenderContext or PluginHookChannelChatContext from this
subpath for channel-specific fields.
runChannelInboundEvent(...) : run ingest, classify, preflight, resolve,
record, dispatch, and finalize for one inbound platform event.
dispatchChannelInboundReply(...) : record and dispatch an already assembled
inbound reply with a delivery adapter.
The injected plugin runtime exposes the same high-level helpers under
runtime.channel.inbound.* for bundled/native channels that already receive the
runtime object.
ts Copy code await runtime. channel . inbound . run ({ channel : "demo" , accountId, raw : platformEvent, adapter : { ingest : normalizePlatformEvent, resolveTurn : resolveInboundReply, }, });
Compatibility dispatchers should assemble dispatchChannelInboundReply(...)
inputs and keep platform delivery in the delivery adapter. New send paths should
prefer message adapters and durable message helpers.
Migration
The old runtime.channel.turn.* runtime aliases were removed. Use:
runtime.channel.inbound.run(...) for raw inbound events.
runtime.channel.inbound.dispatchReply(...) for assembled reply contexts.
runtime.channel.inbound.buildContext(...) for inbound context payloads.
runtime.channel.inbound.runPreparedReply(...) only for channel-owned prepared
dispatch paths that already assemble their own dispatch closure.
New plugin code should not introduce turn -named channel APIs. Keep model or
agent turn vocabulary inside agent/provider code; channel plugins use inbound,
message, delivery, and reply terms.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
