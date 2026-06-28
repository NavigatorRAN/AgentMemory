# Locative - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/locative
- Final URL: https://www.home-assistant.io/integrations/locative
- Canonical URL: https://www.home-assistant.io/integrations/locative/
- Fetched at: 2026-06-28T02:57:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Locative to track devices in Home Assistant.

## Extracted Text

On this page
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to detect presence using Locative . Locative is an open source app for iOS that allows users to set up a GET or POST request when a geofence is entered or exited. This can be configured with Home Assistant to update your location.
Install on your smartphone:
iOS
To configure Locative, you must set it up via the integrations panel in the configuration screen. You must set up the app to send a POST request to your Home Assistant instance at the webhook URL provided by the integration during setup. When you enter or exit a geofence, Locative will send the appropriate request to that URL, updating Home Assistant. You are not able to specify a device name in Locative. Instead, you will need to look in your dev-state menu for a new device that Locative will have created on its first GET . If you had been or are using Owntracks as well, you will need to update the device name used in the Owntracks setup with the name that Locative generated.
When you enter a geofence, your location name in Home Assistant will be set to the name of the geofence in Locative. When you exit a geofence, your location name in Home Assistant will be set to “not home”.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Locative integration was introduced in Home Assistant 0.86, and it's used by
380 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
