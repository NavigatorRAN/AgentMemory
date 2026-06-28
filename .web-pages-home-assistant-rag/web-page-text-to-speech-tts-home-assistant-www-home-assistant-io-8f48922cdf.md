# Text-to-speech (TTS) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tts
- Final URL: https://www.home-assistant.io/integrations/tts
- Canonical URL: https://www.home-assistant.io/integrations/tts/
- Fetched at: 2026-06-28T03:24:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up text-to-speech (TTS) with Home Assistant.

## Extracted Text

On this page
The state of a text-to-speech entity
List of actions
Cache
Preferred audio settings
REST API
POST /api/tts_get_url
Troubleshooting
Self-signed certificates
Google cast devices
Partial, corrupted or no audio
Related links
Text-to-speech (TTS) enables Home Assistant to speak to you.
Note
Building block integration
This text-to-speech (tts) is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this text-to-speech (tts) building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the text-to-speech (tts) building block offers.
See all TTS integrations using this building block for ways to use it in your automations. If you are using the Home Assistant voice assistant Assist , it uses TTS when replying to you. Another way to use TTS is by using TTS with Home Assistant Cloud .
The state of a text-to-speech entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is a timestamp showing the date and time when text-to-speech was last used.
Screenshot showing the state of a text-to-speech entity in the developer tools.
The Text-to-speech (TTS) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Clear TTS cache ( tts.clear_cache )
Removes all cached text-to-speech files and clears the memory.
Say a TTS message ( tts.say )
Says a message on a media player using a legacy text-to-speech platform.
Speak ( tts.speak )
Speaks a message on a media player using text-to-speech.
For an overview of every action across all integrations, see the actions reference .
The integration cache can be controlled with the cache option in the action to speak or say , setting it to True to enable it (default), or False to disable it. A long time cache will be located on the file system. The in-memory cache for fast responses to media players will be auto-cleaned after a short period.
Each TTS platform produces audio samples in different formats, not always compatible with every media player. TTS integration building block supports a way to configure preferred target audio format through options option of speak or say actions.
TTS integration building block uses FFmpeg integration to perform audio transcoding when target entity platform does not support one or all the specified preferred audio format settings (refer to specific platform documentation for any supported setting with related supported values).
Available preferred audio settings, all optional, are:
preferred_format : Set the audio format. When not supported by the target entity platform, the value is a file extension like wav , mp3 , or ogg , among ones supported by FFmpeg tool for output files.
preferred_sample_rate : Set the sample rate. When not supported by the target entity platform, the value is in Hz as a number, among ones supported by the -ar parameter of FFmpeg tool.
preferred_sample_channels : Set the number of audio channels. When not supported by the target entity platform, the value is a number among ones supported by the -ac parameter of FFmpeg tool.
preferred_sample_bytes : Set the audio bit sampling. When not supported by the target entity platform, can only be set to 2 to use 16-bit audio sampling (any other value is ignored).
Example to produce an MP3 audio at 22050Hz:
action : tts.speak target : entity_id : tts.example data : media_player_entity_id : media_player.kitchen message : " May the force be with you." options : preferred_format : mp3 preferred_sample_rate : 22050
Returns a URL to the generated TTS file. The engine_id (which is the entity id) or platform parameter together with message are required. Additional parameters cache , language and options are supported, as JSON attributes, as described for speak action.
{ "engine_id" : "tts.amazon_polly" , "message" : "I am speaking now" }
The return code is 200 if the file is generated. The message body will contain a JSON object with the URL.
{ "path" : "/api/tts_proxy/265944c108cbb00b2a621be5930513e03a0bb2cd_en_-_tts.demo.mp3" , "url" : "http://127.0.0.1:8123/api/tts_proxy/265944c108cbb00b2a621be5930513e03a0bb2cd_en_-_tts.demo.mp3" }
Sample curl command:
$ curl -X POST -H "Authorization: Bearer <ACCESS TOKEN>" \ -H "Content-Type: application/json" \ -d '{"message": "I am speaking now", "engine_id": "amazon_polly"}' \
http://localhost:8123/api/tts_get_url
Important
Playing TTS media will prioritize the local Home Assistant URL, which can be configured by navigating to Settings > System > Network .
It is highly recommended to set the local Home Assistant URL to automatic, in which case the generated URL will be http://<local_ip>:<local_port> .
The following sections describe some of the problems encountered with media devices.
This problem occurs when your Home Assistant instance is configured to be accessed through SSL, and you are using a self-signed certificate on your internal URL.
The tts action will send an https:// URL to the media device, which will check the certificate, and reject it. So it won’t play your file. If you could make the device accept your certificate, it would play the file. However, many media devices do not allow changing settings to accept self-signed certificates. Ultimately, your option may be to serve files to local devices as http:// rather than https:// .
Google cast devices (such as Google Home or Chromecast) require the host in media URLs to be resolvable using Google’s public DNS servers, and if the URL is specifying the https protocol, the certificate must be valid and not self-signed.
These requirements present the following problems, all of which create problems if the local Home Assistant URL is not http://<local_ip>:<local_port> :
They reject self-signed certificates .
They use Google’s public DNS servers to resolve names, not DNS servers provided via DHCP. Additionally, they do not resolve local names through mDNS. This means they do not work with URLs that contain hostnames established by local naming means. Let’s say your Home Assistant instance is running on a machine made known locally as ha (via local DNS) and homeassistant.local (via mDNS). All machines on your local network can access it as ha or homeassistant.local . However, try as you may, your cast device won’t download the media files from your ha machine. That’s because your cast device ignores your local naming setup. In this example, the say action creates a URL like http://ha/path/to/media.mp3 (or https://... if you are using SSL). If you are not using SSL, then setting an internal URL that contains the IP address of your server works around this issue. By using an IP address, the cast device does not have to resolve the hostname.
If you are using SSL (e.g., https://yourhost.example.org/... ) then you must use the hostname in the certificate (e.g., external_url: https://yourhost.example.org ). You cannot use an IP address since the certificate won’t be valid for the IP address, and the cast device will refuse the connection.
The recommended way to overcome these obstacles is to not manually configure a local Home Assistant URL.
Some media players could reproduce only partial, corrupted or no audio at all when the audio format is not fully supported. In such cases it is required to experiment with different combinations of audio formats, channels, sample rates and bits using preferred audio settings options.
For example, some Google Cast devices skip initial audio part when the audio is sampled at 22050Hz, and to fix the problem it is required to set the preferred_sample_rate setting in the options option to 44100 .
List of integrations using the TTS integration
TTS with Home Assistant Cloud
Google Translate TTS
Microsoft TTS
Home Assistant Assist
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Text-to-speech (TTS) entity was introduced in Home Assistant 0.35.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Media source
Text-to-speech
Back to top
