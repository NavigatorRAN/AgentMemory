# Pencom - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pencom
- Final URL: https://www.home-assistant.io/integrations/pencom
- Canonical URL: https://www.home-assistant.io/integrations/pencom/
- Fetched at: 2026-06-28T03:07:41Z
- Content type: text/html; charset=UTF-8

## Description

How to use Pencom Designs 8 channel relay boards.

## Extracted Text

On this page
Configuration
Related topics
Pencom Design is a manufacturer of computer-controlled relay, I/O and custom boards for commercial and industrial applications. This interface to Pencom’s Relay Control Boards is designed to work over an ethernet to serial adapter (NPort). Each switch (relay) can be turned on/off, and the state of the relay can be read.
The Pencom relays can be daisy-chained to allow for up to 8 boards. To enable Pencom in your installation, add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry switch : - platform : pencom host : host.domain.com port : 4001 boards : 2 relays : - name : " Irrigation" addr : 0 - name : " Upper Entry Door" addr : 1 - name : " Fountain" addr : 0 board : 2
Configuration Variables
Looking for your configuration file?
host string Required
The IP address of the ethernet to serial adapter. It is assumed that the adapter has been preconfigured.
port integer Required
The port of the ethernet to serial adapter.
boards integer ( Optional )
Number of boards daisy-chained together (default is 1).
relays list Required
List of relays.
name string Required
The name of the switch (component).
addr integer Required
The relay on the board starting with 0.
board integer ( Optional )
The board number (defaults to 1).
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pencom integration was introduced in Home Assistant 0.85, and it's used by
0 active installations.
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
