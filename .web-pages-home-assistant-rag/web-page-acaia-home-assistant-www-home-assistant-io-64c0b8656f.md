# Acaia - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/acaia
- Final URL: https://www.home-assistant.io/integrations/acaia
- Canonical URL: https://www.home-assistant.io/integrations/acaia/
- Fetched at: 2026-06-28T02:25:43Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Acaia smart coffee scale with Home Assistant.

## Extracted Text

On this page
Configuration
Available platforms & entities
Binary sensors
Buttons
Sensors
Supported devices
Possible use-cases
Automations
Tare & start timer when brew starts
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
The Acaia integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Acaia scales through Home Assistant.
If your machine is within Bluetooth range to your Home Assistant host and the Bluetooth integration is fully loaded, the scale should be discovered automatically. If you are configuring the device manually, your scale needs to be turned on during setup.
Once the integration is set up, Home Assistant will try to connect to your scale every 15 seconds. This means there is sometimes a small delay between you turning the scale on and Home Assistant connecting to it.
To add the Acaia device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Acaia .
Follow the instructions on screen to complete the setup.
Device
The Bluetooth device that is your scale.
Timer running : Whether the timer is currently running on the scale
Tare : Tares the scale.
Reset timer : Resets the timer. If the timer is running, it will continue to run.
Start/stop timer : Starts or stops the timer, depending on whether the timer is currently running. Does not reset, but continue the timer.
Battery : Current battery level of the scale.
Volume flow rate : Calculates the current flow rate (in mL/s) while brewing.
Weight : The weight currently shown on the scale.
The following devices have been tested successfully with this integration:
Lunar
Pyxis
Pearl
Pearl S
If you have successfully tested this integration with another Acaia model, please let us know by enhancing this documentation, or by opening an issue in GitHub.
This integration can be used in combination with integrations for smart coffee machines, such as the La Marzocco integration integration.
It could also be used to display the weight on secondary displays when brewing on a Pyxis or Lunar where you cannot see the display.
Get started with these automation examples.
Example YAML configuration
alias : " Start timer on scale" description : " When a brew starts on the machine, the following actions are started: tare, reset the timer, and start the timer on the scale." triggers : - trigger : state entity_id : - binary_sensor.lm001234_brewing_active to : " on" from : " off" actions : - action : button.press target : entity_id : button.lunar_tare - action : button.press target : entity_id : - button.lunar_reset_timer - action : button.press target : entity_id : - button.lunar_start_stop_timer
While this integration is configured for your device, you won’t be able to use the official app, as only one connection at a time is supported.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Device not discovered or found
Make sure your scale is turned on and in Bluetooth range to your Home Assistant instance. ESPHome Bluetooth Proxies are a great way to increase the range if your instance is too far away. Turn on debug settings in the acaia integration and check your logs.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Acaia device was introduced in Home Assistant 2024.12, and it's used by
138 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@zweckj
Categories
Binary sensor
Button
Sensor
Back to top
