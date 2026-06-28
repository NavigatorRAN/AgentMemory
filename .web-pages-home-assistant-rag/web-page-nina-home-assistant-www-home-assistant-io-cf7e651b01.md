# NINA - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nina
- Final URL: https://www.home-assistant.io/integrations/nina
- Canonical URL: https://www.home-assistant.io/integrations/nina/
- Fetched at: 2026-06-28T03:03:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up NINA warnings in Home Assistant.

## Extracted Text

On this page
Configuration
Options
Filter
Headline blocklist
Affected area filter
Supported functionality
Sensors
Binary sensors
Attributes
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The NINA integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] displays warnings from the Bundesamt für Bevölkerungsschutz und Katastrophenhilfe in Germany.
For each county/city it creates warning slots that change to Unsafe when warnings are present. The details of the warning are provided in separate entities.
To add the NINA service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select NINA .
Follow the instructions on screen to complete the setup.
City/county
City/county to receive warnings for. Grouped for better searchability.
Maximum warnings
Maximum warnings fetched per city/county
Whitelist regex to filter warnings based on affected areas. For details see below.
Blacklist regex to filter warning based on headlines. For details see below.
To define options for NINA, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of NINA are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
The integration includes the possibility to filter warnings in two ways via a regex.
Note
All filters are applied to lowercase text only.
This blocklist filters warnings based on the headline. In other words, if the regular expression matches the headline of the warning, the warning will be ignored .
Default: Match nothing ( /(?!)/ )
Example
Ignore warnings that contain the word corona
Regex: .*corona.*
Headline: corona-verordnung des landes: warnstufe durch landesgesundheitsamt ausgerufen
This filter whitelists warnings based on the affected area. In other words, if the regular expression matches the area, the warning will be displayed .
Default: Match all ( .* )
Show only warnings from the city of nagold.
Regex: .*nagold.*
Areas: gemeinde oberreichenbach, gemeinde neuweiler, stadt nagold
This integration provides the following entities for each warning slot.
Affected areas :
Description : Areas affected by the warning.
Remarks : Shortened to 250 chars. To get all areas please use the nina.get_affected_areas action.
Expires :
Description : Expiration timestamp of the warning.
Headline :
Description : Headline of the warning.
More information URL :
Description : URL with further information about the warning.
Sender :
Description : Sender of the warning.
Sent :
Description : Transmission timestamp of the warning.
Severity :
Description : Severity of the warning.
Options : Extreme, Severe, Moderate, Minor, Unknown
Start :
Description : Starting timestamp of the warning.
Warning :
Description : Presence of a warning.
Attributes : Available attributes are listed below.
The following attributes are available for the warnings.
Attributes :
id : Individual ID for each warning.
Response data
The response data is a string with the description as provided by NINA.
The integration checks for warnings every 5 minutes.
This integration may only work with an Internet connection that supports IPv4.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NINA service was introduced in Home Assistant 2022.2, and it's used by
1.2% of the active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@DeerMaximum
Categories
Binary sensor
Sensor
Back to top
