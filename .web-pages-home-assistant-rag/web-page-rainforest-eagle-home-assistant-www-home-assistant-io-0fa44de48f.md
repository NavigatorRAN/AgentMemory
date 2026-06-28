# Rainforest Eagle - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rainforest_eagle
- Final URL: https://www.home-assistant.io/integrations/rainforest_eagle
- Canonical URL: https://www.home-assistant.io/integrations/rainforest_eagle/
- Fetched at: 2026-06-28T03:11:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the Rainforest Eagle with Home Assistant.

## Extracted Text

On this page
Configuration
Integrates energy usage and pricing from the Rainforest Automation’s Eagle 3 , Eagle-200 and Legacy Eagle energy gateways. These devices work over Zigbee Energy Profile to connect to your smart meter. As such, they do not connect to your regular Zigbee network (you don’t even need a Zigbee network as part of your system), but typically will need to be provisioned (that is to say, connected to your meter) by your utility. You then connect the Eagle to your home network and can pull energy usage via the device’s local API. The price will only be included if it is provided by the electricity meter. If you picked an electricity plan in the app, the price data will not be available.
As the Eagle 3 runs the same API as the Eagle 200, Home Assistant will set up your Eagle 3 as an “Eagle 200”.
To add the Rainforest Eagle device to your Home Assistant instance, use this My button:
Rainforest Eagle can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Rainforest Eagle .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rainforest Eagle device was introduced in Home Assistant 0.97, and it's used by
449 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gtdiehl
@jcalbert
@hastarin
Categories
Energy
Sensor
Back to top
