# Learning Path | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/getting-started/learning-path
- Final URL: https://hermes-agent.nousresearch.com/docs/getting-started/learning-path
- Canonical URL: https://hermes-agent.nousresearch.com/docs/getting-started/learning-path
- Fetched at: 2026-06-23T14:14:46Z
- Content type: text/html; charset=utf-8

## Description

Choose your learning path through the Hermes Agent documentation based on your experience level and goals.

## Extracted Text

Skip to main content
On this page
Hermes Agent can do a lot — CLI assistant, Telegram/Discord bot, task automation, RL training, and more. This page helps you figure out where to start and what to read based on your experience level and what you're trying to accomplish.
Start Here
If you haven't installed Hermes Agent yet, begin with the Installation guide and then run through the Quickstart . Everything below assumes you have a working installation.
First-time provider setup
First-time users almost always want hermes setup --portal — one OAuth covers a model plus the four Tool Gateway tools (search/image/TTS/browser). See Nous Portal .
How to Use This Page ​
Know your level? Jump to the experience-level table and follow the reading order for your tier.
Have a specific goal? Skip to By Use Case and find the scenario that matches.
Just browsing? Check the Key Features table for a quick overview of everything Hermes Agent can do.
By Experience Level ​
Level Goal Recommended Reading Time Estimate Beginner Get up and running, have basic conversations, use built-in tools Installation → Quickstart → CLI Usage → Configuration ~1 hour Intermediate Set up messaging bots, use advanced features like memory, cron jobs, and skills Sessions → Messaging → Tools → Skills → Memory → Cron ~2–3 hours Advanced Build custom tools, create skills, train models with RL, contribute to the project Architecture → Adding Tools → Creating Skills → Contributing ~4–6 hours
By Use Case ​
Pick the scenario that matches what you want to do. Each one links you to the relevant docs in the order you should read them.
"I want a CLI coding assistant" ​
Use Hermes Agent as an interactive terminal assistant for writing, reviewing, and running code.
Installation
Quickstart
CLI Usage
Code Execution
Context Files
Tips & Tricks
tip
Pass files directly into your conversation with context files. Hermes Agent can read, edit, and run code in your projects.
"I want a Telegram/Discord bot" ​
Deploy Hermes Agent as a bot on your favorite messaging platform.
Configuration
Messaging Overview
Telegram Setup
Discord Setup
Voice Mode
Use Voice Mode with Hermes
Security
For full project examples, see:
Daily Briefing Bot
Team Telegram Assistant
"I want to automate tasks" ​
Schedule recurring tasks, run batch jobs, or chain agent actions together.
Cron Scheduling
Batch Processing
Delegation
Hooks
Cron jobs let Hermes Agent run tasks on a schedule — daily summaries, periodic checks, automated reports — without you being present.
"I want to build custom tools/skills" ​
Extend Hermes Agent with your own tools and reusable skill packages.
Plugins
Build a Hermes Plugin
Tools Overview
Skills Overview
MCP (Model Context Protocol)
Architecture
Adding Tools
Creating Skills
For most custom tool creation, start with plugins. The Adding Tools
page is for built-in Hermes core development, not the usual user/custom-tool path.
"I want to train models" ​
Use reinforcement learning to fine-tune model behavior with Hermes Agent's RL training pipeline (powered by Atropos ).
Atropos RL Environments (external)
Provider Routing
RL training works best when you already understand the basics of how Hermes Agent handles conversations and tool calls. Run through the Beginner path first if you're new.
"I want to use it as a Python library" ​
Integrate Hermes Agent into your own Python applications programmatically.
Python Library Guide
Tools
Sessions
Key Features at a Glance ​
Not sure what's available? Here's a quick directory of major features:
Feature What It Does Link Tools Built-in tools the agent can call (file I/O, search, shell, etc.) Tools Skills Installable plugin packages that add new capabilities Skills Memory Persistent memory across sessions Memory Context Files Feed files and directories into conversations Context Files MCP Connect to external tool servers via Model Context Protocol MCP Cron Schedule recurring agent tasks Cron Delegation Spawn sub-agents for parallel work Delegation Code Execution Run Python scripts that call Hermes tools programmatically Code Execution Browser Web browsing and scraping Browser Hooks Event-driven callbacks and middleware Hooks Batch Processing Process multiple inputs in bulk Batch Processing Provider Routing Route requests across multiple LLM providers Provider Routing
What to Read Next ​
Based on where you are right now:
Just finished installing? → Head to the Quickstart to run your first conversation.
Completed the Quickstart? → Read CLI Usage and Configuration to customize your setup.
Comfortable with the basics? → Explore Tools , Skills , and Memory to unlock the full power of the agent.
Setting up for a team? → Read Security and Sessions to understand access control and conversation management.
Ready to build? → Jump into the Developer Guide to understand the internals and start contributing.
Want practical examples? → Check out the Guides section for real-world projects and tips.
You don't need to read everything. Pick the path that matches your goal, follow the links in order, and you'll be productive quickly. You can always come back to this page to find your next step.
How to Use This Page
By Experience Level
By Use Case
"I want a CLI coding assistant"
"I want a Telegram/Discord bot"
"I want to automate tasks"
"I want to build custom tools/skills"
"I want to train models"
"I want to use it as a Python library"
Key Features at a Glance
What to Read Next
