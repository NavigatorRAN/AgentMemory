---
source_url: "https://www.home-assistant.io/integrations/torque"
final_url: "https://www.home-assistant.io/integrations/torque"
canonical_url: "https://www.home-assistant.io/integrations/torque/"
source_handle: "web:www-home-assistant-io:ca7293d22bbb"
source_section: "integrations-torque"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ffe9078e9826e6d3cd105ee4fec1ebac0a9be01d98247803f3c379eba4328c75"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Torque - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/torque
- Final URL: https://www.home-assistant.io/integrations/torque
- Canonical URL: https://www.home-assistant.io/integrations/torque/
- Fetched at: 2026-06-28T03:23:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Torque sensors into Home Assistant.

## Extracted Text

On this page
Setup
Torque application
Configuration
The Torque integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will allow you to monitor Torque data relayed from a Bluetooth OBD2 stick via the Torque mobile application.
To use Torque sensors with your installation, you must configure both the Torque mobile application and Home Assistant.
In Settings > Data Logging & Upload :
Under the Logging Preferences header:
Touch Select what to log , activate the menu in the upper right, and select Add PID to log .
Select items of interest.
Under the Realtime Web Upload header:
Check Upload to web-server .
Enter https://HOST/api/torque or https://@/HOST:PORT/api/torque as the Web-server URL , where HOST and PORT are your externally accessible Home Assistant HTTP host. To use a Bearer Token, this has to be SSL/TLS .
Enable Send HTTPS: Bearer Token (available since Torque Pro 1.12.46)
Paste a Long-Lived Access Token from any Home Assistant user in Set Bearer Token field.
Enter an email address in User Email Address (this can be any non empty string you like).
Optionally set the Web Logging Interval . The 2-second default may quickly fill up the Home Assistant history database.
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : torque email : [email protected]
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: vehicle )
Vehicle name (your choice).
email string Required
Value from the Email address field configured in Torque application. Doesn’t have to be in email syntax.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Torque integration was introduced in Home Assistant 0.10, and it's used by
479 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Car
Back to top
