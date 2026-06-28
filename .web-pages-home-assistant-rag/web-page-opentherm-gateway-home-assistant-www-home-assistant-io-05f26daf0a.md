---
source_url: "https://www.home-assistant.io/integrations/opentherm_gw"
final_url: "https://www.home-assistant.io/integrations/opentherm_gw"
canonical_url: "https://www.home-assistant.io/integrations/opentherm_gw/"
source_handle: "web:www-home-assistant-io:05f26daf0adf"
source_section: "integrations-opentherm-gw"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ccac47e68ed9ed324194b2d3aae734a24ecb75300f70d025547d208ebc5b6116"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# OpenTherm Gateway - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/opentherm_gw
- Final URL: https://www.home-assistant.io/integrations/opentherm_gw
- Canonical URL: https://www.home-assistant.io/integrations/opentherm_gw/
- Fetched at: 2026-06-28T03:06:17Z
- Content type: text/html; charset=UTF-8

## Description

Control your OpenTherm Gateway from Home Assistant.

## Extracted Text

On this page
Configuration
Entities
Button
Select
List of actions
GPIO modes
LED modes
Disabled configuration entities
The OpenTherm Gateway integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used to control the OpenTherm Gateway from Home Assistant.
This integration will add three devices to Home Assistant for each configured gateway. The main control of the integration is a single climate entity which can be found on the added OpenTherm Thermostat device. All added devices have a collection of sensor and binary_sensor entities, which are disabled by default. To enable them, follow the steps on enabling entities .
Note
The OpenTherm protocol is based on polling. The thermostat sends requests to the boiler at specific intervals. As a result, it may take some time for changes to propagate between Home Assistant and the thermostat.
To add the OpenTherm Gateway device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OpenTherm Gateway .
Follow the instructions on screen to complete the setup.
The following configuration options are available:
name
The friendly name used for the OpenTherm Gateway and its entities. This is used to generate the display name of the created device and all related entities.
Examples: Thermostat , Living Room
path or url
Path to the OpenTherm Gateway device as supported by PySerial . This is usually either a path to a serial device in /dev/ if the gateway is connected via serial or USB, or a URL in the form of socket://[IP address]:[port] if it is connected over the network.
Examples: /dev/ttyUSB0 , socket://192.168.0.250:25238
id
The gateway_id for this OpenTherm Gateway. This is used to identify this specific gateway in action and to generate the entity IDs for the entities related to this gateway. The entered value will be slugified, that is, all spaces and special characters will be converted to underscores and any accents will be removed from their characters. The default value is the slugified version of the name given above.
Examples: thermostat , living_room
Important
Please make sure no other device or application is connected to the OpenTherm Gateway at the same time as Home Assistant. This is not a supported scenario and may lead to unexpected results.
The precision and floor_temperature settings that were supported in configuration.yaml entries have been lost upon import of the configuration.yaml entry into the Integrations panel. You can now configure them as per the following Options paragraph.
Options
The OpenTherm Gateway can be further configured through the integration settings in the web interface.
The following options are available:
Read Precision
The desired read precision for this device. Used to display the current temperature on the climate entity. Can be used to match your actual thermostat’s precision. Set to 0 to use the default value for your unit preference.
Set Precision
The desired set precision for this device. Used as step size for setting temperature setpoint from the climate entity. Can be used to match your actual thermostat’s precision. Set to 0 to use the default value for your unit preference.
Temporary Setpoint Override Mode
The desired setpoint override mode. When Temporary Setpoint Override Mode is set to on, the thermostat will be able to cancel the setpoint override after a program change. When the option is set to off, the Setpoint Override Mode will be ‘Constant’ and a manual temperature adjustment on the thermostat is needed to cancel the setpoint override.
Floor Temperature
Some thermostats round all temperatures down to the lower value according to their precision. Default behavior for Home Assistant is to round temperatures to the nearest value. Enable this setting to override this behavior and round to the lower value according to the configured precision.
The integration adds the following buttons to your Home Assistant instance:
Cancel Room Setpoint Override
Pressing this button, which can be found on the OpenTherm Thermostat device, cancels an active room setpoint override. Note that it does not change the target temperature, it only returns control to the thermostat.
Restart
The restart button on the OpenTherm Gateway device can be used to restart the OpenTherm Gateway.
Several select configuration entities can be found on the OpenTherm Gateway device. These can be used to configure the LEDs and GPIO pins of the OpenTherm Gateway. More information about the available modes can be found in the sections LED modes and GPIO modes or in the commands documentation of the OpenTherm Gateway.
The OpenTherm Gateway integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reset gateway ( opentherm_gw.reset_gateway )
Resets the OpenTherm Gateway.
Send transparent command ( opentherm_gw.send_transparent_command )
Sends a custom OpenTherm Gateway command through a transparent interface.
Set central heating override ( opentherm_gw.set_central_heating_ovrd )
Sets the central heating override option on the gateway.
Set clock ( opentherm_gw.set_clock )
Sets the clock and day of the week on the connected thermostat.
Set control setpoint ( opentherm_gw.set_control_setpoint )
Sets the central heating control setpoint override on the gateway.
Set GPIO mode ( opentherm_gw.set_gpio_mode )
Changes the function of the GPIO pins of the gateway.
Set hot water override ( opentherm_gw.set_hot_water_ovrd )
Sets the domestic hot water enable option on the gateway.
Set hot water setpoint ( opentherm_gw.set_hot_water_setpoint )
Sets the domestic hot water setpoint on the gateway.
Set LED mode ( opentherm_gw.set_led_mode )
Changes the function of the LEDs of the gateway.
Set max modulation ( opentherm_gw.set_max_modulation )
Overrides the maximum relative modulation level on the gateway.
Set outside temperature ( opentherm_gw.set_outside_temperature )
Provides an outside temperature to the thermostat.
Set setback temperature ( opentherm_gw.set_setback_temperature )
Configures the setback temperature used with the GPIO home and away modes.
For an overview of every action across all integrations, see the actions reference .
Possible modes and their meaning for the GPIO pins are listed here:
0. Input - default for both ports on a freshly flashed chip.
1. Ground - A permanently low output (0V). Could be used for a power LED.
2. Vcc - A permanently high output (5V). Can be used as a short-proof power supply for some external circuitry used by the other GPIO port.
3. LED E - An additional LED if you want to present more than 4 LED functions.
4. LED F - An additional LED if you want to present more than 5 LED functions.
5. Home - Set thermostat to setback temperature when pulled low.
6. Away - Set thermostat to setback temperature when pulled high.
7. DS1820 (GPIO port B only) - Data line for a DS18S20 or DS18B20 temperature sensor used to measure the outside temperature. A 4k7 resistor should be connected between GPIO port B and Vcc.
Possible LED modes and their meaning are listed here:
R. Receiving an OpenTherm message from the thermostat or boiler.
X. Transmitting an OpenTherm message to the thermostat or boiler.
T. Transmitting or receiving a message on the thermostat interface.
B. Transmitting or receiving a message on the boiler interface.
O. Remote setpoint override is active.
F. Flame is on.
H. Central heating is on.
W. Hot water is on.
C. Comfort mode (Domestic Hot Water Enable) is on.
E. Transmission error has been detected.
M. Boiler requires maintenance.
P. Raised power mode active on thermostat interface.
Warning
Please read this information from the designer of the OpenTherm Gateway before considering using the information in this section.
For advanced control of your heating system, some switch configuration entities can be found on the added OpenTherm Gateway device.
These entities are disabled by default, as they can cause your heating system to run continuously and/or increase your energy consumption significantly if used improperly. In most setups, these entities are not needed and should be left disabled.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenTherm Gateway device was introduced in Home Assistant 0.81, and it's used by
358 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mvn23
Categories
Binary sensor
Climate
Hub
Sensor
Back to top
