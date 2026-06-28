# KEF - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/kef
- Final URL: https://www.home-assistant.io/integrations/kef
- Canonical URL: https://www.home-assistant.io/integrations/kef/
- Fetched at: 2026-06-28T02:54:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate KEF Speakers into Home Assistant.

## Extracted Text

On this page
Configuration
Advanced - configuration example
Actions
Action: Update DSP
Action: Set mode
Action: Set desk dB
Action: Set wall dB
Action: Set treble dB
Action: Set high Hz
Action: Set low Hz
Action: Set sub dB
Notes
Related topics
The KEF integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the KEF LS50 Wireless and KEF LSX speakers from Home Assistant.
Supported devices:
KEF LS50 Wireless
KEF LSX
To add KEF Speakers to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : kef host : IP_ADDRESS type : LS50
Configuration Variables
Looking for your configuration file?
host string Required
IP address of the device. Example: 192.168.1.32
type string Required
The speaker type, either LS50 or LSX .
name string ( Optional , default: KEF )
The name of the device
port integer ( Optional , default: 50001 )
The port of the device
maximum_volume float ( Optional , default: 0.5 )
Maximum volume allowed. Number between 0 and 1.
volume_step float ( Optional , default: 0.05 )
Volume step when increasing volume.
inverse_speaker_mode boolean ( Optional , default: false )
Switch channels from L/R to R/L.
standby_time integer ( Optional )
The speakers automatically turn to standby mode after either 20 or 60 minutes. Leave out for the speaker to never go into standby mode.
supports_on boolean ( Optional , default: true )
LS50 Wireless with a serial number below LS50W13074K24L/R2G do not support turning on the speakers over the network. Set this to false if you have an older model.
# Example configuration.yaml entry media_player : - platform : kef host : IP_ADDRESS type : LS50 name : My KEF speakers maximum_volume : 0.6 volume_step : 0.05
Just like in the KEF Control app, we can change the digital signal processing (DSP) settings.
The speaker’s current DSP settings are updated automatically each hour and after each action.
To update the settings manually, use kef.update_dsp .
The kef.update_dsp action updates all DSP settings.
Data attribute Optional Description entity_id No The entity_id of the KEF speaker.
The kef.set_mode action sets the mode of the speaker. When optional attributes are left out, the setting will be unchanged.
Data attribute Optional Description entity_id No The entity_id of the KEF speaker. desk_mode Yes “Desk mode” ( true or false ) wall_mode Yes “Wall mode” ( true or false ) phase_correction Yes “Phase correction” ( true or false ) high_pass Yes “High-pass mode” ( true or false ) sub_polarity Yes “Sub polarity” ( - or + ) bass_extension Yes “Bass extension” selector ( Less , Standard , or Extra )
The kef.set_desk_db action sets the “Desk mode” slider of the speaker in dB.
Data attribute Optional Description entity_id No The entity_id of the KEF speaker. db_value No Value of the slider (-6 to 0 with steps of 0.5)
The kef.set_wall_db action sets the “Wall mode” slider of the speaker in dB.
The kef.set_treble_db action sets the “Treble trim” slider of the speaker in dB.
Data attribute Optional Description entity_id No The entity_id of the KEF speaker. db_value No Value of the slider (-2 to 2 with steps of 0.5)
The kef.set_high_hz action sets the “High-pass mode” slider of the speaker in Hz.
Data attribute Optional Description entity_id No The entity_id of the KEF speaker. hz_value No Value of the slider (50 to 120 with steps of 5)
The kef.set_low_hz action sets the “Sub out low-pass frequency” slider of the speaker in Hz.
Data attribute Optional Description entity_id No The entity_id of the KEF speaker. hz_value No Value of the slider (40 to 250 with steps of 5)
The kef.set_sub_db action sets the “Sub gain” slider of the speaker in dB.
Data attribute Optional Description entity_id No The entity_id of the KEF speaker. db_value No Value of the slider (-10 to 10 with steps of 1)
The LS50 Wireless was tested with the latest firmware of 19-11-2019: p6.3001902221.105039422 and older firmware: p6.2101809171.105039422
The LSX Wireless was tested with the latest firmware of 10-10-2019 v4.1: p20.4101909240.105243
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The KEF integration was introduced in Home Assistant 0.104, and it's used by
79 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@basnijholt
Categories
Media player
Back to top
