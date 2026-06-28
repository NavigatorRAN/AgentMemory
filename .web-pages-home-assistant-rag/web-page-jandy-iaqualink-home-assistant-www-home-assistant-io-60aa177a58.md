---
source_url: "https://www.home-assistant.io/integrations/iaqualink"
final_url: "https://www.home-assistant.io/integrations/iaqualink"
canonical_url: "https://www.home-assistant.io/integrations/iaqualink/"
source_handle: "web:www-home-assistant-io:60aa177a58f2"
source_section: "integrations-iaqualink"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a507c4beaa483fee54e8c1a983b57d21b4cb6abf48770f27790a3908a06f8bf1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Jandy iAquaLink - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iaqualink
- Final URL: https://www.home-assistant.io/integrations/iaqualink
- Canonical URL: https://www.home-assistant.io/integrations/iaqualink/
- Fetched at: 2026-06-28T02:51:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure Jandy iAquaLink integration.

## Extracted Text

On this page
Supported devices
Unsupported devices
Prerequisites
Configuration
Supported functionality
Entities
Examples
Preheat the spa on a schedule
Notify when freeze protection turns on
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Jandy iAquaLink integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you monitor and control supported Jandy pool and spa systems from Home Assistant. Depending on the equipment connected to your controller, you can check water and air temperatures, control auxiliary equipment like pumps and water features, manage compatible pool lights, and adjust supported pool or spa heaters.
Use case: Turn on your spa heater before you get home, automate pool lights at sunset, get notified when freeze protection activates, or add your pool equipment status to a dashboard so you can check it at a glance.
The integration supports pool and spa systems that are managed through the iAquaLink cloud service using one of the following platforms:
iAquaLink 2.0 (iQ20)
eXO
The entities that appear in Home Assistant depend on the equipment configured in your iAquaLink system. For example, if your system has a spa heater, pool lights, a cleaner, or a waterfall circuit, Home Assistant can create entities for those features.
Other iAquaLink systems are not supported. Equipment that is not exposed in the iAquaLink app or cloud service also cannot be added to Home Assistant.
Create an account and log in using either the iAquaLink app or the iAquaLink website .
Add your devices to the account you created in the previous step, typically using their serial numbers.
To add the Jandy iAquaLink hub to your Home Assistant instance, use this My button:
Jandy iAquaLink can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Jandy iAquaLink .
Follow the instructions on screen to complete the setup.
Username
The email address used to sign in to your account using the iAquaLink app or website.
Password
The password associated with your account.
The Jandy iAquaLink integration provides the following entities.
Binary sensors
Freeze protection
Description : Indicates whether the controller has enabled freeze protection.
Remarks : Only available on systems that expose freeze protection status.
Climate
Pool heater or spa heater
Description : Lets you turn a supported heater on or off and set the target water temperature.
Modes : Heat, Off
Remarks : Created only when your iAquaLink system exposes a controllable heater.
Lights
Pool and spa lights
Description : Lets you turn compatible lights on or off.
Remarks : Some lights also support brightness control or effect selection, depending on the hardware exposed by your iAquaLink system.
Sensors
Temperature sensors
Description : Report numeric values exposed by the controller, such as pool, spa, or air temperature.
Remarks : Temperature units follow the unit configured in your iAquaLink system.
Other numeric sensors
Description : Additional numeric readings may be available when your controller exposes them through the cloud service.
Switches
Auxiliary equipment
Description : Lets you turn supported auxiliary circuits on or off.
Examples : Filter pumps, cleaners, waterfalls, blowers, and other equipment connected to auxiliary relays.
Remarks : The exact switch entities depend on how your pool or spa system is configured.
Examples of automations you can create using the Jandy iAquaLink integration.
This automation turns on the spa heater and sets the target temperature every weekday afternoon.
This example assumes your iAquaLink system is configured to use degrees Fahrenheit.
Example YAML configuration
alias : " Preheat spa before evening" description : > Turn on the spa heater and set the target temperature every weekday afternoon. triggers : - trigger : time at : " 16:30:00" conditions : - condition : time weekday : - mon - tue - wed - thu - fri actions : - action : climate.set_temperature target : entity_id : climate.spa_heater data : hvac_mode : heat temperature : 100
This automation sends a notification when your controller activates freeze protection.
alias : " Notify when freeze protection starts" description : > Send a notification when the pool controller enables freeze protection. triggers : - trigger : state entity_id : binary_sensor.freeze_protection to : " on" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Pool freeze protection active" message : > The Jandy controller has enabled freeze protection.
This integration uses cloud polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] to refresh data from your iAquaLink system, like equipment status, sensor readings, and climate values. Home Assistant updates this data approximately every 15 seconds.
Only equipment exposed through the iAquaLink cloud service can be added to Home Assistant. The entities you see depend on the controller model and the pool or spa equipment configured in the iAquaLink app.
If you need support for another iAquaLink platform, please open a request in the iaqualink-py Python library repository .
Cannot sign in during setup
Symptom: Setup fails with an authentication or login error.
Make sure you can sign in to the iAquaLink website or the iAquaLink app with the same email address and password.
Check for extra spaces or typing mistakes in your email address and password.
If you recently changed your password, go to Settings > Devices & services , open the Jandy iAquaLink three-dots menu, and select Reconfigure .
Setup succeeds, but no systems or entities appear
Symptom: The integration is added, but no pool or spa system shows up in Home Assistant.
Confirm the equipment is listed in the iAquaLink app under the same account you used in Home Assistant.
Verify your system is in the list of supported systems.
If the account contains only unsupported systems, Home Assistant will not create any devices or entities.
Some equipment is missing
Symptom: Your pool or spa system is added, but one or more expected entities are missing.
Open the iAquaLink app and confirm the missing equipment is visible and controllable there.
The integration only creates entities for equipment exposed by the iAquaLink cloud service.
Go to Settings > Devices & services , select Jandy iAquaLink , and reload the integration after making changes in the manufacturer’s app.
Entities become unavailable
Symptom: One or more iAquaLink entities show as unavailable.
Check that Home Assistant has internet access.
Open the iAquaLink app or website and verify the controller is online.
If the iAquaLink service is unavailable, wait a few minutes and reload the integration.
Enable debug logging
If you need more detail in the logs, add the following to your YAML configuration:
logger : default : info logs : iaqualink : debug homeassistant.components.iaqualink : debug
After reproducing the issue, check the logs for the integration.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Jandy iAquaLink hub was introduced in Home Assistant 0.99, and it's used by
904 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@flz
Categories
Binary sensor
Light
Sensor
Switch
Back to top
