---
source_url: "https://www.home-assistant.io/integrations/probe_plus"
final_url: "https://www.home-assistant.io/integrations/probe_plus"
canonical_url: "https://www.home-assistant.io/integrations/probe_plus/"
source_handle: "web:www-home-assistant-io:b916b2276fdd"
source_section: "integrations-probe-plus"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "940aca8a0536770aea67eb86173e66977d1afe52cfba66f0874cef200ffa24cd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Probe Plus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/probe_plus
- Final URL: https://www.home-assistant.io/integrations/probe_plus
- Canonical URL: https://www.home-assistant.io/integrations/probe_plus/
- Fetched at: 2026-06-28T03:09:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Probe Plus food temperature probes into Home Assistant.

## Extracted Text

On this page
Configuration
Available functionality
Sensors
Supported devices
Possible use-cases
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Probe Plus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to view food temperature probe details supported by Probe Plus through Home Assistant.
If your probe is within Bluetooth range to your Home Assistant host and the Bluetooth integration is fully loaded, the probe should be discovered automatically provided that the model name starts with FM2. If you are configuring the device manually, your probe needs to be turned on during setup.
Once the integration is set up, Home Assistant will try to connect to your probe every 15 seconds. This means there is sometimes a small delay between you removing the probe from its dock and Home Assistant connecting to it.
To add the Probe Plus device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Probe Plus .
Follow the instructions on screen to complete the setup.
Device
The Bluetooth device that is your probe.
Battery : Current battery level of the relay and probe.
Temperature : Current temperature reading from the probe.
Probe signal strength : The signal strength of the probe to its charging dock.
Relay voltage : Voltage of the battery within the charging dock (not supported on all models).
Probe voltage : Voltage of the battery inside the probe.
The following devices have been tested successfully with this integration:
FMC210/FMC213
If you have successfully tested this integration with another probe model, please let us know by enhancing this documentation, or by opening an issue in GitHub.
This integration can be used to monitor food temperatures, you could combine this with your Home Assistant Voice to alert you when the food has finished cooking. As a bonus, multiple probes are supported and therefore if you are cooking a large family meal, you can view all your food temperatures on one dashboard.
While this integration is configured for your device, you won’t be able to use the official app, as only one connection at a time is supported.
This assumes that the probe is configured to read the temperature in Celsius. Make sure you have changed this in the app before setting up in case you are using Fahrenheit. A template helper can be used to convert between units.
Device not discovered or found
Make sure your probe is removed from the charging dock and the dock is within Bluetooth range to your Home Assistant instance. ESPHome Bluetooth Proxies are a great way to increase the range if your instance is too far away. Turn on debug settings in the Probe Plus integration and check your logs.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Probe Plus device was introduced in Home Assistant 2025.6, and it's used by
38 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pantherale0
Categories
Sensor
Back to top
