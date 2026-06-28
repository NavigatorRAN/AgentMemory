# Onkyo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/onkyo
- Final URL: https://www.home-assistant.io/integrations/onkyo
- Canonical URL: https://www.home-assistant.io/integrations/onkyo/
- Fetched at: 2026-06-28T03:05:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Onkyo and some Pioneer receivers into Home Assistant.

## Extracted Text

On this page
Configuration
Options
Supported functionality
Zones
Channel muting switches
List of actions
Examples
Play a radio preset
Supported devices
Troubleshooting
No entities created
Removing the integration
To remove an integration instance from Home Assistant
The Onkyo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Onkyo and Integra (from 2011 onward) and also Pioneer (from 2016 onward) receivers using Home Assistant.
Please be aware that you need to enable “Network Standby” for this integration to work with your hardware.
To add the Onkyo device to your Home Assistant instance, use this My button:
Onkyo can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Onkyo .
Follow the instructions on screen to complete the setup.
Host
Hostname or IP address of the device, for example: 192.168.1.2 .
Volume Resolution
Number of steps it takes for the receiver to go from the lowest to the highest possible volume. Possible values are 50, 80, 100, 200. For older Onkyo receivers, this typically is 80; newer Onkyo receivers use 200.
Input sources
List of input sources supported by the receiver.
Listening modes
List of listening modes supported by the receiver.
The above settings can also be adjusted later. To change Host or Volume Resolution , select the three dots menu on the integration entry and select Reconfigure .
To define options for Onkyo, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Onkyo are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Max Volume
Maximum volume limit as a percentage. Often the maximum volume of the receiver is far too loud. Setting this will set Home Assistant’s 100% volume to be this setting on the amp, that is, if you set this to 50%, when you set Home Assistant to be 100%, then your receiver will be set to 50% of its maximum volume.
Mappings of input sources to their names.
Mappings of listening modes to their names.
If your receiver has a second or third zone available, they are displayed as additional media players with functionality similar to the main zone.
If your receiver supports channel muting, the integration creates a switch for each speaker channel. Turning a switch on mutes that channel, and turning it off unmutes it. This lets you mute individual channels independently of the main volume.
The Onkyo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Select HDMI output ( media_player.onkyo_select_hdmi_output )
Switches the active HDMI output on your Onkyo, Integra, or Pioneer receiver.
For an overview of every action across all integrations, see the actions reference .
You can use the media_player.play_media action in a script to play a radio station by its preset number. This does not work for NET radio.
# Example play_media script script : radio1 : alias : " Radio 1" sequence : - action : media_player.turn_on target : entity_id : media_player.onkyo - action : media_player.play_media target : entity_id : media_player.onkyo data : media_content_type : " radio" media_content_id : " 1"
Network receivers from Onkyo and Integra are supported starting with models from the year 2011. Pioneer network receivers are supported starting with models from 2016.
Restart your receiver (power cycle).
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Onkyo device was introduced in Home Assistant 0.17, and it's used by
1.1% of the active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@arturpragacz
@eclair4151
Categories
Media player
Back to top
