# Brottsplatskartan - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/brottsplatskartan
- Final URL: https://www.home-assistant.io/integrations/brottsplatskartan
- Canonical URL: https://www.home-assistant.io/integrations/brottsplatskartan/
- Fetched at: 2026-06-28T02:32:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate brottsplatskartan.se into Home Assistant.

## Extracted Text

On this page
Configuration
Notes
Area
Latitude and Longitude
The Brottsplatskartan integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to track reported incidents occurring in a given area. Incidents include anything reported to Brottsplatskartan . The sensor only counts incidents from the current day.
To add the Brottsplatskartan service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Brottsplatskartan .
Follow the instructions on screen to complete the setup.
Brottsplatskartan captures all incidents in a region, for example, Stockholms län. If the area parameter is defined, any latitude and longitude parameters are ignored.
The radius is set to 5 km when using latitude and longitude to monitor an area. It’s not possible to explicitly set radius to another value.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Brottsplatskartan service was introduced in Home Assistant 0.85, and it's used by
234 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Sensor
Social
Back to top
