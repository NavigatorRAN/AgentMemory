# DLNA Digital Media Server - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dlna_dms
- Final URL: https://www.home-assistant.io/integrations/dlna_dms
- Canonical URL: https://www.home-assistant.io/integrations/dlna_dms/
- Fetched at: 2026-06-28T02:37:40Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to access media stored on a DLNA DMS device with Home Assistant.

## Extracted Text

On this page
Configuration
Renaming
Media source URIs
Examples
The DLNA Digital Media Server integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to browse and play media from a DLNA Digital Media Server . Configured DMS devices act as a Media Source and can be browsed in the Media panel.
To add the DLNA Digital Media Server service to your Home Assistant instance, use this My button:
DLNA Digital Media Server can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select DLNA Digital Media Server .
Follow the instructions on screen to complete the setup.
The name/title of the DMS device is the same as the title of the config entry. It can be changed on the Integrations Configuration page from the three dots menu.
Media source URIs for DLNA DMS look like media-source://dlna_dms/<source_id>/<media_identifier> .
Here <source_id> is the slugified name of the DMS device. For example, “DLNA Server” becomes “dlna_server”. If multiple DMS devices have the same name, an underscore and a unique number will be appended to the end of some of them, for example, “server”, “server_1”, or “server_2”.
The <media_identifier> can have one of three forms:
path/to/file or /path/to/file : Slash-separated path through the Content Directory. This must refer to a unique media item.
:ObjectID : Colon followed by a server-assigned ID for an object.
?query : Question mark followed by a query string to search for, see DLNA ContentDirectory SearchCriteria (part 5.3.16 “A_ARG_TYPE_SearchCriteria” on page 65 and part D.5 “Searching” on page 269) for the syntax. The first result found will be used.
URIs generated while browsing will look like the Object ID form above. However, all three forms will work with the media_player.play_media action.
Using a path URI:
action : media_player.play_media target : entity_id : media_player.living_room_tv data : media_content_id : " media-source://dlna_dms/my_server/videos/favourites/Epic Sax Guy 10 Hours.mp4"
Using a query URI:
action : media_player.play_media target : entity_id : media_player.living_room_tv data : media_content_id : ' media-source://dlna_dms/my_server/?dc:title="Big Buck Bunny"'
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DLNA Digital Media Server service was introduced in Home Assistant 2022.3, and it's used by
20.9% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@chishm
Categories
Media source
Back to top
