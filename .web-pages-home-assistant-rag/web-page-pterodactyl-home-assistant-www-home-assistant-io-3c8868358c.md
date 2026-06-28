# Pterodactyl - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pterodactyl
- Final URL: https://www.home-assistant.io/integrations/pterodactyl
- Canonical URL: https://www.home-assistant.io/integrations/pterodactyl/
- Fetched at: 2026-06-28T03:09:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Pterodactyl server into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Binary sensors
Buttons
Sensors
Removing the integration
To remove an integration instance from Home Assistant
Pterodactyl is a game server management panel designed to simplify the administration of game servers. It offers a user-friendly interface which allows users to manage multiple game servers from a single dashboard, supporting popular games like Minecraft. Its key features include an intuitive web-based control panel, automated server installation, real-time server monitoring, scheduled backups and more. Each game server runs in an isolated Docker container, ensuring security and stability.
The Pterodactyl integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your game servers of your Pterodactyl server within Home Assistant.
To access your Pterodactyl server, an account API key is required. Follow these steps to create a new one:
Access your Pterodactyl Panel and log in with your user account.
From the main dashboard, click your username or profile icon in the top-right corner, then select API Credentials .
Enter a Description to identify the key (for example, “Home Assistant”).
Optionally, specify Allowed IPs to restrict where the key can be used (leave blank to allow all IPs).
Click Create . The panel will generate and display your new account API key.
Copy the account API key immediately and store it securely. You won’t be able to view it again after leaving the page.
Important
Pterodactyl has two different types of API keys: Account and Application. Application API keys are not supported, an account API key as described above is required instead.
To add the Pterodactyl service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Pterodactyl .
Follow the instructions on screen to complete the setup.
During setup, you will be prompted to enter the URL and the account API key of the server.
URL
The URL of your Pterodactyl server, including the protocol ( http:// or https:// ) and optionally the port number. Example: http://192.168.0.123:8080
Account API key
The account API key for accessing your Pterodactyl server (see prerequisites).
This integration provides a binary sensor with the following information for each game server of your Pterodactyl server:
Status: Running or Not running
This integration provides the following buttons A button entity can fire an event, or trigger an action towards a device or service. It can be compared to a physical push button. The button entity does not have a state like on or off , but keeps the timestamp of when it was last pressed in the Home Assistant UI or via an action. [Learn more] for each game server of your Pterodactyl server:
Start server
Stop server
Restart server
The following button is provided as well, but disabled by default:
Force stop server
Warning
Using force stop will terminate the server immediately and may lead to game server file corruption.
This integration provides the following sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] for each game server of your Pterodactyl server:
CPU utilization
Memory usage
Disk usage
Uptime
The following sensors are provided as well, but disabled by default:
CPU limit
Memory limit
Disk limit
Network inbound
Network outbound
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pterodactyl service was introduced in Home Assistant 2025.4, and it's used by
71 active installations.
Its IoT class is Local Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@elmurato
Categories
Binary sensor
Button
Sensor
Back to top
