---
source_url: "https://www.home-assistant.io/integrations/risco"
final_url: "https://www.home-assistant.io/integrations/risco"
canonical_url: "https://www.home-assistant.io/integrations/risco/"
source_handle: "web:www-home-assistant-io:2ba965e05fb9"
source_section: "integrations-risco"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "137850d3fb80fc452d3010f90b0a26881fa53241f2e33c9ffaed7b2c701220b1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Risco - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/risco
- Final URL: https://www.home-assistant.io/integrations/risco
- Canonical URL: https://www.home-assistant.io/integrations/risco/
- Fetched at: 2026-06-28T03:12:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Risco alarms into Home Assistant using Risco Cloud.

## Extracted Text

On this page
Risco cloud (recommended)
Local
Configuration
Options
Supported platforms
List of actions
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects with Risco Alarms, in one of two ways:
The integration will connect with your alarm over Risco Cloud .
This is easiest to configure, and is widely supported, but is cloud based, and requires polling.
Important
As of January 2021, Risco have implemented charges for use of their Cloud Features.
Tip
It is recommended to use a regular (non-owner) account with the Risco app/website, and use a different regular account with the integration. Risco has restrictions on concurrent uses by different users, especially if they have different permission levels.
4 sensors will be created to store events, depending on the category (Status, Alarm, Trouble and Other). Each sensor
has the event timestamp as the state, and other event information in attributes.
If you have multiple sites, only the first site will be used.
The integration will connect locally to your system.
No dependency on the cloud, and instantaneous updates, but is harder to set up.
You will need the panel access code (default 5678) to your system, this access code is NOT the same as the installer/subinstaller code, and with older models,
you might need to either disconnect your system from the cloud, or set up a proxy that will allow you to connect both locally and via the cloud.
The local version of the integration does not support events, and the arming state, but provides an additional binary sensor per zone (with the _alarmed suffix) that signals whether this zone is currently triggering an alarm.
To add the Risco integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Risco .
Follow the instructions on screen to complete the setup.
You can configure additional behavior by clicking on Options in the relevant box in the Integration panel:
Require pin code to arm
When checked, you’ll need to enter your pin code when arming through Home Assistant.
Require pin code to disarm
When checked, you’ll need to enter your pin code when disarming through Home Assistant.
How often to poll Risco Cloud (in seconds)
The lower this is, the faster your entities will reflect changes, but the more resource-intensive it’ll be. Only available when using Cloud.
Maximum concurrent requests in Risco local
Lower values cause the integration to load slower. Higher values could lead to errors. Only available when using Local.
Apart from these options, you can also define a custom mapping between your Home Assistant Alarm states and the Risco arming modes.
This is optional, and unless you’re using group arming, the default mapping is probably best.
This is a two-way mapping, meaning you can map:
What Home Assistant state your partition entity will report when Risco is armed in a specific mode.
Which arming mode to use when arming from Home Assistant using one of its modes. Note that in this step, you can only choose combinations that map to each other in the previous step.
The default mapping:
Risco Arming Mode Home Assistant State Arm (AWAY) Armed Away Partial Arm (STAY) Armed Home Group A Armed Home Group B Armed Home Group C Armed Home Group D Armed Home
And in the reverse direction:
Home Assistant Mode Risco Arming Mode Arm Away Arm Arm Home Partial Arm
Alarm control panel
Binary sensor
Sensor
Switch
The Risco integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set the alarm panel time ( risco.set_time )
Sets the time of a Risco alarm panel.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Risco integration was introduced in Home Assistant 0.115, and it's used by
581 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@OnFreund
Categories
Alarm
Back to top
