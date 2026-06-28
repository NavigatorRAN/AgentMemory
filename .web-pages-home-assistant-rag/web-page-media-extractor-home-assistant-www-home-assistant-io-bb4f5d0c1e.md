---
source_url: "https://www.home-assistant.io/integrations/media_extractor"
final_url: "https://www.home-assistant.io/integrations/media_extractor"
canonical_url: "https://www.home-assistant.io/integrations/media_extractor/"
source_handle: "web:www-home-assistant-io:bb4f5d0c1e80"
source_section: "integrations-media-extractor"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "aebbbf4bd5fba4d596b95708383fd6f912cdc5136cf0cf50bc07e54a2b94b1a8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Media extractor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/media_extractor
- Final URL: https://www.home-assistant.io/integrations/media_extractor
- Canonical URL: https://www.home-assistant.io/integrations/media_extractor/
- Fetched at: 2026-06-28T02:59:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Media extractor into Home Assistant.

## Extracted Text

On this page
Configuration
Play media actions
Extract media URL action
Format query
Cookies
Related topics
The Media extractor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] gets a stream URL and sends it to a media player entity. This integration can extract entity specific streams if configured accordingly.
Note
Media extractor doesn’t transcode streams, it just tries to find a stream that matches the requested query.
To add the Media extractor integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Media extractor .
Follow the instructions on screen to complete the setup.
Navigate to the Actions tab inside Developer tools . From the Actions dropdown menu select media_extractor.play_media and then press the “Fill Example Data” button at the bottom of the page. Use the “Entity ID” dropdown to select your media player and then press the Perform action button.
This will download the file from the given URL.
Data attribute Optional Description entity_id yes Name(s) of entities to seek media on, e.g., media_player.living_room_chromecast . Defaults to all. media_content_id no The ID of the content to play. Platform dependent. media_content_type no The type of the content to play. Must be one of MUSIC, TVSHOW, VIDEO, EPISODE, CHANNEL or PLAYLIST MUSIC.
There is also an action that will directly return the URL in the response of the action.
Data attribute Optional Description url no The URL of the media to extract. format_query yes The query that will be used to select the right media.
The query can be used to select the right media.
Query examples with explanations:
bestvideo : Best video-only stream
best : Best video + audio stream
bestaudio[ext=m4a] : Best audio stream in M4A format
worst : Worst video + audio stream
bestaudio[ext=m4a]/bestaudio[ext=ogg]/bestaudio : Best M4A audio, otherwise best OGG audio and only then any best audio
More info about queries can be found here .
Some supported video services provide a better experience when you are logged in. For example, if you use Twitch Turbo or are subscribed to a Twitch streamer, logging in prevents the video stream from showing an “An ad is currently playing. Come back after the break.” message until the ad is over. Other examples are private or purchased YouTube videos which you can only watch while logged in.
You can add a Netscape format cookie file in the Home Assistant configuration directory. The cookie file will be loaded each time a stream is loaded:
config/media_extractor/cookies.txt
To generate the cookie file, you can use a browser extension (like Get Cookies.txt LOCALLY ). If you want to create one manually, follow this specification: https://curl.se/rfc/cookie_spec.html .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Media extractor integration was introduced in Home Assistant 0.49, and it's used by
2802 active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Media player
Back to top
