---
source_url: "https://www.home-assistant.io/integrations/sleepiq"
final_url: "https://www.home-assistant.io/integrations/sleepiq"
canonical_url: "https://www.home-assistant.io/integrations/sleepiq/"
source_handle: "web:www-home-assistant-io:b6a0642e6a2a"
source_section: "integrations-sleepiq"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e0d4e81e3b74c631dc9d2cb50cba41bb6853b1bb49485d91ad59be6ad431c47b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SleepIQ - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sleepiq
- Final URL: https://www.home-assistant.io/integrations/sleepiq
- Canonical URL: https://www.home-assistant.io/integrations/sleepiq/
- Fetched at: 2026-06-28T03:16:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to integrate SleepIQ beds within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported device types
Notes
The SleepIQ integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you integrate your SleepNumber Bed via SleepIQ by SleepNumber .
You will need an account on SleepIQ to use this integration.
To add the SleepIQ hub to your Home Assistant instance, use this My button:
SleepIQ can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SleepIQ .
Follow the instructions on screen to complete the setup.
There is currently support available for the following platforms within Home Assistant, depending on the bed’s capabilities:
Binary sensor - View occupancy of each side
Button - Calibrate the bed
Button - Stop the pump
Light - Control lights on supported models
Number - View/Set the actuator positions of the foundation
Number - View/Set firmness for each side
Select - Choose a foundation preset position
Select/Number - Set a foot warmer mode and timeout
Select/Number - Set core climate heat/cool modes and timeout
Sensor - View pressure of each side
Switch - Toggle Privacy mode
If you are using a DNS-based ad-blocker such as Pi-hole, you may need to disable it temporarily while configuring this item in Home Assistant.
The Sleep Number bed communicates with endpoints on sleepnumber.com as well as the AWS Firehose data collection service at firehose.us-east-1.amazonaws.com .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SleepIQ hub was introduced in Home Assistant 0.29, and it's used by
2008 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mfugate1
@kbickar
Categories
Binary sensor
Button
Health
Light
Number
Select
Sensor
Switch
Back to top
