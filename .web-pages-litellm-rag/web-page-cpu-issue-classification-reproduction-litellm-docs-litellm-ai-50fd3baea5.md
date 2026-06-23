# CPU Issue Classification & Reproduction | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/troubleshoot/cpu_issues
- Final URL: https://docs.litellm.ai/docs/troubleshoot/cpu_issues
- Canonical URL: https://docs.litellm.ai/docs/troubleshoot/cpu_issues
- Fetched at: 2026-06-23T14:33:33Z
- Content type: text/html; charset=utf-8

## Description

1. Classify the CPU Issue

## Extracted Text

Skip to main content
On this page
Copy as Markdown
1. Classify the CPU Issue ​
Select the options that best describes the CPU behavior observed.
CPU scales with traffic (RPS-driven)
CPU increases without a traffic increase
CPU increases after a LiteLLM upgrade
2. Can you reproduce the issue? ​
Before escalating, verify whether the CPU issue can be reproduced in a test environment that mirrors your production setup.
If reproducible, provide detailed reproduction steps along with any relevant requests or configuration used.
For guidance on the type of information we're looking for, see the LiteLLM Troubleshooting Guide .
3. Issue Cannot Be Reproduced ​
If the CPU issue cannot be reproduced in a test environment that mirrors your production setup, please provide:
Information from Section 1 and 2
CPU classification (Section 1)
Reproduction attempts and environment details (Section 2)
Additional context to help investigate:
Workload: A realistic sample of requests processed before and during the spike, including any recent configuration changes.
Metrics: CPU usage, P50/P99 latency, memory usage. Please include screenshots of the metrics whenever possible.
Logs / Alerts: Any relevant logs or alerts captured before and during the spike .
Providing this information allows the team to analyze patterns, correlate spikes with traffic or configuration, and attempt to reproduce the issue internally. Without it, our engineers won't have enough information to look into the problem.
1. Classify the CPU Issue
2. Can you reproduce the issue?
3. Issue Cannot Be Reproduced
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
