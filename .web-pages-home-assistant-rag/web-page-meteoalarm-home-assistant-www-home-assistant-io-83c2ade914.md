# MeteoAlarm - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/meteoalarm
- Final URL: https://www.home-assistant.io/integrations/meteoalarm
- Canonical URL: https://www.home-assistant.io/integrations/meteoalarm/
- Fetched at: 2026-06-28T02:59:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up MeteoAlarm binary sensors within Home Assistant.

## Extracted Text

On this page
Configuration
The MeteoAlarm integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to watch for weather alerts in Europe from MeteoAlarm (EUMETNET). To use this binary sensor, you need the country and the province name from MeteoAlarm . It is crucial to write the country name exactly as it appears in the URL starting with https://feeds.meteoalarm.org/feeds/meteoalarm-legacy-atom- , including any hyphens used in the name. Failure to do so may result in errors or incorrect data.
The name of the province can be found using the MeteoAlarm EMMA_ID Region explorer tool
The binary sensor state shows the warning message if applicable. The details are available as attribute.
To enable this binary sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
binary_sensor : - platform : meteoalarm country : " netherlands" province : " Groningen"
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: meteoalarm )
Binary sensor name
country string Required
The fullname of your country in English format (lowercases)
province string Required
The province
language string ( Optional , default: en-US )
The ISO code of your language, please be aware that this is only possible in the current country. So ‘nl-NL’ or ‘nl-BE’ is only possible in Netherlands or Belgium
Example output
You will find an example below when the state is “on”.
attribution : Information provided by MeteoAlarm language : en-GB category : Met event : Severe forest-fire warning responseType : Monitor urgency : Immediate severity : Severe certainty : Likely effective : 2019-05-02T22:00:00+00:00 onset : 2019-05-02T22:00:00+00:00 expires : 2019-05-03T21:59:00+00:00 senderName : Stig Carlsson headline : Orange forest-fire for Hedmark, Oppland description : High grass and heather fire hazard in areas without snow until significant amount of precipitation. Consequences : Vegetation is very easily ignited and very large areas may be affected. instruction : Be very careful with open fire. Follow the instructions from the local authorities. Emergency services should assess a necessary level of alertness. awareness_level : 3; orange; Severe awareness_type : 8; forest-fire unit_of_measurement : friendly_name : meteoalarm icon : mdi:alert
There are a few awareness levels:
2; yellow; Moderate
3; orange; Severe
4; red; High
Example automation
automation : - alias : " Alert me about weather warnings" triggers : - trigger : state entity_id : binary_sensor.meteoalarm from : " off" actions : - action : notify.notify data : title : " {{state_attr('binary_sensor.meteoalarm', 'headline')}}" message : " {{state_attr('binary_sensor.meteoalarm', 'description')}} is effective on {{state_attr('binary_sensor.meteoalarm', 'effective')}}"
Note
This integration is not affiliated with MeteoAlarm and retrieves data from the website by using the XML feeds. Use it at your own risk.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The MeteoAlarm integration was introduced in Home Assistant 0.93, and it's used by
1600 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rolfberkenbosch
Categories
Binary sensor
Back to top
