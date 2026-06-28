---
source_url: "https://www.home-assistant.io/integrations/google_cloud"
final_url: "https://www.home-assistant.io/integrations/google_cloud"
canonical_url: "https://www.home-assistant.io/integrations/google_cloud/"
source_handle: "web:www-home-assistant-io:5893fb5d9b77"
source_section: "integrations-google-cloud"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e3d688347d8ab394be7b989f0c09460c8b335f24974c56b104933e1460a89ff8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Google Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_cloud
- Final URL: https://www.home-assistant.io/integrations/google_cloud
- Canonical URL: https://www.home-assistant.io/integrations/google_cloud/
- Fetched at: 2026-06-28T02:46:33Z
- Content type: text/html; charset=UTF-8

## Description

Google Cloud Platform integration.

## Extracted Text

On this page
Configuration
Obtaining service account file
Google Cloud text-to-speech
Pricing
Text-to-speech configuration
Action speak
Action say (legacy)
Google Cloud speech-to-text
Speech-to-text configuration
The Google Cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use Google Cloud Platform APIs and integrate them into Home Assistant.
To add the Google Cloud service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Cloud .
Follow the instructions on screen to complete the setup.
Visit Cloud Resource Manager .
Click CREATE PROJECT button at the top.
Specify convenient Project name and click CREATE button.
Make sure that billing is enabled for your Google Cloud Platform project .
Enable needed Cloud API visiting one of the links below or APIs library , selecting your Project from the dropdown list and clicking the Continue button:
Text-to-speech
Speech-to-text
Set up authentication:
Visit this link
From the toolbar above the Service account list, select Create service account .
In the Service account name field, enter any name.
If you are requesting a text-to-speech API key:
Don’t select a value from the Role list. No role is required to access this service .
Click Create . If a note appears, warning that this service account has no role, you may ignore that.
Return to the Service account list page and click on the service account you created in step 5 to see the details for this service account.
Choose the Keys tab within the details view for this service account.
In the Add Key dropdown, select Create New Key .
Specify a JSON key type and click Create .
A [serviceaccountname].json file will download to your browser.
Upload this file when asked in the integration setup.
Google Cloud text-to-speech converts text into human-like speech in 380+ voices across 50+ languages and variants . It applies groundbreaking research in speech synthesis and Google’s powerful neural networks to deliver high-fidelity audio. With this easy-to-use API, you can create lifelike interactions with your users that transform customer service, device interaction, and other applications.
The Cloud text-to-speech API is priced monthly based on the number of characters to synthesize into audio sent to the service. For up-to-date pricing, see here .
Below settings can be configured in the options of the integration and in the options parameter of the tts.speak service.
Configuration Variables
Looking for your configuration file?
language string ( Optional , default: en-US )
Default language of the voice, e.g., en-US . Supported languages, genders and voices listed here . Also there are extra not documented but supported languages (see dropdown here ).
gender string ( Optional , default: neutral )
Default gender of the voice, e.g., male . Supported languages, genders and voices listed here .
voice string ( Optional )
Default voice name, e.g., en-US-Wavenet-F . Supported languages, genders and voices listed here . Important! This parameter will override language and gender parameters if set .
encoding string ( Optional , default: mp3 )
Default audio encoder. Supported encodings are ogg_opus , mp3 and linear16 .
speed float ( Optional , default: 1.0 )
Default rate/speed of the voice, in the range [0.25, 4.0]. 1.0 is the normal native speed supported by the specific voice. 2.0 is twice as fast, and 0.5 is half as fast. If unset(0.0), defaults to the native 1.0 speed.
pitch float ( Optional , default: 0.0 )
Default pitch of the voice, in the range [-20.0, 20.0]. 20 means increase of 20 semitones from the original pitch. -20 means decrease of 20 semitones from the original pitch.
gain float ( Optional , default: 0.0 )
Default volume gain (in dB) of the voice, in the range [-96.0, 16.0]. If unset, or set to a value of 0.0 (dB), will play at normal native signal amplitude. A value of -6.0 (dB) will play at approximately half the amplitude of the normal native signal amplitude. A value of +6.0 (dB) will play at approximately twice the amplitude of the normal native signal amplitude. Strongly recommend not to exceed +10 (dB) as there’s usually no effective increase in loudness for any value greater than that.
profiles list ( Optional , default: [] )
An identifier which selects ‘audio effects’ profiles that are applied on (post synthesized) text-to-speech. Effects are applied on top of each other in the order they are given. Supported profile ids listed here .
text_type string ( Optional , default: text )
Default text type. Supported text types are text and ssml . Read more on what is that and how to use SSML here .
The tts.speak action is the modern way to use Google Cloud TTS action. Add the speak action, select the entity for your Google Cloud TTS, select the media player entity or group to send the TTS audio to, and enter the message to speak.
For more options about speak , see the Speak section on the main TTS building block page.
A tts.speak action can look like:
action : tts.speak target : entity_id : tts.google_cloud data : cache : true media_player_entity_id : media_player.living_room_display message : this is a test language : en-US options : gender : male voice : en-US-Wavenet-F encoding : linear16 speed : 0.9 pitch : -2.5 gain : -5.0 text_type : ssml profiles : - telephony-class-application - wearable-class-device
The tts.google_cloud_say action can be used when configuring the legacy google_cloud text-to-speech platform in configuration.yaml . We recommend new users to instead set up the integration in the UI and use the tts.speak action with the corresponding Google Cloud text-to-speech entity as target. If you are an existing user of tts.google_cloud_say , you can still use it but don’t remove the legacy google_cloud text-to-speech platform in configuration.yaml . If you remove it, you will have to manually migrate to tts.speak .
Google Cloud speech-to-text converts audio into text transcriptions for 125 languages and variants .
Speech-to-text is priced based on the amount of audio successfully processed by the service each month, measured in increments of one second. For up-to-date pricing, see here under the Speech-to-text v1 API.
stt_model string ( Optional )
One of the transcription models here . Defaults to latest_short because this is the recommended one. If you get: 400 Invalid recognition 'config': The requested model is currently not supported for language : <language code> try changing this to the legacy command_and_search .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Cloud service was introduced in Home Assistant 0.95, and it's used by
1947 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lufton
@tronikos
Categories
Voice
Back to top
