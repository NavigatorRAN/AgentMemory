# Harbor | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/projects/Harbor
- Final URL: https://docs.litellm.ai/docs/projects/Harbor
- Canonical URL: https://docs.litellm.ai/docs/projects/Harbor
- Fetched at: 2026-06-23T14:26:12Z
- Content type: text/html; charset=utf-8

## Description

Harbor is a framework from the creators of Terminal-Bench for evaluating and optimizing agents and language models. It uses LiteLLM to call 100+ LLM providers.

## Extracted Text

Skip to main content
Copy as Markdown
Harbor is a framework from the creators of Terminal-Bench for evaluating and optimizing agents and language models. It uses LiteLLM to call 100+ LLM providers.
# Install
uv add harbor
# Run a benchmark with any LiteLLM-supported model
harbor run --dataset terminal-bench@2.0 \
--agent claude-code \
--model anthropic/claude-opus-4-1 \
--n-concurrent 4
Key features:
Evaluate agents like Claude Code, OpenHands, Codex CLI
Build and share benchmarks and environments
Run experiments in parallel across cloud providers (Daytona, Modal)
Generate rollouts for RL optimization
GitHub
Documentation
