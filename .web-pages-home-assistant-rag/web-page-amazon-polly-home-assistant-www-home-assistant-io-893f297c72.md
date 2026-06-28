---
source_url: "https://www.home-assistant.io/integrations/amazon_polly"
final_url: "https://www.home-assistant.io/integrations/amazon_polly"
canonical_url: "https://www.home-assistant.io/integrations/amazon_polly/"
source_handle: "web:www-home-assistant-io:893f297c72e9"
source_section: "integrations-amazon-polly"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "04231191ae6894abec7c24f4ed01fdd59075b20ce6b3f0efacd9b5da12c4ed47"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Amazon Polly - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/amazon_polly
- Final URL: https://www.home-assistant.io/integrations/amazon_polly
- Canonical URL: https://www.home-assistant.io/integrations/amazon_polly/
- Fetched at: 2026-06-28T02:27:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Amazon Polly with Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Usage
Advanced usage
Related topics
The Amazon Polly integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] works with Amazon Polly to create the spoken output.
Polly is a paid service via Amazon Web Services. There is a free tier for the first 12 months and then a charge per million characters afterwards.
For more information, please read the AWS General Reference regarding Security Credentials to get the needed details. Also, check the boto3 Documentation about the profiles and the AWS Regions and Endpoints Reference for available regions.
Available voices are listed in the Amazon Documentation .
To get started, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file (example for Amazon Polly).
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry tts : - platform : amazon_polly aws_access_key_id : AWS_ACCESS_KEY_ID aws_secret_access_key : AWS_SECRET_ACCESS_KEY
Configuration Variables
Looking for your configuration file?
aws_access_key_id string Required
Your AWS Access Key ID. If provided, you must also provide an aws_secret_access_key and must not provide a profile_name .
aws_secret_access_key string Required
Your AWS Secret Access Key. If provided, you must also provide an aws_access_key_id and must not provide a profile_name .
profile_name string ( Optional )
A credentials profile name. If provided, you must not provide an aws_access_key_id nor an aws_secrete_access_key .
region_name string ( Optional , default: us-east-1 )
The region identifier to connect to.
text_type string ( Optional , default: text )
Whether to interpret messages as text or as ssml by default.
voice string ( Optional )
The Voice Name/ID to be used for generated speech by default.
output_format string ( Optional , default: mp3 )
Override the default output format. Either mp3 , ogg_vorbis or pcm .
sample_rate string ( Optional )
Override the default sample rate. Possible values are: 8000, 16000, 22050, 24000.
Default:
22050 for MP3 and Ogg Vorbis, 16000 for pcm
engine string ( Optional , default: standard )
Override the default engine. Can be either of standard , neural , long-form or generative . See Amazon documentation for compatible regions and voices.
Say to all media_player device entities:
- action : tts.amazon_polly_say data : message : " <speak>Hello from Amazon Polly</speak>"
or
- action : tts.amazon_polly_say data : message : > <speak> Hello from Amazon Polly </speak>
Say to the media_player.living_room device entity:
- action : tts.amazon_polly_say target : entity_id : media_player.living_room message : > <speak> Hello from Amazon Polly </speak>
Say with break:
- action : tts.amazon_polly_say data : message : > <speak> Hello from <break time=".9s" /> Amazon Polly </speak>
Say with specific voice and engine as options:
- action : tts.amazon_polly_say data : message : " Hello from Amazon Polly" entity_id : media_player.living_room language : en-GB options : voice : Amy engine : generative
Amazon Polly supports accented bilingual voices and you may find that you’d prefer the voice you like be slowed down, or speeded up. If the speed of the voice is a concern, Amazon Polly provides the ability to modify this using SSML tags. First enable SSML in configuration:
- platform : amazon_polly ... text_type : ssml ...
Note: You now need to enclose all new and previous TTS input within the <speak></speak> tags. To use SSML in automation, you can follow these steps, for instance:
action : tts.amazon_polly_say data : cache : true entity_id : media_player.mpd message : >- <speak> <prosody rate="75%">나는 <prosody rate="75%">천천히</prosody> <lang xml:lang="fr-FR">parle</lang>.하고 있다식기세척!</speak> language : ko-KR
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Amazon Polly integration was introduced in Home Assistant 0.37, and it's used by
381 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jschlyter
Categories
Text-to-speech
Back to top
