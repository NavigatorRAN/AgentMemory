---
source_url: "https://www.home-assistant.io/integrations/smarla"
final_url: "https://www.home-assistant.io/integrations/smarla"
canonical_url: "https://www.home-assistant.io/integrations/smarla/"
source_handle: "web:www-home-assistant-io:c78876f12ead"
source_section: "integrations-smarla"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "211173a976ab0a842ab26848c344f034e31fec5e5185a6f5ddcabc9252272249"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Swing2Sleep Smarla - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/smarla
- Final URL: https://www.home-assistant.io/integrations/smarla
- Canonical URL: https://www.home-assistant.io/integrations/smarla/
- Fetched at: 2026-06-28T03:16:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on connecting Swing2Sleep Smarla to Home Assistant.

## Extracted Text

On this page
Requirements
Registration
Configuration
Provided entities
Removing the integration
To remove an integration instance from Home Assistant
The Swing2Sleep Smarla integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables Home Assistant to integrate Swing2Sleep (Smarla) motorized cradles. This integration will allow you to control your Smarla device.
Swing2Sleep Smarla device with Version 1.6.X or later.
Swing2Sleep app.
Internet connectivity.
Follow the instructions in the Swing2Sleep app.
Connect the device to your Wi-Fi network.
Follow the steps for Configuration until the access token field appears
In the Swing2Sleep app, generate an access token under Settings .
Copy the access token and continue with the Configuration .
To add the Swing2Sleep Smarla device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Swing2Sleep Smarla .
Follow the instructions on screen to complete the setup.
The Swing2Sleep Smarla integration provides one switch entity for each configured Smarla device as its main feature, allowing you to toggle the cradle’s oscillation.
The firmware of each device can be monitored and updated through an update entity available on the device page.
Additionally, the integration sets up the following entities:
Switches
Smart mode : Enables or disables automatic intensity control.
Numbers
Intensity : Sets the intensity level (range: 0 to 100 ).
Sensors
Amplitude : Displays the current measured amplitude of the oscillation.
Period : Displays the current measured period of the oscillation.
Activity : Displays the current measured activity level.
Spring status : Displays the current status of the installed spring set on the cradle.
Swing count : Displays the total number of swings.
Total swing time : Displays the total swing time in seconds.
Buttons
Send diagnostics : Triggers a one-time event to send diagnostic data to the manufacturer.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After deleting the integration, go to the Swing2Sleep app and remove the “Home Assistant” entry under Settings > Connected devices as well.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Swing2Sleep Smarla device was introduced in Home Assistant 2025.6, and it's used by
4 active installations.
Its IoT class is Cloud Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@explicatis
@johannes-exp
Categories
Button
Number
Sensor
Switch
Update
Back to top
