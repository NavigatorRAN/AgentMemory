# PECO Outage Counter - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/peco
- Final URL: https://www.home-assistant.io/integrations/peco
- Canonical URL: https://www.home-assistant.io/integrations/peco/
- Fetched at: 2026-06-28T03:07:34Z
- Content type: text/html; charset=UTF-8

## Description

Get how many outages are in your county

## Extracted Text

On this page
Configuration
Available entities
PECO is a public utility company that provides electricity to the Philadelphia metro.
To learn more about PECO, visit their about page .
Note
This integration is only for PECO customers. To see if your county is supported, take a look at their outage map .
PECO Is a registered trademark of Exelon Business Services Co., LLC
To add the PECO Outage Counter service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select PECO Outage Counter .
Follow the instructions on screen to complete the setup.
The PECO Outage Counter integration allows you to get the current count of power outages for any county, and the total for the operating region too.
Outage Count : This will return the current number of outages of a county or the entire operating region.
Smart Meter : This can use the smart meter functionality of select meters to verify that power is being delivered to your home.
This integration will create the following 6 entities:
A sensor that shows how many outages are in your county.
A sensor that shows the total amount of customers with no power.
A sensor that shows the total amount of customers served in the county.
A sensor that shows the percentage of customers with no power.
A sensor that shows the alert that appears when you open the online outage map.
A binary sensor that returns the state of your meter.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The PECO Outage Counter service was introduced in Home Assistant 2022.4, and it's used by
37 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@IceBotYT
Categories
Sensor
Back to top
