---
source_url: "https://www.home-assistant.io/integrations/minecraft_server"
final_url: "https://www.home-assistant.io/integrations/minecraft_server"
canonical_url: "https://www.home-assistant.io/integrations/minecraft_server/"
source_handle: "web:www-home-assistant-io:0fa1eb874b40"
source_section: "integrations-minecraft-server"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bc2d039c2d6e9268719b92b4dffbc9a609065346a828f32dcf47f64c59e9e4b2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Minecraft Server - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/minecraft_server
- Final URL: https://www.home-assistant.io/integrations/minecraft_server
- Canonical URL: https://www.home-assistant.io/integrations/minecraft_server/
- Fetched at: 2026-06-28T03:00:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Minecraft server into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Server address
Binary sensors
Sensors
Removing the integration
To remove an integration instance from Home Assistant
Minecraft is a sandbox video game developed by Mojang Studios. Minecraft servers allow players to play the game online or via a local area network with other players. The Minecraft Server integration lets you retrieve information from a Minecraft server within Home Assistant. Both Java Edition and Bedrock Edition servers are supported.
Minecraft Java Edition servers must be version 1.4 or newer.
The configuration parameter enable-status must be set to true in the server configuration file ( server.properties ) for 1.7 or newer servers.
To add the Minecraft Server service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Minecraft Server .
Follow the instructions on screen to complete the setup.
During setup you will be prompted to enter the address of the server.
The server address is a combination of the hostname and the port, where the port is optional. For SRV records, the port is automatically extracted. For all other cases the default port (25565 for Java Edition and 19132 for Bedrock Edition) is used, if the port is omitted. Here are some server address examples:
SRV record : hypixel.net
Hostname : mc.hypixel.net:25565 or mc.hypixel.net
IP address : 192.168.0.123:19132 or 192.168.0.123
Note
Default is localhost:25565 .
Bedrock Edition servers don’t support SRV records.
This integration provides a binary sensor for the following information from a Minecraft server:
Connection status
This integration provides sensors for the following information from a Minecraft server:
Latency
Version
Protocol version
Number of online players
Including player names list in the state attributes, if available (see note below).
Number of maximum players
World Message / Message of the Day (MOTD)
For Bedrock Edition servers following sensors are provided additionally:
Edition: Minecraft Pocket Edition (MCPE) or Minecraft Education Edition (MCEE)
Game mode
Map name
Player names are only available on Java Edition 1.7 or later servers. Depending on the server, the player names list may not be shown completely. Some servers and plugins limit or completely hide this list or even replace the player names with fake ones to show some custom messages there.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Minecraft Server service was introduced in Home Assistant 0.106, and it's used by
1979 active installations.
Its IoT class is Local Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@elmurato
@zachdeibert
Categories
Binary sensor
Sensor
Back to top
