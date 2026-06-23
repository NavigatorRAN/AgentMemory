# Guardrail Providers | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/guardrail_providers
- Final URL: https://docs.litellm.ai/docs/guardrail_providers
- Canonical URL: https://docs.litellm.ai/docs/guardrail_providers
- Fetched at: 2026-06-23T14:24:01Z
- Content type: text/html; charset=utf-8

## Description

Add safety and content filtering to LLM calls

## Extracted Text

Skip to main content
🗃️ Contributing to Guardrails
3 items
📄️ Team Bring-Your-Own Guardrails
Team-based guardrails let developers register a guardrail for their team via the API; an admin then reviews and approves or rejects it in the LiteLLM UI. Only Generic Guardrail API guardrails can be registered this way.
📄️ Aim Security
Quick Start
📄️ Akto
Use Akto as a guardrail provider, enabling runtime security for all LLM traffic routed through the proxy. Akto is purpose-built to secure autonomous and agentic AI systems that inspects every request and response inline, risk-scores interactions, and enforces policy decisions to block harmful actions, data exposure, and unsafe behavior before they can occur.
📄️ Aporia
Use Aporia to detect PII in requests and profanity in responses
📄️ Azure Content Safety Guardrail
LiteLLM supports Azure Content Safety guardrails via the Azure Content Safety API.
📄️ Bedrock Guardrails
If you haven't set up or authenticated your Bedrock provider yet, see the Bedrock Provider Setup & Authentication Guide.
📄️ CrowdStrike AIDR
The CrowdStrike AIDR guardrail uses configurable detection policies to identify
📄️ Custom Code Guardrail
Write custom guardrail logic using Python-like code that runs in a sandboxed environment.
📄️ Custom Guardrail
Use this if you want to write code to run a custom guardrail
📄️ DynamoAI Guardrails
LiteLLM supports DynamoAI guardrails for content moderation and policy enforcement on LLM inputs and outputs.
📄️ EnkryptAI Guardrails
LiteLLM supports EnkryptAI guardrails for content moderation and safety checks on LLM inputs and outputs.
📄️ Gray Swan Cygnal Guardrail
Use Gray Swan Cygnal to continuously monitor conversations for policy violations, indirect prompt injection (IPI), jailbreak attempts, and other safety risks.
📄️ Guardrails AI
Use Guardrails AI (guardrailsai.com) to add checks to LLM output.
📄️ HiddenLayer Guardrails
LiteLLM ships with a native integration for HiddenLayer. The proxy sends every request/response to HiddenLayer’s /detection/v1/interactions endpoint so you can block or redact unsafe content before it reaches your users.
📄️ IBM Guardrails
LiteLLM works with IBM's FMS Guardrails for content safety. You can use it to detect jailbreaks, PII, hate speech, and more.
📄️ Javelin Guardrails
Javelin provides AI safety and content moderation services with support for prompt injection detection, trust & safety violations, and language detection.
📄️ Lakera AI
Supported endpoints: The Lakera v2 integration only supports the chat completions endpoint (/v1/chat/completions). It is not supported for the Responses API, /v1/messages, MCP, A2A, or other proxy endpoints.
📄️ Lasso Security
Use Lasso Security to protect your LLM applications from prompt injection attacks, harmful content generation, and other security threats through comprehensive input and output validation.
📄️ Microsoft Purview Guardrail
LiteLLM supports Microsoft Purview DLP policies via the Microsoft Graph processContent API.
📄️ Google Cloud Model Armor
LiteLLM supports Google Cloud Model Armor guardrails via the Model Armor API.
📄️ Noma Security
Use Noma Security to protect your LLM applications with comprehensive AI content moderation and safety guardrails.
📄️ Onyx Security
📄️ OpenAI Moderation
Overview
📄️ Pangea
The Pangea guardrail uses configurable detection policies (called recipes) from its AI Guard service to identify and mitigate risks in AI application traffic, including:
📄️ PANW Prisma AIRS
LiteLLM supports PANW Prisma AIRS (AI Runtime Security) guardrails via the Prisma AIRS Scan API. This integration provides Security-as-Code for AI applications using Palo Alto Networks' AI security platform.
📄️ PII, PHI Masking - Presidio
📄️ Pillar Security
Pillar Security integrates with LiteLLM Proxy via the Generic Guardrail API, providing comprehensive AI security scanning for your LLM applications.
📄️ In-memory Prompt Injection Detection
LiteLLM Supports the following methods for detecting prompt injection attacks
📄️ PromptGuard
Use PromptGuard to protect your LLM applications with prompt injection detection, PII redaction, topic filtering, entity blocklists, and hallucination detection. PromptGuard is self-hostable with drop-in proxy integration.
📄️ Qostodian Nexus by Qohash
Qohash is a pioneer of zero-copy data security, the only model designed to secure petabytes of unstructured data in large enterprises. Enterprises run dozens of AI models, copilots, and autonomous agents, all hungry for data. Qostodian Nexus is the single control layer that governs every interaction. It knows your data. It enforces your policies. It scales from prompt inspection to LLM output data governance, interrogating all agentic, human, SaaS and API interactions with one control plane and a consistent set of policies. Nexus scans prompts and responses using deterministic classification policies and LLM-as-a-judge checks, returning an explicit enforcement decision (ALLOW, LOG, REDACT or BLOCK).
📄️ Qualifire
Use Qualifire to evaluate LLM outputs for quality, safety, and reliability. Detect prompt injections, hallucinations, PII, harmful content, and validate that your AI follows instructions.
📄️ Rubrik Guardrail
Use Rubrik's tool blocking and logging integration to validate LLM tool calls against an external policy service and batch-log all LLM requests/responses.
📄️ ✨ Secret Detection/Redaction (Enterprise-only)
❓ Use this to REDACT API Keys, Secrets sent in requests to an LLM.
📄️ Sensitive Data Routing (Built-in Guardrail)
Built-in guardrail that detects sensitive data in a request and reroutes it to an on-premise model instead of blocking or redacting it. No external dependencies required.
📄️ LiteLLM Tool Permission Guardrail
LiteLLM provides the LiteLLM Tool Permission Guardrail that lets you control which tool calls a model is allowed to invoke, using configurable allow/deny rules. This offers fine-grained, provider-agnostic control over tool execution (e.g., OpenAI Chat Completions toolcalls, Anthropic Messages tooluse, MCP tools).
📄️ Vigil Guard
Use Vigil Guard as a LiteLLM proxy guardrail to evaluate chat input and model output before it is returned to your application.
📄️ Zscaler AI Guard
