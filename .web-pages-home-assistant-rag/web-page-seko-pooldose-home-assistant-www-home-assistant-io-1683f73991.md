---
source_url: "https://www.home-assistant.io/integrations/pooldose"
final_url: "https://www.home-assistant.io/integrations/pooldose"
canonical_url: "https://www.home-assistant.io/integrations/pooldose/"
source_handle: "web:www-home-assistant-io:1683f7399187"
source_section: "integrations-pooldose"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "64dee04607247101e8421a1d0a7f85ae410c38e26f9d1cd625e4363639901079"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SEKO PoolDose - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pooldose
- Final URL: https://www.home-assistant.io/integrations/pooldose
- Canonical URL: https://www.home-assistant.io/integrations/pooldose/
- Fetched at: 2026-06-28T03:08:43Z
- Content type: text/html; charset=UTF-8

## Description

Connect your SEKO PoolDose water treatment system to Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Data updates
Update and write behavior
Supported devices
Supported functionality
Binary sensors
Sensors
Numbers
Switches
Selects
Examples
Monitor ORP levels and send alerts
Monitor pH levels and send alerts
Pause dosing when pH is extreme
Pool monitoring dashboard
Known limitations
Hardware and connectivity issues
Cached data behavior
Troubleshooting
Device not found
Connection refused
Unstable connection
Missing peristaltic pump status
Diagnostics
The SEKO PoolDose integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects a SEKO water treatment system with Home Assistant. SEKO is a manufacturer of various monitoring and control devices for pools and spas.
This integration uses an undocumented local HTTP API. It provides live readings for pool sensors such as temperature, pH, ORP/Redox, alarm status, relay states, as well as configuration parameters.
Install and set up the PoolDose device according to its user manual.
In particular, connect the device to your Wi-Fi network.
Identify the IP address or hostname of the device.
Browse to the IP address or hostname. Use HTTP and port 80.
Log in to the web interface.
Verify that sensor data is displayed, such as water temperature or pH values shown as gauges.
Deactivate the device password, that is, set it to 0000.
Optional: Block the device’s internet access to guarantee fully local operation and prevent potentially breaking firmware updates.
To add the SEKO PoolDose device to your Home Assistant instance, use this My button:
SEKO PoolDose can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SEKO PoolDose .
Follow the instructions on screen to complete the setup.
Host
The IP address or hostname of your device. Identify this in the web interface of the device or of your router.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
This integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the device every 10 minutes (600 seconds) by default. This polling interval is configured to balance data freshness with device stability:
The device does not support frequent requests and may become unstable with shorter intervals
Physical water treatment values typically change slowly and do not require frequent monitoring
This interval provides adequate monitoring for pool water management while maintaining device reliability
Parallel reads for read-only values are avoided and write operations are serialized (one value at a time). This reduces load on the device’s limited hardware and prevents race conditions.
The following devices are known to be supported by the integration:
SEKO PoolDose Double
SEKO PoolDose Double Spa
SEKO PoolDose pH+ORP CF Group Wi-Fi
SEKO PoolDose pH
VÁGNER POOL VA DOS BASIC
VÁGNER POOL VA DOS EXACT
This integration provides the following entities.
Recirculation pump alarm : Recirculation pump issue.
pH tank level alarm : Low pH dosing solution level.
ORP tank level alarm : Low ORP dosing solution level.
Chlorine tank level alarm : Low chlorine dosing solution level.
Flow rate alarm : Water flow issues.
pH overfeed alarm : Excessive pH dosing detected.
pH overfeed alarm alternative : Alternative pH overfeed alarm.
pH too low : pH level too low.
pH too high : pH level too high.
ORP overfeed alarm : Excessive ORP dosing detected.
ORP overfeed alarm alternative : Alternative ORP overfeed alarm.
Chlorine overfeed alarm : Excessive chlorine dosing detected.
Chlorine overfeed alarm alternative : Alternative chlorine overfeed alarm.
Chlorine too low (ORP) : Chlorine concentration too low based on ORP readings.
Chlorine too high (ORP) : Chlorine concentration too high based on ORP readings.
Chlorine too high : Chlorine concentration too high.
Alarm relay : Main alarm relay state.
Auxiliary relay 1 : Auxiliary relay 1 output state.
Auxiliary relay 2 : Auxiliary relay 2 output state.
Auxiliary relay 3 : Auxiliary relay 3 output state.
Water too cold : Water temperature too cold.
Water too hot : Water temperature too hot.
System standby : System in standby mode.
Circulation pump monitoring : Whether the controller monitors the pool circulation pump while dosing.
Power-on delay : Whether to apply a safety delay after the device powers on before enabling pumps and dosing control.
Flow delay : Whether to apply a delay after water flow is detected before starting dosing, to let circulation stabilize.
Temperature : Water temperature.
Unit : °C, °F
pH : pH value.
ORP : Current ORP (Redox) value.
Unit : mV
Chlorine : Chlorine concentration.
Unit : ppm
Flow rate : Water flow rate.
Unit : L/s, m³/h
pH type dosing : Type of pH dosing being used.
Values : pH+, pH-
Peristaltic pH dosing : pH peristaltic dosing mode.
Values : Off, Proportional, On/Off, Timed
Overfeed alert pH time : Time threshold for pH overfeed alerts.
Unit : min
ORP type dosing : Type of ORP dosing being used.
Values : Low, High
Peristaltic ORP dosing : ORP peristaltic dosing mode.
Chlorine type dosing : Type of chlorine dosing being used.
Peristaltic chlorine dosing : Chlorine peristaltic dosing mode.
Values : Off, Proportional, On/Off, Timed, Cycle
Overfeed alert ORP time : Time threshold for ORP overfeed alerts.
pH calibration type : Type of pH calibration being used.
Values : Off, Reference, 1 point, 2 points
pH calibration offset : pH calibration offset value.
pH calibration slope : pH calibration slope value.
ORP calibration type : Type of ORP calibration being used.
Values : Off, Reference, 1 point
ORP calibration offset : ORP calibration offset value.
ORP calibration slope : ORP calibration slope value.
Totalizer : Total water volume accumulated.
Unit : L, m³
Device configuration : Overall water treatment configuration that defines which measurements and dosing channels are active.
Values : pH+ORP (control pH and ORP only), pH+ORP+Chlorine (control pH, ORP, and an additional chlorine dosing channel)
Temperature unit : Temperature measurement unit.
Values : Celsius, Fahrenheit
pH target : Target pH value for automatic dosing control.
ORP target : Target ORP (Redox) value for automatic dosing control.
Chlorine target : Target chlorine concentration for automatic dosing control.
pH overfeed alarm lower limit : Lower threshold for pH overfeed detection.
pH overfeed alarm upper limit : Upper threshold for pH overfeed detection.
ORP overfeed alarm lower limit : Lower threshold for ORP overfeed detection.
ORP overfeed alarm upper limit : Upper threshold for ORP overfeed detection.
Chlorine overfeed alarm lower limit : Lower threshold for chlorine overfeed detection.
Chlorine overfeed alarm upper limit : Upper threshold for chlorine overfeed detection.
pH dosing off-time : Pause duration between pH dosing cycles.
Unit : s
ORP dosing off-time : Pause duration between ORP dosing cycles.
Chlorine dosing off-time : Pause duration between chlorine dosing cycles.
Power-on delay timer : Delay after power-on before dosing starts.
Flow delay timer : Delay after flow detection before dosing starts.
Pause dosing : Pauses or resumes the dosing process.
Pump monitoring : Enables or disables pump monitoring.
Frequency input : Enables or disables frequency input for a water meter.
Water meter unit : Water meter measurement unit.
Options : Liters, Cubic meters
Flow rate unit : Flow rate measurement unit.
Options : Cubic meters per hour, Liters per second
pH dosing type : pH dosing type.
Options : pH+ / alcalyne, pH- / acid
pH dosing method : pH dosing control method.
Options : Disabled, Proportional control, On/Off control, Timed dosing
ORP dosing type : ORP/Redox dosing type.
Options : Low intensity, High intensity
ORP dosing method : ORP/Redox dosing control method.
Chlorine dosing type : Chlorine dosing type.
Chlorine dosing method : Chlorine dosing control method.
This automation monitors your pool’s ORP level and sends a notification when it goes outside the recommended range.
automation : - alias : " Pool ORP out of range" triggers : - trigger : numeric_state entity_id : sensor.pool_device_orp below : 650 id : " low" - trigger : numeric_state entity_id : sensor.pool_device_orp above : 750 id : " high" actions : - action : notify.notify data : title : " Pool ORP alert" message : " ORP level is {{ trigger.id }}: {{ states('sensor.pool_device_orp') }} mV"
This automation monitors your pool’s pH level and sends a notification when it goes outside the recommended range.
automation : - alias : " Pool pH out of range" triggers : - trigger : numeric_state entity_id : sensor.pool_device_ph below : 6.8 id : " low" - trigger : numeric_state entity_id : sensor.pool_device_ph above : 7.6 id : " high" actions : - action : notify.notify data : title : " Pool pH alert" message : " pH level is {{ trigger.id }}: {{ states('sensor.pool_device_ph') }}"
This automation pauses the dosing system when the pH level reaches dangerously high or low values, preventing excessive chemical dosing.
automation : - alias : " Pause dosing on extreme pH" triggers : - trigger : numeric_state entity_id : sensor.pool_device_ph below : 6.5 id : " too_low" - trigger : numeric_state entity_id : sensor.pool_device_ph above : 8.0 id : " too_high" actions : - action : switch.turn_on target : entity_id : switch.pool_device_pause_dosing - action : notify.notify data : title : " Pool dosing paused" message : " Dosing paused - pH is {{ trigger.id }}: {{ states('sensor.pool_device_ph') }}"
This example combines multiple card types to create a comprehensive pool monitoring view.
type : vertical-stack cards : - type : entities title : Pool status entities : - entity : sensor.pool_device_temperature name : Temperature - entity : sensor.pool_device_ph name : pH level - entity : sensor.pool_device_orp name : ORP level - entity : switch.pool_device_pause_dosing name : Dosing control - type : horizontal-stack cards : - type : gauge entity : sensor.pool_device_ph name : pH min : 6.5 max : 8.0 needle : true segments : - from : 6.5 color : var(--error-color) - from : 6.8 color : var(--warning-color) - from : 7.2 color : var(--success-color) - from : 7.6 color : var(--warning-color) - from : 7.8 color : var(--error-color) - type : gauge entity : sensor.pool_device_orp name : ORP unit : mV min : 600 max : 800 needle : true segments : - from : 600 color : var(--error-color) - from : 650 color : var(--success-color) - from : 750 color : var(--error-color) - type : history-graph title : 24 hour trends hours_to_show : 24 entities : - entity : sensor.pool_device_ph - entity : sensor.pool_device_orp - entity : sensor.pool_device_temperature - type : entities title : Alarms state_color : true entities : - entity : binary_sensor.pool_device_ph_tank_level_alarm name : pH tank level - entity : binary_sensor.pool_device_orp_tank_level_alarm name : ORP tank level - entity : binary_sensor.pool_device_ph_overfeed_alarm name : pH overfeed - entity : binary_sensor.pool_device_orp_overfeed_alarm name : ORP overfeed - entity : binary_sensor.pool_device_flow_rate_alarm name : Flow rate
The device does not support frequent requests and may become unstable with shorter intervals.
Physical water treatment values typically change slowly and do not require frequent monitoring.
This interval provides adequate monitoring for pool water management while maintaining device reliability.
The PoolDose devices have two characteristics that can affect their network connectivity:
Hardware limitations : The devices use a small-scale controller that is heavily loaded by web server and data processing tasks. This can occasionally cause brief connection interruptions, though devices typically recover quickly.
Energy-saving mode : When the pump monitoring feature is activated in the device settings, the device often enters an energy-saving mode if no pump operation is detected. During this time, the device may be less responsive or temporarily unavailable on the network, for example, at night.
These limitations are normal behavior for the device and not issues with the integration itself. To handle these connectivity issues, the integration caches values for a maximum of 300 seconds (5 minutes) when the device is temporarily unresponsive. After this cache period expires, entities will show as “unavailable” until the device provides new data again.
Symptom: “Device could not be found on the network”
When trying to set up the integration, you receive an error that the device cannot be found.
Description
The device may not be properly connected to your network, or it may be using a different IP address or hostname than expected.
Resolution
To resolve this issue, try the following steps:
Check that your device is powered on and connected to your Wi-Fi network.
Look for a device called “kommspot” in your router’s device list or DHCP client table.
Use the IP address shown for “kommspot” in the integration setup.
Ensure the device and Home Assistant are on the same network segment.
Symptom: “Connection refused” or authentication errors
The integration cannot connect to the device even though it’s found on the network.
This typically occurs when the device’s web interface password is not set to the default value (0000) or not properly deactivated.
To resolve this issue:
Browse to the device’s IP address using a web browser.
Set the password to the default value (0000) or deactivate password protection.
Try setting up the integration again.
Symptom: Entities frequently become unavailable
Sensor entities show as “unavailable” intermittently, especially during certain times of day.
This is normal behavior for the PoolDose device. When the circulation pump is not running, the device enters a kind of sleep mode and becomes less responsive to network requests.
This behavior is expected and does not indicate a problem with the integration:
The integration uses cached values when the device is temporarily unresponsive.
Entities will return to normal once the device becomes responsive again.
Consider this behavior when creating automations that depend on these sensors.
Symptom: No peristaltic pump status data is available
Peristaltic pump status sensors don’t show any data or appear as unavailable.
The PoolDose device only propagates the status of peristaltic dosing pumps when the external relays for these pumps are enabled in the device settings.
To get peristaltic pump status data:
Browse to your PoolDose device’s settings.
Find the external relay configuration for the pH and ORP pumps.
Enable the external relays for the pumps you want to monitor.
Save the settings and restart the device if required.
This integration provides diagnostics to help with debugging and troubleshooting. The diagnostics output includes:
The device information reported by the coordinator with sensitive values redacted.
The most recent data fetched from the device by the coordinator.
To collect diagnostics, go to Settings > Devices & services , open the PoolDose integration,
click the three-dot menu on the integration entry and choose Download diagnostics . Attach the downloaded file when reporting issues to help maintainers investigate.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SEKO PoolDose device was introduced in Home Assistant 2025.9, and it's used by
21 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lmaertin
Categories
Binary sensor
Number
Select
Sensor
Switch
Water Management
Back to top
