# Secrets | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/secrets
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/secrets
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/secrets/
- Fetched at: 2026-06-23T14:17:29Z
- Content type: text/html; charset=utf-8

## Description

Hermes can pull API keys from external secret managers at process startup instead of storing them in ~/.hermes/.env. The bootstrap token for the secret manager lives in .env; every other provider key (OpenAI, Anthropic, OpenRouter, etc.) can stay in the manager and rotate centrally.

## Extracted Text

Skip to main content
Hermes can pull API keys from external secret managers at process startup instead of storing them in ~/.hermes/.env . The bootstrap token for the secret manager lives in .env ; every other provider key (OpenAI, Anthropic, OpenRouter, etc.) can stay in the manager and rotate centrally.
Supported:
Bitwarden Secrets Manager — bws CLI, lazy-installed, free tier works.
More backends (Vault, AWS Secrets Manager, 1Password CLI) are easy to add behind the same interface — the lift is one module in agent/secret_sources/ and one CLI handler. File a request if you have a specific one in mind.
