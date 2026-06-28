# Deluge - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/deluge
- Final URL: https://www.home-assistant.io/integrations/deluge
- Canonical URL: https://www.home-assistant.io/integrations/deluge/
- Fetched at: 2026-06-28T02:36:29Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Deluge within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Sensor
Switch
There is currently support for the following device types within Home Assistant:
To be able to use this integration, you need to do the following:
Enable the following option in deluge settings: Daemon > Allow Remote Connections
When set up, the daemon has an account called localclient. Refer here to get the password for the local client or add a line in the auth file with your own username and password. Use one of those credentials from there to authenticate the integration with the daemon.
To add the Deluge service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Deluge .
Follow the instructions on screen to complete the setup.
The deluge platform allows you to monitor your downloads with Deluge from within Home Assistant and setup automation based on the information.
The deluge switch platform allows you to control your Deluge client from within Home Assistant. The platform enables you switch all your torrents in pause, and then unpause them all.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Deluge service was introduced in Home Assistant 0.57, and it's used by
260 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Downloading
Back to top
