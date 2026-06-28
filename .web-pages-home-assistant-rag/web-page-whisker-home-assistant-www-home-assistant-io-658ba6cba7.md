---
source_url: "https://www.home-assistant.io/integrations/litterrobot"
final_url: "https://www.home-assistant.io/integrations/litterrobot"
canonical_url: "https://www.home-assistant.io/integrations/litterrobot/"
source_handle: "web:www-home-assistant-io:658ba6cba7fa"
source_section: "integrations-litterrobot"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "50cdb7d3c3e0abc41cb254c0c698479312c80a1a5416d7439acdd504f4fbb58f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Whisker - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/litterrobot
- Final URL: https://www.home-assistant.io/integrations/litterrobot
- Canonical URL: https://www.home-assistant.io/integrations/litterrobot/
- Fetched at: 2026-06-28T02:57:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Whisker's lineup of Wi-Fi-enabled, automatic, self-cleaning litter boxes and pet feeders to Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Entities
Litter-Robot
Feeder-Robot
Pet
List of actions
Data updates
Examples
Clean area(s) when a Litter-Robot cycles
Known limitations
Troubleshooting
Device becomes unavailable or unresponsive
Removing the integration
To remove an integration instance from Home Assistant
The Whisker integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor and control your Wi-Fi-enabled, automatic, self-cleaning litter box and pet feeders. If you have pet profiles set up, you can also track your pet’s weight.
Any Wi-Fi connected Whisker device that can be onboarded via the Whisker app should work with this integration.
Before using this integration, you’ll need a Whisker account and a Wi-Fi-enabled Litter-Robot or Feeder-Robot linked to it. You can do this via the Whisker app.
To add the Whisker hub to your Home Assistant instance, use this My button:
Whisker can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Whisker .
Follow the instructions on screen to complete the setup.
Username
The email address of your Whisker account.
Password
The password of your Whisker account.
Entity Domain Description Litter box vacuum Main entity that represents a Litter-Robot unit. Night light mode switch When turned on, automatically turns on the night light in darker settings, only for Litter-Robot 3. Panel lockout switch When turned on, disables the buttons on the unit to prevent changes to settings. Last seen sensor Displays the time the unit was last seen / reported an update. Litter level sensor Displays the litter level, only for Litter-Robot 4. Pet weight sensor Displays the last measured pet weight, only for Litter-Robot 4. Sleep mode start time sensor When sleep mode is enabled, displays the current or next sleep mode start time. Sleep mode end time sensor When sleep mode is enabled, displays the current or last sleep mode end time. Status code sensor Displays the status code (such as Clean Cycle in Progress, Ready, or Drawer Full). Total cycles sensor Displays the total cycles. Waste drawer sensor Displays the current waste drawer level. Power status binary_sensor Indicates whether power is currently connected. Sleep mode binary_sensor Indicates whether sleep mode is enabled. Sleeping binary_sensor Indicates whether sleep mode is currently active. Clean cycle wait time minutes select View and select the clean cycle wait time. Globe brightness select View and select the brightness level for the globe light, only for Litter-Robot 4. Globe light select View and select the globe light setting, only for Litter-Robot 4. Panel brightness select View and select the panel brightness, only for Litter-Robot 4. Reset button Button to reset the robot, clearing any errors and potentially triggering a cycle, only for Litter-Robot 4. Reset waste drawer button Button to reset the waste drawer level to 0%, only for Litter-Robot 3. Firmware update View and update to the latest firmware, only for Litter-Robot 4.
Entity Domain Description Give snack button Button to dispense a single snack portion. Meal insert size select View and select the meal insert size. Food dispensed today sensor Displays the amount of food, in cups, by the feeder. Food level sensor Displays the approximate food level remaining in the hopper. Last feeding sensor Displays the timestamp of the last dispensed meal or snack. Next feeding sensor Displays the timestamp of the next scheduled meal. Gravity mode switch When turned on, the unit will keep the bowl full by checking the food level every 6 hours. Night light mode switch When turned on, automatically turns on the night light in darker settings. Panel lockout switch When turned on, disables the buttons on the unit to prevent changes to settings.
Entity Domain Description Visits today sensor Pet’s daily visits to the Litter-Robot. Weight sensor Pet’s weight.
The Whisker integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set sleep mode ( litterrobot.set_sleep_mode )
Sets the sleep mode and start time on a Litter-Robot.
For an overview of every action across all integrations, see the actions reference .
This integration subscribes to updates from Feeder-Robot and Litter-Robot devices to receive new data as soon as it is available.
Additionally, this integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] for updated device and pet data every 5 minutes.
The following features are not currently supported by the integration:
Access to cameras on Litter-Robot 5 Pro models.
Configuring sleep schedules on Litter-Robot 4 and newer models.
Certain device settings, including renaming devices, filter replacement resets, and cycle count resets.
Reassigning pet visits.
The device shows as unavailable when it cannot reach the Whisker cloud service. Check your internet connection first, then open the Whisker app and see if you can still control the device from there. If the app also cannot connect, the Whisker service may be down or your device may be offline.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Whisker hub was introduced in Home Assistant 2021.3, and it's used by
4241 active installations.
Its IoT class is Cloud Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@natekspencer
@tkdrob
Categories
Button
Select
Sensor
Switch
Update
Vacuum
Back to top
