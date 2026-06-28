---
source_url: "https://www.home-assistant.io/integrations/time_date"
final_url: "https://www.home-assistant.io/integrations/time_date"
canonical_url: "https://www.home-assistant.io/integrations/time_date/"
source_handle: "web:www-home-assistant-io:ce09218f30df"
source_section: "integrations-time-date"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bdf638f5aac02693b1ec5eadcdec3847485ba8ec5eb91b752edb5e2da5950e93"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Time & Date - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/time_date
- Final URL: https://www.home-assistant.io/integrations/time_date
- Canonical URL: https://www.home-assistant.io/integrations/time_date/
- Fetched at: 2026-06-28T03:22:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to create time and the date sensors within Home Assistant.

## Extracted Text

On this page
Configuration
Data updates
Creating a custom time and date sensor
More time-related resources
The Time & Date integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides sensors for the current date or time in different formats. All values are based on the time zone configured under Settings > System > General .
To add the Time & Date service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Time & Date .
Follow the instructions on screen to complete the setup.
During setup, select the display option for the sensor you want to create. The integration creates one sensor in the selected format.
Display option
The date or time format for the sensor. Available options:
Date : The current date, for example, 2026-04-12 .
Date & Time : The current date and time, for example, 2026-04-12, 14:30 .
Date & Time (ISO) : The current date and time in ISO 8601 format, for example, 2026-04-12T14:30:00 .
Date & Time (UTC) : The current date and time in UTC, for example, 2026-04-12, 12:30 .
Time : The current local time, for example, 14:30 .
Time & Date : The current time and date (reversed order), for example, 14:30, 2026-04-12 .
Time (UTC) : The current time in UTC, for example, 12:30 .
Sensors that include the time update every minute. The date-only sensor updates each day at midnight.
If you want a sensor with a custom date or time format, you can create a template sensor in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. The example below uses the sensor created by the Date & Time (ISO) display option as the source and reformats it with timestamp_custom() using standard Python datetime formatting .
Add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
template : - sensor : - name : " Date and time" state : > {{ as_timestamp(states('sensor.date_time_iso')) | timestamp_custom('%A %B %-d, %I:%M %p') }} icon : " mdi:calendar-clock"
This requires the Date & Time (ISO) display option to be set up in this integration.
For more information about using time related variables and sensors in templates, see the template function reference for today_at , now , and as_timestamp .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Time & Date service was introduced in Home Assistant pre 0.7, and it's used by
8.9% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Calendar
Back to top
