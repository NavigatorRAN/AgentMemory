# Washington State Department of Transportation (WSDOT) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/wsdot
- Final URL: https://www.home-assistant.io/integrations/wsdot
- Canonical URL: https://www.home-assistant.io/integrations/wsdot/
- Fetched at: 2026-06-28T03:29:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate WSDOT data into your home.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Examples
Data updates
Advanced configuration
Troubleshooting
Can’t set up the device
No data displayed
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Washington State Department of Transportation (WSDOT) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you travel time information from the Washington State Department of Transportation (WSDOT) .
First, you need to get a free Traveler Information api_key from the WSDOT API webpage . Just enter your email address to instantly get the key.
Once you have the key, you are ready to configure your WSDOT sensors.
To add the Washington State Department of Transportation (WSDOT) service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Washington State Department of Transportation (WSDOT) .
Follow the instructions on screen to complete the setup.
api_key
Your API key from WSDOT.
travel_time
List of routes.
id
ID of the route.
name
Name of the route.
Note
WSDOT does provide information about ferry schedules, mountain passes, and tolls, but so far only Travel Time data is available on this platform.
Here’s an example of the sensor in use:
WSDOT retrieves travel time updates every 2 minutes. This is not currently configurable.
If you would like to manually curate the sensors provided by WSDOT , you can edit your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file to remove, rename, or re-add routes.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Figuring out which Travel Time ID ( id ) is associated with your routes is a bit of a challenge. If you visit
https://wsdot.com/Traffic/api/TravelTimes/TravelTimesREST.svc/GetTravelTimesAsJson?AccessCode=[your_api_key_here]
substituting your api_key , you will get a list of all available routes.
Search through it and then find the key TravelTimeID .
That tells you the number you need.
If no tips here help resolve your issue, feel free to
open a bug
and make sure to include the
debug logs and
diagnostics data whenever possible.
Symptom: “Invalid API Key”
When trying to set up the integration, the form shows the message “Invalid API Key”.
Description
This means that the API key entered in the configuration was denied access to https://wsdot.wa.gov .
Resolution
To resolve this issue, try the following steps:
Double-check that you input your API key correctly.
A correct API Key is a series of eight, four, four, four, twelve hexadecimal ( 0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f ) components.
Example: 0123456a-789b-012c-345d-6789012345ef .
Make sure that you included the dashes, and no extra spaces or newlines.
Test your API key.
Test your API key directly against WSDOT by entering it into the following URL in your browser: https://wsdot.wa.gov/Traffic/api/TravelTimes/TravelTimesREST.svc/GetTravelTimesAsJson?AccessCode=[your-api-key-here] .
If this returns a “Request Error” page saying “Invalid Access Code”, you will need to check your key, or obtain a new one.
If this returns a page of raw JSON data, your API key is valid.
Obtain a new API key.
If you have not yet obtained an API key, or you lost or mistyped an earlier API key, you can get a new one.
Navigate to https://wsdot.wa.gov/traffic/api/ , enter your email and hit the Submit button. The new API key will immediately be displayed below the input box.
Symptom: “Unknown” time shown Description
One or more WSDOT element content diaplays unknown .
The WSDOT travel sensors poll for new travel times every 2 minutes.
You may have to wait up to 4 minutes for initial durations to populate.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Configuration file
Debug logs
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Washington State Department of Transportation (WSDOT) service was introduced in Home Assistant 0.37, and it's used by
29 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ucodery
Categories
Transport
Back to top
