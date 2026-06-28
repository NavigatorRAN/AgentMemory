---
source_url: "https://www.home-assistant.io/integrations/cast"
final_url: "https://www.home-assistant.io/integrations/cast"
canonical_url: "https://www.home-assistant.io/integrations/cast/"
source_handle: "web:www-home-assistant-io:3fa92acf5071"
source_section: "integrations-cast"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a871255d549a690e13270ff1be850d70baece435e6c81541903efec271eb91b2"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Cast - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cast
- Final URL: https://www.home-assistant.io/integrations/cast
- Canonical URL: https://www.home-assistant.io/integrations/cast/
- Fetched at: 2026-06-28T02:33:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Google Cast into Home Assistant.

## Extracted Text

On this page
Configuration
Options
Home Assistant Cast
List of actions
Playing media
Using the built in media player app (Default Media Receiver)
Casting with other apps
BBC iPlayer
BBC Sounds
BubbleUPNP
NRK Radio
NRK TV
Plex
Supla
YouTube
Troubleshooting automatic discovery
Zeroconf configuration
Cast devices and Home Assistant on different subnets
Home Assistant Container
To add the Google Cast hub to your Home Assistant instance, use this My button:
Google Cast can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Cast .
Follow the instructions on screen to complete the setup.
Support for mDNS discovery in your local network is mandatory for automatic discovery. Make sure that your router has this feature enabled. If mDNS does not work in your network, the IP addresses of the Cast devices can be manually entered in the configuration as mentioned below.
To define options for Google Cast, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Google Cast are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Known hosts
A comma-separated list of hostnames or IP-addresses of cast devices, use if mDNS discovery is not working
Allowed UUIDs
A comma-separated list of UUIDs of Cast devices to add to Home Assistant. Use only if you don’t want to add all available devices. The device won’t be added until discovered through either mDNS or if it’s included in the list of known hosts. To find the UUID for your device use a mDNS browser. Alternatively, if you’re comfortable using Python, you can use the following Python command (adjust friendly names as required) - python3 -c "import pychromecast; print(pychromecast.get_listed_chromecasts(friendly_names=['Living Room TV', 'Bedroom TV', 'Office Chromecast']))" .
Ignore CEC
A comma-separated list of Chromecasts that should ignore CEC data for determining the active input. See the upstream documentation for more information .
Home Assistant has its own Cast application to show the Home Assistant UI on any Chromecast device. You can use it by adding the Cast entity row to your dashboards, or by calling the cast.show_lovelace_view action to show a specific dashboard view on a Cast device from an automation or script.
Important
Home Assistant Cast requires your Home Assistant installation to be accessible via https:// . If you’re using Home Assistant Cloud, you don’t need to do anything. Otherwise you must make sure that you have configured the external_url in your configuration .
The Google Cast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Show dashboard view via Google Cast ( cast.show_lovelace_view )
Shows a dashboard view on a Google Cast device.
For an overview of every action across all integrations, see the actions reference .
Note
Chromecasts generally don’t resolve hosts through mDNS and also ignore DNS servers from DHCP, they instead use Google’s public DNS servers, 8.8.8.8 and 8.8.4.4.
This means media URLs must either specify the IP address of the server directly, for example, http://192.168.1.1:8123/movie.mp4 , or be publicly resolvable, for example, http://homeassistant.internal.mydomain.com:8123/movie.mp4 where homeassistant.internal.mydomain.com resolves to 192.168.1.1 using Google’s DNS servers. A hostname that can’t be publicly resolved, for example, http://homeassistant.local:8123/movie.mp4 , will fail to play.
This is important when casting TTS or local media sources; the cast integration will cast such media from the local Home Assistant URL, which can be configured by navigating to Settings > System > Network or by configuring an internal_url .
Chromecasts can play many kinds of modern media (image/audio/video) formats using the built in app Default Media Receiver. As a rule of thumb, if a Chrome browser can play a media file a Chromecast will be able to handle that too.
The media needs to be accessible via HTTP(S). Chromecast devices do not support other protocols like DLNA or playback from an SMB file share.
You can play MP3 streams like net radios, FLAC files or videos from your local network with the media_player.play_media action, as long as the media is accessible via HTTP(S). You need to set the media_content_id to the media URL and media_content_type to a matching content type.
# Play a video file from the local network: action : media_player.play_media target : entity_id : media_player.chromecast data : media_content_type : " video" media_content_id : " http://192.168.0.100/movies/sample-video.mkv"
# Show a jpeg image: action : media_player.play_media target : entity_id : media_player.chromecast data : media_content_type : " image/jpeg" media_content_id : " http://via.placeholder.com/1024x600.jpg/0B6B94/FFFFFF/?text=Hello,%20Home%20Assistant!"
Extra media metadata (for example title, subtitle, artist or album name) can be passed into the action and that will be shown on the Chromecast display.
For the possible metadata types and values, check the Google Cast documentation > MediaInformation > metadata field .
# Play a movie from the internet, with extra metadata provided: action : media_player.play_media target : entity_id : media_player.chromecast data : media_content_type : " video/mp4" media_content_id : " http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" extra : metadata : metadataType : 1 title : " Big Buck Bunny" subtitle : " By Blender Foundation, Licensed under the Creative Commons Attribution license" images : - url : " https://peach.blender.org/wp-content/uploads/watchtrailer.gif"
# Play a netradio, with extra metadata provided: action : media_player.play_media target : entity_id : media_player.chromecast data : media_content_type : " audio/mp3" media_content_id : " http://stream.tilos.hu:8000/tilos" extra : metadata : metadataType : 3 title : " Radio TILOS" artist : " LIVE" images : - url : " https://tilos.hu/images/kockalogo.png"
It’s possible to play with other apps than the default media receiver.
To do so, media_content_type should be set to cast , and media_content_id should be a JSON dict with parameters for the app, including the app name.
This app doesn’t retrieve its own metadata, so if you want the cast interface or media player card to show titles and/or images you will have to provide the data yourself. See the examples below.
Note: Media ID is NOT the 8 digit alphanumeric in the URL, it can be found by right-clicking the playing video. E.g., this episode shows:
2908kbps dash (mf_cloudfront_dash_https) b09w70r2 960x540
With b09w70r2 being the media_id
Media parameters
Mandatory:
app_name : bbciplayer
media_id : Item ID
Optional:
is_live : Item is a live stream
Example
Example values to cast this episode
alias : " Cast BBC iPlayer to My Chromecast" sequence : - action : media_player.play_media target : entity_id : media_player.my_chromecast data : media_content_type : cast media_content_id : ' { "app_name": "bbciplayer", "media_id": "b09w70r2" }' extra : metadata : metadataType : 0 title : " Bitz & Bob" subtitle : " Castle Makeover" images : - url : " https://ichef.bbci.co.uk/images/ic/1280x720/p07j4m3r.jpg"
app_name : bbcsounds
Example values to cast BBC Radio 1
alias : " Cast BBC Sounds to My Chromecast" sequence : - action : media_player.play_media target : entity_id : media_player.my_chromecast data : media_content_type : cast media_content_id : ' { "app_name": "bbcsounds", "media_id": "bbc_radio_one", "is_live": true }' extra : metadata : metadataType : 0 title : " Radio 1" images : - url : " https://sounds.files.bbci.co.uk/2.3.0/networks/bbc_radio_one/background_1280x720.png"
The BubbleUPNP app has similar functionality to the built in Default Media Receiver app, and can be used as a backup if the default app fails to play the media.
app_name : bubbleupnp
media_id : The URL to play
media_type : Media type, for example, video/mp4 , audio/mp3 , or image/jpeg . Defaults to video/mp4 .
' cast_bubbleupnp_to_my_chromecast' : alias : " Cast a video to My Chromecast using BubbleUPNP" sequence : - action : media_player.play_media target : entity_id : media_player.my_chromecast data : media_content_type : cast media_content_id : ' { "app_name": "bubbleupnp", "media_id": "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4", "media_type": "video/mp4" }'
Finding Media IDs
You can find the media ID in the URL. For example:
Live channel: https://radio.nrk.no/direkte/p1 , media ID is p1
Podcast: https://radio.nrk.no/podkast/tazte_priv/l_8457deb0-4f2c-4ef3-97de-b04f2c6ef314 , media ID is l_8457deb0-4f2c-4ef3-97de-b04f2c6ef314
On-demand program: https://radio.nrk.no/serie/radiodokumentaren/sesong/201011/MDUP01004510 , media ID is MDUP01004510
app_name : nrkradio
media_id : NRK Radio media ID
Example values to cast the item at https://radio.nrk.no/podkast/tazte_priv/l_8457deb0-4f2c-4ef3-97de-b04f2c6ef314
' cast_nrkradio_to_chromecast' : alias : " Cast NRK Radio to Chromecast" sequence : - action : media_player.play_media target : entity_id : media_player.chromecast data : media_content_type : cast media_content_id : ' { "app_name": "nrkradio", "media_id": "l_8457deb0-4f2c-4ef3-97de-b04f2c6ef314" }'
Live programs: the media ID is in the URL. For example, for https://tv.nrk.no/direkte/nrk1 , the media ID is nrk1
On-demand programs: find the media ID by selecting the share button. For example, for https://tv.nrk.no/serie/uti-vaar-hage/sesong/2/episode/2 the share link is https://tv.nrk.no/se?v=OUHA43000207 and the media ID is OUHA43000207
app_name : nrktv
media_id : NRK TV media ID
Example values to cast the item at https://tv.nrk.no/serie/uti-vaar-hage/sesong/2/episode/2
' cast_nrktv_to_chromecast' : alias : " Cast NRK TV to Chromecast" sequence : - action : media_player.play_media target : entity_id : media_player.chromecast data : media_content_type : cast media_content_id : ' { "app_name": "nrktv", "media_id": "OUHA43000207" }'
To cast media directly from a configured Plex server, set the fields as documented in the Plex integration and prepend the media_content_id with plex:// :
' cast_plex_to_chromecast' : alias : " Cast Plex to Chromecast" sequence : - action : media_player.play_media target : entity_id : media_player.chromecast data : media_content_type : movie media_content_id : ' plex://{"library_name": "Movies", "title": "Groundhog Day"}'
Supla is a Finnish audio streaming service. The media_id is the numeric ID from the Supla URL. For example, the ID for https://www.supla.fi/audio/3601824 is 3601824 .
app_name : supla
media_id : The numeric ID from the Supla audio URL
is_live : Set to true if the item is a livestream
Example values to cast the item at https://www.supla.fi/audio/3601824 :
' cast_supla_to_my_chromecast' : alias : " Cast supla to My Chromecast" sequence : - action : media_player.play_media target : entity_id : media_player.my_chromecast data : media_content_type : cast media_content_id : ' { "app_name": "supla", "media_id": "3601824" }'
app_name : youtube
media_id : YouTube video ID
enqueue : Enqueue only
playlist_id : Play video with media_id from this playlist. Note that only providing playlist_id but no media_id does not work.
' cast_youtube_to_my_chromecast' : alias : " Cast YouTube to My Chromecast" sequence : - action : media_player.play_media target : entity_id : media_player.my_chromecast data : media_content_type : cast media_content_id : ' { "app_name": "youtube", "media_id": "dQw4w9WgXcQ" }'
mDNS relies on UDP multicast, which may fail for various reasons. If none of the tips in this section helps, the recommended solution is to ensure all cast devices have static IPs assigned to them and configure a list of known hosts.
The Google Cast integration relies on the Zeroconf integration for mDNS discovery. The Zeroconf integration has some configuration options which impact mDNS routing.
Cast devices can only be automatically discovered if they are on the same subnet as Home Assistant because mDNS packets are not routed across subnets.
Automatic discovery in setups with cast devices on a different subnet than Home Assistant is not recommended and not supported.
If it is not possible, it’s necessary to either enable mDNS forwarding between the subnets or to configure a list of known hosts.
When running the Home Assistant Container in Docker, make sure it is running with host network mode. Running without it is not supported by the Home Assistant project, and will cause this integration to be unable to discover to your Cast devices.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Cast hub was introduced in Home Assistant pre 0.7, and it's used by
50.7% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@emontnemery
Categories
Media player
Back to top
