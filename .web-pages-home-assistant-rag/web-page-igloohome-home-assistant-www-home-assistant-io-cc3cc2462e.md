---
source_url: "https://www.home-assistant.io/integrations/igloohome"
final_url: "https://www.home-assistant.io/integrations/igloohome"
canonical_url: "https://www.home-assistant.io/integrations/igloohome/"
source_handle: "web:www-home-assistant-io:cc3cc2462e9e"
source_section: "integrations-igloohome"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "87cf1928923f9d775c76d5e3ca74ba72f46997e5b7a9a7cb0380f5b4eeb94949"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# igloohome - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/igloohome
- Final URL: https://www.home-assistant.io/integrations/igloohome
- Canonical URL: https://www.home-assistant.io/integrations/igloohome/
- Fetched at: 2026-06-28T02:51:25Z
- Content type: text/html; charset=UTF-8

## Description

Integrates igloohome smart access devices.

## Extracted Text

On this page
Prerequisites
Setup
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
Battery levels not updating
Authentication problems
Unable to lock/unlock/open lock
The igloohome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] grants Home Assistant access to paired smart access device(s) via the igloodeveloper API . The features of this integration include:
For Bridge owners:
Lock/Unlock/Open locks that are linked to a bridge.
Regular updates of all linked devices’ battery level.
For non-bridge owners:
Regular updates of devices’ last-known battery level.
Battery levels are updated by using the sync function on igloohome mobile app with the device.
You own an igloohome device(s) and have paired them to an account.
Have an active subscription on iglooaccess with the same account.
Once you have registered and activated your iglooaccess account:
Sign in .
Jump to API access .
Create a set of credentials with the name Home Assistant .
Copy out the Client ID & Client Secret .
Keep these credentials secure and never share them with others.
Add this integration to your Home Assistant instance.
Copy the Client ID & Client Secret to the respective text fields when prompted by the integration.
The integration will retrieve the devices under your account and create entries for them in Home Assistant.
To add the igloohome hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select igloohome .
Follow the instructions on screen to complete the setup.
Client ID
Client ID provided by your iglooaccess account.
Client secret
Client Secret provided by your iglooaccess account.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Some generic troubleshooting steps:
Ensure that your subscription is still active.
If you are using a bridge, ensure that it is linked to the correct devices.
If you do not have a bridge. Sync the device with the igloohome mobile app, then reload the config entry associated to the device.
Verify that your API credentials are correctly filled in.
Ensure your API credentials have not expired or been revoked.
Verify that the bridge is:
powered on
has an active internet connection
and is within Bluetooth range of the lock
If you’ve changed the link between the bridge and the lock, reload the config entry.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The igloohome hub was introduced in Home Assistant 2025.2, and it's used by
38 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@keithle888
Categories
Sensor
Back to top
