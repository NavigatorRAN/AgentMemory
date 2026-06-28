---
source_url: "https://www.home-assistant.io/integrations/tod"
final_url: "https://www.home-assistant.io/integrations/tod"
canonical_url: "https://www.home-assistant.io/integrations/tod/"
source_handle: "web:www-home-assistant-io:6e484aaf7cb2"
source_section: "integrations-tod"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9f99c121170628c3f8acf676cf3c7c7a2fb8ecc06ed9a3564355d0605847af0c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Times of the Day - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tod
- Final URL: https://www.home-assistant.io/integrations/tod
- Canonical URL: https://www.home-assistant.io/integrations/tod/
- Fetched at: 2026-06-28T03:22:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Times of the Day binary sensors within Home Assistant.

## Extracted Text

On this page
Configuration
YAML configuration
Considerations
Daylight Saving Time Handling
Case 1: Sensor Interval Does Not Exist
Case 2: Sensor End Time Does Not Exist
Case 3: Sensor Start Time Does Not Exist
The Times of the Day integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a binary sensor that gets its values by checking if the current time is within defined time ranges.
To add the Times of the Day helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select Times of the Day .
Follow the instructions on screen to complete the setup.
Name
The name the binary sensor should have. This can be changed later.
On time
The time when the sensor should turn on.
Off time
The time when the sensor should turn off.
Alternatively, this integration can be configured and set up manually via YAML. This has some additional functionality over the UI setup.
The time ranges can be provided as an absolute local time or by using the sunrise or sunset keyword, calculated based on the sun position for the location.
In addition, for sun position-based ranges, a negative or positive offset can be configured.
To enable the Times of Day binary sensor in your installation, add the
following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry binary_sensor : - platform : tod name : Early Morning after : sunrise after_offset : " -02:00" before : " 07:00" unique_id : early_morning_sensor - platform : tod name : Late Morning after : " 10:00" before : " 12:00" unique_id : late_morning_sensor
Configuration Variables
Looking for your configuration file?
name string Required
Name of the sensor.
before string | time Required
The absolute local time value or sun event for ending of the time range.
before_offset time ( Optional )
The time offset of the ending time range.
after string | time Required
The absolute local time value or sun event for beginning of the time range.
after_offset time ( Optional )
The time offset of the beginning time range.
unique_id string ( Optional )
An ID that uniquely identifies this sensor. This allows changing the name, icon, and entity_id from the web interface.
The primary purpose of this sensor is to use a simple time range definition instead of creating a complex template with references to sun.sun integration attributes.
The sensor state is ON when this condition after + after_offset <= current time < before + before_offset .
If after time is later than before then the next day is considered, that is:
binary_sensor : - platform : tod name : Night after : sunset before : sunrise
In the above example, the next day sunrise is calculated as a time range end.
The ToD sensor handles the following cases where the sensor interval:
does not exist at all
stops at a non-existent time
starts at a non-existent time.
To help understand all 3 cases, actual examples are provided below.
Let’s make the following assumptions:
Daylight Saving starts at 2am
On the DST day, the ToD sensor interval is from non-existent 2:30am to non-existent 2:40am.
In this case, the ToD sensor will not trigger since the 2:30am-2:40am interval does not exist on the day when time jumps from 2am to 3am. However, on the following day, the sensor resumed operating normally.
On the DST day, the ToD sensor interval is from 1:50am to non-existent 2:10am.
In this case, the ToD sensor will last 10 minutes starting at 1:50am and stop at 3am (the 2am-3am time is jumped over and does not exist).
On the DST day, the ToD sensor interval is from non-existent 2:50am to 3:10am.
In this case, the ToD sensor will last 10 minutes, starting at 3:00am and stopping at 3:10am (the 2am-3am time is jumped over and does not exist).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Times of the Day helper was introduced in Home Assistant 0.89, and it's used by
2.2% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Binary sensor
Helper
Back to top
