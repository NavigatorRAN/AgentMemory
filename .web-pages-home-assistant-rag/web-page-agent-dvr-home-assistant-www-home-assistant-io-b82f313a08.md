# Agent DVR - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/agent_dvr
- Final URL: https://www.home-assistant.io/integrations/agent_dvr
- Canonical URL: https://www.home-assistant.io/integrations/agent_dvr/
- Fetched at: 2026-06-28T02:26:18Z
- Content type: text/html; charset=UTF-8

## Description

Access and control Agent DVR from Home Assistant.

## Extracted Text

On this page
Configuration
Alarm control panel
List of actions
Iframe
Agent DVR is a free* software DVR solution for Windows 10, Mac and Linux. Agent DVR runs as a service or console application and can access and control a huge range of third party cameras with advanced motion detection, including DeepStack integration for object recognition. The iSpyConnect website provides secured (SSL) remote access without port forwarding needed.
You can add Agent DVR via integrations using the IP address and port of the server, like: http://192.168.1.3:8090/ . If you have “Protect API” turned on in your Agent DVR server configuration, you can supply the username and password as part of the URL, for example, http://username: [email protected] :8090 .
To add the Agent DVR hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Agent DVR .
Follow the instructions on screen to complete the setup.
Important
Please ensure you are using Agent DVR v2.6.1.0 +
Reports on the current alarm status and can be used to arm and disarm the system.
The Agent DVR integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Disable alerts ( agent_dvr.disable_alerts )
Disables alert events for an Agent DVR camera.
Enable alerts ( agent_dvr.enable_alerts )
Enables alert events for an Agent DVR camera.
Snapshot ( agent_dvr.snapshot )
Takes a photo on an Agent DVR camera.
Start recording ( agent_dvr.start_recording )
Starts continuous recording on an Agent DVR camera.
Stop recording ( agent_dvr.stop_recording )
Stops continuous recording on an Agent DVR camera.
For an overview of every action across all integrations, see the actions reference .
The Agent DVR cameras also support the standard camera actions , such as turning the camera on or off and toggling motion detection.
Using the Webpage Card you can embed the Agent DVR viewer directly in Home Assistant. Just point it to the Agent DVR web app
*Agent offers additional services like secured remote access (without port forwarding) and cloud uploads via a subscription service.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Agent DVR hub was introduced in Home Assistant 0.110, and it's used by
891 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ispysoftware
Categories
Alarm
Camera
Back to top
