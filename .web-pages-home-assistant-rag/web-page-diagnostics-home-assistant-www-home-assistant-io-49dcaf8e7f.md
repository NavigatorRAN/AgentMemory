---
source_url: "https://www.home-assistant.io/integrations/diagnostics"
final_url: "https://www.home-assistant.io/integrations/diagnostics"
canonical_url: "https://www.home-assistant.io/integrations/diagnostics/"
source_handle: "web:www-home-assistant-io:49dcaf8e7f3c"
source_section: "integrations-diagnostics"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2d04a93d4ba2165537250ebd6c1b70bf74ae85b5d3152648df6b9938b4fa4545"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Diagnostics - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/diagnostics
- Final URL: https://www.home-assistant.io/integrations/diagnostics
- Canonical URL: https://www.home-assistant.io/integrations/diagnostics/
- Fetched at: 2026-06-28T02:37:11Z
- Content type: text/html; charset=UTF-8

## Description

The diagnostics integration lets you download integration and device diagnostic information for debugging.

## Extracted Text

On this page
Downloading diagnostics
From the integration page
From a device page
Related
Related topics
The Diagnostics integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you download a diagnostics file for a specific integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] or device A device is a model representing a physical or logical unit that contains entities. . Sharing this file when reporting an issue helps developers diagnose and fix the problem faster, because it contains the relevant state, configuration, and context without requiring you to describe every detail by hand.
This integration is always enabled and requires no setup. However, not every integration provides diagnostic data. When no data is available, the download option is not shown.
Important
About sensitive information in the diagnostics file
Before sharing a diagnostics file publicly (for example, in a GitHub issue), open it in any text editor to review its contents. Integrations must redact sensitive information, such as API keys, tokens, and passwords. Redacted values appear in the file as **REDACTED** , but it is always good to verify before sharing.
You can download diagnostics from two places in Home Assistant.
Go to Settings > Devices & services .
Select the integration you want diagnostics for.
Open the three-dot menu and select Download diagnostics .
The downloaded file contains information about the integration as a whole and all of its devices.
Select the integration, then select the device you want diagnostics for.
The downloaded file contains information specific to that device only, which is useful when reporting a device-specific issue.
Screenshot of the Download diagnostics button on a device page.
For more general guidance on gathering troubleshooting information when reporting a problem, see Debug logs and diagnostics .
Debug logs and diagnostics
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Diagnostics system was introduced in Home Assistant 2022.2, and it's used by
3978 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Other
Back to top
