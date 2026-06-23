# Spend Update Queue Full Warnings | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/troubleshoot/spend_queue_warnings
- Final URL: https://docs.litellm.ai/docs/troubleshoot/spend_queue_warnings
- Canonical URL: https://docs.litellm.ai/docs/troubleshoot/spend_queue_warnings
- Fetched at: 2026-06-23T14:33:39Z
- Content type: text/html; charset=utf-8

## Description

Overview

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Overview ​
The "Spend update queue is full" warning occurs in high-volume LiteLLM proxy deployments when the internal spend tracking queue reaches capacity. This is a protective mechanism to prevent memory issues during traffic spikes.
Warning Message ​
WARNING:litellm.proxy.db.db_transaction_queue.spend_update_queue:Spend update queue is full. Aggregating entries to prevent memory issues.
Root Cause ​
The spend update queue has a default maximum size of 10,000 entries ( MAX_SIZE_IN_MEMORY_QUEUE=10000 ). When this limit is reached:
New spend tracking entries are aggregated instead of queued individually
This prevents memory exhaustion but may slightly delay spend updates
The warning indicates your deployment is processing requests faster than the database can handle spend updates
Solutions ​
1. Increase Queue Size ​
Set the MAX_SIZE_IN_MEMORY_QUEUE environment variable to a higher value:
MAX_SIZE_IN_MEMORY_QUEUE=50000
Tradeoffs:
Higher queue sizes store more items in memory - provision at least 8GB RAM for large queues
Recommended for deployments with consistent high traffic
2. Horizontal Scaling ​
Deploy multiple proxy instances with load balancing. This distributes the spend tracking load across multiple queues, reducing the pressure on any single instance's spend update queue.
Related Configuration ​
# Environment variables
MAX_SIZE_IN_MEMORY_QUEUE : 10000 # Default queue size
Overview
Warning Message
Root Cause
Solutions
1. Increase Queue Size
2. Horizontal Scaling
Related Configuration
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
