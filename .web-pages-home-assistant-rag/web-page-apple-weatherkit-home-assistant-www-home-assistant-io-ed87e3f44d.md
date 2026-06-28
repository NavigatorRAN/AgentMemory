# Apple WeatherKit - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/weatherkit
- Final URL: https://www.home-assistant.io/integrations/weatherkit
- Canonical URL: https://www.home-assistant.io/integrations/weatherkit/
- Fetched at: 2026-06-28T03:28:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Apple WeatherKit with Home Assistant.

## Extracted Text

On this page
Requirements
Configuration
Credentials
Troubleshooting
The Apple WeatherKit integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] obtains current weather and forecasts (hourly and daily) from Apple Weather. It is the most direct replacement for those coming from the Dark Sky API since Apple bought Dark Sky and implemented its technology into their weather service.
There is currently support for the following device types within Home Assistant:
Weather
Sensor
You will need a paid Apple Developer Program account to use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] .
To add the Apple WeatherKit service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Apple WeatherKit .
Follow the instructions on screen to complete the setup.
You will need to obtain the appropriate credentials which you will use to connect to Apple WeatherKit. We need to register a few things in your Apple Developer account:
Go to Certificates, Identifiers & Profiles in your Apple Developer account.
In the Keys section, add a new key.
Name it whatever you want.
Select “WeatherKit” from the list.
Download the .p8 file provided. This is your Private Key .
Write down the Key ID . You will need it later.
In the Identifiers section, add a new identifier.
Select “Services IDs” from the drop-down in the top-right.
Enter whatever you’d like for the description.
For the identifier, Apple recommends using a reverse-DNS style name, like com.example.homeassistant .
Save the identifier you used. This is your Service ID .
You can add a new WeatherKit integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] entry now that you have all the credentials. Using the details from earlier, it should look something like this:
Key ID : ABC123DEFG
Service ID : com.example.homeassistant
Apple team ID : ABC123DEFG
This value can be found in the top-right of the Apple Developer website.
Private key : -----BEGIN PRIVATE KEY----- [...]
Open the .p8 file you downloaded earlier in a text editor and copy the entire contents into this field, including the header and footer.
If you are having issues setting up the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , please make sure the following are true:
You are entering the key exactly as it appears in the .p8 file, including the header and footer.
There are no leading or trailing spaces in other configuration values.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Apple WeatherKit service was introduced in Home Assistant 2023.10, and it's used by
314 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tjhorner
Categories
Back to top
