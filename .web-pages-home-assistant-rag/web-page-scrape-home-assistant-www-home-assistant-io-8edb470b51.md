# Scrape - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/scrape
- Final URL: https://www.home-assistant.io/integrations/scrape
- Canonical URL: https://www.home-assistant.io/integrations/scrape/
- Fetched at: 2026-06-28T03:14:03Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Web scrape sensors into Home Assistant.

## Extracted Text

On this page
Configuration
YAML Configuration
Using templates
Examples
Home Assistant
Available implementations
Get a value out of a tag
IFTTT status
Get the latest podcast episode file URL
Energy price
Related topics
The Scrape sensor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] scrapes information from websites. The sensor loads an HTML page, and allows you to search and extract specific values. As this is not a fully featured web scraper like scrapy , it will work with simple web pages and it can be time-consuming to get the right section.
Both UI and YAML setup is supported while YAML provides additional configuration possibilities.
To add the Scrape integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Scrape .
Follow the instructions on screen to complete the setup.
Note
Scrape uses configuration subentries for configuring the sensors.
Set up the resource configuration once per resource you want to scrape information from.
Create one or multiple configuration subentries per sensor you want to create by scraping the website.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] using YAML, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry scrape : - resource : https://www.home-assistant.io sensor : - name : " Current version" select : " .release-date"
Configuration Variables
Looking for your configuration file?
resource string Required
The resource or endpoint that contains the value.
resource_template template Required
The resource or endpoint that contains the value with template support.
method string ( Optional , default: GET )
The method of the request. Either POST or GET .
payload string ( Optional )
The payload to send with a POST request. Depends on the service, but usually formed as JSON.
payload_template template ( Optional )
The payload to send with a POST request with template support.
verify_ssl boolean ( Optional , default: true )
Verify the SSL certificate of the endpoint.
timeout integer ( Optional , default: 10 )
Defines max time to wait data from the endpoint.
authentication string ( Optional )
Type of the HTTP authentication. basic or digest .
username string ( Optional )
The username for accessing the REST endpoint.
password string ( Optional )
The password for accessing the REST endpoint.
headers list | template ( Optional )
The headers for the requests.
params list | template ( Optional )
The query params for the requests.
scan_interval integer ( Optional , default: 600 )
Define the refrequency to call the REST endpoint in seconds.
encoding string ( Optional , default: UTF-8 )
The character encoding to use if none provided in the header of the shared data.
sensor map Required
A list of sensors to create from the shared data. All configuration settings that are supported by RESTful Sensor not listed above can be used here.
name template ( Optional )
Defines a template to get the name of the entity.
select string Required
Defines the HTML tag to search for. Check Beautifulsoup’s CSS selectors for details.
attribute string ( Optional )
Get value of an attribute on the selected tag.
index integer ( Optional , default: 0 )
Defines which of the elements returned by the CSS selector to use.
value_template template ( Optional )
Defines a template to get the state of the sensor.
unique_id string ( Optional )
An ID that uniquely identifies this entity. Will be combined with the unique ID of the configuration block if available. This allows changing the name , icon and entity_id from the web interface.
icon template ( Optional )
Defines a template for the icon of the entity.
availability template ( Optional , default: true )
Defines a template to get the available state of the entity. If the template either fails to render or returns True , "1" , "true" , "yes" , "on" , "enable" , or a non-zero number, the entity will be available . If the template returns any other value, the entity will be unavailable . If not configured, the entity will always be available . Note that the string comparison not case sensitive; "TrUe" and "yEs" are allowed.
unit_of_measurement string ( Optional , default: None )
Defines the units of measurement of the sensor, if any. This will also display the value based on the user profile Number Format setting and influence the graphical presentation in the history visualization as a continuous value.
state_class string ( Optional , default: None )
The state_class of the sensor. This will also display the value based on the user profile Number Format setting and influence the graphical presentation in the history visualization as a continuous value.
picture template ( Optional )
Defines a template for the entity picture of the sensor.
device_class device_class ( Optional , default: None )
Sets the class of the device, changing the device state and icon that is displayed on the UI (see below). It does not set the unit_of_measurement .
For incoming data, a value template translates incoming JSON or raw data to a valid payload.
Incoming payloads are rendered with possible JSON values, so when rendering, the value_json can be used to access the attributes in a JSON based payload, otherwise the value variable can be used for non-json based data.
Additional, the this can be used as variables in the template. The this attribute refers to the current entity state of the entity.
Further information about this variable can be found in the template documentation
Example value template with json:
With given payload:
{ "state" : "ON" , "temperature" : 21.902 }
Template {{ value_json.temperature | round(1) }} renders to 21.9 .
In this section you find some real-life examples of how to use this sensor. There is also a Jupyter notebook available for this example to give you a bit more insight.
The current release Home Assistant is published on homepage
scrape : # Example configuration.yaml entry - resource : https://www.home-assistant.io sensor : - name : Release select : " .release-date"
Get the counter for all our implementations from the integrations page under Settings > Devices & services .
# Example configuration.yaml entry scrape : - resource : https://www.home-assistant.io/integrations/ sensor : - name : Home Assistant impl. select : ' a[href="#all"]' value_template : ' {{ value.split("(")[1].split(")")[0] }}'
The German Federal Office for Radiation protection (Bundesamt für Strahlenschutz) is publishing various details about optical radiation including an UV index. This example is getting the index for a region in Germany.
# Example configuration.yaml entry scrape : - resource : https://www.bfs.de/DE/themen/opt/uv/uv-index/prognose/prognose_node.html sensor : - name : Coast Ostsee select : " p" index : 19 unit_of_measurement : " UV Index"
If you make heavy use of the IFTTT web service for your automations and are curious about the status of IFTTT then you can display the current state of IFTTT in your frontend.
# Example configuration.yaml entry scrape : - resource : https://status.ifttt.com/ sensor : - name : IFTTT status select : " .component-status"
If you want to get the file URL for the latest episode of your favorite podcast , so you can pass it on to a compatible media player.
# Example configuration.yaml entry scrape : - resource : https://hasspodcast.io/feed/podcast sensor : - name : Home Assistant Podcast select : " enclosure" index : 1 attribute : url
This example tries to retrieve the price for electricity.
# Example configuration.yaml entry scrape : - resource : https://elen.nu/dagens-spotpris/se3-stockholm/ sensor : - name : Electricity price select : " .text-lg.font-bold" index : 1 value_template : ' {{ value | replace (",", ".") | float }}' unit_of_measurement : " öre/kWh"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Scrape integration was introduced in Home Assistant 0.31, and it's used by
1% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
@gjohansson-ST
Categories
Sensor
Back to top
