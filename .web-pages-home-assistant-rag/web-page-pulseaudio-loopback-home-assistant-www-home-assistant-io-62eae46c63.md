# PulseAudio Loopback - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pulseaudio_loopback
- Final URL: https://www.home-assistant.io/integrations/pulseaudio_loopback
- Canonical URL: https://www.home-assistant.io/integrations/pulseaudio_loopback/
- Fetched at: 2026-06-28T03:09:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Pulseaudio loopback modules to build a flexible whole-home audio system.

## Extracted Text

On this page
Related topics
The goal behind this switch is to allow a very flexible whole home audio system based upon PulseAudio .
For example, for a system with a 7.1 surround sound card, and 3 instances of MPD running, it is possible to quickly route the output of any MPD instance to any of the 8 possible (4 stereo) channels on the sound card, by loading/unloading a loopback module. This loading/unloading functionality is provided by this integration. When the switch is on , the loopback module is loaded. When the switch is off , the module is not loaded.
The benefit of this approach is that this audio routing can occur without modifying the design-time configuration of MPD or PulseAudio.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses a TCP connection to control a local or remote PulseAudio server. So there are no local dependencies.
To enable this switch, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : pulseaudio_loopback
Configuration Variables
Looking for your configuration file?
sink_name string Required
The name of the Pulseaudio sink that will receive the audio.
source_name string Required
The name of the Pulseaudio source that will supply the audio.
name string ( Optional , default: paloopback )
Name of the switch.
host string ( Optional )
The IP address or host name of the PulseAudio server.
Default:
Use client configuration in /etc/pulse
port integer ( Optional , default: 4713 )
The port that Pulseaudio is listening on.
Important
This integration relies on raw TCP commands to PulseAudio. In order for PulseAudio to accept commands with this integration, module-native-protocol-tcp auth-ip-acl=<homeassistant ip> must be loaded on the PulseAudio server.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PulseAudio Loopback integration was introduced in Home Assistant 0.16, and it's used by
17 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Switch
Back to top
