# Trafikverket Ferry - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/trafikverket_ferry
- Final URL: https://www.home-assistant.io/integrations/trafikverket_ferry
- Canonical URL: https://www.home-assistant.io/integrations/trafikverket_ferry/
- Fetched at: 2026-06-28T03:23:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to integrate Trafikverket Ferry within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Use cases
Sensors
Ferry harbour names
Retrieve ferry departure information from Trafikverket .
Please click here and register to obtain the API key.
To add the Trafikverket Ferry service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Trafikverket Ferry .
Follow the instructions on screen to complete the setup.
Retrieve the next departure and information connected to it.
Destination harbor is optional and by leaving it empty it will show the next destination available from the selected departure harbor.
By choosing a specific time it will only show departures after this.
By deselecting from the pre-filled days of the week you can make selections such as only Monday to Friday if needed.
Departure date and time by made selections.
Departure sensor for following two departures after next (disabled by default)
Departure harbor.
Destination harbor.
Modified time (this sensor is deactivated as standard).
Other information provided by Trafikverket related to the specific departure is shown as attribute on all sensors.
Click here to see examples of harbor names, use city name as harbor, as for example “Ekerö”, “Svanesund”.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Trafikverket Ferry service was introduced in Home Assistant 2022.5, and it's used by
13 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Sensor
Transport
Back to top
