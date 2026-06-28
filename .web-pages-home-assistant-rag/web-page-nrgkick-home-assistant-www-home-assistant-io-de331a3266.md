---
source_url: "https://www.home-assistant.io/integrations/nrgkick"
final_url: "https://www.home-assistant.io/integrations/nrgkick"
canonical_url: "https://www.home-assistant.io/integrations/nrgkick/"
source_handle: "web:www-home-assistant-io:de331a326692"
source_section: "integrations-nrgkick"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "938b5f2bd978adf0fc03f63aaaf259066cc8255d68aee35f9d3f7f659c515ddf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# NRGkick - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nrgkick
- Final URL: https://www.home-assistant.io/integrations/nrgkick
- Canonical URL: https://www.home-assistant.io/integrations/nrgkick/
- Fetched at: 2026-06-28T03:04:09Z
- Content type: text/html; charset=UTF-8

## Description

Integrate the NRGkick Gen2 mobile EV charger using the local REST JSON API.

## Extracted Text

On this page
Use cases
Supported devices
Unsupported devices
Prerequisites
Configuration
Configuration options
Supported functionality
Binary sensors
Sensors
Device tracker
Controls
Key entities
Data updates
Known limitations
Troubleshooting
Can’t connect to the device
Entities show unavailable
Some phase sensors are missing or show as unknown
Removing the integration
To remove an integration instance from Home Assistant
Related links
The NRGkick integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor the NRGkick mobile EV charger (Wallbox) by DiniTech with Home Assistant. It enables real-time monitoring of charging status, tracking energy consumption, controlling charging behavior, and integrating EV charging data into the Home Assistant energy dashboard.
The integration connects directly to the device on your local network using the local REST JSON API. No cloud connection is required.
You can use the NRGkick integration to:
Monitor your EV charging in real time - Track charging status, current power draw, session energy, and per-phase values directly from your dashboard.
Optimize your home energy management - Add your charger to the Home Assistant energy dashboard to integrate EV charging into your overall energy monitoring system.
Create smart charging automations such as:
Receiving notifications when charging stops or reaches an energy target
Controlling charging current based on solar surplus
Pausing charging during expensive peak hours
Reacting to warnings or errors reported by the charger
Track charger location on SIM models - Use the GPS device tracker in map views and zone-based automations.
The following NRGkick chargers are supported by this integration:
NRGkick Gen2 (Smart Cable / Flexible Wallbox)
This includes the 16A and 32A variants, as well as models with cellular (SIM) and GPS capabilities.
Note
The NRGkick 16A light model requires the “NRGkick App incl. Bluetooth/Wi-Fi connectivity” one-time upgrade to use the local API.
NRGkick Gen1 (Bluetooth-only)
Home Assistant and the NRGkick device need to be on the same local network.
Your NRGkick device needs to have SmartModule firmware 4.0.0.0 or newer.
The REST JSON API needs to be enabled in the NRGkick app.
To enable the API:
Open the NRGkick app from the manufacturer on your smartphone.
Go to Extended > Local API .
Enable JSON API .
Optional: Enable authentication and set a username and password.
To add the NRGkick device to your Home Assistant instance, use this My button:
NRGkick can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select NRGkick .
Follow the instructions on screen to complete the setup.
If you enabled authentication in the NRGkick app, enter the username and password during setup.
Host
The hostname or IP address of your NRGkick device, for example, nrgkick.local or 192.0.2.10 .
Username
Username for HTTP Basic Authentication (optional).
Password
Password for HTTP Basic Authentication (optional).
The above configuration can also be adjusted later via Settings > Devices & services . On the NRGkick integration, select , then select Reconfigure .
Below is a complete overview of the entities this integration provides.
This integration provides a single binary sensor:
Charge permitted : Indicates whether the vehicle is currently allowed to charge. If this sensor is on ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : on ), charging is permitted. If it is off ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : off ), charging is not permitted.
The integration creates the following sensors:
Tip
The ability to add your charger to the Home Assistant energy dashboard is one of the most useful features of this integration. It is recommended to add the Total charged energy sensor to the energy dashboard configuration.
Device information General
Rated current (A): Max rated current of the NRGkick.
Connector
Connector phase count : Phase count of the connected attachment.
Connector max current (A): Max current of the connected attachment.
Connector type : Attachment type (for example Type 2, CEE, domestic).
Connector serial **: Attachment serial number.
Grid
Grid voltage (V): Detected grid voltage type.
Grid frequency (Hz): Detected grid frequency.
Network
SSID **: Wi-Fi network name of the currently connected network.
Signal strength (dBm): Wi-Fi signal strength (RSSI).
Cellular (only if available)
These sensors are only available on NRGkick SIM models.
Cellular operator **: Cellular network operator.
Cellular signal strength ** (dBm): Cellular signal strength (RSSI).
Cellular mode **: Cellular mode.
Device values Energy
Total charged energy (kWh): Total charged energy overall. This is the recommended sensor to use in the Home Assistant energy dashboard.
Charged energy (kWh): Charged energy during the most recent charge session. While possible, it is not recommended to use this sensor in the Home Assistant energy dashboard because it resets each session.
Powerflow
Charging current (A): Max current signaled to the EV.
Peak power ** (W): Highest power during the most recent charge session.
Total active power (W): Total active power across all phases.
Total reactive power ** (var): Total reactive power across all phases.
Total apparent power ** (VA): Total apparent power across all phases.
Total power factor ** (%): Power factor across all phases.
Charging voltage (V): Average charging voltage across phases.
Powerflow grid frequency ** (Hz): Grid frequency reported in powerflow data.
L1 voltage ** (V): Voltage on phase L1.
L1 current (A): Current on phase L1.
L1 active power (W): Active power on phase L1.
L1 reactive power ** (var): Reactive power on phase L1.
L1 apparent power ** (VA): Apparent power on phase L1.
L1 power factor ** (%): Power factor on phase L1.
L2 voltage ** (V): Voltage on phase L2.
L2 current (A): Current on phase L2.
L2 active power (W): Active power on phase L2.
L2 reactive power ** (var): Reactive power on phase L2.
L2 apparent power ** (VA): Apparent power on phase L2.
L2 power factor ** (%): Power factor on phase L2.
L3 voltage ** (V): Voltage on phase L3.
L3 current (A): Current on phase L3.
L3 active power (W): Active power on phase L3.
L3 reactive power ** (var): Reactive power on phase L3.
L3 apparent power ** (VA): Apparent power on phase L3.
L3 power factor ** (%): Power factor on phase L3.
Neutral current ** (A): Current on neutral conductor (N).
General
Charging rate : Charging rate based on the user-defined average EV consumption in kilometers per hour.
Vehicle connected since : Timestamp derived from the device-reported connection time.
Vehicle charging time (s): Charging time of the most recent charge session.
Status : Charging status. The state can be one of the following:
Standby ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : standby ): No vehicle is connected and the charger is idle.
Connected ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : connected ): A vehicle is connected and ready.
Charging ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : charging ): The vehicle is currently charging.
Error ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : error ): The charger reported an error.
Wakeup ( state The state holds the information of interest of an entity, for example, if a light is on or off. Each entity has exactly one state and the state only holds one value at a time. However, entities can store attributes related to that state such as brightness, color, or a unit of measurement. [Learn more] : wakeup ): The charger is waking up or preparing a session.
Charge count : Vehicle plug-in cycle count.
RCD trigger : Indicates if the RCD got triggered and which type.
Warning code : Current warning code reported by the device.
Error code : Current error code reported by the device.
Temperatures
Housing temperature (°C): NRGkick housing temperature.
Connector L1 temperature (°C): Attachment phase 1 temperature.
Connector L2 temperature (°C): Attachment phase 2 temperature.
Connector L3 temperature (°C): Attachment phase 3 temperature.
Domestic plug 1 temperature (°C): Domestic attachment pin 1 temperature.
Domestic plug 2 temperature (°C): Domestic attachment pin 2 temperature.
Important
The sensors marked with ** are disabled by default. If you want to use them, you need to enable them first. See the enabling or disabling entities documentation for information on how to do this.
The integration creates the following device tracker:
GPS tracker : Current device location (latitude and longitude) and location accuracy.
The device tracker is only available on NRGkick SIM models.
The integration creates the following controls.
Switches
Charging enabled : Turn on to enable charging. Turn off to pause charging.
Numbers
Charging current (A): Set the charging current (6 A to the maximum supported by your device and the connected attachment).
Phase count : Set the number of phases (1 to 3, depending on the connected attachment).
Energy limit (Wh): Set an energy limit for the current charging session (0 = no limit).
Entity IDs depend on your device name in Home Assistant. The examples below assume the default device name of NRGkick .
sensor.nrgkick_charging_current : Charging current.
sensor.nrgkick_charged_energy : Charged energy.
sensor.nrgkick_total_charged_energy : Total charged energy. Recommended for the Home Assistant energy dashboard.
sensor.nrgkick_status : Charging status.
binary_sensor.nrgkick_charge_permitted : Indicates whether charging is currently permitted.
device_tracker.nrgkick_gps_tracker : Current location of the device (only on SIM models).
number.nrgkick_charging_current : Set the charging current.
number.nrgkick_energy_limit : Set an energy limit for the current charging session (0 = no limit).
number.nrgkick_phase_count : Set the number of phases.
switch.nrgkick_charging_enabled : Turn on to enable charging. Turn off to pause charging.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the device for updates.
Polling interval: 30 seconds.
The integration can only expose monitoring data and controls that are available through the NRGkick local JSON API. Settings and features that are only available in the NRGkick app and are not exposed through the local JSON API cannot be managed from Home Assistant (for example, time-controlled charging, solar charging). However, you can build similar functionality in Home Assistant using the available controls and automations.
SIM-specific entities, such as cellular sensors and the GPS device tracker, are only available on SIM-capable models because only those devices provide that data.
If setup fails with a connection error:
Verify the device is reachable on your network (for example by starting the NRGkick app or entering the device IP in a web browser).
Verify the REST JSON API is enabled in the NRGkick app.
If you use authentication, verify the username and password.
Verify the device is powered on and connected to the Wi-Fi network.
Sometimes the NRGkick device is not reachable on your network. Restart the device by unplugging it from power, waiting 30 seconds, and plugging it back in.
Under Settings > Devices & services , select NRGkick , then reload the integration.
This is expected when charging with a single-phase power source. Those sensors usually provide values only when a three-phase source is available and active.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
NRGkick Website
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NRGkick device was introduced in Home Assistant 2026.2, and it's used by
174 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@andijakl
Categories
Energy
Back to top
