# HVV Departures - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hvv_departures
- Final URL: https://www.home-assistant.io/integrations/hvv_departures
- Canonical URL: https://www.home-assistant.io/integrations/hvv_departures/
- Fetched at: 2026-06-28T02:50:48Z
- Content type: text/html; charset=UTF-8

## Description

Display the departures of buses, trains and ferries in Hamburg within Home Assistant.

## Extracted Text

On this page
Configuration
Options
Departure sensors
States
Attributes
Elevator sensors
How to get the API credentials
Data
The HVV Departures integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will display the departures of buses, trains and ferries in Hamburg.
To add the HVV Departures service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select HVV Departures .
Follow the instructions on screen to complete the setup.
Need your API credentials? See how to get the API credentials .
Menu: Configuration > Integrations > Select your new integration > Press the cog in the upper left corner
select lines : filter the departures on the station to only show departures for the selected lines.
offset : set this if you want to list the departures some minutes in the future, for example, if you live ten minutes away from the station.
use realtime data : enable this to include delay and cancellation information.
The integration creates one sensor for the departures at the selected station.
The state is a timestamp representing the time for the next departure, not including delays.
Attribute Description line Line number of the next departure origin The station where the transport started from direction The station where the transport ends type Type of the transportation, for example, Bus or S id A unique identifier for the line. In most cases, line is sufficient to identify the line delay Real-time data about the delay of the transport in seconds. Add this to the departure time to get the real departure time next A list of the upcoming departures. Each element has the above attributes and departure containing the timestamp
If the selected station has elevators, binary sensors will be available.
OK ( off ): The elevator is working.
Problem ( on ): The elevator is out of order. See the cause attribute for more information.
Attribute Description cabin_width Width of the elevator cabin cabin_length Length of the elevator cabin door_width Width of the elevator doors elevator_type Type of the elevator button_type Type of the elevator buttons, can be one of the following:
BRAILLE
ACUSTIC
COMBI
UNKNOWN
cause If the state of the sensor is on (“Problem”), the cause attribute may contain further information about the cause lines List of lines that can be reached using this elevator
You have to apply for credentials via the HVV website. You can see their official guide here (the page is only available in German).
In your mail, tell them you are using your API credentials for use within Home Assistant. They will subsequently send your API credentials in a follow-up response.
Data is provided by HVV .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The HVV Departures service was introduced in Home Assistant 0.112, and it's used by
206 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@vigonotion
Categories
Transport
Back to top
