# WLED - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/wled
- Final URL: https://www.home-assistant.io/integrations/wled
- Canonical URL: https://www.home-assistant.io/integrations/wled/
- Fetched at: 2026-06-28T03:28:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate WLED with Home Assistant.

## Extracted Text

On this page
Use cases
Prerequisites
Configuration
Options
Supported functionality
Lights
Selects
Numbers
Sensors
Switches
Buttons
Updates
Data updates
Known limitations
Supported devices
Example automations
Activating random effect
Activating random palette
Activating a preset
Automation using specific palette name
Troubleshooting
Failed to set up the device due to MAC address mismatch
Removing the integration
To remove an integration instance from Home Assistant
WLED is a fast and feature-rich
implementation of an ESP8266/ESP32 webserver to control NeoPixel LEDs
(like WS2812B, WS2811, SK6812, and similar) and SPI based chipsets
(like WS2801 and APA102).
WLED can enhance your home automation in many ways:
Ambient lighting effects: Create dynamic lighting scenes that respond to music, time of day, or events in your home, adding atmosphere to any room.
Status indicators: Use different colors and effects to visualize information, such as showing your Home Assistant status, upcoming weather conditions, or calendar events.
Entertainment and games: Control LED strips during movie nights, gaming sessions, or parties with synchronized effects and color changes.
Energy-efficient accent lighting: Replace traditional accent lighting with power-efficient LED strips while maintaining full control and automation.
Smart home notifications: Set up visual alerts by triggering specific light effects when important events occur, like doorbell presses or security alerts.
Important
This integration requires a WLED device running WLED 0.14.0 or newer.
You can install the latest version of WLED on your device by going to
the WLED web installer or by downloading the
latest release from the WLED GitHub releases page .
To add the WLED device to your Home Assistant instance, use this My button:
WLED can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WLED .
Follow the instructions on screen to complete the setup.
Host
Hostname or IP address of your WLED device.
To define options for WLED, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of WLED are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Keep Master Light
Keep the master light (the main light entity that controls the entire WLED device), even if there is only 1 segment. This ensures the master light is always there, in case you are automating segments to be added and removed dynamically.
The WLED integration provides the following entities.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds the WLED device as a light in Home Assistant.
Home Assistant treats every segment of the LED strip as a separate light
entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] .
Only native supported features of a light in Home Assistant are supported
(which includes effects).
Using WLED segments
WLED can split a single LED strip into multiple segments. These segments can be
controlled separately in WLED and in Home Assistant as well.
If WLED has 1 segment defined (the default), that one segment controls the whole
LED strip. Home Assistant creates a single light entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] to control the
strip.
If WLED has 2 or more segments, each segment gets its own light entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] in
Home Assistant. Additionally, a master light entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is created. This master
entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] controls the strip power and overall brightness applied to all segments.
Additionally, select, number, and switch entities described below will be created for each segment.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides select entities
for the following information from WLED:
Live override: Controls how WLED handles incoming real-time data (off, on, or until device restarts).
Playlist: Activates a playlist configured on the WLED device.
Preset: Activates a preset configured on the WLED device.
Color palette (per segment): Selects the color palette used by the current effect.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides number entities
to control the following, segment-specific settings:
Intensity
Speed
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides sensor entities
Estimated current (in mA, only when a automatic brightness limiter is configured on the device)
Max current (in mA, only when a automatic brightness limiter is configured on the device)
LED count
Uptime (disabled by default)
Free memory (in bytes, disabled by default)
Wi-Fi Signal Strength (in %, disabled by default)
Wi-Fi Signal Strength (RSSI in dBm, disabled by default)
Wi-Fi Channel (disabled by default)
Wi-Fi BSSID (disabled by default)
IP Address
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will also create several
switch entities .
Nightlight
Toggles the WLED nightlight feature, which gradually dims the lights over a configurable duration.
Can be configured on the WLED itself under
Settings > LED Preferences > Timed light .
Sync receive and sync send
Toggles the synchronization between multiple WLED devices.
Settings > Sync Interfaces > WLED Broadcast .
WLED Sync documentation
Reverse
Reverses the direction of the LED effect on a segment. One switch is created per segment.
Freeze
Freezes the LED effect on a segment. One switch is created per segment.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a button entity
to restart the WLED device.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] has an update entity
that provides information on the latest available version of WLED
and indicates if a firmware update is available for installation.
The firmware update can be triggered and installed onto your WLED device
directly from Home Assistant.
The update entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] will only provide updates to stable versions,
unless you are using a beta version of WLED. In that case, the update
entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] will also provide updates to newer beta versions.
By default, official WLED builds enable the WebSocket server, which lets the integration receive real-time updates (“push” data) directly from the device.
When the integration starts, it first tries to connect by using WebSocket . If the device firmware does not support WebSockets, like a custom WLED build compiled without that feature, the integration automatically falls back to polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] and fetches data every 10 seconds by default.
Information about new WLED releases is checked independently, once every 3 hours, regardless of the number of connected devices.
WLED exposes a single color model per segment in Home Assistant.
This means that mixed-type LED strips — for example RGB + CCT or RGBW + CCT combinations — cannot currently have their RGB and CCT channels controlled independently in Home Assistant.
When such strips are used, only one color temperature or hue is active at a time.
The integration relies on the WLED JSON API.
Custom WLED builds that disable or remove parts of the API, such as turning off the JSON interface in favor of HTTP + MQTT only, are not supported.
Real-time effects that depend on sound-reactive or 2D matrix features appear in the effect list, but may not behave correctly if the WLED instance was not compiled with those capabilities.
Custom segment names configured in WLED are not used by the integration. Segments are always named using their index (for example, “Segment 1”, “Segment 2”), regardless of any names assigned in the WLED interface.
The integration does not support controlling WLED usermods, such as the AudioReactive usermod. Features like toggling the microphone on or off are not available.
There is no segment master control to apply changes (color, effect, brightness) to all segments in a single action. To control multiple segments at once, you can group them using a light group , though this sends separate requests per segment and may result in less smooth transitions compared to WLED’s native multi-segment control.
Only the primary color of a segment can be set through the integration. The secondary and tertiary colors that many WLED effects use cannot be controlled directly from Home Assistant. The workaround is to configure those colors in the WLED app or web interface, save the configuration as a preset, and then activate that preset from Home Assistant — the preset restores all colors, including secondary and tertiary.
The integration requires WLED version 0.14.0 or newer .
Official WLED releases for ESP8266 and ESP32 are fully supported.
Most standard digital LED chipsets supported by WLED—such as WS2812B , WS2811 , SK6812 , APA102 , or WS2801 —work correctly with all features exposed in Home Assistant.
Some LED configurations, however, have limited functionality:
Analog RGB + CCT or digital RGBCCT strips, such as WS2508 or hybrid RGB + CCT setups, cannot be controlled with separate sliders for color and color temperature.
Home Assistant can only manage one color model at a time.
You can automate changing the effect using an action like this:
action : light.turn_on target : entity_id : light.wled data : effect : " {{ state_attr('light.wled', 'effect_list') | random }}"
It is recommended to select an effect that matches the capabilities of your WLED device (e.g., 1D, 2D, or Sound Reactive). You can refer to the WLED effect list to explore available options. Once you identify compatible effects, you can randomize them based on their IDs.
Below is an example of how to select a random effect with an ID between 1 and 117, excluding retired effects:
action : light.turn_on target : entity_id : light.wled data : effect : " {{ state_attr('light.wled', 'effect_list')[1:118] | reject('equalto', 'RSVD') | list | random }}"
Activating a random palette is very similar to the above random effect,
and can be done by selecting a random one from the available palette select
action : select.select_option target : entity_id : select.wled_color_palette data : option : " {{ state_attr('select.wled_color_palette', 'options') | random }}"
Activating a preset is an easy way to set a WLED light to a specific
configuration. Here is an example action to set a WLED light
to a preset called My Preset:
- action : light.turn_on target : entity_id : light.wled - action : select.select_option target : entity_id : select.wled_preset data : option : " My Preset"
When a preset is activated and the light state is modified afterward
(for example, with a light.turn_on action), the preset may be reset to an empty value.
This can affect services such as select.select_next , which will start again
from the first option instead of continuing the cycle.
If you want to pick presets directly from the effects list in a light card, you can use a template light to wrap the WLED device and expose its presets as effects.
An automation to turn on a WLED light and select a specific palette and
set intensity, and speed can be created by first calling the light.turn_on
action, then calling the select.select_option action to select the
palette, then call the number.set_value action to set the intensity
and again to set the speed.
Here is an example of all of these put together into an automation:
- alias : " Turn on WLED rain effect when weather changes to rainy" triggers : - trigger : state entity_id : sensor.weather_condition to : " rainy" actions : - action : light.turn_on target : entity_id : light.wled data : effect : " Rain" - action : select.select_option target : entity_id : select.wled_color_palette data : option : " Breeze" - action : number.set_value target : entity_id : number.wled_intensity data : value : 200 - action : number.set_value target : entity_id : number.wled_speed data : value : 255
Symptom
“Failed to set up: MAC address does not match the configured device. Expected to connect to device with MAC: XX:XX:XX:XX:XX:01, but connected to device with MAC: XX:XX:XX:XX:XX:02.”
When setting up or loading the integration, Home Assistant reports that the MAC address of the connected device does not match the MAC address stored in the configuration.
Description
This error indicates that Home Assistant connected to a different device than expected while using the same IP address.
The most common cause is DHCP address reuse. This usually happens when:
The original device was offline or temporarily disconnected.
The router reassigned its IP address to another device.
Home Assistant attempted to connect to the old IP address and reached a different device with a different MAC address.
To avoid controlling or communicating with the wrong device, the integration validates the MAC address and stops the setup if it does not match the configured one.
Resolution
To resolve this issue, follow these steps:
Open the integration settings in Home Assistant.
Select Reconfigure from the menu of the affected integration.
Verify the currently configured IP address.
Enter the correct IP address of the device if it has changed.
Submit the form to update the configuration.
If you are unsure about the correct IP address, you can try the following:
Check your router or DHCP server for the device’s current IP assignment.
Ensure the IP address matches the device you are configuring.
To reduce the chance of this issue happening again, you can:
Configure a DHCP reservation for the device in your router.
Assign a static IP address to the device.
In many cases, this issue resolves automatically. When Home Assistant discovers the device at a new IP address, the integration may update the configuration on its own and restore the connection without manual action.
If the error persists, reconfiguring the integration with the correct IP address is required.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WLED device was introduced in Home Assistant 0.102, and it's used by
6.3% of the active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
@mik-laj
Categories
Light
Sensor
Switch
Update
Back to top
