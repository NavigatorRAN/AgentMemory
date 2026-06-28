---
source_url: "https://www.home-assistant.io/integrations/huum"
final_url: "https://www.home-assistant.io/integrations/huum"
canonical_url: "https://www.home-assistant.io/integrations/huum/"
source_handle: "web:www-home-assistant-io:e764c491394f"
source_section: "integrations-huum"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "10ef1ffa2b51572f5b0b72df982d851640c00e1476db45f6156fbabd7973f59b"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Huum - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/huum
- Final URL: https://www.home-assistant.io/integrations/huum
- Canonical URL: https://www.home-assistant.io/integrations/huum/
- Fetched at: 2026-06-28T02:50:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Huum saunas into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Binary sensors
Climate
Lights
Numbers
Sensors
Examples
Sauna ready notification with light
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Huum integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you monitor and control your Huum sauna from Home Assistant. Huum manufactures electric sauna heaters with smart connectivity, allowing you to adjust the temperature and, when your sauna controller supports these features, control the light and manage the steamer humidity level right from your dashboard.
Use case: Preheat your sauna before you get home, and, when your controller includes light or steamer control, automate the light and humidity based on schedules, or monitor the sauna temperature from anywhere.
Before setting up this integration, make sure you have:
A Huum UKU WiFi sauna control system installed and connected to the internet.
A Huum account. You can create one in the Huum app. Your username is usually your email address.
To add the Huum device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Huum .
Follow the instructions on screen to complete the setup.
Username
The username of your Huum account, which is usually your email address.
Password
The password of your Huum account.
The Huum integration provides the following entities.
Door
Description : Indicates whether the sauna door is open or closed.
Sauna heater
Description : Controls the sauna heater. You can adjust the target temperature within the range configured on the sauna controller (defaults to 40–110 °C, with a step of 1 °C).
Modes : Heat, Off
Remarks : The target temperature can only be changed while the sauna is in heat mode.
Light
Description : Turns the sauna light on or off.
Remarks : Only available if the sauna controller is configured with a light or a steamer and light combination.
Humidity
Description : Controls the steamer to adjust the sauna humidity level (0-40%).
Remarks : Only available if the sauna controller is configured with a steamer or a steamer and light combination. The humidity level can only be changed while the sauna is actively heating.
Temperature
Description : Shows the current sauna temperature in degrees Celsius.
Examples of automations you can create using the Huum integration.
Send a notification and turn on the sauna light when the target temperature is reached.
Example YAML configuration
alias : " Sauna ready notification with light" description : >- Sends a notification and turns on the sauna light when the target temperature is reached. mode : restart variables : notification_title : " Sauna is Ready!" notification_message : " Your sauna has reached {target_temperature}°C. Enjoy!" triggers : - trigger : state entity_id : climate.huum_sauna to : heat from : " off" actions : - wait_template : >- {% set current = state_attr('climate.huum_sauna', 'current_temperature') | float(0) %} {% set target = state_attr('climate.huum_sauna', 'temperature') | float(0) %} {{ current >= target }} continue_on_timeout : false - action : light.turn_on target : entity_id : light.huum_sauna_light - action : notify.send_message target : entity_id : notify.my_device data : title : " {{ notification_title }}" message : >- {% set target_temperature = state_attr('climate.huum_sauna', 'temperature') | int %} {{ notification_message.replace('{target_temperature}', target_temperature | string) }}
The Huum integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Huum cloud service every 30 seconds for status updates.
The light and steamer entities are only available when the corresponding hardware is configured on the sauna controller.
The steamer humidity level can only be adjusted while the sauna is actively heating.
The target temperature can only be changed while the sauna is in heat mode.
The integration applies the same safety measures as the Huum app. If a safety condition is triggered (for example, the sauna door is open), the sauna will not turn on.
Connection error during setup
Symptom: Configuration flow shows a connection error
Ensure your Home Assistant instance has an active internet connection.
Double-check that you entered the correct username and password. Try logging in to the Huum app to confirm.
The Huum cloud service may occasionally be unavailable. Wait a few minutes and try again.
Invalid credentials
Symptom: “Invalid authentication” error during setup
Make sure your username (usually your email address) has no extra spaces or typos.
If you’re unsure of your password, reset it through the Huum app, then try setting it up again.
Confirm you can log in to the Huum app with the same credentials.
Sauna not appearing after setup
Symptom: Setup completes but no sauna device appears
Open the Huum app and verify your sauna is shown as connected, not just registered.
Ensure your sauna is linked to the same Huum account you used during setup.
Power cycle the UKU WiFi controller, wait for it to reconnect, then try setting it up again.
Sauna becomes unavailable
Symptom: Entities show as unavailable
Ensure your Home Assistant instance and the UKU WiFi controller both have a stable internet connection.
Open the Huum app and verify the sauna is shown as online. If not, check the controller’s power and Wi‑Fi connection.
Go to Settings > Devices & services , select the Huum integration, then select the three-dot menu and choose Reload .
Cannot adjust temperature or humidity
Symptom: Changing the target temperature or humidity level has no effect
The target temperature and humidity level can only be changed while the sauna is in heat mode. Make sure the sauna is actively heating.
If the door sensor indicates the door is open, the sauna will not turn on. Close the door and try again.
Confirm you can adjust the settings through the Huum app. If the app also shows restrictions, the issue is with the sauna controller.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Huum
Huum UKU WiFi smart sauna control system
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Huum device was introduced in Home Assistant 2024.2, and it's used by
201 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frwickst
@vincentwolsink
Categories
Binary sensor
Number
Sensor
Back to top
