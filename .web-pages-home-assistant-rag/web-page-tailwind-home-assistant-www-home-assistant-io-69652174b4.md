# Tailwind - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tailwind
- Final URL: https://www.home-assistant.io/integrations/tailwind
- Canonical URL: https://www.home-assistant.io/integrations/tailwind/
- Fetched at: 2026-06-28T03:20:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Tailwind garage door controller with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Covers
Binary sensors
Buttons
Numbers
Examples
Notify when the garage door is left open
Close the garage door at bedtime if left open
Close the garage door when everyone leaves home
Data updates
Known limitations
Troubleshooting
Cannot connect during setup
Invalid authentication
Unsupported firmware
Removing the integration
To remove an integration instance from Home Assistant
Related topics
The Tailwind integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your Tailwind garage door controller fully locally, without relying on cloud services.
Use cases for this integration include:
Opening and closing your garage door from the Home Assistant UI or automations.
Monitoring whether the garage door is currently open or closed.
Automating your garage door based on presence detection, for example, opening it when you arrive home.
Adjusting the brightness of the status LED on the Tailwind device.
The following Tailwind devices are supported:
Tailwind iQ3
Before setting up this integration, make sure your Tailwind device is set up, connected to your network, and configured in the Tailwind app.
You will need the following information during setup:
The IP address of your Tailwind device. In the Tailwind app, select the cog icon on your device. The IP address is shown in the Device Info section.
The local control key token. Go to the Tailwind web portal , sign in with your Tailwind account, and select the Local Control Key tab. The 6-digit number shown is your local control key token.
To add the Tailwind device to your Home Assistant instance, use this My button:
Tailwind can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tailwind .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of your Tailwind device.
Local control key token
The 6-digit local control key token from the Tailwind web portal .
To change the host or local control key token after setup, go to Settings > Devices & services , select the Tailwind integration, and select Reconfigure .
The integration creates a cover entity for each garage door connected to your Tailwind controller. You can open and close the door and see its current state (open or closed).
Operational problem
Description : Indicates whether the door has an operational problem (locked out).
Entity category : Diagnostic
Identify
Description : Flashes the status LED on the Tailwind device so you can identify it.
Entity category : Configuration
Status LED brightness
Description : Controls the brightness of the status LED on the Tailwind device (0 to 100%).
Send a mobile notification when the garage door has been open for more than 10 minutes:
alias : " Notify when garage door left open" triggers : - trigger : state entity_id : cover.garage_door to : " open" for : minutes : 10 actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Garage door" message : " The garage door has been open for 10 minutes."
Automatically close the garage door when you activate your bedtime scene, but only if it is currently open:
alias : " Close garage door at bedtime" triggers : - trigger : state entity_id : scene.bedtime conditions : - condition : state entity_id : cover.garage_door state : " open" actions : - action : cover.close_cover target : entity_id : cover.garage_door
Close the garage door automatically when nobody is home:
alias : " Close garage door when leaving home" triggers : - trigger : state entity_id : zone.home to : " 0" conditions : - condition : state entity_id : cover.garage_door state : " open" actions : - action : cover.close_cover target : entity_id : cover.garage_door
The integration polls the Tailwind device every 5 seconds over the local network for updated door and device status.
The integration communicates with the Tailwind device over the local network. If the device is not reachable, the entities become unavailable.
The Tailwind device requires a minimum firmware version. If your firmware is too old, the integration will not set up. Update your device to the latest firmware using the Tailwind app.
If you see a “Cannot connect” error during setup, verify that:
The Tailwind device is powered on and connected to your network.
The IP address you entered is correct. You can find it in the Tailwind app under the device’s cog icon in the Device Info section.
Home Assistant can reach the device on the local network.
If you see an “Invalid authentication” error, your local control key token may have changed. Go to the Tailwind web portal and verify the current token. You can update it in Home Assistant by selecting Reconfigure on the integration card.
If you see an “Unsupported firmware” message, update your Tailwind device to the latest firmware version using the Tailwind app, then try setting up the integration again.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Debug logs and diagnostics
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tailwind device was introduced in Home Assistant 2024.1, and it's used by
780 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Cover
Back to top
