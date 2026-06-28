# Rehlko - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rehlko
- Final URL: https://www.home-assistant.io/integrations/rehlko
- Canonical URL: https://www.home-assistant.io/integrations/rehlko/
- Fetched at: 2026-06-28T03:11:46Z
- Content type: text/html; charset=UTF-8

## Description

Support for Rehlko devices (formerly Oncue and Kohler Energy)

## Extracted Text

On this page
Configuration
Required manual input
Binary sensors
Sensors
Status sensors
Tested generators
Removing the integration
To remove an integration instance from Home Assistant
The Rehlko (formerly Kohler Energy Management) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor the status of your enabled Kohler generator through Home Assistant. This integration replaces the legacy Oncue integration.
To add the Rehlko hub to your Home Assistant instance, use this My button:
Rehlko can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Rehlko .
Follow the instructions on screen to complete the setup.
To configure a Rehlko (Kohler Energy Management) account, enter the following information:
email
The email used to log in to the Rehlko (Kohler Energy Management) application.
password
The password used to log in to the Rehlko (Kohler Energy Management) application.
The integration uses your generator’s name as the device name and within your entity names. To change this name, it is recommended to do so in the Kohler app before configuring the integration.
This integration provides the following binary sensors to help you keep track of your generator’s key states:
Auto run
Lets you know if your generator will automatically start when there is a power outage.
Connectivity
Shows whether your generator is currently connected to the Rehlko cloud.
Oil pressure
Monitors the oil pressure sensor. If this sensor is on , it means there is a problem with the oil pressure.
Load shed
Monitors load shedding status for managed loads. If this sensor is on , it means the load is being shed. Generators can manage up to 6 loads. Disabled by default.
The sensors exposed by this integration depend on the specific instrumentation installed on your generator and transfer switch. Sensor availability can vary significantly—even between units of the same model.
Status sensors provide information about the overall state of the generator.
Note: This list of values is not complete. If you observe new values, please report them by opening an issue.
Generator status
Provides the overall status of the generator.
Value Description ReadyToRun Generator is ready to run in case of a power outage. Running Generator is running. RunningExercise Generator is currently running its exercise program. Shutdown Generator is shut down due to a failure and will not run in case of a power outage. SwitchStateOff Generator is turned off and will not run in case of a power outage. Engine state
Provides the detailed engine state.
Value Description CrankOn Generator is currently cranking and trying to start up. Off Generator is turned off and will not run in case of a power outage. Running Generator is running. Standby Generator is ready to run in case of a power outage. Stopping Generator is stopping. PerformingFullSpeedDiagnostics Generator is running full speed diagnostics. PerformingUnloadedFullSpeedExercise Generator is running full speed exercise. PerformingVariableSpeedExercise Generator is running variable speed exercise. Power source
Provides an indication of power source for the home.
Value Description Generator Generator is providing power to the home. Utility Utility power is providing power to the home.
These are the generator models that have been tested:
38RCLB
26RCA
20RESA
20RCA
14RESA
30RCL
This integration follows the standard integration removal process; no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rehlko hub was introduced in Home Assistant 2025.5, and it's used by
143 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@peterager
Categories
Sensor
Back to top
