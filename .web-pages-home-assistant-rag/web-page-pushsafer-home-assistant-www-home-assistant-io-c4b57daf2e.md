---
source_url: "https://www.home-assistant.io/integrations/pushsafer"
final_url: "https://www.home-assistant.io/integrations/pushsafer"
canonical_url: "https://www.home-assistant.io/integrations/pushsafer/"
source_handle: "web:www-home-assistant-io:c4b57daf2ed9"
source_section: "integrations-pushsafer"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "1f703cc4b053d974f4ebfa18a5745521f4774233b82272d5abd1685f8733d521"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Pushsafer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pushsafer
- Final URL: https://www.home-assistant.io/integrations/pushsafer
- Canonical URL: https://www.home-assistant.io/integrations/pushsafer/
- Fetched at: 2026-06-28T03:10:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Pushsafer notifications to Home Assistant.

## Extracted Text

On this page
Examples
Related topics
The Pushsafer service is a platform for the notify integration. This allows you to send messages to the user using Pushsafer.
To get a private or alias key you need to go to the Pushsafer website and register.
To use Pushsafer notifications, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : pushsafer private_key : YOUR_KEY
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
private_key string Required
Your private or alias key. Private key = send the notification to all devices with standard params, alias key send the notification to the devices stored in the alias with predefined params.
Message to two devices with formatted text.
actions : - action : notify.notify data : title : " Test to 2 devices" message : " Attention [b]bold[/b] text[br][url=https://www.pushsafer.com]Link to Pushsafer[/url]" data : icon : " 2" iconcolor : " #FF0000" sound : " 2" vibration : " 1" url : " https://www.home-assistant.io/" urltitle : " Open Home Assistant" time2live : " 0"
Message to one device with formatted text and image from an external URL.
actions : - action : notify.notify data : title : " Test to 1 device with image from an url" message : " Attention [i]italic[/i] Text[br][url=https://www.home-assistant.io/]Testlink[/url]" data : icon : " 14" iconcolor : " #FFFF00" sound : " 22" vibration : " 31" url : " https://www.home-assistant.io/" urltitle : " Open Home Assistant" time2live : " 60" picture1 : url : " https://www.home-assistant.io/images/integrations/alexa/alexa-512x512.png"
Message to two devices and one device group with formatted text and local image.
actions : - action : notify.notify data : title : " Test to 3 devices with local image" message : " Attention [i]italic[/i] Text[br][url=https://www.home-assistant.io/]Testlink[/url]" target : [ " 1111" , " 2222" , " gs3333" ] , data : icon : " 20" iconcolor : " #FF00FF" sound : " 33" vibration : " 0" url : " https://www.home-assistant.io/" urltitle : " Open Home Assistant" time2live : " 10" priority : " 2" retry : " 60" expire : " 600" confirm : " 10" answer : " 1" answeroptions : " yes|no|maybe" answerforce : " 1" picture1 : { path : " C: \\ Users \\ Kevin \\ AppData \\ Roaming \\ .homeassistant \\ image-760-testimage.jpg"
To customize your push-notification you can take a look at the Pushsafer API description .
When setting up the application you can use this icon .
To use notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pushsafer integration was introduced in Home Assistant 0.39, and it's used by
84 active installations.
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
