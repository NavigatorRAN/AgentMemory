# Mailgun - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mailgun
- Final URL: https://www.home-assistant.io/integrations/mailgun
- Canonical URL: https://www.home-assistant.io/integrations/mailgun/
- Fetched at: 2026-06-28T02:58:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Mailgun mail notifications to Home Assistant.

## Extracted Text

On this page
Configuration
Notifications
Notifications configuration
Example automation
To be able to receive webhooks from Mailgun, your Home Assistant instance needs to be accessible from the web and you need to have the external URL configured .
To set it up, go to the integrations page in the configuration screen and find Mailgun. Click on configure. Follow the instructions on the screen to configure Mailgun.
You will get a URL of the following format: https://<home-assistant-domain>/api/webhook/9940e99a26fae4dcf6fe0a478124b6b58b578ea4c55c9a584beb1c9f5057bb91 . To receive webhooks from Mailgun, you need to provide that URL as a callback URL in the Webhooks tab of the Mailgun Control Panel.
There is currently support for the following device types within Home Assistant:
Notifications .
# Example configuration.yaml entry mailgun : domain : EXAMPLE.COM api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
domain string Required
This is the domain name to be used when sending out mail. Needs to be the first custom domain you have set up.
api_key string Required
This is the API token that has been generated in your Mailgun account.
sandbox boolean ( Optional , default: false )
( Deprecated ) Whether to use the sandboxed domain for outgoing mail. Since the domain item is required, it should be set to the sandbox domain name, so this isn’t needed.
Events coming in from Mailgun will be available as events in Home Assistant and are fired as mailgun_message_received . The data specified by Mailgun will be available as the event data. You can use this event to trigger automations.
You can then consume that information with the following automation:
automation : triggers : - trigger : event event_type : mailgun_message_received event_data : action : call_service actions : - action : light.turn_on target : entity_id : light.office
The Mailgun notification action allows you to send emails via Mailgun’s REST API. It requires the Mailgun component to be set up.
# Example configuration.yaml entry notify : - name : mailgun platform : mailgun recipient : [email protected]
name string ( Optional , default: notify )
The optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
recipient string Required
The email address of the recipient.
sender string ( Optional )
The sender’s email address.
Default:
hass@DOMAIN , where DOMAIN is the outgoing mail domain, as defined by the domain configuration entry.
The following automation reacts to an event by sending out an email with two attachments.
# Example automation using Mailgun notifications automation : triggers : - trigger : event event_type : SPECIAL_EVENT actions : - action : notify.mailgun data : title : " Something special has happened" message : " This a test message from Home Assistant" data : images : - /home/pi/pic_test1.png - /home/pi/pic_test2.png
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mailgun service was introduced in Home Assistant 0.38, and it's used by
243 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Back to top
