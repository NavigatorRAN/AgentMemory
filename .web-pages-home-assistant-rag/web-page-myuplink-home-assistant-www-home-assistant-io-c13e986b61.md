---
source_url: "https://www.home-assistant.io/integrations/myuplink"
final_url: "https://www.home-assistant.io/integrations/myuplink"
canonical_url: "https://www.home-assistant.io/integrations/myuplink/"
source_handle: "web:www-home-assistant-io:c13e986b61e8"
source_section: "integrations-myuplink"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ac4b00d57cedcbd5be2d84d099e2f531e4c4d873a0f27b5765ae51b7de784672"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# myUplink - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/myuplink
- Final URL: https://www.home-assistant.io/integrations/myuplink
- Canonical URL: https://www.home-assistant.io/integrations/myuplink/
- Fetched at: 2026-06-28T03:02:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the myUplink integration within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported heat-pump systems
Use cases
Example
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related links
The myUplink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you get information about and control heat-pump devices supporting myUplink using the official cloud API .
The integration will connect to your account and download all available data from the API. The downloaded information will be used to create devices and entities in Home Assistant. There can be from a few entities up to many hundreds depending on the type of equipment. The integration will make the best effort to map the data-points in the API to sensors, switches, number, and select entities.
Note
You may need a valid subscription with myUplink to control your equipment with switch, select, and number entities.
Visit https://myuplink.com/register and sign up for a user account.
Go to Applications , and register a new App:
Application Name : Home Assistant (or whatever name makes sense to you)
Description : A brief description of how you’ll use this application (e.g., “Home Assistant integration for controlling my heat pump”)
Callback URL : https://my.home-assistant.io/redirect/oauth
I have manually disabled My Home Assistant
If you don’t have My Home Assistant on your installation,
you can use <HOME_ASSISTANT_URL>/auth/external/callback as the redirect URI
instead.
The <HOME_ASSISTANT_URL> must be the same as used during the configuration/
authentication process.
Internal examples: http://192.168.0.2:8123/auth/external/callback , http://homeassistant.local:8123/auth/external/callback .”
To add the myUplink hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select myUplink .
Follow the instructions on screen to complete the setup.
The integration configuration will require the Client ID and Client Secret created above. See Application Credentials for more details.
The integration supports all heat-pump devices that can be connected to the myUplink cloud service. See Works with myUplink .
However, the representation in Home Assistant depends on how and to what extent the manufacturer has implemented the service.
Common use cases include:
System Monitoring : Display the current operation state of the pump (heating house, pool, or hot water)
Smart Notifications : Get alerts when the water temperature is low in the heater tank
Automation : Adjust the temperature curve offset during holiday mode
Analytics : View long-term statistics and graphs for the relevant sensors
Automation that will send a notification to a smartphone when the hot water reserve is getting low. In this example a temperature below 42°C in the middle of the water tank will trigger the notification. Note that actual entity name varies between models of heat pumps. You will have to adapt the yaml code to your own installation.
automation : - alias : " Notify on low hot water reserve" triggers : - trigger : numeric_state entity_id : - sensor.your_pump_hot_water_charging_bt6 below : 42 actions : - action : notify.send_message target : entity_id : notify.my_device data : message : " Hot water reserve is getting low." title : " Water heater"
The integration will poll the API for data every 60 seconds. This polling interval is designed to work within the rate limits of myUplink APIs while providing timely updates.
The integration makes the best effort to map data-points from the API to relevant entities in Home Assistant. However, some sensors may not appear for certain heat-pump models, or in other cases, numerous irrelevant entities might be created. Please create an issue on GitHub and include a diagnostic download file from your installation if you believe that the mapping can be improved.
Entity names are available in English and cannot be automatically translated by Home Assistant. The reason is that the names are defined by the API and can be changed by updates of the API or the firmware in the appliance. However, most entity names are self-explanatory, e.g., “Room temperature (BT50)”.
Can’t log in to myUplink API
Make sure that you have entered the application credentials correctly. A common problem is that leading or trailing spaces are included in the entered credential strings. You may have to delete the application credentials from Home Assistant and install the integration again to get everything right.
After removing the integration, go to the myUplink developer site and remove the credentials unless you will use them again.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
myUplink web portal
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The myUplink hub was introduced in Home Assistant 2024.2, and it's used by
1329 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pajzo
@astrandb
Categories
Binary sensor
Number
Select
Sensor
Switch
Update
Back to top
