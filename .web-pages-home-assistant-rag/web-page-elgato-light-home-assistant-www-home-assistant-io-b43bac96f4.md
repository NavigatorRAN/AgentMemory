# Elgato Light - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/elgato
- Final URL: https://www.home-assistant.io/integrations/elgato
- Canonical URL: https://www.home-assistant.io/integrations/elgato/
- Fetched at: 2026-06-28T02:39:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate an Elgato Light with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Lights
Buttons
Sensors
Switches
List of actions
Examples
Turn on lights when streaming software starts
Low battery notification for Key Light Mini
Data updates
Known limitations
Troubleshooting
Cannot connect during setup
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Elgato Light integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Elgato LED lighting devices locally over your network. Elgato Lights are designed for streamers, content creators, and home studio setups, and are commonly used on platforms like YouTube and Twitch.
Use cases for this integration include:
Turning your studio lights on and off automatically when your streaming software starts or stops.
Adjusting brightness and color temperature based on the time of day.
Using a light as a visual notification, for example, to flash when a doorbell is pressed or a timer finishes.
Monitoring the battery level of portable Key Light Mini devices.
The following Elgato lighting devices are known to be supported:
Elgato Key Light
Elgato Key Light Air
Elgato Key Light Mini
Elgato Ring Light
Elgato Light Strip
Your Elgato Light must be powered on and connected to your local network. In most cases, the integration automatically discovers the device on your network.
To add the Elgato Light device to your Home Assistant instance, use this My button:
Elgato Light can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Elgato Light .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your Elgato Light device. This is only shown when adding the device manually. Devices discovered automatically through zeroconf are added without any input required.
The integration creates a light entity for each Elgato Light device. You can control:
On/off state
Brightness
Color temperature
Color (for devices that support color, such as the Light Strip, detected automatically)
Identify
Description : Briefly flashes the Elgato Light so you can identify which device it is. Also usable as a visual notification.
Entity category : Configuration
Restart
Description : Restarts the Elgato Light device.
Battery
Description : The current battery level of your Elgato Key Light Mini, as a percentage. Only available on Key Light Mini.
Studio mode
Description : Toggles studio mode on the Key Light Mini. When studio mode is enabled, the device bypasses the battery and runs directly from the power adapter. Only available on Key Light Mini.
The Elgato Light integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Identify a light ( elgato.identify )
Briefly blinks an Elgato Light to identify it or as a visual notification.
For an overview of every action across all integrations, see the actions reference .
Automatically turn on your Elgato Key Light when OBS (or any other streaming software) starts streaming, using an entity exposed by an OBS integration:
alias : " Turn on key light when streaming" triggers : - trigger : state entity_id : binary_sensor.obs_streaming to : " on" actions : - action : light.turn_on target : entity_id : light.elgato_key_light data : brightness_pct : 80 color_temp_kelvin : 5600
Send a mobile notification when the Key Light Mini battery drops below 20%:
alias : " Key Light Mini low battery" triggers : - trigger : numeric_state entity_id : sensor.elgato_key_light_mini_battery below : 20 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Key Light Mini" message : " Battery is below 20%."
The integration polls the Elgato Light device every 10 seconds over the local network for its current state.
The integration communicates with the Elgato Light device over the local network. If the device is not reachable, its entities become unavailable.
Color control is only available on devices that support it, such as the Light Strip. Color temperature and brightness are available on all supported models.
The battery level sensor and studio mode switch are only available on the Key Light Mini, as other models do not have a built-in battery.
If you see a “Cannot connect” error during setup, verify that:
The Elgato Light device is powered on and connected to your network.
The hostname or IP address you entered in Host is correct.
Home Assistant can reach the device on the local network.
Most Elgato Lights are discovered automatically via zeroconf, so manual setup is rarely needed. If the device is not discovered, check that zeroconf/mDNS traffic is not blocked on your network.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Debug logs and diagnostics
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Elgato Light device was introduced in Home Assistant 0.104, and it's used by
3633 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Light
Back to top
