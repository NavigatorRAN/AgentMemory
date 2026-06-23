# Non-interactive mode – Codex | OpenAI Developers

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://developers.openai.com/codex/noninteractive
- Final URL: https://developers.openai.com/codex/noninteractive
- Canonical URL: https://developers.openai.com/codex/noninteractive
- Fetched at: 2026-06-23T14:12:42Z
- Content type: text/html; charset=utf-8

## Description

Use `codex exec` to run Codex in scripts and CI

## Extracted Text

Search the Codex docs
Search docs
Suggested
responses create reasoning_effort realtime prompt caching
Primary navigation
Get started
Overview
Quickstart
Models
Pricing
SDKs and CLI
OpenAI SDK
Agents SDK
OpenAI CLI
Latest: GPT-5.5
Prompt guidance
Core concepts
Text generation
Code generation
Images and vision
Audio and speech
Structured output
Function calling
Responses API
Using tools
Agent definitions
Models and providers
Running agents
Sandbox agents
Orchestration
Guardrails
Results and state
Integrations and observability
Evaluate agent workflows
Voice agents
ChatKit
Customize
Widgets
Actions
Advanced integrations
Tools
Web search
MCP and Connectors
Secure MCP Tunnel
Skills
Shell
Computer use
File search and retrieval
File search
Retrieval
Tool search
More tools
Apply Patch
Local shell
Image generation
Code interpreter
Run and scale
Conversation state
Background mode
Streaming
WebSocket mode
Webhooks
File inputs
Context management
Compaction
Counting tokens
Prompt caching
Prompting
Prompt engineering
Citation formatting
Migration guide
Reasoning
Reasoning models
Reasoning best practices
Evaluation
Red teaming
Realtime and audio
Live translation
Transcription
Realtime transcription
Speech to text
Speech generation
Realtime prompting guide
Connection methods
WebRTC
WebSocket
SIP
Realtime sessions
Managing conversations
Voice activity detection
Realtime with tools
Webhooks and server-side controls
Managing costs
Specialized models
Video generation
Deep research
Embeddings
Moderation
Going live
Production best practices
Workload identity federation
Kubernetes
AWS
Microsoft Azure
Google Cloud
GitHub Actions
SPIFFE
Deployment checklist
Amazon Bedrock
Latency optimization
Predicted Outputs
Priority processing
Cost optimization
Batch
Flex processing
Accuracy optimization
Safety
Safety best practices
Safety checks
Cybersecurity checks
Under 18 API Guidance
Legacy APIs
Agent Builder
Node reference
Safety in building agents
Evals
Getting started
Working with evals
Prompt optimizer
External models
Best practices
Graders
Fine-tuning
Optimization cycle
Supervised fine-tuning
Vision fine-tuning
Direct preference optimization
Reinforcement fine-tuning
RFT use cases
Assistants API
Deep dive
Resources
Terms and policies
Changelog
Your data
Permissions
Rate limits
IP egress ranges
Admin APIs
Deprecations
MCP for deep research
Developer mode
ChatGPT Actions
Introduction
Actions library
Authentication
Production
Data retrieval
Sending files
Docs Use cases
Getting Started
Explore use cases
Import to Codex
Concepts
Customization
Memories
Chronicle
Sandboxing
Auto-review
Subagents
Workflows
Cyber Safety
Glossary
Using Codex
App
Features
Settings
Review
Automations
Worktrees
Local Environments
In-app browser
Chrome extension
Computer Use
Appshots
Commands
Windows
Troubleshooting
IDE Extension
IDE Commands
Slash commands
CLI
Command Line Options
Web
Environments
Internet Access
Integrations
GitHub
Slack
Linear
Codex Security
Codex Security plugin
Run a security scan
Run a deep scan
Review code changes
Triage a backlog
Fix findings
Export and track findings
Codex Security cloud
Setup
Improving the threat model
FAQ
Configuration
Config File
Config Basics
Advanced Config
Config Reference
Environment Variables
Sample Config
Speed
Rules
Hooks
AGENTS.md
MCP
Plugins
Build plugins
Sites
Record & Replay
Administration
Access tokens
Agent approvals & security
Remote connections
Deployment
Enterprise
Admin Setup
Governance
Managed configuration
Automation
Non-interactive Mode
Codex SDK
App Server
MCP Server
GitHub Action
Learn
Videos
Community
Blog
Mastering Codex Remote for engineering
Using skills to accelerate OSS maintenance
View all
Cookbooks
Build an Agent Improvement Loop with Traces, Evals, and Codex
Build iterative repair loops with Codex
Building AI Teams
Releases
Feature Maturity
Open Source
Home
Collections
Apps SDK Workspace Agents Commerce Ads
Core Concepts
MCP Apps in ChatGPT
UX principles
UI guidelines
Plan
Research use cases
Define tools
Design components
Build
Set up your server
Build your ChatGPT UI
Authenticate users
Manage state
Monetize your app
Examples
Deploy
Deploy your app
Connect from ChatGPT
Test your integration
Submit your app
Conversion apps
Restaurant reservation spec
Product checkout spec
Guides
Optimize Metadata
Security & Privacy
App submission guidelines
Reference
Trigger workspace agent runs
Authenticate with Workspace Agent access tokens
File Upload
Products
API
Feeds
Promotions
Ads Overview
Measurement
JavaScript Pixel
Conversions API
Supported events
Advertiser API
Product feeds
Campaign Targeting
API Reference
Campaigns
Ad Groups
Ads
Ad Account
Insights
Files
Showcase Blog Cookbook Learn Community
API examples
All posts
Recent
How Perplexity Brought Voice Search to Millions Using the Realtime API
Designing delightful frontends with GPT-5.4
From prompts to products: One year of Responses
Topics
General
Apps SDK
Audio
Codex
Agents
Multimodal
Text
Optimization
ChatGPT
gpt-oss
Contribute
Cookbook on GitHub
OpenAI Developers plugin
Docs MCP
Categories
Demo apps
Audio & Voice
Scaling
Programs
Codex Ambassadors
Codex for Students
Codex for Open Source
Events
Meetups
Hackathon Support
Forum
Discord
API Dashboard
Copy Page
Non-interactive mode lets you run Codex from scripts (for example, continuous integration (CI) jobs) without opening the interactive TUI.
You invoke it with codex exec .
For flag-level details, see codex exec .
When to use codex exec
Use codex exec when you want Codex to:
Run as part of a pipeline (CI, pre-merge checks, scheduled jobs).
Produce output you can pipe into other tools (for example, to generate release notes or summaries).
Fit naturally into CLI workflows that chain command output into Codex and pass Codex output to other tools.
Run with explicit, pre-set sandbox and approval settings.
Basic usage
Pass a task prompt as a single argument:
codex exec "summarize the repository structure and list the top 5 risky areas"
While codex exec runs, Codex streams progress to stderr and prints only the final agent message to stdout . This makes it straightforward to redirect or pipe the final result:
codex exec "generate release notes for the last 10 commits" | tee release-notes.md
Use --ephemeral when you don’t want to persist session rollout files to disk:
codex exec --ephemeral "triage this repository and suggest next steps"
If stdin is piped and you also provide a prompt argument, Codex treats the prompt as the instruction and the piped content as additional context.
This makes it easy to generate input with one command and hand it directly to Codex:
curl -s https://jsonplaceholder.typicode.com/comments \ | codex exec "format the top 20 items into a markdown table" \ > table.md
For more advanced stdin piping patterns, see Advanced stdin piping .
Permissions and safety
By default, codex exec runs in a read-only sandbox. In automation, set the least permissions needed for the workflow:
Allow edits: codex exec --sandbox workspace-write "<task>"
Allow broader access: codex exec --sandbox danger-full-access "<task>"
Use danger-full-access only in a controlled environment (for example, an isolated CI runner or container).
Codex keeps codex exec --full-auto as a deprecated compatibility flag and prints a warning. Prefer the explicit --sandbox workspace-write flag in new scripts.
Use --ignore-user-config when you need a run that doesn’t load $CODEX_HOME/config.toml , and --ignore-rules when you need to skip user and project execpolicy .rules files for a controlled automation environment.
If you configure an enabled MCP server with required = true and it fails to initialize, codex exec exits with an error instead of continuing without that server.
Make output machine-readable
To consume Codex output in scripts, use JSON Lines output:
codex exec --json "summarize the repo structure" | jq
When you enable --json , stdout becomes a JSON Lines (JSONL) stream so you can capture every event Codex emits while it’s running. Event types include thread.started , turn.started , turn.completed , turn.failed , item.* , and error .
Item types include agent messages, reasoning, command executions, file changes, MCP tool calls, web searches, and plan updates.
Sample JSON stream (each line is a JSON object):
{ "type" : "thread.started" , "thread_id" : "0199a213-81c0-7800-8aa1-bbab2a035a53" } { "type" : "turn.started" } { "type" : "item.started" , "item" :{ "id" : "item_1" , "type" : "command_execution" , "command" : "bash -lc ls" , "status" : "in_progress" }} { "type" : "item.completed" , "item" :{ "id" : "item_3" , "type" : "agent_message" , "text" : "Repo contains docs, sdk, and examples directories." }} { "type" : "turn.completed" , "usage" :{ "input_tokens" : 24763 , "cached_input_tokens" : 24448 , "output_tokens" : 122 , "reasoning_output_tokens" : 0 }}
If you only need the final message, write it to a file with -o <path> / --output-last-message <path> . This writes the final message to the file and still prints it to stdout (see codex exec for details).
Create structured outputs with a schema
If you need structured data for downstream steps, use --output-schema to request a final response that conforms to a JSON Schema.
This is useful for automated workflows that need stable fields (for example, job summaries, risk reports, or release metadata).
schema.json
{ "type" : "object" , "properties" : { "project_name" : { "type" : "string" }, "programming_languages" : { "type" : "array" , "items" : { "type" : "string" } } }, "required" : [ "project_name" , "programming_languages" ], "additionalProperties" : false }
Run Codex with the schema and write the final JSON response to disk:
codex exec "Extract project metadata" \ --output-schema ./schema.json \ -o ./project-metadata.json
Example final output (stdout):
{ "project_name" : "Codex CLI" , "programming_languages" : [ "Rust" , "TypeScript" , "Shell" ] }
Authenticate in automation
codex exec reuses saved CLI authentication by default. In CI, it’s common to provide credentials explicitly:
Use API key auth
For GitHub Actions, use the Codex GitHub Action instead of installing and authenticating the CLI yourself. The action is designed to reduce API key exposure by installing Codex, starting a Responses API proxy, and running Codex with a configurable safety strategy.
Do not set OPENAI_API_KEY or CODEX_API_KEY as a job-level environment variable in workflows that check out or run repository-controlled code. Build scripts, tests, dependency lifecycle hooks, or a compromised action in the same job can read those environment variables.
For other automation environments, set CODEX_API_KEY only for the single codex exec invocation and make sure no untrusted code runs in the same process environment.
To use a different API key for a single run, set CODEX_API_KEY inline:
CODEX_API_KEY =< api-key > codex exec --json "triage open bug reports"
CODEX_API_KEY is only supported in codex exec .
Use ChatGPT-managed auth in CI/CD (advanced)
Read this if you need to run CI/CD jobs with a Codex user account instead of an
API key, such as enterprise teams using ChatGPT-managed Codex access on trusted
runners or users who need ChatGPT/Codex rate limits instead of API key usage.
API keys are the right default for automation because they are simpler to
provision and rotate. Use this path only if you specifically need to run as
your Codex account.
Treat ~/.codex/auth.json like a password: it contains access tokens. Don’t
commit it, paste it into tickets, or share it in chat.
Do not use this workflow for public or open-source repositories. If codex login
is not an option on the runner, seed auth.json through secure storage, run
Codex on the runner so Codex refreshes it in place, and persist the updated file
between runs.
See Maintain Codex account auth in CI/CD (advanced) .
Resume a non-interactive session
If you need to continue a previous run (for example, a two-stage pipeline), use the resume subcommand:
codex exec "review the change for race conditions" codex exec resume --last "fix the race conditions you found"
You can also target a specific session ID with codex exec resume <SESSION_ID> .
Git repository required
Codex requires commands to run inside a Git repository to prevent destructive changes. Override this check with codex exec --skip-git-repo-check if you’re sure the environment is safe.
Common automation patterns
Example: Autofix CI failures in GitHub Actions
For GitHub Actions workflows, use openai/codex-action instead of installing Codex and passing the API key to a shell step. The action starts a secure proxy for the OpenAI API key.
You can use Codex to automatically propose fixes when a CI workflow fails. The pattern is:
Trigger a follow-up workflow when your main CI workflow completes with an error.
Check out the failing commit with repository read permissions only.
Run setup commands before Codex, without exposing your OpenAI API key to those steps.
Run the Codex GitHub Action.
Save Codex’s local changes as a patch artifact.
In a separate job, apply the patch and open a pull request.
The Codex job below has only contents: read . After Codex runs, it only serializes the diff as an artifact. The open_pr job receives repository write permissions, but it does not receive OPENAI_API_KEY .
The example assumes a Node.js project. Adjust the setup and test commands to match your stack.
For a deeper security checklist, see the Codex GitHub Action security guidance .
name : Codex auto-fix on CI failure on : workflow_run : workflows : [ "CI" ] types : [ completed ] jobs : generate_fix : if : ${{ github.event.workflow_run.conclusion == 'failure' }} runs-on : ubuntu-latest permissions : contents : read outputs : has_patch : ${{ steps.diff.outputs.has_patch }} steps : - uses : actions/checkout@v5 with : ref : ${{ github.event.workflow_run.head_sha }} fetch-depth : 0 persist-credentials : false - uses : actions/setup-node@v4 with : node-version : "20" - name : Install dependencies run : | if [ -f package-lock.json ]; then npm ci; fi - name : Run Codex uses : openai/codex-action@v1 with : openai-api-key : ${{ secrets.OPENAI_API_KEY }} prompt : | The CI workflow "${{ github.event.workflow_run.name }}" failed for commit ${{ github.event.workflow_run.head_sha }}. Run `npm test --silent` to reproduce the failure. Identify the minimal change needed to make the tests pass, implement only that change, and run `npm test --silent` again. Do not refactor unrelated files. - name : Create patch artifact id : diff run : | git add -N . git diff --binary HEAD > codex.patch if [ -s codex.patch ]; then echo "has_patch=true" >> "$GITHUB_OUTPUT" else echo "has_patch=false" >> "$GITHUB_OUTPUT" fi - name : Upload patch artifact if : steps.diff.outputs.has_patch == 'true' uses : actions/upload-artifact@v4 with : name : codex-fix-patch path : codex.patch if-no-files-found : error open_pr : runs-on : ubuntu-latest needs : generate_fix if : needs.generate_fix.outputs.has_patch == 'true' permissions : contents : write pull-requests : write steps : - uses : actions/checkout@v5 with : ref : ${{ github.event.workflow_run.head_sha }} fetch-depth : 0 - uses : actions/download-artifact@v4 with : name : codex-fix-patch - name : Apply Codex patch run : git apply --index codex.patch - name : Open pull request env : GH_TOKEN : ${{ github.token }} FAILED_HEAD_BRANCH : ${{ github.event.workflow_run.head_branch }} FAILED_HEAD_SHA : ${{ github.event.workflow_run.head_sha }} RUN_ID : ${{ github.event.workflow_run.run_id }} run : | branch="codex/auto-fix-$RUN_ID" git config user.name "github-actions[bot]" git config user.email "41898282+github-actions[bot]@users.noreply.github.com" git switch -c "$branch" git commit -m "Auto-fix failing CI via Codex" git push origin "$branch" { echo "Codex generated this patch after CI failed for \`$FAILED_HEAD_SHA\`." echo echo "Review the changes before merging." } > pr-body.md gh pr create \ --base "$FAILED_HEAD_BRANCH" \ --head "$branch" \ --title "Auto-fix failing CI via Codex" \ --body-file pr-body.md
Advanced stdin piping
When another command produces input for Codex, choose the stdin pattern based on where the instruction should come from. Use prompt-plus-stdin when you already know the instruction and want to pass piped output as context. Use codex exec - when stdin should become the full prompt.
Use prompt-plus-stdin
Prompt-plus-stdin is useful when another command already produces the data you want Codex to inspect. In this mode, you write the instruction yourself and pipe in the output as context, which makes it a natural fit for CLI workflows built around command output, logs, and generated data.
npm test 2>&1 \ | codex exec "summarize the failing tests and propose the smallest likely fix" \ | tee test-summary.md
More prompt-plus-stdin examples
Summarize logs
tail -n 200 app.log \ | codex exec "identify the likely root cause, cite the most important errors, and suggest the next three debugging steps" \ > log-triage.md
Inspect TLS or HTTP issues
curl -vv https://api.example.com/health 2>&1 \ | codex exec "explain the TLS or HTTP failure and suggest the most likely fix" \ > tls-debug.md
Prepare a Slack-ready update
gh run view 123456 --log \ | codex exec "write a concise Slack-ready update on the CI failure, including the likely cause and next step" \ | pbcopy
Draft a pull request comment from CI logs
gh run view 123456 --log \ | codex exec "summarize the failure in 5 bullets for the pull request thread" \ | gh pr comment 789 --body-file -
Use codex exec - when stdin is the prompt
If you omit the prompt argument, Codex reads the prompt from stdin. Use codex exec - when you want to force that behavior explicitly.
The - sentinel is useful when another command or script is generating the entire prompt dynamically. This is a good fit when you store prompts in files, assemble prompts with shell scripts, or combine live command output with instructions before handing the whole prompt to Codex.
cat prompt.txt | codex exec - printf "Summarize this error log in 3 bullets:\n\n%s\n" "$( tail -n 200 app.log)" \ | codex exec - generate_prompt.sh | codex exec - --json > result.jsonl
Ask AI
Loading docs agent...
