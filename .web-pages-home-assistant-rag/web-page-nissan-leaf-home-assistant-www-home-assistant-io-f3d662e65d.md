# Nissan Leaf - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nissan_leaf
- Final URL: https://www.home-assistant.io/integrations/nissan_leaf
- Canonical URL: https://www.home-assistant.io/integrations/nissan_leaf/
- Fetched at: 2026-06-28T03:03:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions for how to integrate Nissan Leaf(s) into Home Assistant.

## Extracted Text

On this page
Configuration
Full configuration sample
Starting a Charge
Updating on-demand using Automation
Hints
Related topics
The Nissan Leaf integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers integration with the NissanConnect EV cloud service. NissanConnect EV was previously known as Nissan Carwings.
Important
Please be aware that the nissan_leaf integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] only works with Nissan vehicles from before 2019. Newer vehicles will not work with this integration.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offers:
sensors for the battery status, range and charging status.
a switch to start and stop the climate control.
a button to request the car starts charging.
action to request updates from the car.
To use Nissan Leaf in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry nissan_leaf : username : " YOUR_USERNAME" password : " YOUR_PASSWORD" region : " YOUR_REGION"
Configuration Variables
Looking for your configuration file?
username string Required
The username associated with your NissanConnect EV account. Enclose in quotes.
password string Required
The password for your given NissanConnect EV account. Enclose in quotes.
region string Required
The region where the NissanConnect EV account is registered. Should be one of the following, NE (for Europe), NNA (USA), NCI (Canada), NMA (Australia), NML (Japan).
update_interval time ( Optional , default: 1 hour )
The interval between updates if the climate control is off and the car is not charging. Set in any time unit (e.g., minutes, hours, days!). Providing a low interval will cause the service to refresh more frequently and can negatively impact your 12V battery.
update_interval_charging time ( Optional , default: 15 )
The interval in minutes between updates if charging.
update_interval_climate time ( Optional , default: 5 )
The interval in minutes between updates if climate control on.
A more advanced example for setting the update interval:
# Example configuration.yaml entry nissan_leaf : username : " YOUR_USERNAME" password : " YOUR_PASSWORD" region : " YOUR_REGION" update_interval : hours : 1 update_interval_charging : minutes : 15 update_interval_climate : minutes : 5 force_miles : true
You can use the button.press action to send a request to the Nissan servers to start a charge. The car must be plugged in!
- action : button.press target : entity_id : button.start_NICKNAME_charging # replace
You can also use the nissan_leaf.update action to request an on-demand update. To update almost exclusively via the action set the update_interval to a high value in the integration configuration. The action requests the VIN number as described above.
- id : update_when_driver_not_home alias : " Update when driver not home" initial_state : on triggers : - trigger : time_pattern minutes : " /30" conditions : - condition : state entity_id : device_tracker.drivername # replace state : " not_home" actions : - action : nissan_leaf.update data : vin : " 1HGBH41JXMN109186" # replace
The update interval has a minimum of two minutes.
Requesting updates uses a small amount of energy from the 12 V battery. The 12 V battery charges from the main traction battery when the car is not plugged in. If the car is left plugged in for a long time, or if the main traction battery is very low then the 12 V battery may gradually discharge. A low update interval may cause the 12 V battery to become flat. When the 12 V battery is flat the car will not start. Do not set the update interval too low. Use at your own risk.
This integration communicates with the Nissan Servers which then communicate with the car. The communication between the car and the Nissan Servers is very slow, and takes up to five minutes to get information from the car, therefore the default polling interval is set to one hour to not overwhelm the connection.
Responses from the Nissan servers are received separately for the battery/range, climate control, and location. The updated_on attribute will show the last time the data was retrieved from the server. There are separate attributes for when the next_update is scheduled and for indicating if update_in_progress . The nissan_leaf.update action will reset the next_update attribute.
The Nissan APIs do not allow charging to be stopped remotely.
The Nissan servers have a history of being unstable, therefore please confirm that the official Nissan Leaf app/website is working correctly before reporting bugs.
In the UK the cut-off for Carwings was the 16 plate 24 kWh and the 65 plate 30 kWh. Cars after this have NissanConnect.
As of 25 July 2019 the MyCarFinder API is not longer available, hence the device_tracker support has been removed.
Please report bugs using the following logger configuration.
logger : default : critical logs : homeassistant.components.nissan_leaf : debug homeassistant.components.binary_sensor.nissan_leaf : debug homeassistant.components.button.nissan_leaf : debug homeassistant.components.sensor.nissan_leaf : debug homeassistant.components.switch.nissan_leaf : debug
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nissan Leaf integration was introduced in Home Assistant 0.89, and it's used by
100 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@filcole
Categories
Car
Back to top
