---
source_url: "https://www.home-assistant.io/integrations/tuya"
final_url: "https://www.home-assistant.io/integrations/tuya"
canonical_url: "https://www.home-assistant.io/integrations/tuya/"
source_handle: "web:www-home-assistant-io:a50e6c4df21a"
source_section: "integrations-tuya"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e1d9d0c271db8a4534728d236421659c3bc98c696e67bb7ee513b41bb1c4f89c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Tuya - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tuya
- Final URL: https://www.home-assistant.io/integrations/tuya
- Canonical URL: https://www.home-assistant.io/integrations/tuya/
- Fetched at: 2026-06-28T03:24:07Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the Tuya hub within Home Assistant.

## Extracted Text

On this page
Prerequisites
Obtaining User Code for sign-in
Configuration
Scanning the QR code
Scenes
List of actions
Troubleshooting
Unsupported device or missing device functionality
Integration requires re-authenticating after every integration reload
Feeder meal plan not supported
The Tuya integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates all Powered by Tuya devices you have added to the Tuya Smart and Tuya Smart Life apps.
All Home Assistant platforms are supported by the Tuya integration, except the lock and remote platform.
You need to have the Tuya Smart or Smart Life app installed, with an account created and
at least one device added to that account.
During the setup process, you will need:
A second screen (such as a phone, tablet, or another computer) to display the QR code that appears during configuration
The Smart Life or Tuya Smart app installed on your mobile device to scan the QR code
To sign-in, you will need to get your User Code from the Smart Life /
Tuya Smart app. You can find it by opening the app and:
On the tab bar, select Me .
Select the ⚙️ (gear) icon in the top-right corner.
Tap Account and Security .
At the bottom, User Code will be shown; you need to when setting up this integration.
To add the Tuya hub to your Home Assistant instance, use this My button:
Tuya can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tuya .
Follow the instructions on screen to complete the setup.
To scan the QR code in the Smart Life app:
Open the Smart Life app
Tap the + button or Add Device
Select Scan or look for the QR code scanner option
Scan the QR code displayed on your Home Assistant screen
After adding new devices to your Tuya account through the Smart Life or Tuya Smart app, you need to reload the Tuya integration in Home Assistant for the new devices to appear:
Go to Settings > Devices & services
Find the Tuya integration
Click the three dots menu
Select Reload
Tuya supports scenes in their app. These allow triggering some of the more complex modes of various devices such as light changing effects. Scenes created in the Tuya app will automatically appear in the Scenes list in Home Assistant the next time the integration updates.
The Tuya integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get feeder meal plan data ( tuya.get_feeder_meal_plan )
Retrieves the feeding schedule from a Tuya pet feeder.
Set feeder meal plan data ( tuya.set_feeder_meal_plan )
Sets the feeding schedule on a Tuya pet feeder.
For an overview of every action across all integrations, see the actions reference .
This integration relies on the official Python SDK provided by Tuya , which does not expose all functionality available in SmartLife.
The data points provided by the SDK are visible in the Home Assistant device diagnostics JSON file, under the status , status_range and function keys:
Select the device
Under the device information, click the three dots menu
Select Download diagnostics
Open the diagnostic file, and check manually the status , status_range and function keys
If status , status_range and function are all empty, then only scenes declared inside Tuya (if any) will be available inside Home Assistant.
When Tuya updates the terms and conditions of iot.tuya.com, the integration will require repeated authentication.
To fix this:
Log in to iot.tuya.com , and accept the terms and conditions.
Restart Home Assistant.
Reconfigure the Tuya integration.
Symptom: “Feeder not supported” warning
Home Assistant shows a warning that this particular feeder is not supported.
Description
Feeders are dependent on tuya-device-handlers to be integrated based on feeders product_id .
Resolution
Open a issue to tuya-device-handlers with information provided from QueryThingsDataModel API result from iot.tuya.com (under Cloud / API Explorer / Device Control).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tuya hub was introduced in Home Assistant 0.74, and it's used by
29.5% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Tuya
@zlinoliver
Categories
Binary sensor
Camera
Climate
Cover
Doorbell
Event
Fan
Humidifier
Light
Number
Scene
Select
Siren
Switch
Vacuum
Valve
Back to top
