# Use MCP with Hermes | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/guides/use-mcp-with-hermes
- Final URL: https://hermes-agent.nousresearch.com/docs/guides/use-mcp-with-hermes
- Canonical URL: https://hermes-agent.nousresearch.com/docs/guides/use-mcp-with-hermes
- Fetched at: 2026-06-23T14:15:19Z
- Content type: text/html; charset=utf-8

## Description

A practical guide to connecting MCP servers to Hermes Agent, filtering their tools, and using them safely in real workflows

## Extracted Text

Skip to main content
On this page
This guide shows how to actually use MCP with Hermes Agent in day-to-day workflows.
If the feature page explains what MCP is, this guide is about how to get value from it quickly and safely.
When should you use MCP? ​
Use MCP when:
a tool already exists in MCP form and you do not want to build a native Hermes tool
you want Hermes to operate against a local or remote system through a clean RPC layer
you want fine-grained per-server exposure control
you want to connect Hermes to internal APIs, databases, or company systems without modifying Hermes core
Do not use MCP when:
a built-in Hermes tool already solves the job well
the server exposes a huge dangerous tool surface and you are not prepared to filter it
you only need one very narrow integration and a native tool would be simpler and safer
Mental model ​
Think of MCP as an adapter layer:
Hermes remains the agent
MCP servers contribute tools
Hermes discovers those tools at startup or reload time
the model can use them like normal tools
you control how much of each server is visible
That last part matters. Good MCP usage is not just “connect everything.” It is “connect the right thing, with the smallest useful surface.”
Step 1: install MCP support ​
If you installed Hermes with the standard install script, MCP support is already included (the installer runs uv pip install -e ".[all]" ).
If you installed without extras and need to add MCP separately:
cd ~/.hermes/hermes-agent
uv pip install -e ".[mcp]"
For npm-based servers, make sure Node.js and npx are available.
For many Python MCP servers, uvx is a nice default.
Step 2: add one server first ​
Start with a single, safe server.
Example: filesystem access to one project directory only.
mcp_servers :
project_fs :
command : "npx"
args : [ "-y" , "@modelcontextprotocol/server-filesystem" , "/home/user/my-project" ]
Then start Hermes:
hermes chat
Now ask something concrete:
Inspect this project and summarize the repo layout.
Step 3: verify MCP loaded ​
You can verify MCP in a few ways:
Hermes banner/status should show MCP integration when configured
ask Hermes what tools it has available
use /reload-mcp after config changes
check logs if the server failed to connect
A practical test prompt:
Tell me which MCP-backed tools are available right now.
Step 4: start filtering immediately ​
Do not wait until later if the server exposes a lot of tools.
Example: whitelist only what you want ​
github :
args : [ "-y" , "@modelcontextprotocol/server-github" ]
env :
GITHUB_PERSONAL_ACCESS_TOKEN : "***"
tools :
include : [ list_issues , create_issue , search_code ]
This is usually the best default for sensitive systems.
WSL2: bridge Hermes in WSL to Windows Chrome ​
This is the practical setup when:
Hermes runs inside WSL2
the browser you want to control is your normal signed-in Chrome on Windows
/browser connect is awkward or unreliable from WSL
In this setup, Hermes does not connect to Chrome directly. Instead:
Hermes runs in WSL
Hermes starts a local stdio MCP server
that MCP server is launched through Windows interop ( cmd.exe or powershell.exe )
the MCP server attaches to your live Windows Chrome session
Mental model:
Hermes (WSL) -> MCP stdio bridge -> Windows Chrome
Why this mode is useful ​
you keep your real Windows browser profile, cookies, and logins
Hermes stays in its supported Unix environment (WSL2)
browser control is exposed as MCP tools instead of relying on Hermes core browser transport
Recommended server ​
Use chrome-devtools-mcp .
If your Windows Chrome already has live remote debugging enabled from chrome://inspect/#remote-debugging , add it like this from WSL:
hermes mcp add chrome-devtools-win --command cmd.exe --args /c npx -y chrome-devtools-mcp@latest --autoConnect --no-usage-statistics
After saving the server:
hermes mcp test chrome-devtools-win
Then start a fresh Hermes session or run:
/reload-mcp
Typical prompt ​
Once loaded, Hermes can use the MCP-prefixed browser tools directly. For example:
调用 MCP 工具 mcp_chrome_devtools_win_list_pages，列出当前浏览器标签页。
When /browser connect is the wrong tool ​
If Hermes runs in WSL and Chrome runs on Windows, /browser connect may fail even though Chrome is open and debuggable.
Common reasons:
WSL cannot reach the same host-local endpoint Chrome exposes to Windows tools
newer Chrome live-debugging flows are not the same as a classic ws://localhost:9222
the browser is easier to attach to from a Windows-side helper like chrome-devtools-mcp
In those cases, keep /browser connect for same-environment setups and use MCP for WSL-to-Windows browser bridging.
Known pitfalls ​
Start Hermes from a Windows-mounted path like /mnt/c/Users/<you> or /mnt/c/workspace/... when using Windows stdio executables through MCP.
If you start Hermes from /root or /home/... , Windows may emit a UNC current-directory warning before the MCP server starts.
If chrome-devtools-mcp --autoConnect times out while enumerating pages, reduce background/frozen tabs in Chrome and retry.
Example: blacklist dangerous actions ​
stripe :
url : "https://mcp.stripe.com"
headers :
Authorization : "Bearer ***"
exclude : [ delete_customer , refund_payment ]
Example: disable utility wrappers too ​
docs :
url : "https://mcp.docs.example.com"
prompts : false
resources : false
What does filtering actually affect? ​
There are two categories of MCP-exposed functionality in Hermes:
Server-native MCP tools
filtered with:
tools.include
tools.exclude
Hermes-added utility wrappers
tools.resources
tools.prompts
Utility wrappers you may see ​
Resources:
list_resources
read_resource
Prompts:
list_prompts
get_prompt
These wrappers only appear if:
your config allows them, and
the MCP server session actually supports those capabilities
So Hermes will not pretend a server has resources/prompts if it does not.
Common patterns ​
Pattern 1: local project assistant ​
Use MCP for a repo-local filesystem or git server when you want Hermes to reason over a bounded workspace.
fs :
args : [ "-y" , "@modelcontextprotocol/server-filesystem" , "/home/user/project" ]
git :
command : "uvx"
args : [ "mcp-server-git" , "--repository" , "/home/user/project" ]
Good prompts:
Review the project structure and identify where configuration lives.
Check the local git state and summarize what changed recently.
Pattern 2: repo-native work record with Open Scaffold ​
Use Open Scaffold when you want Hermes to read a repository's durable AI-work record: mission, plans, evidence notes, handoff packets, and review/gate results. Hermes remains the agent; Open Scaffold remains the repo-local record.
Add the server for one scaffolded repository:
hermes mcp add open_scaffold --command npx --args -y open-scaffold@latest mcp serve --repo /absolute/path/to/repo
hermes mcp test open_scaffold
Then keep the exposed surface read-oriented. Choose select in the hermes mcp add prompt, or edit config.yaml afterward:
open_scaffold :
args : [ "-y" , "open-scaffold@latest" , "mcp" , "serve" , "--repo" , "/absolute/path/to/repo" ]
include :
- list_plans
- get_plan
- get_mission
- list_evidence
- get_evidence
- get_status
- search_plans
- list_amendments
- get_handoff
- analyze_loop
- gate_loop
Use the Open Scaffold MCP tools to compile the current handoff packet and tell me the next legal action.
Inspect the active plans and evidence notes, then say whether this repo is ready for human review or needs another attempt.
Boundary notes:
Open Scaffold MCP is local-first and read-only by default.
Its write tools require the server to be started with --allow-write ; do not enable that until you explicitly want Hermes to mutate .osc files.
Open Scaffold records and gates work; it does not authorize Hermes to merge, publish, deploy, or spawn runtimes.
Pin open-scaffold@<version> instead of @latest if you need reproducible tool schemas.
Pattern 3: GitHub triage assistant ​
include : [ list_issues , create_issue , update_issue , search_code ]
List open issues about MCP, cluster them by theme, and draft a high-quality issue for the most common bug.
Search the repo for uses of _discover_and_register_server and explain how MCP tools are registered.
Pattern 4: internal API assistant ​
internal_api :
url : "https://mcp.internal.example.com"
include : [ list_customers , get_customer , list_invoices ]
Look up customer ACME Corp and summarize recent invoice activity.
This is the sort of place where a strict whitelist is far better than an exclude list.
Pattern 4: documentation / knowledge servers ​
Some MCP servers expose prompts or resources that are more like shared knowledge assets than direct actions.
prompts : true
resources : true
List available MCP resources from the docs server, then read the onboarding guide and summarize it.
List prompts exposed by the docs server and tell me which ones would help with incident response.
Tutorial: end-to-end setup with filtering ​
Here is a practical progression.
Phase 1: add GitHub MCP with a tight whitelist ​
Start Hermes and ask:
Search the codebase for references to MCP and summarize the main integration points.
Phase 2: expand only when needed ​
If you later need issue updates too:
Then reload:
Phase 3: add a second server with different policy ​
filesystem :
Now Hermes can combine them:
Inspect the local project files, then create a GitHub issue summarizing the bug you find.
That is where MCP gets powerful: multi-system workflows without changing Hermes core.
Safe usage recommendations ​
Prefer allowlists for dangerous systems ​
For anything financial, customer-facing, or destructive:
use tools.include
start with the smallest set possible
Disable unused utilities ​
If you do not want the model browsing server-provided resources/prompts, turn them off:
Keep servers scoped narrowly ​
Examples:
filesystem server rooted to one project dir, not your whole home directory
git server pointed at one repo
internal API server with read-heavy tool exposure by default
Reload after config changes ​
Do this after changing:
include/exclude lists
enabled flags
resources/prompts toggles
auth headers / env
Troubleshooting by symptom ​
"The server connects but the tools I expected are missing" ​
Possible causes:
filtered by tools.include
excluded by tools.exclude
utility wrappers disabled via resources: false or prompts: false
server does not actually support resources/prompts
"The server is configured but nothing loads" ​
Check:
enabled: false was not left in config
command/runtime exists ( npx , uvx , etc.)
HTTP endpoint is reachable
auth env or headers are correct
"Why do I see fewer tools than the MCP server advertises?" ​
Because Hermes now respects your per-server policy and capability-aware registration. That is expected, and usually desirable.
"How do I remove an MCP server without deleting the config?" ​
Use:
enabled : false
That keeps the config around but prevents connection and registration.
Recommended first MCP setups ​
Good first servers for most users:
filesystem
git
GitHub
fetch / documentation MCP servers
one narrow internal API
Not-great first servers:
giant business systems with lots of destructive actions and no filtering
anything you do not understand well enough to constrain
Related docs ​
MCP (Model Context Protocol)
FAQ
Slash Commands
When should you use MCP?
Mental model
Step 1: install MCP support
Step 2: add one server first
Step 3: verify MCP loaded
Step 4: start filtering immediately
Example: whitelist only what you want
WSL2: bridge Hermes in WSL to Windows Chrome
Why this mode is useful
Recommended server
Typical prompt
When /browser connect is the wrong tool
Known pitfalls
Example: blacklist dangerous actions
Example: disable utility wrappers too
What does filtering actually affect?
Utility wrappers you may see
Common patterns
Pattern 1: local project assistant
Pattern 2: repo-native work record with Open Scaffold
Pattern 3: GitHub triage assistant
Pattern 4: internal API assistant
Pattern 4: documentation / knowledge servers
Tutorial: end-to-end setup with filtering
Phase 1: add GitHub MCP with a tight whitelist
Phase 2: expand only when needed
Phase 3: add a second server with different policy
Safe usage recommendations
Prefer allowlists for dangerous systems
Disable unused utilities
Keep servers scoped narrowly
Reload after config changes
Troubleshooting by symptom
"The server connects but the tools I expected are missing"
"The server is configured but nothing loads"
"Why do I see fewer tools than the MCP server advertises?"
"How do I remove an MCP server without deleting the config?"
Recommended first MCP setups
Related docs
