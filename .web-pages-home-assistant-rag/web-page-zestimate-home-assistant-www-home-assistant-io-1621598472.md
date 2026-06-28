# Zestimate - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zestimate
- Final URL: https://www.home-assistant.io/integrations/zestimate
- Canonical URL: https://www.home-assistant.io/integrations/zestimate/
- Fetched at: 2026-06-28T03:30:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Zestimate sensor into Home Assistant.

## Extracted Text

On this page
Configuration
Additional attributes
The Zestimate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to track the Zestimate® value of properties using the Zillow API . According to Zillow’s website, a Zestimate® home valuation is Zillow’s estimated market value. It is not an appraisal. Use it as a starting point to determine a home’s value. The Zestimate® is provided by Zillow , a website primarily for listing homes to buy/sell/rent in the United States.
This integration adds one entity per zpid specified, named sensor.zestimate with numbers appended if you choose to track more than one Zestimate.
You will need to sign up for the Zillow API at the following link Zillow API . You will also need the Zillow property ID for each property you’d like to track. This information is available from the URL of a property you are interested in. If you’re the owner of this property, it’s recommended to claim the listing and update the property information to help the information be as accurate as possible.
For example, the White House zpid is 84074482 and can be found in its Zillow URL: https://www.zillow.com/homedetails/1600-Pennsylvania-Ave-NW-Washington-DC-20006/84074482_zpid/
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
sensor : - platform : zestimate api_key : YOUR_API_KEY zpid : - YOUR_ZPID_1 - YOUR_ZPID_2
Configuration Variables
Looking for your configuration file?
api_key string Required
The API key to access the service. Obtain yours using the Zillow API .
zpid list Required
Property IDs to track in the front end. Can be found in its Zillow URL as described above. Include only the numbers, do not include the “_zpid”.
The following additional attributes are also available via the sensor.
These attributes are available:
Last update
30 Day change in value
Valuation Range High
Valuation Range Low
Address
Currency
Amount
Example screenshot:
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Zestimate integration was introduced in Home Assistant 0.65, and it's used by
11 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
