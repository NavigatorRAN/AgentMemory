# Elvia - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/elvia
- Final URL: https://www.home-assistant.io/integrations/elvia
- Canonical URL: https://www.home-assistant.io/integrations/elvia/
- Fetched at: 2026-06-28T02:39:56Z
- Content type: text/html; charset=UTF-8

## Description

Documentation for the Elvia integration.

## Extracted Text

On this page
Prerequisites
Configuration
Updates
Multiple meters for a single API token
The Elvia integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will import your historical grid consumption.
You can use the Elvia integration, regardless of which provider you are subscribed to, as long as Elvia operates the grid. If you are unsure if this works for you, log in to Min side and check. If you see a meter there, you can use it.
Unlike most other integrations, this integration provides no entities. The imported data can be used in the Energy dashboard and with the statistics-graph card .
To use this integration, you need to create an API token.
Start by logging in to your Min side .
Once logged in, select your main account (Usually the one with your name on it).
Select the Tilganger tab.
Under the Tilgang til data section, select the Opprett token for målerverdier i API .
In the dialog, select the meter(s) ( see note below about multiple meters ) you want to import values for, give it a name (like “Home Assistant integrasjon”) and use the Opprett button to create your token.
Copy the token shown in the dialog and paste that into the integration configuration.
To add the Elvia service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Elvia .
Follow the instructions on screen to complete the setup.
The integration will fetch new data every hour.
The first time it runs, the data for the past three years will be imported.
The integration is scheduled to be updated hourly, so there will be some delay when you see the updated data inside Home Assistant compared to Min side and Elvia’s mobile apps.
If you are interested in real-time monitoring, this integration is not for you. In this case, you need to use a real-time metering integration like Tibber .
While you can select multiple meters when you create your token, the integration will only allow 1 meter for each configuration.
So, if you are using the same token for multiple meters, you must add the integration multiple times and select a different meter each time.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Elvia service was introduced in Home Assistant 2024.2, and it's used by
152 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ludeeus
Categories
Energy
Back to top
