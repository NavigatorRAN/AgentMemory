# Claude Code Plugin Marketplace (Managed Skills) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/claude_code_plugin_marketplace
- Final URL: https://docs.litellm.ai/docs/tutorials/claude_code_plugin_marketplace
- Canonical URL: https://docs.litellm.ai/docs/tutorials/claude_code_plugin_marketplace
- Fetched at: 2026-06-23T14:33:50Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM AI Gateway acts as a central registry for Claude Code plugins. Admins can govern which plugins are available across the organization, and engineers can discover and install approved plugins from a single source.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM AI Gateway acts as a central registry for Claude Code plugins. Admins can govern which plugins are available across the organization, and engineers can discover and install approved plugins from a single source.
Prerequisites ​
LiteLLM Proxy running with database connected
Admin access to LiteLLM UI
Plugins hosted on GitHub, GitLab, or any git-accessible URL
Admin Guide: Managing the Marketplace ​
Step 1: Navigate to Claude Code Plugins ​
In the LiteLLM Admin UI, click on Claude Code Plugins in the left navigation menu.
Step 2: View the Plugins List ​
You'll see the list of all registered plugins. From here you can add, enable, disable, or delete plugins.
Step 3: Add a New Plugin ​
Click + Add New Plugin to register a plugin in your marketplace.
Step 4: Fill in Plugin Details ​
Enter the plugin information:
Name : Plugin identifier (kebab-case, e.g., my-plugin )
Source Type : Choose GitHub, Git URL, or Git Subdir
Repository/URL : The git source (e.g., org/repo for GitHub)
Version : Semantic version (optional)
Description : What the plugin does
Category : Plugin category for organization
Keywords : Search terms
Step 5: Submit the Plugin ​
After filling in the details, click Add Plugin to register it.
Step 6: Enable/Disable Plugins ​
Toggle plugins on or off to control what appears in the public marketplace. Only enabled plugins are visible to engineers.
Engineer Guide: Installing Plugins ​
Step 1: Add the LiteLLM Marketplace ​
Add your company's LiteLLM marketplace to Claude Code:
claude plugin marketplace add http://your-litellm-proxy:4000/claude-code/marketplace.json
Step 2: Browse Available Plugins ​
List all available plugins from the marketplace:
claude plugin search @litellm
Step 3: Install a Plugin ​
Install any plugin from the marketplace:
claude plugin install my-plugin@litellm
Step 4: Verify Installation ​
The plugin is now installed and ready to use:
API Reference ​
Public Endpoint (No Auth Required) ​
GET /claude-code/marketplace.json ​
Returns the marketplace catalog for Claude Code discovery.
curl http://localhost:4000/claude-code/marketplace.json
Response:
{
"name" : "litellm" ,
"owner" : {
"name" : "LiteLLM" ,
"email" : "support@litellm.ai"
} ,
"plugins" : [
"name" : "my-plugin" ,
"source" : {
"source" : "github" ,
"repo" : "org/my-plugin"
"version" : "1.0.0" ,
"description" : "My awesome plugin" ,
"category" : "productivity" ,
"keywords" : [ "automation" , "tools" ]
}
]
Admin Endpoints (Auth Required) ​
POST /claude-code/plugins ​
Register a new plugin.
curl -X POST http://localhost:4000/claude-code/plugins \
-H "Authorization: Bearer sk-..." \
-H "Content-Type: application/json" \
-d '{
"name": "my-plugin",
"source": {"source": "github", "repo": "org/my-plugin"},
"version": "1.0.0",
"description": "My awesome plugin",
"category": "productivity",
"keywords": ["automation", "tools"]
}'
GET /claude-code/plugins ​
List all registered plugins.
curl http://localhost:4000/claude-code/plugins \
-H "Authorization: Bearer sk-..."
POST /claude-code/plugins/{name}/enable ​
Enable a plugin.
curl -X POST http://localhost:4000/claude-code/plugins/my-plugin/enable \
POST /claude-code/plugins/{name}/disable ​
Disable a plugin.
curl -X POST http://localhost:4000/claude-code/plugins/my-plugin/disable \
DELETE /claude-code/plugins/{name} ​
Delete a plugin.
curl -X DELETE http://localhost:4000/claude-code/plugins/my-plugin \
Plugin Source Formats ​
GitHub
Git URL
Git Subdir
"repo" : "organization/repository"
"source" : "url" ,
"url" : "https://github.com/org/repo.git"
Use this format for GitLab, Bitbucket, or self-hosted git repositories.
"source" : "git-subdir" ,
"url" : "https://github.com/org/repo.git" ,
"path" : "plugins/my-plugin"
Use this format when your plugin lives in a subdirectory of a git repository. The path field must be a relative path of slash-separated segments (alphanumeric, dots, hyphens, underscores only).
Example: Setting Up an Internal Plugin Marketplace ​
1. Create Internal Plugins ​
Structure your plugin repository:
my-company-plugin/
├── plugin.json # Plugin manifest
├── SKILL.md # Main skill file
├── skills/ # Additional skills
│ └── helper.md
└── README.md
2. Register Plugins via API ​
# Register your internal tools plugin
-H "Authorization: Bearer $LITELLM_MASTER_KEY" \
"name": "internal-tools",
"source": {"source": "github", "repo": "mycompany/internal-tools"},
"description": "Internal development tools and utilities",
"author": {"name": "Platform Team", "email": "platform@mycompany.com"},
"category": "internal",
"keywords": ["internal", "tools", "utilities"]
3. Use in Claude Code ​
Send engineers the marketplace URL:
# One-time setup for each engineer
claude plugin marketplace add http://litellm.internal.company.com/claude-code/marketplace.json
# Install company plugins
claude plugin install internal-tools@litellm
Troubleshooting ​
Plugin not appearing in marketplace:
Verify the plugin is enabled in the admin UI
Check that the plugin has a valid source field
Installation fails:
Ensure the git repository is accessible from the engineer's machine
For private repos, engineers need appropriate git credentials configured
Database errors:
Verify LiteLLM proxy is connected to the database
Check proxy logs for detailed error messages
Prerequisites
Admin Guide: Managing the Marketplace
Step 1: Navigate to Claude Code Plugins
Step 2: View the Plugins List
Step 3: Add a New Plugin
Step 4: Fill in Plugin Details
Step 5: Submit the Plugin
Step 6: Enable/Disable Plugins
Engineer Guide: Installing Plugins
Step 1: Add the LiteLLM Marketplace
Step 2: Browse Available Plugins
Step 3: Install a Plugin
Step 4: Verify Installation
API Reference
Public Endpoint (No Auth Required)
Admin Endpoints (Auth Required)
Plugin Source Formats
Example: Setting Up an Internal Plugin Marketplace
1. Create Internal Plugins
2. Register Plugins via API
3. Use in Claude Code
Troubleshooting
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
