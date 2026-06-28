# Tikteck - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tikteck
- Final URL: https://www.home-assistant.io/integrations/tikteck
- Canonical URL: https://www.home-assistant.io/integrations/tikteck/
- Fetched at: 2026-06-28T03:22:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Tikteck LED bulbs within Home Assistant.

## Extracted Text

On this page
Support for the Bluetooth smart bulb from Tikteck . To enable these lights, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry light : - platform : tikteck devices : 00:21:4D:00:00:01 : name : Bulb 1 password : 76409387 00:21:4D:00:00:01 : name : Bulb 2 password : 36478643
Configuration Variables
Looking for your configuration file?
devices list ( Optional )
A list of devices with their Bluetooth address.
name string ( Optional )
A custom name to use in the frontend.
password string Required
The bulb-specific password.
The password can be obtained from an Android device using an app like aLogcat or the adb logcat command for phones in developer mode. Look for a line like:
E LedoBleSDK: login =skName=======[Smart Light]=======skPw==[password]
The password is the text between the square brackets following skPw .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tikteck integration was introduced in Home Assistant 0.36, and it's used by
0 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Light
Back to top
