---
source_url: "https://www.home-assistant.io/integrations/lg_tv_rs232"
final_url: "https://www.home-assistant.io/integrations/lg_tv_rs232"
canonical_url: "https://www.home-assistant.io/integrations/lg_tv_rs232/"
source_handle: "web:www-home-assistant-io:7f7551115b5b"
source_section: "integrations-lg-tv-rs232"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "de887eaead0702776ac5519341212bcc1c3456f88f3f49352f679459af1b8de4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# LG TV via Serial - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lg_tv_rs232
- Final URL: https://www.home-assistant.io/integrations/lg_tv_rs232
- Canonical URL: https://www.home-assistant.io/integrations/lg_tv_rs232/
- Fetched at: 2026-06-28T02:56:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate LG TVs via their RS-232 serial port into Home Assistant.

## Extracted Text

On this page
Supported devices
Unsupported devices
Prerequisites
Configuration
Supported functionality
Media player
Data updates
Automation examples
Turn the TV off when everyone leaves home
Switch to the HDMI input when starting movie night
Known limitations
Troubleshooting
Can’t set up the device
The TV becomes unavailable
Removing the integration
To remove an integration instance from Home Assistant
The LG TV via Serial integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control LG TVs by connecting to their RS-232 serial port. By connecting the TV to your Home Assistant server using a serial (RS-232) cable, an ESPHome-based serial proxy, or a USB-to-serial adapter, you get local control of the TV.
Controlling a TV via RS-232 is more reliable and responsive than using the TV’s network or IR interfaces, and it works even when the TV is in standby. It also allows you to control TVs that do not have smart features or network connectivity.
The following devices have been tested with the integration:
LG OLED55B7A
In general, LG TVs and commercial displays that expose an RS-232C control port (DE-9 connector or, on some sets, a 3.5 mm service jack) are supported.
Most LG TVs sold starting roughly 2008, as well as LG commercial signage displays, include this port. Both the modern ( xb ) and legacy ( kb ) input-selection commands are supported, so older sets work too.
LG TVs without a physical RS-232C port. Many entry-level TVs from 2018 onwards dropped the serial port. For those, use the LG webOS Smart TV integration instead.
A physical serial connection between your TV and the system running Home Assistant. This can be a direct serial (RS-232) cable, a USB-to-serial adapter, or an ESPHome -based serial proxy.
LG TVs use a null-modem (cross-over) cable: the TX and RX lines must be swapped.
RS-232C Control must be enabled on the TV. On many LG models this option lives in a hidden service ( InStart ) menu. Consult your TV’s documentation.
To add the LG TV via Serial device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LG TV via Serial .
Follow the instructions on screen to complete the setup.
Port
The serial port the TV is connected to. This can be a local device path or a remote serial proxy URL. For example, /dev/ttyUSB0 (USB adapter), socket://192.168.1.100:2000 (network proxy), or socket://esphome-device.local:6638 (ESPHome).
Set ID
The set ID configured on the TV (1-99). Leave this at the default of 1 for a single TV. When multiple TVs are daisy-chained on the same RS-232 bus, give each set a unique ID and add a separate entry for each.
The integration adds a single media player entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for the TV.
For supported TVs, you can use Home Assistant to:
Turn the TV on and off.
Change the volume and step it up or down.
Mute and unmute the TV.
Select the input source.
LG TVs do not report changes on their own over RS-232, so Home Assistant polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the TV every 5 seconds for its power state, input source, volume, and mute state. Changes made with the TV’s own remote are picked up at the next poll.
While the TV is in standby it only answers the power query. Other attributes, such as volume and input source, are populated once the TV is on.
The real power of this integration is tying the TV into the rest of your home.
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
automation : - alias : " Turn off the living room TV when away" triggers : - trigger : state entity_id : zone.home to : " 0" actions : - action : media_player.turn_off target : entity_id : media_player.lg_tv
automation : - alias : " Movie night switches the TV to HDMI 1" triggers : - trigger : state entity_id : input_boolean.movie_night to : " on" actions : - action : media_player.turn_on target : entity_id : media_player.lg_tv - action : media_player.select_source target : entity_id : media_player.lg_tv data : source : " HDMI 1"
Many LG TVs ignore the power-on command over RS-232 while the set is in standby. If turning the TV on does not work, you might have to disable a power saving mode.
Different LG models support different subsets of the RS-232 command set, so some input sources may not be selectable on every TV.
If the TV is configured to route audio to an external output (such as optical or HDMI ARC) instead of the TV speakers, the volume controls are not shown for the media player.
Symptom: “Failed to connect”
When trying to set up the integration, the form shows the message “Failed to connect”.
Description
Home Assistant could not communicate with the TV over the serial port.
Resolution
To resolve this issue, try the following steps:
Make sure the TV is powered on. The TV must be on for the initial connection.
Make sure RS-232C Control is enabled in the TV’s service menu.
Verify the cable is a null-modem (cross-over) cable and is fully seated. LG’s RS-232 jack is recessed, so push the plug in until it clicks.
Confirm the correct serial port was selected, and that no other software is using it.
If you use multiple daisy-chained TVs, confirm the set ID matches the one configured on the TV.
If the serial connection is lost, the entity becomes unavailable and Home Assistant automatically reconnects. Check the cable and, for network serial proxies, the network connection between Home Assistant and the proxy.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LG TV via Serial device was introduced in Home Assistant 2026.6, and it's used by
4 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@balloob
Categories
Back to top
