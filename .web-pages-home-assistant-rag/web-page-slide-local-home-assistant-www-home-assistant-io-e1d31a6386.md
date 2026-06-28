# Slide Local - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/slide_local
- Final URL: https://www.home-assistant.io/integrations/slide_local
- Canonical URL: https://www.home-assistant.io/integrations/slide_local/
- Fetched at: 2026-06-28T03:16:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Innovation in Motion Slide covers with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Options
Supported functionality
Cover
Button
Switch
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Slide Local integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your Slide devices in Home Assistant using the local API.
The integration should work with all Slide covers (API version 1 and 2).
Before you can use the integration, you have to make sure the slide is configured for the local API. By default, the Slide connects to the cloud API, but it is possible to use the local API, too (only one of them can be active). To switch between the cloud and local API, do the following:
Press the reset button 2x
LED flashes 5x fast: cloud API disabled, local API enabled
LED flashes 2x slow: local API disabled, cloud API enabled
To add the Slide Local device to your Home Assistant instance, use this My button:
Slide Local can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Slide Local .
Follow the instructions on screen to complete the setup.
To set up the integration you need the following information:
hostname
Hostname or IP of the slide device.
password
The device code of your Slide (inside of your Slide or in the box, 8 characters). Only required for API 1, with API 2 you can fill in anything here.
To define options for Slide Local, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Slide Local are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Invert position
Check the box, if your cover uses inverted positions for open and closed.
Your slide device will appear as cover.
You can start the calibration sequence for your slide by pushing on the Calibration button.
You can enable/disable the Touch&Go functionality (open/close cover by a short pull on the cover) by using the TouchGo switch.
The integration fetches data from the device every 15 seconds.
The integration only provides connection with Slide devices via the local API. The cloud API is no longer available.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Slide Local device was introduced in Home Assistant 2025.1, and it's used by
249 active installations.
Its IoT class is Local Polling.
🥇 Gold quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dontinelli
Categories
Back to top
