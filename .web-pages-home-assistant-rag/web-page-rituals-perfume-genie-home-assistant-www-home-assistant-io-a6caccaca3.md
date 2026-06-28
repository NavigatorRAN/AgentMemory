---
source_url: "https://www.home-assistant.io/integrations/rituals_perfume_genie"
final_url: "https://www.home-assistant.io/integrations/rituals_perfume_genie"
canonical_url: "https://www.home-assistant.io/integrations/rituals_perfume_genie/"
source_handle: "web:www-home-assistant-io:a6caccaca319"
source_section: "integrations-rituals-perfume-genie"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3ef5ce252e545a3d0139fafe5bbefd8dd7d7cdc118e577158c23188cec216288"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Rituals Perfume Genie - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rituals_perfume_genie
- Final URL: https://www.home-assistant.io/integrations/rituals_perfume_genie
- Canonical URL: https://www.home-assistant.io/integrations/rituals_perfume_genie/
- Fetched at: 2026-06-28T03:12:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Rituals Perfume Genie diffusers within Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Switch
Number
Select
Binary sensor
Sensors
Examples
Turn the diffuser on at a specific time
Data updates
Known limitations
Troubleshooting
Authentication fails or the diffuser stops updating
A diffuser is missing from Home Assistant
Removing the integration
To remove an integration instance from Home Assistant
The Rituals Perfume Genie integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control and monitor your Rituals perfume diffusers from Home Assistant.
The Perfume Genie is a smart fragrance diffuser. Once it is connected to your home Wi-Fi and linked to your Rituals account, this integration brings it into Home Assistant. You can start and stop the fragrance, set how much is diffused, and keep an eye on the cartridge and battery, all without reaching for the Rituals app.
That opens the door to fragrance that follows your day. Picture the diffuser easing on as you walk through the door in the evening, winding down on its own at bedtime, and a gentle reminder reaching you when the cartridge runs low. Because every control is available to your automations, your home can set the mood on its own.
The following devices are supported by this integration:
Rituals Perfume Genie
Rituals Perfume Genie 2nd generation
Rituals Perfume Genie 3rd generation
Before you set up the integration, make sure you have:
A Rituals account.
Your Perfume Genie set up in the Rituals mobile app and connected to your Wi-Fi network.
The email address and password for your Rituals account.
To add the Rituals Perfume Genie hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Rituals Perfume Genie .
Follow the instructions on screen to complete the setup.
Email
The email address for your Rituals account.
Password
The password for your Rituals account.
Each diffuser on your Rituals account is added to Home Assistant as a device, with the entities described below.
Note
The entities you see depend on your model. The battery and charging entities appear on the battery-powered model only. On mains-powered models, the Room size control is disabled by default. You can turn it on from the entity’s settings if you want to use it.
Diffuser : The main switch for the diffuser. Turn it on to start diffusing fragrance, and off to stop. This switch carries the name of your diffuser.
Perfume amount : Sets how much fragrance is diffused, on a scale from 1 (lightest) to 3 (strongest).
Room size : Tells the diffuser how large the room is, in square meters, so it can pace the fragrance to suit the space. You can choose 15, 30, 60, or 100.
Charging : Shows whether the diffuser’s battery is charging. Available on the battery-powered model only.
Battery : The remaining battery charge, as a percentage. Available on the battery-powered model only.
Fill : How full the current fragrance cartridge is.
Perfume : The name of the fragrance cartridge currently in the diffuser.
Wi-Fi signal : The strength of the diffuser’s Wi-Fi connection, as a percentage.
The following example shows how to use the Rituals Perfume Genie integration in a Home Assistant automation. It is a starting point you can build on for your own ideas.
This automation starts the fragrance every evening at 18:00.
automation : - alias : " Start fragrance in evening" triggers : - trigger : time at : " 18:00:00" actions : - action : switch.turn_on target : entity_id : switch.rituals_perfume_genie_diffuser
Home Assistant polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] your Rituals account for updates every few minutes. With a single diffuser, it polls every 3 minutes. Each additional diffuser on your account lengthens that interval, which keeps Home Assistant within the limits of the Rituals service.
The integration relies on the Rituals cloud service. If your internet connection or the Rituals service is unavailable, Home Assistant cannot read from or control your diffuser.
The battery and charging entities are available on the battery-powered model only.
Symptom: “Reauthentication required” or entities show as unavailable
After a while, Home Assistant can no longer reach your Rituals account, or you are asked to sign in again.
Resolution
Confirm you can sign in to the Rituals mobile app with the same email address and password.
If you recently changed your Rituals password, enter the new password when Home Assistant prompts you to reauthenticate.
Check that the diffuser is powered on and connected to your Wi-Fi network in the Rituals app.
If one of your diffusers does not appear:
Open the Rituals mobile app and confirm the diffuser is registered to your account and online.
Make sure the diffuser is connected to your Wi-Fi network.
Reload the integration from its page under Settings > Devices & services .
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rituals Perfume Genie hub was introduced in Home Assistant 2021.3, and it's used by
508 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@milanmeu
@frenck
@quebulm
Categories
Sensor
Back to top
