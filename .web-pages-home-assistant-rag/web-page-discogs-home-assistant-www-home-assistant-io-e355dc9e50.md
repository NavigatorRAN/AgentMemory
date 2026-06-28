# Discogs - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/discogs
- Final URL: https://www.home-assistant.io/integrations/discogs
- Canonical URL: https://www.home-assistant.io/integrations/discogs/
- Fetched at: 2026-06-28T02:37:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Discogs sensors within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The Discogs integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to see the current amount of records in your Discogs collection.
First, you’ll need to get a personal access token from your Discogs account.
You can generate a token from your profile’s Developer settings .
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : discogs token : YOUR_TOKEN
The monitored conditions can create a sensor which displays the amount of records currently in your collection and/or wantlist, and an option to pick a random record from your collection.
Configuration Variables
Looking for your configuration file?
token string Required
The Discogs API token to use as identification to get your collection.
name string ( Optional )
Name to use in the frontend.
monitored_conditions list ( Optional )
A list of sensor to include.
collection
Shows the amount of records in the user’s collection.
wantlist
Shows the amount of records in the user’s wantlist.
random_record
Proposes a random record from the collection to play.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Discogs integration was introduced in Home Assistant 0.61, and it's used by
102 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@thibmaek
Categories
Multimedia
Back to top
