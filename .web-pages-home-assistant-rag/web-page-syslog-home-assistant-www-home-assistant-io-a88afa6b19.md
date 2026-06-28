---
source_url: "https://www.home-assistant.io/integrations/syslog"
final_url: "https://www.home-assistant.io/integrations/syslog"
canonical_url: "https://www.home-assistant.io/integrations/syslog/"
source_handle: "web:www-home-assistant-io:a88afa6b19d1"
source_section: "integrations-syslog"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "771642b2095a2381510933628b9ce03a9f0a1e330ccc765e95044587e63cfcce"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Syslog - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/syslog
- Final URL: https://www.home-assistant.io/integrations/syslog
- Canonical URL: https://www.home-assistant.io/integrations/syslog/
- Fetched at: 2026-06-28T03:20:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add syslog notifications to Home Assistant.

## Extracted Text

On this page
Related topics
The Syslog integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to deliver notifications from Home Assistant to the local syslog.
To enable syslog notifications in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : syslog
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
facility string ( Optional , default: syslog )
Facility according to RFC 3164 ( https://tools.ietf.org/html/rfc3164 ). Check the table below for entries.
option string ( Optional , default: pid )
Log option. Check the table below for entries.
priority string ( Optional , default: info )
Priority of the messages. Check the table below for entries.
The table contains values to use in your configuration.yaml file.
facility option priority kernel pid 5 user cons 4 mail ndelay 3 daemon nowait 2 auth perror 1 LPR 0 news -1 uucp -2 cron syslog local0 local1 local2 local3 local4 local5 local6 local7
For details about facility, option, and priority please consult the wikipedia article and RFC 3164 .
To use notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Syslog integration was introduced in Home Assistant pre 0.7, and it's used by
247 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Back to top
