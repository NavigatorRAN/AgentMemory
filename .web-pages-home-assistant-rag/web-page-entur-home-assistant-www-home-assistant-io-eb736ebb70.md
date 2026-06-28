# Entur - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/entur_public_transport
- Final URL: https://www.home-assistant.io/integrations/entur_public_transport
- Canonical URL: https://www.home-assistant.io/integrations/entur_public_transport/
- Fetched at: 2026-06-28T02:40:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to set up monitoring of public transport departures in Norway.

## Extracted Text

On this page
Configuration
Example usage
Obtaining a stop id
FAQ - Troubleshooting
The Entur integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] gives real-time departure information for the next departures from any bus stop, car ferry quay, train station, airport and person ferries quay in Norway.
For each stop place given in the configuration, a sensor will be mounted for that stop place. It will give remaining minutes until the nearest departure in the state, but also next departures in the attributes. Information about if the departure is monitored in real-time or is from scheduled times, and how many minutes there is in delays, are included as well.
Real-time data is fetched from Entur . Entur is a service which collects and delivers information about all public transport available in Norway under an open source license .
Note
Note that the underlying API is rate limited and to avoid getting your instance blocked from Entur the sensor is only fetching new information every 45 seconds. It’s recommended to not schedule updates more often than this.
# Example configuration.yaml entry sensor : - platform : entur_public_transport stop_ids : - ' STOP_ID_1' - ' STOP_ID_2'
Configuration Variables
Looking for your configuration file?
stop_ids list Required
List of stop places or platforms to monitor departure times from.
name string ( Optional , default: Entur )
Override parts of the sensor name.
expand_platforms boolean ( Optional , default: true )
If additional sensors should be created for each platform under a stop place.
show_on_map boolean ( Optional , default: false )
If platform locations should be added to the sensor, and the map.
line_whitelist list ( Optional )
List of lines that should be whitelisted in the resulting sensors, and will only show when the defined lines are expected to leave the platform or station. All lines that you want on any of the sensors should be included in the list.
omit_non_boarding boolean ( Optional , default: true )
If the sensors should remove resulting departures that doesn’t take new passengers, or is at last stop.
number_of_departures integer ( Optional , default: 2 )
The number of departures that should be shown in the sensor attributes. Maximum 10, Minimum 2.
Example of multiple stop places, with expanded sensors for each platform under the station, and with the platforms added to the map.
# Example configuration.yaml entry sensor : - platform : entur_public_transport name : Transport expand_platforms : true show_on_map : true stop_ids : - ' NSR:StopPlace:548' # Bergen train station - ' NSR:StopPlace:737' # Trondheim airport - ' NSR:StopPlace:5850' # Grorud T bus stop - ' NSR:StopPlace:58652' # Mortavika ferry - ' NSR:StopPlace:27639' # Sør-Hidle quay - ' NSR:Quay:48550' # Fiskepiren bus stop platform 1
Example with whitelisting of one line on each stop place.
# Example configuration.yaml entry sensor : - platform : entur_public_transport stop_ids : - ' NSR:Quay:7333' - ' NSR:Quay:48550' - ' NSR:StopPlace:596' line_whitelist : - ' RUT:Line:1' - ' KOL:Line:1000_236' - ' NSB:Line:59'
Entur’s travel planer has a map of all stops used in Norway. Use the map to find the stops you’re interested in. When you have found one of your stops, click on it.
Now the web browser should contain a URL with the id in it. Such as this:
https://entur.no/nearby-stop-place-detail?id=NSR:StopPlace:32376
The stop id is the content after id= parameter in the URL. Copy paste this into the configuration.
Q: I have multiple stop ids and have added whitelisting of a line. Now some of the stop places are showing unknown .
A: A whitelisting of lines takes affect on all of the stops. So you have to whitelist all lines you are interested in on all stop places.
Q: I have added whitelisting of lines, and everything has worked as fine before, but now it has stopped updating all of a sudden.
A: Some transport companies, such as Kolumbus in Rogaland, have running numbers on the end of their line ids. These gets periodically updated and will make the whitelisting invalid. The new line ids needs to be added again. Most of the time it iterates by one.
Q: Where do I find a line id to add to the whitelisting?
A: The sensor will show the line id, and is the recommended way to find it, while we wait for ‘Nasjonalt Stoppestedregister’ to become public. It is also possible to see the line ids by using the developer tool in the browser while looking at the traffic in Entur’s travel planer .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Entur service was introduced in Home Assistant 0.84, and it's used by
284 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hfurubotten
@SanderBlom
Categories
Transport
Back to top
