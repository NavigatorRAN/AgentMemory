# WattTime - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/watttime
- Final URL: https://www.home-assistant.io/integrations/watttime
- Canonical URL: https://www.home-assistant.io/integrations/watttime/
- Fetched at: 2026-06-28T03:27:53Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the WattTime integration within Home Assistant.

## Extracted Text

On this page
Registering an account
Configuration
Sensors
The WattTime integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows users to get real-time emissions data for a latitude/longitude from WattTime .
You need a WattTime account before you can set up this integration. Registration is done via the WattTime API . The simplest way to register is by using cURL on the command line:
curl -X "POST" "https://api.watttime.org/register" \ -H 'Content-Type: application/json' \ -d '{
"username": "<USERNAME>",
"password": "<PASSWORD>",
"email": "<EMAIL>",
"org": "<ORG>"
}'
The org value can be anything you like. It does not need to represent a real organization.
To add the WattTime service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select WattTime .
Follow the instructions on screen to complete the setup.
Note
The sensors available to you will depend on the type of WattTime subscription you have. You can reach out to WattTime to upgrade your subscription via their website .
Name Subscription Level Meaning Marginal Operating Emissions Rate Pro The currently measured amount of lbs of CO2 per MWh Relative Marginal Emissions Intensity All A percentage between the lowest (cleanest) and highest (highest) MOER values observed in the past two weeks
You can learn more about the data that WattTime collects in the WattTime API documentation and on the WattTime solutions page .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The WattTime service was introduced in Home Assistant 2021.10, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Energy
Environment
Sensor
Back to top
