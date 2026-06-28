---
source_url: "https://www.home-assistant.io/integrations/xmpp"
final_url: "https://www.home-assistant.io/integrations/xmpp"
canonical_url: "https://www.home-assistant.io/integrations/xmpp/"
source_handle: "web:www-home-assistant-io:466c7a0bb8cf"
source_section: "integrations-xmpp"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "bff3f56c74d8c83c838db79a19bb7f3bd8eddcd3fe00cfd6c5a765095ba893ed"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Jabber (XMPP) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/xmpp
- Final URL: https://www.home-assistant.io/integrations/xmpp
- Canonical URL: https://www.home-assistant.io/integrations/xmpp/
- Fetched at: 2026-06-28T03:29:44Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Jabber (XMPP) notifications to Home Assistant.

## Extracted Text

On this page
Configuration
Jabber text message
Jabber image message
Jabber file message
Templating
Related topics
The Jabber (XMPP) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to deliver notifications from Home Assistant to a Jabber (XMPP) account.
To enable Jabber notifications in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME # e.g., jabber platform : xmpp sender : YOUR_JID password : YOUR_JABBER_ACCOUNT_PASSWORD recipient : - YOUR_RECIPIENT 1 - YOUR_RECIPIENT 2
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The default value is notify . The notifier will bind to the notify.NOTIFIER_NAME action.
sender string Required
The Jabber ID (JID) that will act as origin of the messages. Add your JID including the domain, e.g., [email protected] .
resource string ( Optional )
Resource part of JID, e.g., [email protected] / HA-cabin .
Default:
home-assistant
password string Required
The password for your given Jabber account.
recipient string | list Required
Default Jabber IDs (JID) that will receive the notification. This can be a JID or a list of JIDs for multiple recipients.
This is where you want to send your Jabber notifications by default (when not specifying target in the action). Any JID(s) specified in the action’s target field will override this recipient content.
tls boolean ( Optional , default: true )
Force TLS.
verify boolean ( Optional , default: true )
Allow disabling SSL certificate validity check, e.g., self-signed certificate.
room string ( Optional )
Room’s name (e.g., [email protected] ). If set, send a message to chatroom instead of the recipient.
title string ( Optional , default: Home Assistant )
Default message title. To make it empty, set it to "" .
Note
Pre Home Assistant 0.81 sleekxmpp was used to connect to XMPP servers. sleekxmpp as of version 1.3.2, does not support > TLS v1. If you are running your own XMPP server (e.g., Prosody, ejabberd) make sure to allow using TLS v1.
Home Assistant after 0.81 uses slixmpp , which also supports TLS v1.1 and TLS v1.2.
All Jabber IDs (JID) must include the domain. Make sure that the password matches the account provided as sender.
You can send text messages and images as well as other files through Jabber.
Here are some examples on how to set up a script, that can be run from an automation.
Number 1 shows a classical, text-only message. The Title is optional, although if omitted,
it will be set to the component’s title configuration variable. To keep it empty, set it to "" .
# Example script.yaml entry 1_send_jabber_message : alias : " Text only Jabber message" sequence : - action : notify.jabber # from notify.NOTIFIER_NAME data : title : " Optional Title" message : " My funny or witty message"
You can send images or files from locally stored files or remote web locations via Jabber’s HTTP Upload feature.
To send files and images, your jabber server must support XEP_0363 .
Be aware that images are uploaded onto the Jabber server of your provider. They reside there un-encrypted and could be accessed by the server admins. Usually images are deleted after a few days.
Home Assistant supports TLS encryption to ensure transport encryption. TLS is enforced by default. You can disable it with the tls flag – which is not recommended.
Number 2 sends only an image, retrieved from the URL. The TLS connection to get the image is also not verified (use with caution).
# Example script.yaml entry 2_send_jabber_message_with_image_url : alias : " Send Image via Jabber from website" sequence : - action : notify.jabber data : title : " " message : " " data : url : " https://www.graz.at:8443/webcam_neu/getimg.php" verify : false
Number 3 sends an image from a local path.
# Example script.yaml entry 3_send_jabber_message_with_local_image_path : alias : " Send Image via Jabber from local file" sequence : - action : notify.jabber data : title : " " message : " " data : path : " /home/homeassistant/super_view.jpg"
Number 4 sends a text-file, retrieved from GitHub, renamed to Hass_Cheatsheet.txt to be viewable on a mobile Android device, as most don’t offer any application to view .md files. Optionally you can add a timeout for the HTTP upload in seconds.
# Example script.yaml entry 4_send_jabber_message_with_file : alias : " Send text file via Jabber" sequence : - action : notify.jabber data : title : " " message : " " data : url : " https://raw.githubusercontent.com/arsaboo/homeassistant-config/master/HASS%20Cheatsheet.md" path : " Hass_Cheatsheet.txt" timeout : 10
Number 5 sends an image retrieved from a URL, and an additional text message with title and message .
# Example script.yaml entry 5_send_jabber_message_with_image_and_text : alias : " Send Image and Text via Jabber" sequence : - action : notify.jabber data : title : " The Time is now" message : " {{ now() }}, templating works as well..." data : url : " https://github.com/home-assistant/home-assistant.io/raw/next/source/images/favicon-192x192.png"
Number 6 sends an image from a templated URL.
# Example script.yaml entry 6_send_jabber_message_with_image_from_url_template : alias : " Send Image from template URL via Jabber" sequence : - action : notify.jabber data : title : " " message : " " data : url_template : " https://www.foto-webcam.eu/webcam/dornbirn/{{ now().year }}/{{ '%02d' % now().month }}/{{ '%02d' % now().day }}/{{ '%02d' % now().hour }}{{ (now().minute + 58) % 60 // 10}}0_hd.jpg"
The possible source of a file is prioritized and only one will be picked up. url_template has the highest priority; next is url then path_template and finally if none of them are defined path would be used. path will be used to eliminate file extension guessing for unknown URL downloads. Only the file extension will be left, as Home Assistant changes the filename to a random string for added privacy.
To find out more about notifications, please see the getting started with automation page .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Jabber (XMPP) integration was introduced in Home Assistant pre 0.7, and it's used by
94 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
@flowolf
Categories
Notifications
Back to top
