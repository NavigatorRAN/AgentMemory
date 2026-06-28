---
source_url: "https://www.home-assistant.io/integrations/saunum"
final_url: "https://www.home-assistant.io/integrations/saunum"
canonical_url: "https://www.home-assistant.io/integrations/saunum/"
source_handle: "web:www-home-assistant-io:5c73351c8004"
source_section: "integrations-saunum"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6add547a257bfc69a4ce4054280a94d50505170f33175972931d03605ebf6763"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Saunum - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/saunum
- Final URL: https://www.home-assistant.io/integrations/saunum
- Canonical URL: https://www.home-assistant.io/integrations/saunum/
- Fetched at: 2026-06-28T03:13:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Saunum sauna control units into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Using the sauna
Starting a sauna session
Sauna type preset modes
Fan mode settings
Supported functionality
Climate
Lights
Numbers
Sensors
Binary sensors
List of actions
Automations
Sauna ready notification with light
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Saunum integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates your Saunum Leil sauna control unit with Home Assistant. Saunum is an Estonian company that creates advanced sauna heaters and control systems with smart features.
With the Leil control unit, you can precisely control temperature, customize your sauna experience, and monitor your sauna’s operation.
The following devices are known to be supported by the integration:
Saunum Leil touch screen control panel
Before setting up the integration, you need to:
Have a Saunum Leil sauna control unit installed and connected to your network.
Know the IP address of your control unit. You can find this on the Leil touch panel:
Navigate to Settings > Modbus Settings
Note the IP address displayed
To add the Saunum device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Saunum .
Follow the instructions on screen to complete the setup.
Host
The IP address of your Saunum Leil control unit. You can find it in the Leil touch panel under Settings > Modbus Settings .
Changing temperature unit
The temperature unit displayed in Home Assistant is controlled by your Home Assistant system settings, not by the integration or the Leil touch panel settings.
To change between Celsius and Fahrenheit:
Go to Settings > System > General .
Under Unit system , select either:
Metric for Celsius (°C)
Imperial for Fahrenheit (°F)
The temperature entities will automatically update to display in your chosen unit.
The Saunum Leil control unit natively operates in Celsius, even if Fahrenheit is selected in the Leil touch panel display settings. Home Assistant automatically converts and displays temperatures in Fahrenheit when the Imperial unit system is selected. Temperature ranges are:
Celsius: 40-100°C
Fahrenheit: 104-212°F
Turn on the session by setting the Sauna climate entity to heat mode.
Adjust the target temperature using climate entity temperature dial (40-100°C / 104-212°F).
Adjust the fan mode (optional) to control the sauna air circulation fan speed.
Once started, the sauna begins heating to the target temperature and automatically turns off after the configured duration. During an active session, you cannot change the sauna type, sauna duration, or fan duration settings.
Note
You cannot start a sauna session when the sauna door is open. The control unit will prevent heating from starting as a safety measure. Close the sauna door before attempting to start a heating session. You can monitor the door status using the Door open binary sensor.
The Saunum Leil control unit supports three sauna type presets that can store different configurations for temperature, sauna duration, and fan duration. These presets allow you start your sauna session with different settings quickly.
You can select the active preset using the climate entity’s preset mode control. The preset determines the default values for temperature, duration, and fan settings when starting a sauna session.
The preset mode (sauna type) can only be changed when the sauna session is not active.
Customizing preset names
Preset names can be configured on the Saunum Leil control unit itself. You can also customize the preset names in Home Assistant to match the names configured on your device:
Go to the Saunum integration in Settings > Devices & services .
Select Configure for your Saunum Leil device.
Enter custom names for each of the three sauna type presets to match those configured on your Leil touch panel (for example, Finnish Sauna , Quick Session , Deep Heat ).
Select Submit to save your changes.
The custom preset names will immediately appear in the climate entity’s preset mode selector, making it easier to identify and select your preferred sauna configuration.
The sauna heater has a built-in ventilation fan that helps circulate air and maintain even temperature distribution. You can adjust the fan speed during an active sauna session using the climate entity’s fan mode control:
Off (0): Fan is turned off
Low (1): Low fan speed
Medium (2): Medium fan speed
High (3): High fan speed
The fan mode can only be changed when a sauna session is active (heating mode is on). When the sauna is off, the fan mode setting is not available.
Warning
Fire and burn hazards : Flammable materials such as towels, clothes, or cleaning supplies left on or near the sauna heater can ignite and cause fire, leading to property damage, serious injury, or death. Hot sauna surfaces can cause severe burns.
Never leave a heating sauna unattended for extended periods. Always ensure proper ventilation and never place flammable materials near or on the sauna heater. Keep the sauna area clear of combustible items before starting a heating session.
Remote control safety guidelines
When controlling your sauna remotely through Home Assistant:
Always verify the sauna is empty before starting a remote heating session.
Ensure no flammable materials have been left in or near the sauna.
Set appropriate session durations to prevent prolonged unattended operation.
Monitor alarm sensors regularly for any safety issues.
Sauna surfaces, especially near the heater, can cause severe burns. Use caution when the sauna is hot.
The Saunum integration provides the following entities.
Sauna
Description : Main climate control for your sauna, allowing you to set target temperature and control heating.
Features : Temperature control, HVAC modes (off, heat), fan mode (off, low, medium, high), preset mode (sauna type selection).
Sauna light
Description : Control the sauna lighting if light is connected to the control unit.
Features : Turn the sauna light on or off.
Sauna duration
Description : Configure how long the sauna session will run before automatically turning off.
Unit : Minutes
Range : 1-720 minutes (0-12 hours)
Default : 120 minutes (2 hours) when not set
Remarks : Cannot be changed during an active sauna session.
Fan duration
Description : Configure how long the sauna air circulation fan runs before automatically turning off.
Range : 1-30 minutes
Default : 15 minutes when not set
Temperature
Description : Current temperature inside the sauna.
Unit : °C (Celsius) or °F (Fahrenheit) depending on your Home Assistant unit system.
Heater elements active
Description : Number of active heating elements (0-3).
Use case : Monitor heating intensity and power consumption.
On time
Description : Total accumulated operating time of the Leil touch screen control panel since last restart.
Unit : Seconds
Remarks : This sensor is disabled by default. Enable it in the entity settings if you want to track usage statistics.
Door open
Description : Indicates whether the sauna door is currently open.
Device class : Door
Use case : Monitor sauna door status for safety and automation purposes.
Door open during heating alarm
Description : Safety alarm triggered when the sauna door is opened while the heater is actively running.
Device class : Problem
Category : Diagnostic
Use case : Important safety alert to prevent overheating and ensure safe operation.
Door open too long alarm
Description : Alarm triggered when the sauna door has been left open for an extended period.
Use case : Alerts you to potential energy waste or forgotten open door.
Thermal cutoff alarm
Description : Critical safety alarm triggered when the thermal safety cutoff has activated due to excessive heat.
Use case : Immediate attention required - indicates a serious overheating condition.
Internal temperature alarm
Description : Alarm triggered when the internal electronics temperature is too high.
Use case : Indicates potential ventilation or cooling issues with the control unit.
Temperature sensor shorted alarm
Description : Diagnostic alarm indicating the temperature sensor has a short circuit.
Use case : Sensor malfunction requiring technical service.
Temperature sensor disconnected alarm
Description : Diagnostic alarm indicating the temperature sensor is disconnected or has an open circuit.
Use case : Sensor connection issue requiring technical service.
Important
Monitor the alarm binary sensors regularly. Any active alarm sensor indicates a potential safety or operational issue that should be addressed immediately. The sauna heater will automatically shut down when safety alarms are triggered.
The Saunum integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Start session ( saunum.start_session )
Starts a sauna session with a custom duration, target temperature, and fan duration.
For an overview of every action across all integrations, see the actions reference .
Examples of automations you can create using the Saunum integration.
Send a notification and turn on the sauna light when the target temperature is reached.
Example YAML configuration
alias : " Sauna ready notification with light" description : >- Sends a notification and turns on the sauna light when the target temperature is reached. mode : restart variables : sauna_climate : climate.saunum_leil notification_title : " Sauna is Ready!" notification_message : " Your sauna has reached {target_temperature}°C. Enjoy!" triggers : - trigger : state entity_id : climate.saunum_leil to : " heat" from : " off" id : session_start actions : - wait_template : >- {% set current = state_attr(sauna_climate, 'current_temperature') | float(0) %} {% set target = state_attr(sauna_climate, 'temperature') | float(0) %} {{ current >= target }} continue_on_timeout : false - action : light.turn_on target : entity_id : light.saunum_leil - action : notify.send_message target : entity_id : notify.my_device data : title : " {{ notification_title }}" message : >- {% set target_temperature = state_attr(sauna_climate, 'temperature') | int %} {{ notification_message.replace('{target_temperature}', target_temperature | string) }}
The Saunum integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the control unit every 1 minute by default.
The integration communicates with the control unit using the Modbus TCP protocol. Ensure your network allows communication on port 502.
When the sauna session is active, the sauna duration, fan duration, and sauna type cannot be changed.
The integration does not provide the ability to reboot, which can instead be done via the Leil touch screen control panel.
Cannot connect to the device
Symptom: “Failed to connect to the device”
When trying to set up the integration, you receive an error message that the connection failed.
This typically means the control unit is not reachable on your network, or the Modbus TCP settings are incorrect.
To resolve this issue, try the following steps:
Verify the control unit is powered on and connected to your network.
Check the IP address on the Leil touch panel:
Go to Settings > Modbus Settings .
Verify the IP address matches what you entered.
Ensure your Home Assistant instance can reach the control unit:
Try pinging the IP address from your Home Assistant host system.
Check for firewalls or network segmentation blocking communication.
Verify the port 502 is accessible:
Check your router and firewall settings.
Ensure no other device or software is already communicating with the control unit on the same Modbus connection.
Entities show as unavailable
Symptom: All entities show as “unavailable”
After successful setup, the entities appear but show unavailable status.
This indicates the integration successfully connected initially but is now unable to communicate with the control unit.
Check that the control unit is still powered on.
Verify network connectivity between Home Assistant and the control unit.
Check if the IP address of the control unit has changed (DHCP):
Consider setting a static IP address for the control unit in your router.
If the IP address changed, remove and re-add the integration with the new address.
Restart the Saunum Leil control unit if communication issues persist.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Saunum
Saunum Leil product page
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Saunum device was introduced in Home Assistant 2025.12, and it's used by
12 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mettolen
Categories
Back to top
