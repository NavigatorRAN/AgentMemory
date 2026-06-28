# Uptime Kuma - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/uptime_kuma
- Final URL: https://www.home-assistant.io/integrations/uptime_kuma
- Canonical URL: https://www.home-assistant.io/integrations/uptime_kuma/
- Fetched at: 2026-06-28T03:25:30Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Uptime Kuma with Home Assistant.

## Extracted Text

On this page
About Uptime Kuma
How you can use this integration
Prerequisites
Configuration
Sensors
Update
Automations
Examples
Global status binary sensor
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Uptime Kuma integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects Home Assistant with your Uptime Kuma monitoring tool.
Uptime Kuma is an open-source, free, and easy-to-use self-hosted monitoring tool used to track the uptime and performance of websites, applications, and other services.
This integration allows you to track the status of your Uptime Kuma monitors directly in Home Assistant. You can use these entities in dashboards, automations, and scripts to react to service outages or monitor uptime trends within your smart home setup.
To set up the Uptime Kuma integration, you need an API key and the URL of your Uptime Kuma instance (for example: https://uptime.example.org ).
You can create an API key by logging in to your Uptime Kuma instance, navigating to Settings > API Keys , and selecting Add API Key .
To add the Uptime Kuma service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Uptime Kuma .
Follow the instructions on screen to complete the setup.
URL
Address of your Uptime Kuma instance. Example: https://uptime.example.com .
Verify SSL certificate
Enable SSL certificate verification for secure connections.
API key
An API key to authenticate with your Uptime Kuma instance.
Status : The current status of the monitor. Possible states: up , down , pending , or maintenance .
Response time : Time in milliseconds taken for the last status check.
Certificate expiry : Number of days remaining before the SSL certificate expires.
Monitor type : The type of check being performed (e.g., HTTP(s), TCP, ping).
Monitored hostname : The hostname or IP address being monitored (if applicable).
Monitored port : The port number used by the monitored service (if applicable).
Monitored URL : The full URL of the monitored service (if applicable).
Uptime (1/30/365 days) : Uptime ratio in percent, calculated over a sliding window of 1, 30, or 365 days.
Response time Ø (1/30/365 days) : Average response time calculated over a sliding window of 1, 30, or 365 days.
Tags : Number of tags assigned to the monitor. The full list of tags is available as state attributes.
Uptime Kuma version : The update entity indicates if Uptime Kuma is up-to-date or if there is a newer Uptime Kuma version available. For more information on how to update your Uptime Kuma instance, please refer to the documentation . If you are using the Uptime Kuma community app for Home Assistant (formerly known as Uptime Kuma add-on), you will receive an update notification in Home Assistant as soon as the Uptime Kuma community app is updated.
Get started with this automation example to create an Uptime Kuma warning light that changes color based on the monitor’s status.
Example YAML configuration
actions : - choose : - conditions : - condition : state entity_id : sensor.uptime_kuma_my_service state : down sequence : - action : light.turn_on data : color_name : red target : entity_id : light.warning_light - conditions : - condition : state entity_id : sensor.uptime_kuma_my_service state : pending sequence : - action : light.turn_on data : color_name : yellow target : entity_id : light.warning_light - conditions : - condition : state entity_id : sensor.uptime_kuma_my_service state : maintenance sequence : - action : light.turn_on data : color_name : blue target : entity_id : light.warning_light - conditions : - condition : state entity_id : sensor.uptime_kuma_my_service state : up sequence : - action : light.turn_on data : color_name : green target : entity_id : - light.warning_light triggers : - trigger : state entity_id : - sensor.uptime_kuma_my_service
If you’d like a single binary sensor that reflects the global status of your Uptime Kuma monitors, you can create a template binary sensor. This sensor will report a problem whenever one or more selected monitors are in a problem state (for example, down, pending, or maintenance).
Open your Home Assistant Dashboard.
Go to Settings > Devices & services > Helpers .
Select Create helper .
Go to Templates > Binary sensor .
Fill in the name, for example Uptime Kuma global status .
Select the device class problem .
Paste the following state template:
{% set problems = ['down', 'pending', 'maintenance'] %}
{% set has_label = 'my-label' %}
{% set entities = integration_entities('uptime_kuma') | select('match', 'sensor.*_status*') %}
{% set alerts = expand(entities) | selectattr('state', 'in', problems ) | selectattr('entity_id', 'in', label_entities(has_label)) | list %}
{{ alerts | count }}
Important
Replace my-label with your actual label name.
Adjust sensor.*_status* if your Home Assistant language or entity naming differs.
Add the chosen label to all the Uptime Kuma status sensors you want included in this global check.
This integration retrieves data from your Uptime Kuma instance every 30 seconds.
When using Uptime Kuma versions before v2.0.0, Uptime Kuma’s API does not expose unique identifiers for monitors. Because of this, using the same name for multiple monitors will cause only one of them to appear in Home Assistant. Renaming a monitor will result in new entities being created, while the old (stale) entities will remain unless manually removed.
Paused monitors are not exposed by the API, so Home Assistant cannot distinguish between a deleted monitor and a paused one. As a result, if you delete an Uptime Kuma monitor, the corresponding device entry in Home Assistant must be removed manually.
Note
To remove a monitor from Home Assistant, go to Settings > Devices & services > Uptime Kuma select the three dots menu next to the device entry you want to remove. Then select Remove device .
The Uptime Kuma integration relies on an active internet connection to communicate with your Uptime Kuma instance, unless it’s running locally. If you encounter issues, verify that your network connection is stable and your Uptime Kuma instance is accessible.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
You can now remove the API key used for Home Assistant from Uptime Kuma, unless it is also used by other integrations or applications.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Uptime Kuma service was introduced in Home Assistant 2025.8, and it's used by
1% of the active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tr4nt0r
Categories
Sensor
System monitor
Back to top
