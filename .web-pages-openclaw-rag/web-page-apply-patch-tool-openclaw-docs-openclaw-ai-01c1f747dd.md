# apply_patch tool - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/tools/apply-patch
- Final URL: https://docs.openclaw.ai/tools/apply-patch
- Canonical URL: https://docs.openclaw.ai/tools/apply-patch
- Fetched at: 2026-06-23T14:57:24Z
- Content type: text/html; charset=utf-8

## Description

Apply multi-file patches with the apply_patch tool

## Extracted Text

Close
Capabilities Tools
Apply file changes using a structured patch format. This is ideal for multi-file
or multi-hunk edits where a single edit call would be brittle.
The tool accepts a single input string that wraps one or more file operations:
Code Copy code *** Begin Patch *** Add File: path/to/file.txt +line 1 +line 2 *** Update File: src/app.ts @@ -old line +new line *** Delete File: obsolete.txt *** End Patch
Parameters
input (required): Full patch contents including *** Begin Patch and *** End Patch .
Notes
Patch paths support relative paths (from the workspace directory) and absolute paths.
tools.exec.applyPatch.workspaceOnly defaults to true (workspace-contained). Set it to false only if you intentionally want apply_patch to write/delete outside the workspace directory.
Use *** Move to: within an *** Update File: hunk to rename files.
*** End of File marks an EOF-only insert when needed.
Available by default for OpenAI and OpenAI Codex models. Set
tools.exec.applyPatch.enabled: false to disable it.
Optionally gate by model via
tools.exec.applyPatch.allowModels .
Config is only under tools.exec .
Example
json Copy code { "tool" : "apply_patch" , "input" : "*** Begin Patch\n*** Update File: src/index.ts\n@@\n-const foo = 1\n+const foo = 2\n*** End Patch" }
Related
Diffs
Read-only diff viewer for change presentation.
Exec tool
Shell command execution from the agent.
Code execution
Sandboxed remote Python analysis with xAI.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
