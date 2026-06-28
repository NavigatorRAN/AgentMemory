---
source_url: "https://www.home-assistant.io/integrations/datadog"
final_url: "https://www.home-assistant.io/integrations/datadog"
canonical_url: "https://www.home-assistant.io/integrations/datadog/"
source_handle: "web:www-home-assistant-io:70ce49c20d6a"
source_section: "integrations-datadog"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "41b2ac87c846976146cdd756de7590779bb5ca8af555ecaa08999a410a84a5e2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Datadog - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/datadog
- Final URL: https://www.home-assistant.io/integrations/datadog
- Canonical URL: https://www.home-assistant.io/integrations/datadog/
- Fetched at: 2026-06-28T02:35:56Z
- Content type: text/html; charset=UTF-8

## Description

Send data and events to Datadog.

## Extracted Text

On this page
Setup
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Datadog integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] sends all state changes to Datadog using a Datadog Agent .
Datadog allows you to analyze, monitor, cross-reference, and alert on your data. You can use it to detect statistical anomalies, see graphs across multiple sources in real time, and send critical alerts to Slack.
The integration also sends events from activity tracking into Datadog, allowing you to correlate these events with your data.
You need to have a Datadog agent installed in a network accessible by Home Assistant.
In the Datadog Agent configuration , you must enable DogStatsD non-local traffic to allow StatsD data collection from outside localhost .
To add the Datadog service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Datadog .
Follow the instructions on screen to complete the setup.
host
The IP address or hostname of your Datadog host, for example, 192.168.1.23 .
port
Port to use.
prefix
Metric prefix to use.
rate
The sample rate of UDP packets sent to Datadog.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Datadog service was introduced in Home Assistant 0.45, and it's used by
44 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
History
Back to top
