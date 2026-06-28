# Yoto - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/yoto
- Final URL: https://www.home-assistant.io/integrations/yoto
- Canonical URL: https://www.home-assistant.io/integrations/yoto/
- Fetched at: 2026-06-28T03:30:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Yoto players with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Data updates
Known limitations
Development and testing with your own client ID
Removing the integration
To remove an integration instance from Home Assistant
The Yoto integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your Yoto audio players from Home Assistant. You can play and pause cards, change the volume, skip tracks, seek within a track, and see what is currently playing.
The integration talks to the official Yoto cloud over OAuth2 and receives playback updates over MQTT, so changes that happen on the player show up in Home Assistant almost immediately. Online and offline detection still relies on the cloud API and can lag by up to 5 minutes.
Any Yoto player that is linked to your Yoto family in the Yoto app is supported.
To use the integration, you need a Yoto account with at least one player linked in the Yoto app.
To add the Yoto hub to your Home Assistant instance, use this My button:
Yoto can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Yoto .
Follow the instructions on screen to complete the setup.
During setup, Home Assistant opens the Yoto authorization page so you can grant access. After you approve, Home Assistant creates one device A device is a model representing a physical or logical unit that contains entities. and one media player entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] for every Yoto player in your family.
The integration provides one media player entity per Yoto player. Each entity supports:
Play, pause, and stop
Skip to the previous or next track
Seek to a position within the current track
Set the volume directly, or step up and down in the 16 hardware steps the player uses
Show the currently playing track title, the card title and author, and the card cover art as media artwork
Show the player as off when it is asleep or disconnected from the Yoto cloud
Yoto players cannot be powered on remotely. Home Assistant reports the player as off when it is offline but cannot wake it up.
The integration receives real-time playback updates from each Yoto player over MQTT. To keep the reported status fresh even when the player has not changed state, the integration also requests a status snapshot from each player every 60 seconds.
The player’s online or offline state comes from the Yoto cloud REST API, which the integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] every 5 minutes. A player that loses power or network can take up to that long to show as off in Home Assistant.
The online and offline state of a player can lag by up to 5 minutes because the Yoto cloud only exposes this through polling.
Yoto players cannot be powered on or off from Home Assistant.
Starting playback of a specific card from Home Assistant is not supported yet. You can control playback that is already running on the player, but you cannot tell the player which card to play.
Only follow these steps if you need to use your own OAuth application, like when you are developing or testing the integration.
Set up your own client ID
To set up the integration with your own development credentials, create a Confidential Client application in the Yoto developer dashboard with the following settings:
Under Allowed Callback URLs , enter https://my.home-assistant.io/redirect/oauth .
Under Scopes , select:
offline_access
family:view
family:devices:view
family:devices:control
family:devices:manage
family:library:view
user:content:view
user:icons:manage
Copy the Client ID and Client secret , and add them as Application Credentials before starting the integration setup.
For more details, see the Yoto Developers documentation .
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After removing the integration, you can also delete the developer application you created on the Yoto developer portal if you no longer need it.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Yoto hub was introduced in Home Assistant 2026.6, and it's used by
345 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@cdnninja
@piitaya
Categories
Media Player
Back to top
