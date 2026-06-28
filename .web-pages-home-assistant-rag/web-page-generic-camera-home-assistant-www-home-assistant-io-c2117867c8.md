---
source_url: "https://www.home-assistant.io/integrations/generic"
final_url: "https://www.home-assistant.io/integrations/generic"
canonical_url: "https://www.home-assistant.io/integrations/generic/"
source_handle: "web:www-home-assistant-io:c2117867c8b9"
source_section: "integrations-generic"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e214f482ccb9d12a72bbc2875595d4ad8f1034e9d5cd85c4175dd41795aaffa3"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Generic Camera - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/generic
- Final URL: https://www.home-assistant.io/integrations/generic
- Canonical URL: https://www.home-assistant.io/integrations/generic/
- Fetched at: 2026-06-28T02:45:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate IP cameras within Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Weather graph from USA National Weather Service
Local image
Image from HTTP only camera
Live stream
Secured access to the camera
The Generic Camera integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate any IP camera or other URL into Home Assistant. Templates can be used to generate the URLs on the fly.
Home Assistant will serve the images via its server, making it possible to view your IP cameras while outside of your network. The endpoint is /api/camera_proxy/camera.[name] .
To add the Generic Camera device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Generic Camera .
Follow the instructions on screen to complete the setup.
You must enter a URL in at least one of the fields Still Image URL or Stream Source URL , the others are optional.
Templates are allowed in the URL fields, which can be used to select different images or parameterize the URL depending on the status of sensors. Template validity and network access are checked during the configuration steps.
Still Image URL
The URL your camera serves the image on, e.g., http://192.168.1.21:2112/ . Can be a template . Usernames and passwords are allowed in the URL, but if none are provided, the Username and Password settings will be used during authentication. At least one of still_image_url or stream_source must be provided.
Stream Source
The URL your camera serves the live stream on, e.g., rtsp://192.168.1.21:554/ . Can be a template . Usernames and passwords are allowed in the URL, but if none are provided, the Username and Password settings will be used during authentication. At least one of still_image_url or stream_source must be provided. Note that a stream_source without a still_image_url can only be used if the stream integration is configured.
Username
The username for accessing your camera. Note that this applies to both still_image_url and stream_source.
Password
The password for accessing your camera. Note that this applies to both still_image_url and stream_source.
More options
These options are only needed for special cases.
Frame Rate
The number of frames-per-second (FPS) of the stream. Can cause heavy traffic on the network and/or heavy load on the camera.
Verify SSL certificate
Enable or disable SSL certificate verification. Set to false to use an http-only camera, or you have a self-signed SSL certificate and haven’t installed the CA certificate to enable verification.
RTSP transport protocol
Set the RTSP transport protocol to tcp , udp , udp_multicast or http .
Authentication
Type for authenticating the requests basic or digest .
Limit refetch to URL change
Limits re-fetching of the remote image to when the URL changes. Only relevant if using a template to fetch the remote image.
Use wallclock as timestamps
Rewrite the camera timestamps. This may help with playback or crashing issues from Wi-Fi cameras or cameras of certain brands (for example, EZVIZ).
Example showing the Generic camera platform pointing at a dynamic Google Map image.
In this section, you find some real-life examples of how to use this camera platform.
You can display a GIF from the web as a still image.
Still Image URL: https://radar.weather.gov/ridge/standard/CONUS_0.gif
You can show a static image with this platform. Just place the image here: /config/www/your_image.png
Still Image URL: https://127.0.0.1:8123/local/your_image.png
To access a camera which is only available via HTTP, you must turn off SSL verification.
Still Image URL: http://example.org/your_image.png
To access a camera that has both a snapshot and live stream URL, using the stream integration.
Still Image URL: http://194.218.96.92/jpg/image.jpg
Stream Source: rtsp://user: [email protected] :554
If a camera only has a live stream URL and no snapshot URL, the stream integration can also generate still images from the live stream URL.
To access a camera that requires secured access for still image or live stream (an HIK in my case).
Still Image URL: http://192.168.1.100/ISAPI/Streaming/Channels/101/picture
Stream Source: rtsp://USERNAME: [email protected] :554/Streaming/Channels/102
Verify SSL: false
Username: user
Password: pass
Authentication: digest
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Generic Camera device was introduced in Home Assistant pre 0.7, and it's used by
6.2% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@davet2001
Categories
Camera
Back to top
