---
source_url: "https://www.home-assistant.io/integrations/media_source"
final_url: "https://www.home-assistant.io/integrations/media_source"
canonical_url: "https://www.home-assistant.io/integrations/media_source/"
source_handle: "web:www-home-assistant-io:af6494e04ade"
source_section: "integrations-media-source"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4710a90f16c578413ec90d32df036e7056ccc69febf55880e18bcab826670551"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Media source - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/media_source
- Final URL: https://www.home-assistant.io/integrations/media_source
- Canonical URL: https://www.home-assistant.io/integrations/media_source/
- Fetched at: 2026-06-28T02:59:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to access your media with Home Assistant.

## Extracted Text

On this page
Configuration
Local media
Using custom or additional media folders
Playing media from a media source
Identifying a media source from the media browser
The Media source integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] platform allows integrations to expose media for
use inside Home Assistant through the Media Browser panel or through supported
media players like Google Cast.
This integration is configured automatically
through default_config or if another integration implements a media source.
If your configuration does not contain any of the above, you can add the below
to your configuration file:
# Example configuration.yaml entry media_source :
By default, the integration looks for media in a specified folder.
If other media_dirs are not declared you need to use /media/local path for
example in companion app notification.
This folder is by default configured in the path /media .
Home Assistant OS users can access this folder by using,
for example, the Samba app. Users of Home Assistant Container can
mount a volume of their choice to /media .
Files served from media are protected by Home Assistant authentication
unlike those served from www .
It is also possible to set up custom and additional media directories. To do
so, you’ll need to adjust the core configuration .
This example makes two different folders available to the integration:
# Example configuration.yaml homeassistant : media_dirs : local : /media recording : /mnt/recordings
Tip
If you want to use media from a network storage, the network storage must be connected first. Refer to these instructions on how to connect network storage .
The media from the network storage is then automatically added to the local media browser.
To play media from a media source via an action, use the uri
scheme media-source://media_source/<media_dir>/<path> .
Default media_dir is local .
Note
Web browsers and Google Cast media players have very limited video container
and codec support. The media source integration does not do any transcoding of
media, meaning media files must be natively supported by your media player or
web browser (for playing in the frontend).
If a video file is not supported by
your media player or web browser it will fail to play. Please check the
documentation of your media player or web browser for lists
of supported video formats.
Example:
action : media_player.play_media target : entity_id : media_player.living_room_tv data : media_content_type : " video/mp4" media_content_id : " media-source://media_source/local/videos/favourites/Epic Sax Guy 10 Hours.mp4"
If you wish to use the media-source:// URI for an action, and the media is already available in the media browser (either as locally stored on the Home Assistant machine, or mapped using network storage) the following steps can help to determine the media-source uri.
Select Media in the sidebar.
Navigate to the folder containing the media you wish to play.
In this example, we will go My media > NAS_Media . This folder is a network share containing a collection of .mp3 files. One of which is named my-music.mp3 .
Copy the current URL from the URL bar.
for example: https://home-assistant.local/media-browser/browser/app%2Cmedia-source%3A%2F%2Fmedia_source/%2Cmedia-source%3A%2F%2Fmedia_source%2Flocal%2FNAS_Media
Search for an online URL Decoder, paste in the copied text and decode.
https://home-assistant.local/media-browser/browser/app,media-source://media_source/,media-source://media_source/local/NAS_Media
The last media source, in this case media-source://media_source/local/NAS_Media makes up the first part of the path, with the complete path being:
media-source://media_source/local/NAS_Media/my-music.mp3
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Media source system was introduced in Home Assistant 0.115, and it's used by
2% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hunterjm
Categories
Media source
Back to top
