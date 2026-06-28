---
source_url: "https://www.home-assistant.io/integrations/sigfox"
final_url: "https://www.home-assistant.io/integrations/sigfox"
canonical_url: "https://www.home-assistant.io/integrations/sigfox/"
source_handle: "web:www-home-assistant-io:20baed458821"
source_section: "integrations-sigfox"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bfed7e9921fb9e32eea9e1d46d4a42288afe391f07e4b4b9dc32ccf5c788a6f2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Sigfox - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sigfox
- Final URL: https://www.home-assistant.io/integrations/sigfox
- Canonical URL: https://www.home-assistant.io/integrations/sigfox/
- Fetched at: 2026-06-28T03:15:53Z
- Content type: text/html; charset=UTF-8

## Description

Display messages from Sigfox devices in Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
SigFox integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adding a sensor for each Sigfox device registered with your account. The default name of sensors is sigfox_{DEVICE_ID} where DEVICE_ID is the devices Sigfox ID. The state of an added Sigfox sensor is the payload of the last message published by that device. Additionally, there are attributes for the latitude and longitude coordinates of the device, as well as the signal-to-noise ratio ( snr ).
Note that your_api_login and your_api_password are your API access credentials which can be accessed by following:
Log into Sigfox backend
Select GROUP
Select API ACCESS
Click on new and create new access entry
To use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : sigfox api_login : your_api_login api_password : your_api_password
Configuration Variables
Looking for your configuration file?
api_login string Required
Your Sigfox API login.
api_password string Required
Your Sigfox API password.
name string ( Optional , default: sigfox )
The name to prepend to the device ID.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sigfox integration was introduced in Home Assistant 0.68, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
