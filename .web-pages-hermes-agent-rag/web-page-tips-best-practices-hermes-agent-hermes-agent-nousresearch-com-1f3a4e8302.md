# Tips & Best Practices | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/guides/tips
- Final URL: https://hermes-agent.nousresearch.com/docs/guides/tips
- Canonical URL: https://hermes-agent.nousresearch.com/docs/guides/tips
- Fetched at: 2026-06-23T14:15:18Z
- Content type: text/html; charset=utf-8

## Description

Practical advice to get the most out of Hermes Agent — prompt tips, CLI shortcuts, context files, memory, cost optimization, and security

## Extracted Text

Skip to main content
On this page
A quick-wins collection of practical tips that make you immediately more effective with Hermes Agent. Each section targets a different aspect — scan the headers and jump to what's relevant.
Confused which model to pick?
Run hermes setup --portal — you get 300+ models including Claude, GPT-5, and Gemini under one subscription. See Nous Portal .
Getting the Best Results ​
Be Specific About What You Want ​
Vague prompts produce vague results. Instead of "fix the code," say "fix the TypeError in api/handlers.py on line 47 — the process_request() function receives None from parse_body() ." The more context you give, the fewer iterations you need.
Provide Context Up Front ​
Front-load your request with the relevant details: file paths, error messages, expected behavior. One well-crafted message beats three rounds of clarification. Paste error tracebacks directly — the agent can parse them.
Use Context Files for Recurring Instructions ​
If you find yourself repeating the same instructions ("use tabs not spaces," "we use pytest," "the API is at /api/v2 "), put them in an AGENTS.md file. The agent reads it automatically every session — zero effort after setup.
Let the Agent Use Its Tools ​
Don't try to hand-hold every step. Say "find and fix the failing test" rather than "open tests/test_foo.py , look at line 42, then..." The agent has file search, terminal access, and code execution — let it explore and iterate.
Use Skills for Complex Workflows ​
Before writing a long prompt explaining how to do something, check if there's already a skill for it. Type /skills to browse available skills, or just invoke one directly like /axolotl or /github-pr-workflow .
CLI Power User Tips ​
Multi-Line Input ​
Press Alt+Enter , Ctrl+J , or Shift+Enter to insert a newline without sending. Shift+Enter only works when the terminal sends it as a distinct keystroke (Kitty / foot / WezTerm / Ghostty by default; iTerm2 / Alacritty / VS Code terminal once the Kitty keyboard protocol is enabled). The other two work in every terminal.
Paste Detection ​
The CLI auto-detects multi-line pastes. Just paste a code block or error traceback directly — it won't send each line as a separate message. The paste is buffered and sent as one message.
Interrupt and Redirect ​
Press Ctrl+C once to interrupt the agent mid-response. You can then type a new message to redirect it. Double-press Ctrl+C within 2 seconds to force exit. This is invaluable when the agent starts going down the wrong path.
Resume Sessions with -c ​
Forgot something from your last session? Run hermes -c to resume exactly where you left off, with full conversation history restored. You can also resume by title: hermes -r "my research project" .
Clipboard Image Paste ​
Press Ctrl+V to paste an image from your clipboard directly into the chat. The agent uses vision to analyze screenshots, diagrams, error popups, or UI mockups — no need to save to a file first.
Slash Command Autocomplete ​
Type / and press Tab to see all available commands. This includes built-in commands ( /compress , /model , /title ) and every installed skill. You don't need to memorize anything — Tab completion has you covered.
tip
Use /verbose to cycle through tool output display modes: off → new → all → verbose . The "all" mode is great for watching what the agent does; "off" is cleanest for simple Q&A.
Context Files ​
AGENTS.md: Your Project's Brain ​
Create an AGENTS.md in your project root with architecture decisions, coding conventions, and project-specific instructions. This is automatically injected into every session, so the agent always knows your project's rules.
# Project Context
- This is a FastAPI backend with SQLAlchemy ORM
- Always use async/await for database operations
- Tests go in tests/ and use pytest-asyncio
- Never commit .env files
SOUL.md: Customize Personality ​
Want Hermes to have a stable default voice? Edit ~/.hermes/SOUL.md (or $HERMES_HOME/SOUL.md if you use a custom Hermes home). Hermes now seeds a starter SOUL automatically and uses that global file as the instance-wide personality source.
For a full walkthrough, see Use SOUL.md with Hermes .
# Soul
You are a senior backend engineer. Be terse and direct.
Skip explanations unless asked. Prefer one-liners over verbose solutions.
Always consider error handling and edge cases.
Use SOUL.md for durable personality. Use AGENTS.md for project-specific instructions.
.cursorrules Compatibility ​
Already have a .cursorrules or .cursor/rules/*.mdc file? Hermes reads those too. No need to duplicate your coding conventions — they're loaded automatically from the working directory.
Discovery ​
Hermes loads the top-level AGENTS.md from the current working directory at session start. Subdirectory AGENTS.md files are discovered lazily during tool calls (via subdirectory_hints.py ) and injected into tool results — they are not loaded upfront into the system prompt.
Keep context files focused and concise. Every character counts against your token budget since they're injected into every single message.
Memory & Skills ​
Memory vs. Skills: What Goes Where ​
Memory is for facts: your environment, preferences, project locations, and things the agent has learned about you. Skills are for procedures: multi-step workflows, tool-specific instructions, and reusable recipes. Use memory for "what," skills for "how."
When to Create Skills ​
If you find a task that takes 5+ steps and you'll do it again, ask the agent to create a skill for it. Say "save what you just did as a skill called deploy-staging ." Next time, just type /deploy-staging and the agent loads the full procedure.
Managing Memory Capacity ​
Memory is intentionally bounded (~2,200 chars for MEMORY.md, ~1,375 chars for USER.md). When it fills up, the agent consolidates entries. You can help by saying "clean up your memory" or "replace the old Python 3.9 note — we're on 3.12 now."
Let the Agent Remember ​
After a productive session, say "remember this for next time" and the agent will save the key takeaways. You can also be specific: "save to memory that our CI uses GitHub Actions with the deploy.yml workflow."
warning
Memory is a frozen snapshot — changes made during a session don't appear in the system prompt until the next session starts. The agent writes to disk immediately, but the prompt cache isn't invalidated mid-session.
Performance & Cost ​
Don't Break the Prompt Cache ​
Most LLM providers cache the system prompt prefix. If you keep your system prompt stable (same context files, same memory), subsequent messages in a session get cache hits that are significantly cheaper. Avoid changing the model or system prompt mid-session.
Use /compress Before Hitting Limits ​
Long sessions accumulate tokens. When you notice responses slowing down or getting truncated, run /compress . This summarizes the conversation history, preserving key context while dramatically reducing token count. Use /usage to check where you stand.
Delegate for Parallel Work ​
Need to research three topics at once? Ask the agent to use delegate_task with parallel subtasks. Each subagent runs independently with its own context, and only the final summaries come back — massively reducing your main conversation's token usage.
Use execute_code for Batch Operations ​
Instead of running terminal commands one at a time, ask the agent to write a script that does everything at once. "Write a Python script to rename all .jpeg files to .jpg and run it" is cheaper and faster than renaming files individually.
Choose the Right Model ​
Use /model to switch models mid-session. Use a frontier model (Claude Sonnet/Opus, GPT-4o) for complex reasoning and architecture decisions. Switch to a faster model for simple tasks like formatting, renaming, or boilerplate generation.
Run /usage periodically to see your token consumption. Run /insights for a broader view of usage patterns over the last 30 days.
Messaging Tips ​
Set a Home Channel ​
Use /sethome in your preferred Telegram or Discord chat to designate it as the home channel. Cron job results and scheduled task outputs are delivered here. Without it, the agent has nowhere to send proactive messages.
Use /title to Organize Sessions ​
Name your sessions with /title auth-refactor or /title research-llm-quantization . Named sessions are easy to find with hermes sessions list and resume with hermes -r "auth-refactor" . Unnamed sessions pile up and become impossible to distinguish.
DM Pairing for Team Access ​
Instead of manually collecting user IDs for allowlists, enable DM pairing. When a teammate DMs the bot, they get a one-time pairing code. You approve it with hermes pairing approve telegram XKGH5N7P — simple and secure.
Tool Progress Display Modes ​
Use /verbose to control how much tool activity you see. In messaging platforms, less is usually more — keep it on "new" to see just new tool calls. In the CLI, "all" gives you a satisfying live view of everything the agent does.
On messaging platforms, sessions auto-reset after idle time (default: 24 hours) or daily at 4 AM. Adjust per-platform in ~/.hermes/config.yaml if you need longer sessions.
Security ​
Use Docker for Untrusted Code ​
When working with untrusted repositories or running unfamiliar code, use Docker or Daytona as your terminal backend. Set TERMINAL_BACKEND=docker in your .env . Destructive commands inside a container can't harm your host system.
# In your .env:
TERMINAL_BACKEND = docker
TERMINAL_DOCKER_IMAGE = hermes-sandbox:latest
Avoid Windows Encoding Pitfalls ​
On Windows, some default encodings (such as cp125x ) cannot represent all Unicode characters, which can cause UnicodeEncodeError when writing files in tests or scripts.
Prefer opening files with an explicit UTF-8 encoding:
with open ( "results.txt" , "w" , encoding = "utf-8" ) as f :
f . write ( "✓ All good\n" )
In PowerShell, you can also switch the current session to UTF-8 for console and native command output:
$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::new($false)
This keeps PowerShell and child processes on UTF-8 and helps avoid Windows-only failures.
Review Before Choosing "Always" ​
When the agent triggers a dangerous command approval ( rm -rf , DROP TABLE , etc.), you get four options: once , session , always , deny . Think carefully before choosing "always" — it permanently allowlists that pattern. Start with "session" until you're comfortable.
Command Approval Is Your Safety Net ​
Hermes checks every command against a curated list of dangerous patterns before execution. This includes recursive deletes, SQL drops, piping curl to shell, and more. Don't disable this in production — it exists for good reasons.
When running in a container backend (Docker, Singularity, Modal, Daytona), dangerous command checks are skipped because the container is the security boundary. Make sure your container images are properly locked down.
Use Allowlists for Messaging Bots ​
Never set GATEWAY_ALLOW_ALL_USERS=true on a bot with terminal access. Always use platform-specific allowlists ( TELEGRAM_ALLOWED_USERS , DISCORD_ALLOWED_USERS ) or DM pairing to control who can interact with your agent.
# Recommended: explicit allowlists per platform
TELEGRAM_ALLOWED_USERS = 123456789,987654321
DISCORD_ALLOWED_USERS = 123456789012345678
# Or use cross-platform allowlist
GATEWAY_ALLOWED_USERS = 123456789,987654321
Have a tip that should be on this page? Open an issue or PR — community contributions are welcome.
Getting the Best Results
Be Specific About What You Want
Provide Context Up Front
Use Context Files for Recurring Instructions
Let the Agent Use Its Tools
Use Skills for Complex Workflows
CLI Power User Tips
Multi-Line Input
Paste Detection
Interrupt and Redirect
Resume Sessions with -c
Clipboard Image Paste
Slash Command Autocomplete
Context Files
AGENTS.md: Your Project's Brain
SOUL.md: Customize Personality
.cursorrules Compatibility
Discovery
Memory & Skills
Memory vs. Skills: What Goes Where
When to Create Skills
Managing Memory Capacity
Let the Agent Remember
Performance & Cost
Don't Break the Prompt Cache
Use /compress Before Hitting Limits
Delegate for Parallel Work
Use execute_code for Batch Operations
Choose the Right Model
Messaging Tips
Set a Home Channel
Use /title to Organize Sessions
DM Pairing for Team Access
Tool Progress Display Modes
Security
Use Docker for Untrusted Code
Avoid Windows Encoding Pitfalls
Review Before Choosing "Always"
Command Approval Is Your Safety Net
Use Allowlists for Messaging Bots
