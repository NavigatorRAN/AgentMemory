---
source_url: "https://www.home-assistant.io/docs/troubleshooting_general"
final_url: "https://www.home-assistant.io/docs/troubleshooting_general"
canonical_url: "https://www.home-assistant.io/docs/troubleshooting_general/"
source_handle: "web:www-home-assistant-io:edc808fd6d1e"
source_section: "docs-troubleshooting-general"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2111526fbcbd8db51fec904cd8a1c409a4d3546de8ed5f5928ecbc4f9d9b0988"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# General troubleshooting - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/troubleshooting_general
- Final URL: https://www.home-assistant.io/docs/troubleshooting_general
- Canonical URL: https://www.home-assistant.io/docs/troubleshooting_general/
- Fetched at: 2026-06-28T02:23:33Z
- Content type: text/html; charset=UTF-8

## Description

General troubleshooting information

## Extracted Text

On this page
Home Assistant went into recovery mode
Symptom: Home Assistant is in recovery mode
Description
Resolution
Restarting Home Assistant in safe mode
I don’t see any updates
Related topics
This page provides some information about more generic troubleshooting topics.
On top of the page you see a red banner. On the Overview page, you see a Recovery mode notification.
When Home Assistant is in recovery mode, there was an issue with the configuration.
Recovery mode loads a minimum set of integrations to allow troubleshooting the configuration. Recovery mode will use the parts of the configuration that was used the last time Home Assistant started successfully. You can still see the user interface, the settings, and apps.
You need to identify the issue in the configuration files and fix it there. The issue could be caused by something as simple as an invalid YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] file.
If you are running Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. , you can install an app such as Studio Code Server to edit the configuration file if needed.
If you are still logged in, you can edit your configuration .
In the Home Assistant user interface, open the app you usually use and edit the configuration file.
Restart Home Assistant.
If you are locked out because you forgot your password, you cannot edit the configuration file from the user interface. Follow the steps to reset your password .
If your Home Assistant is acting up and you cannot identify a root cause, you can use Safe mode to narrow down the number of possible causes.
Safe mode loads Home Assistant Core, but no custom integrations, no custom cards, and no custom themes. If the issue does not persist in Safe mode , the issue is not with Home Assistant Core. Before reporting an issue, check if the issue persists in Safe mode .
You can enable Safe mode in several ways:
From the UI:
Go to Settings > System > Restart Home Assistant (top right) > Restart Home Assistant in safe mode .
From the command line :
Run:
ha core restart --safe-mode
By creating a file in the configuration directory:
Create an empty file named safe-mode in your Home Assistant configuration directory. Home Assistant will detect this file on startup and automatically boot into Safe mode.
Typically, updates are shown at the top of the Settings page. If you don’t see them there, the Visibility option might be disabled.
On the System page, in the top-right corner, select the three dots menu and select Check for updates .
Go to System > Updates .
Select the update notification.
Select the cogwheel , then set Visible to active.
Editing your configuration
Recovery mode integration
Resetting your password
Home assistant via command line
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
