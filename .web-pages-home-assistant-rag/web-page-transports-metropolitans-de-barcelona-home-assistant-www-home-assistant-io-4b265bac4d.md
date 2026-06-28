# Transports Metropolitans de Barcelona - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tmb
- Final URL: https://www.home-assistant.io/integrations/tmb
- Canonical URL: https://www.home-assistant.io/integrations/tmb/
- Fetched at: 2026-06-28T03:22:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate TMB iBus sensor within Home Assistant.

## Extracted Text

On this page
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will provide you the remaining time, in minutes, for the next bus in a specific stop by using the iBus service .
You must create an application on developer.tmb.cat to obtain the app_id and app_key values that you will need.
Add the data to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file as shown in the example:
# Example configuration.yaml entry sensor : - platform : tmb app_id : !secret tmb_app_id app_key : !secret tmb_app_key stops : - line : V25 stop : 3258
Configuration Variables
Looking for your configuration file?
app_id string Required
Your TMB APP identifier.
app_key string Required
Your TMB APP key.
stops list ( Optional )
List of bus stops to track.
line string Required
Identifier of the line to track.
stop integer Required
Stop identifier.
name string ( Optional , default: LINE - STOP )
Name you want to use to identifier that stop.
Data provided by TMB .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Transports Metropolitans de Barcelona integration was introduced in Home Assistant 0.104, and it's used by
23 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@alemuro
Categories
Transport
Back to top
