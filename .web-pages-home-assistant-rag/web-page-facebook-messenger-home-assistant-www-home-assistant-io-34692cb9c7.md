---
source_url: "https://www.home-assistant.io/integrations/facebook"
final_url: "https://www.home-assistant.io/integrations/facebook"
canonical_url: "https://www.home-assistant.io/integrations/facebook/"
source_handle: "web:www-home-assistant-io:34692cb9c7d0"
source_section: "integrations-facebook"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "837d90c2af048a7ff90d361cfeb114ae5dc3b6a97d2060bec7c3271d4b998921"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Facebook Messenger - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/facebook
- Final URL: https://www.home-assistant.io/integrations/facebook
- Canonical URL: https://www.home-assistant.io/integrations/facebook/
- Fetched at: 2026-06-28T02:41:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Facebook user notifications to Home Assistant.

## Extracted Text

On this page
Usage
Rich messages
Related topics
The Facebook Messenger integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables sending notifications via Facebook Messenger, powered by Facebook .
To use this notification integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : facebook page_access_token : FACEBOOK_PAGE_ACCESS_TOKEN
Configuration Variables
Looking for your configuration file?
page_access_token string Required
Access token for your Facebook page. Checkout Facebook Messenger Platform for more information.
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
With Facebook notify action, you can send your notifications to your Facebook messenger with help of your Facebook page. You have to create a Facebook Page and App for this action. You can control it by calling the notify action as described here . It will send a message on messenger to user specified by target on behalf of your page. See the quick start guide for more information.
The phone number used in target should be registered with Facebook messenger. Phone number of the recipient should be in +1(212)555-2368 format. If your app is not approved by Facebook then the recipient should by either admin, developer or tester for your Facebook app. More information about the phone number.
# Example automation notification entry automation : - alias : " Evening Greeting" triggers : - trigger : sun event : sunset actions : - action : notify.facebook data : message : " Good Evening" target : - ' +919413017584' - ' +919784516314'
You can also send messages to users that do not have stored their phone number on Facebook, but this requires a bit more work. The Messenger platform uses page-specific user IDs instead of a global user ID. You will need to enable a webhook for the “messages” event in Facebook’s developer console. Once a user writes a message to a page, that webhook will then receive the user’s page specific ID as part of the webhook’s payload. Below is a simple PHP script that reacts to the message “get my id” and sends a reply containing the user’s ID:
<?php $access_token = "" ; $verify_token = "" ; if ( isset ( $_REQUEST [ 'hub_challenge' ])) { $challenge = $_REQUEST [ 'hub_challenge' ]; $hub_verify_token = $_REQUEST [ 'hub_verify_token' ]; if ( $hub_verify_token === $verify_token ) { echo $challenge ; } } $input = json_decode ( file_get_contents ( 'php://input' ), true ); $sender = $input [ 'entry' ][ 0 ][ 'messaging' ][ 0 ][ 'sender' ][ 'id' ]; $message = $input [ 'entry' ][ 0 ][ 'messaging' ][ 0 ][ 'message' ][ 'text' ]; if ( preg_match ( '/get my id/' , strtolower ( $message ))) { $url = 'https://graph.facebook.com/v2.10/me/messages?access_token=' . $access_token ; $ch = curl_init ( $url ); $jsonData = '{
"recipient":{
"id":"' . $sender . '"
},
"message":{
"text":"Your ID: ' . $sender . '"
}
}' ; $jsonDataEncoded = $jsonData ; curl_setopt ( $ch , CURLOPT_POST , 1 ); curl_setopt ( $ch , CURLOPT_POSTFIELDS , $jsonDataEncoded ); curl_setopt ( $ch , CURLOPT_HTTPHEADER , [ 'Content-Type: application/json' ]); if ( ! empty ( $input [ 'entry' ][ 0 ][ 'messaging' ][ 0 ][ 'message' ])) { $result = curl_exec ( $ch ); } }
You could also send rich messing (cards, buttons, images, videos, etc). Info to which types of messages and how to build them.
# Example script with a notification entry with a rich message script : test_fb_notification : sequence : - action : notify.facebook data : message : Some text before the quick replies target : 0034643123212 data : quick_replies : - content_type : text title : Red payload : DEVELOPER_DEFINED_PAYLOAD_FOR_PICKING_RED - content_type : text title : Blue payload : DEVELOPER_DEFINED_PAYLOAD_FOR_PICKING_BLUE
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Facebook Messenger integration was introduced in Home Assistant 0.36, and it's used by
55 active installations.
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
