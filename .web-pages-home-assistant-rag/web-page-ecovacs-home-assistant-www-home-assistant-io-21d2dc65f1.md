# Ecovacs - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ecovacs
- Final URL: https://www.home-assistant.io/integrations/ecovacs
- Canonical URL: https://www.home-assistant.io/integrations/ecovacs/
- Fetched at: 2026-06-28T02:39:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Ecovacs vacuums and mowers within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Provided entities
Vacuum
Integration lifespan
Handling errors
Getting device and chargers coordinates
Self-hosted configuration
Troubleshooting
Your device is not supported?
Removing the integration
To remove an integration instance from Home Assistant
The Ecovacs integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates Ecovacs robotic vacuum cleaners and lawn mowers.
This is for the “Deebot” series of robotic vacuum cleaners and the “GOAT” series of robotic lawn mowers from Ecovacs.
Note that Ecovacs also has other types of cleaning robots that are not supported by this integration.
You will need your Ecovacs account information (username and password) to discover and control vacuums and mowers in your account. Your username is the same as your email address.
Additional note: There are some issues with password encoding. Using some special characters, for example - and ? , in your password may not work.
To add the Ecovacs hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ecovacs .
Follow the instructions on screen to complete the setup.
During setup, you can choose to use a self-hosted instance over the cloud servers. Self-hosting comes with some requirements and limitations. See Self-hosted configuration for additional details.
The Ecovacs integration provides a vacuum entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for each device that is connected to your Ecovacs account.
Using the vacuum entity, you can monitor and control your Ecovacs Deebot vacuum.
Additionally, depending on your model , the integration provides the following entities:
Binary sensor :
Mop attached : On if the mop is attached. Note: If you do not see the state change to Mop attached in Home Assistant, you may need to wake up the robot to push the state change. Some models report an entity state change only if the overall status of the vacuum has changed. For example, if the overall state changes from docked to cleaning .
Button :
Reset lifespan : For each supported component, a button entity to reset the lifespan will be created. All disabled by default.
Relocate : Button entity to trigger manual relocation.
Station actions : For each supported station action, a button entity will be created.
Event :
Last job : Provides the stop reason as event_type
Image :
Map : The floorplan/map as an image in SVG format.
Number :
Clean count : Set the number of times to clean the area.
Cut direction : Set the mower cutting direction (from 0 to 180 degrees).
Volume : Set the volume.
Water level : Set a precise water level used during cleaning with the mop.
Select :
Active map : Select the active map. The ID will be shown when the map has no name.
Water level : Choose from predefined water levels used during cleaning with the mop.
Work mode : Specify the mode, how the bot should clean.
Sensor :
Auto-empty frequency : The frequency of emptying the bot dust bin during cleaning.
Error : The error code and a description of the error. 0 means no error. Disabled by default.
Lifespan : For each supported component, an entity with the remaining lifespan will be created.
Network : The following network related entities will be created. All disabled by default.
Ip address
Wi-Fi RSSI
Wi-Fi SSID
Cleaning cycle :
Area : The cleaned area
Time : The cleaned time
Station state : Station state enum sensor. See options to see all possible states
Total statistics : Updated after each cleaning cycle:
Area : Total cleaned area
Cleanings : The number of cleanings
Time : The total cleaning time
Switch :
Advanced mode : Enable advanced mode. Disabled by default.
Border spin : Enable border spin, which means the bot will tilt to reach corners during mopping. Present on bots without an extendable mop. Disabled by default.
Border switch : Enable border switch. Disabled by default.
Carpet auto fan speed boost : Enable maximum fan speed if a carpet is detected. Disabled by default.
Child lock : Enable child lock. Disabled by default.
Move up warning : Enable device move up warning. Disabled by default.
Cross map border warning : Enable warning for crossing the map border. Disabled by default.
Continuous cleaning : Enable continuous cleaning, which means the bot resumes the cleaning job if he needs to charge in between. Disabled by default.
Safe protect : Enable “Safe protect” feature. Disabled by default.
True detect : Enable “True detect” feature. Disabled by default.
The ecovacs vacuum platform allows you to monitor and control your Ecovacs Deebot vacuums.
The remaining lifespan of components on your Deebot vacuum will be reported as attributes on the vacuum entity. The value will be a whole number representing the percentage of life remaining.
Here’s an example of how to extract the filter’s lifespan to its own sensor using a template sensor :
# Example configuration.yaml entry template : - sensor : - name : " Vacuum Filter Remaining Lifespan" unit_of_measurement : " %" state : " {{ state_attr('vacuum.my_vacuum_id', 'component_filter') }}"
Or, if you want a simple binary sensor that becomes On when the filter needs to be replaced (5% or less):
# Example configuration.yaml entry template : - binary_sensor : - name : " Vacuum Filter" device_class : problem state : " {{ state_attr('vacuum.my_vacuum_id', 'component_filter') <= 5 }}"
The vacuum entity has an error attribute that will contain the most recent error message that came from the vacuum. There is not a comprehensive list of all error messages, so you may need to do some experimentation to determine the error messages that your vacuum can send.
If the vacuum fires a “no error” event, the error attribute will change back to None . Note, however, that this does not happen for all types of errors.
Alternatively, you can use the ecovacs_error event to watch for errors. This event will contain a data payload that looks like:
{ "entity_id" : "vacuum.deebot_m80" , "error" : "an_error_name" }
Finally, if a vacuum becomes unavailable (usually due to being idle and off its charger long enough for it to completely power off,) the vacuum’s status attribute will change to offline until it is turned back on.
The integration has a raw_get_positions action to retrieve device and chargers coordinates.
Example:
action : ecovacs.raw_get_positions target : entity_id : vacuum.deebot_n8_plus
Action response example
The action returns a raw response with a list of coordinates available in `resp -> body -> data` like this:
vacuum.deebot_n8_plus : ret : ok resp : header : pri : 1 tzm : 480 ts : " 1717748487712" ver : 0.0.1 fwVer : 1.2.0 hwVer : 0.1.1 body : code : 0 msg : ok data : deebotPos : x : 1 y : 5 a : 85 invalid : 0 chargePos : - x : 5 y : 9 a : 85 t : 1 invalid : 0 mid : " 200465850" id : 5o81 payloadType : j
Depending on your setup of the self-hosted instance, you can connect to the server using the following settings:
Username : Enter the email address configured in your instance. If authentication is disabled, you can enter any valid email address.
Password : Enter the password configured in your instance. If authentication is disabled, you can enter any string (series of characters).
REST URL : http:// SELF_HOSTED_INSTANCE :8007
MQTT URL : mqtts:// SELF_HOSTED_INSTANCE :8883
Verify MQTT SSL certificate : disabled
Replace SELF_HOSTED_INSTANCE with either the IP address or the hostname of your instance.
The above configuration is based on the information from Bumper’s documentation .
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue re-occurs stop the debug logging again ( download of debug log file will start automatically ). Further if still possible , please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
Because Ecovacs doesn’t provide a public documentation about their APIs, the support of devices is based on reverse engineering of the communication of the device. This reverse engineering can only be done by persons, who are in possession of such a device and the knowledge how to do the reverse engineering. Therefore the support of devices heavily depends on contributions from the community.
If your device is not supported, please request for help or contribute on your own the support of your device directly to the deebot_client library.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ecovacs hub was introduced in Home Assistant 0.77, and it's used by
2.2% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mib1185
@edenhaus
@Augar
Categories
Hub
Lawn mower
Back to top
