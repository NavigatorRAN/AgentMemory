# APRS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aprs
- Final URL: https://www.home-assistant.io/integrations/aprs
- Canonical URL: https://www.home-assistant.io/integrations/aprs/
- Fetched at: 2026-06-28T02:28:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use APRS to track devices in Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The APRS (Automatic Packet Reporting System) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects to the APRS-IS network for tracking amateur radio devices.
To enable APRS tracking in Home Assistant, add the following section to configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry device_tracker : - platform : aprs username : FO0BAR # or FO0BAR-1 to FO0BAR-15 callsigns : - ' XX0FOO*' - ' YY0BAR-1'
Configuration Variables
Looking for your configuration file?
username string Required
Your callsign (or callsign-SSID combination). This is used to connect to the host. Note: Do not use the same callsign or callsign-SSID combination as a device you intend to track: the APRS-IS network will not route the packets to Home Assistant. This is a known limitation of APRS packet routing.
password string ( Optional , default: -1 )
Your APRS password. This will verify the connection.
callsigns list Required
A list of callsigns you wish to track. Wildcard * is allowed. Any callsigns that match will be added as devices.
host string ( Optional , default: rotate.aprs2.net )
The APRS server to connect to.
timeout float ( Optional , default: 30.0 )
The number of seconds to wait to connect to the APRS-IS network before giving up.
Verified connections are only required to send data to the APRS-IS network, which the aprs platform does not yet do.
However, you are free to verify your connection if you know your APRS password.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The APRS integration was introduced in Home Assistant 0.95, and it's used by
100 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@PhilRW
Categories
Presence detection
Back to top
