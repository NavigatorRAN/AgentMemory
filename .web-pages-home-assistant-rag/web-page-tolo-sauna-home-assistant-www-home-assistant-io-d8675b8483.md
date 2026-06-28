# TOLO Sauna - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tolo
- Final URL: https://www.home-assistant.io/integrations/tolo
- Canonical URL: https://www.home-assistant.io/integrations/tolo/
- Fetched at: 2026-06-28T03:22:59Z
- Content type: text/html; charset=UTF-8

## Description

Control your TOLO Sauna and Steam Bath with Home Assistant.

## Extracted Text

On this page
Prerequisites
Features
Sauna operating mode
Temperature and humidity
Light control
Fan control
Aroma therapy
Salt bath
Sweeping and descaling
Diagnostic information
Configuration
The TOLO Sauna integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Steamtec TOLO devices with Home Assistant.
To be able to connect to your TOLO system via Home Assistant, you need to have the TOLO App Control Box, which is also required to be able to control your TOLO system using your mobile phone.
Connect the TOLO App Control Box to your network.
For auto detection, your Home Assistant instance needs to be connected to the same network broadcast domain as your TOLO App Control Box (which is usually true for normal home networks).
However, you can also manually define the IP to which the Home Assistant TOLO integration should connect to.
Please use your router to find out the IP address of your TOLO App Control Box.
General notice:
A TOLO system can be equipped with many optional accessoires, such as lights , fans , aroma oil injectors , sole nebulizer and descaling pump .
The TOLO system does not report back which optional accessories are attached. Therefore, the TOLO integration always provides all possible entities even if the features are not available due to missing optional accessories.
The TOLO integration offers a climate entity to control the general operating mode of your TOLO system.
This can either be Off , Heat , or Dry .
Off : Energy is shut down, the water boiler is empty (or will be emptied soon, see Sweeping and Descaling ).
Heat : This is the normal operating mode for enjoying your sauna or steam bath.
If Power timer is set to a value greater than zero, the TOLO system will automatically turn off after the amount of minutes configured in the Power timer setting.
If Power timer is set to zero, the TOLO system will run indefinitely, until it is turned off manually.
Dry : In this mode, everything is turned off except the fan.
This mode can be used when shutting down the TOLO system to reduce humidity in the room.
After the time configured in Fan timer (see Fan Control ) has passed, the fan and the TOLO system will automatically turn to Off .
The TOLO system allows setting a target temperature between 35°C and 60°C.
The TOLO system will heat and continue to produce steam until the room temperature sensor reaches the configured target temperature.
Target humidity can be set between 60% and 99%.
Once the configured humidity is reached, the steam generator will stop producing steam.
If then the humidity is below 6% (this value is hardcoded by TOLO systems and cannot be changed by the TOLO integration), the TOLO system will start to produce steam again.
This setting is only recognized if the TOLO system is equipped with a humidity sensor (not part of the default configuration).
If no humidity sensor is present, steam production will only depend on the temperature.
The TOLO system allows you to connect RGB LEDs, which can be controlled by the TOLO integration.
The TOLO system provides two modes for LED operation, manual and automatic .
Manual : When turned on, the RGB LEDs will stick to the same color until it is manually changed by pressing the Next color button.
Automatic : When turned on, the RGB LEDs will slowly fade from one color to another.
The TOLO system allows you to connect a fan, which can be used to reduce the humidity after the steam generation has been turned off.
Once activated, the fan will automatically turn off between 1 and 60 minutes, depending on the Fan timer setting.
The TOLO system allows you to connect an aroma oil injector with slots for either one or two aroma flavors.
When enabled, the aroma pump will work every 5 minutes for 5 seconds each.
Unfortunately, the TOLO system does not allow you to change these intervals.
For shorter intervals between pump activations, the TOLO manual suggests to manually disable and enable Aroma therapy .
The TOLO system allows you to connect a sole nebulizer, which can be used to inject salt spray in your sauna or steam bath room to allow for a salt bath.
Using the Salt bath timer , the salt bath feature can be configured to run indefinitely (set Salt bath timer to 0) or for a pre-defined time between 1 and 60 minutes.
The TOLO system has a built-in system for sweeping and descaling.
This feature is currently not supported by the TOLO integration and will be added in an upcoming release.
Beside the controls described above, the TOLO integration provides following diagnostic information:
Power timer :
The remaining time the TOLO system will produce steam after it has been turned on.
Fan timer :
The remaining time the fan will be on after it has been turned on.
Salt bath timer :
The remaining time the salt bath will be active after it has been turned on.
Tank temperature :
Current temperature of the water in the water tank.
Should be close to 100°C when in Heat mode.
Water level :
The current water level in the water tank.
This should be 0% when off and 100% when in Heat mode.
Water in/out valves :
Indicates if the TOLO system currently lets water run in or out.
When starting up, Water in valve should be open while Water out valve should be closed.
During Heat operation, both valves should be normally closed except short moments where consumed water needs to be refilled.
When off, the Water out valve should remain open.
To add the TOLO Sauna device to your Home Assistant instance, use this My button:
TOLO Sauna can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select TOLO Sauna .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The TOLO Sauna device was introduced in Home Assistant 2021.12, and it's used by
9 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@MatthiasLohr
Categories
Climate
Health
Light
Back to top
