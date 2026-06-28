---
source_url: "https://www.home-assistant.io/integrations/clicksend_tts"
final_url: "https://www.home-assistant.io/integrations/clicksend_tts"
canonical_url: "https://www.home-assistant.io/integrations/clicksend_tts/"
source_handle: "web:www-home-assistant-io:fd667911624f"
source_section: "integrations-clicksend-tts"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "16acc9c903ab96c1e5e32c449ba7e9092eb93b41a10ea8600fda9b0e3b4102c6"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# ClickSend TTS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/clicksend_tts
- Final URL: https://www.home-assistant.io/integrations/clicksend_tts
- Canonical URL: https://www.home-assistant.io/integrations/clicksend_tts/
- Fetched at: 2026-06-28T02:34:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add ClickSend text-to-speech (TTS) notifications to Home Assistant.

## Extracted Text

On this page
Usage
The ClickSend TTS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses ClickSend to deliver text-to-speech (TTS) notifications from Home Assistant.
After creating your account, you should now be able to obtain your username and api_key here .
To add ClickSend to your installation, add the following to your Home Assistant configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
notify : - platform : clicksend_tts username : CLICKSEND_USERNAME api_key : CLICKSEND_API_KEY recipient : PHONE_NO
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: clicksend_tts )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
username string Required
Your username (probably your email address).
api_key string Required
Your API Key.
recipient string Required
An E.164 formatted phone number, like +14151234567 . This is the phone number that you want to call and notify via TTS, see ClickSend Documentation for more info.
language string ( Optional , default: en-us )
The language you want to use to convert the message to audio. Accepted values are found in the ClickSend Documentation .
voice string ( Optional , default: female )
The voice that needs to be used to play the message to the recipient. Allowed values are female or male .
ClickSend is a notify platform and thus can be controlled by calling the notify action as described here . It will send a notification to the E.164 phone number you configured as recipient .
alias : " The sun has set" triggers : - trigger : sun event : sunset actions : - action : notify.clicksend_tts data : message : " The sun has set"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ClickSend TTS integration was introduced in Home Assistant 0.55, and it's used by
37 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Back to top
