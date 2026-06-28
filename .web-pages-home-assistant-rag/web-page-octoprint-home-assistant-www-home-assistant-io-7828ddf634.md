# OctoPrint - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/octoprint
- Final URL: https://www.home-assistant.io/integrations/octoprint
- Canonical URL: https://www.home-assistant.io/integrations/octoprint/
- Fetched at: 2026-06-28T03:05:02Z
- Content type: text/html; charset=UTF-8

## Description

Integration between OctoPrint and Home Assistant.

## Extracted Text

On this page
Configuration
API key
Binary sensor
Sensor
Camera
Buttons
Number
List of actions
Troubleshooting
Device is already configured for a second instance
OctoPrint is a web interface for your 3D printer. This is the main integration to integrate OctoPrint sensors.
To add the OctoPrint service to your Home Assistant instance, use this My button:
OctoPrint can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OctoPrint .
Follow the instructions on screen to complete the setup.
username
Username for the server.
host
Address of the server, e.g., 192.168.1.32 .
port
Port of the server.
path
URL path of the server
ssl
Whether to use SSL or not when communicating.
verify ssl
Should the SSL certificate be validated.
For the integration to work, please check that in Octoprint, the Discovery Plugin is enabled and in the Settings > Printer Notifications menu that Enable popups is checked.
The Octoprint integration will attempt to register itself via the Application Keys Plugin . After submitting the configuration UI in Home Assistant, log in to Octoprint as the user whose credentials you just entered in Home Assistant, and select Allow on the prompt.
NOTE: You must be logged into Octoprint as the user which you are adding to Home Assistant. If you log in to Octoprint as any other user, you will not see the prompt to allow access.
The OctoPrint integration provides the following binary sensors:
Printing
Print Error
The OctoPrint integration lets you monitor various states of your 3D printer and its print jobs.
Supported sensors:
Actual Bed Temperature
Actual Tool (Nozzle) Temperature
Current Printer State
Estimated Finish Time
Job Completed Percentage
Estimated Start Time
Target Bed Temperature
Target Tool (Nozzle) Temperature
Current File Name
Current File Size
The OctoPrint integration provides a camera feed if one is configured in OctoPrint.
The OctoPrint integration provides the following buttons:
Pause Job
Reboot System
Restart Octoprint
Resume Job
Shutdown System
Stop Job
The OctoPrint integration lets you set target bed and tool temperature. These writable properties return the same data as Target Temperature sensors, and additionally allow changing Target Temperature from automation, scripts, or entities card interaction.
Set Target Bed Temperature
Set Target Tool (Nozzle) Temperature
The OctoPrint integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Connect to a printer ( octoprint.printer_connect )
Instructs the OctoPrint server to connect to a printer.
For an overview of every action across all integrations, see the actions reference .
This is typically caused by copying/backup/restoring part of the config files between OctoPrint instances.
SSH into the OctoPrint instance that is being added.
Edit the config.yaml for the instance (Typically /home/pi/.octoprint )
Under plugins/discovery , change the value of upnpUuid to have a different uuid.
Restart the OctoPrint service
Attempt to add the instance once again.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OctoPrint service was introduced in Home Assistant 0.19, and it's used by
1.7% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rfleming71
Categories
3D printing
Button
Back to top
