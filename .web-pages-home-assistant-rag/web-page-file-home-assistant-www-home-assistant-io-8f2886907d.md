# File - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/file
- Final URL: https://www.home-assistant.io/integrations/file
- Canonical URL: https://www.home-assistant.io/integrations/file/
- Fetched at: 2026-06-28T02:42:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate sensors which read from files into Home Assistant.

## Extracted Text

On this page
Configuration
List of actions
Notifications
Sensor
Examples
Related topics
The File integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows storing notifications in a file or setting up a sensor based on a file’s content.
This integration is enabled by default, unless you’ve disabled or removed the default_config: line from your configuration. If that is the case, the following example shows you how to enable this integration manually:
# Basic configuration.yaml entry file :
To add the File integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select File .
Follow the instructions on screen to complete the setup.
The File integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Read file ( file.read_file )
Reads a file and returns its contents in a response.
For an overview of every action across all integrations, see the actions reference .
Make sure that the file you want to use is added to the allowlist_external_dirs . The file will be created if it doesn’t exist, but make sure the folder exists. Add the path of your configuration folder (for example, /config/file_notifications ) to save the file there. Setting timestamp to true adds a timestamp to every logged entry.
After creating a config entry, you can change the entry name, the name of the notify entity, or the entity ID, if you prefer.
To use notifications in automations or scripts, see the getting started with automation page .
Use the notify.send_message action to store notification messages.
The file sensor platform reads the entries from a plain-text file and shows the found value. Only the last line of the file is used. This is similar to do $ tail -n 1 sensor.txt on the command-line. Note that file paths must be added to allowlist_external_dirs .
In this section you find some real-life examples of how to use this sensor.
Entries as JSON
Assuming that the log file contains multiple values formatted as JSON as shown below:
[...]
{"temperature": 21, "humidity": 39}
{"temperature": 22, "humidity": 36}
This would require the following settings to extract the temperature:
Name: Temperature
File path: /config/sensor.json
Value template: {{ value_json.temperature }}
Unit of measurement: "°C"
Entries as CSV
Assuming the log file contains multiple values formatted as CSV as shown below:
timestamp,temperature,humidity
1631472948,21,39
1631472949,22,36
File path: /config/sensor.csv
Value template: {{ value.split(",")[1] }}
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The File integration was introduced in Home Assistant pre 0.7, and it's used by
1% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
Categories
Utility
Back to top
