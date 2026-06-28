---
source_url: "https://www.home-assistant.io/integrations/apprise"
final_url: "https://www.home-assistant.io/integrations/apprise"
canonical_url: "https://www.home-assistant.io/integrations/apprise/"
source_handle: "web:www-home-assistant-io:e8237d3b720e"
source_section: "integrations-apprise"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7ac55fdd02bc0ca822e074ac920c099a35c283e2fcfe565fa984806e8792dade"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Apprise - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/apprise
- Final URL: https://www.home-assistant.io/integrations/apprise
- Canonical URL: https://www.home-assistant.io/integrations/apprise/
- Fetched at: 2026-06-28T02:28:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Apprise to send notifications from Home Assistant to more than 140 notification services.

## Extracted Text

On this page
Configuration
Direct URL
Configuration file
Remote Apprise API
Configuration options
Sending a notification
Tag-based targeting
Troubleshooting
Related topics
The Apprise integration connects Home Assistant to more than 140 notification services , including Amazon SNS, Discord, Telegram, Slack, Microsoft Teams, Twilio, and many more. A single Apprise configuration can route alerts to multiple services at once, so your automations stay simple and provider-independent.
To use Apprise notifications, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file and restart Home Assistant.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
The simplest setup. Add one or more Apprise URLs directly to your configuration. Visit the Apprise services directory to find the right URL format for your service:
notify : - name : NOTIFIER_NAME platform : apprise url : YOUR_APPRISE_URL
You can pass a list to notify multiple services at once:
notify : - name : NOTIFIER_NAME platform : apprise url : - YOUR_FIRST_URL - YOUR_SECOND_URL
Every service listed under url is always notified together on every action call. If you need to selectively notify different services depending on the situation, use the configuration file approach instead, which supports tag-based targeting.
To notify multiple services or use tag-based routing, store your service URLs in a separate file and reference it:
notify : - name : NOTIFIER_NAME platform : apprise config : /config/apprise.yml
Then create /config/apprise.yml and list your services:
# /config/apprise.yml urls : - tgram://BOT_TOKEN/CHAT_ID : tag : telegram - mailtos://YOUR_USER: [email protected] : tag : email
If you run a self-hosted Apprise API instance, you can point the config option directly to it. This is useful when you manage multiple Home Assistant installations and want to keep your notification services defined in one place:
notify : - name : NOTIFIER_NAME platform : apprise config : https://apprise.example.com/get/YOUR_PROFILE_KEY
You can also use url and config together in the same entry, and you can define as many services as you like in either option. For details on YAML and plain text configuration file formats, see the Apprise configuration documentation .
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
The notifier will bind to the action notify.NAME .
url list ( Optional )
One or more Apprise URLs pointing to notification services. Accepts a single URL string or a list of URL strings. All listed services are notified on every call.
config string ( Optional )
A path or URL pointing to an Apprise configuration file or a remote Apprise API endpoint.
Once Home Assistant restarts, use the notify service you defined to send notifications from an automation:
- action : notify.NOTIFIER_NAME data : title : " Motion detected" message : " Front door camera triggered."
When you use a configuration file, you can assign tags to your services and use the target field to control who receives each message. By default, Apprise only notifies services that have no tags assigned. Use target to reach tagged services:
- action : notify.NOTIFIER_NAME data : message : " Security alert: front door opened." target : " security"
How multiple tags combine in target :
A list sends to every service tagged with any of the listed values (OR logic).
A space-separated string sends only to services that carry all of the listed tags (AND logic).
The reserved tag all notifies every service, whether tagged or not.
# OR logic: notify anything tagged "security" or "family" - action : notify.NOTIFIER_NAME data : message : " Alert." target : - " security" - " family"
# AND logic: notify only services tagged BOTH "security" AND "family" - action : notify.NOTIFIER_NAME data : message : " Alert." target : " security family"
If notifications are not sending, enable debug logging for the Apprise component in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
logger : default : info logs : homeassistant.components.apprise : debug
After restarting, your Home Assistant logs will show which configuration files Apprise loads, how it resolves tags, and whether each notification dispatches successfully. This makes it easy to spot invalid URLs or connectivity issues.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Apprise integration was introduced in Home Assistant 0.101, and it's used by
179 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@caronc
Categories
Notifications
Back to top
