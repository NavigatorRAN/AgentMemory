# Twilio - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/twilio
- Final URL: https://www.home-assistant.io/integrations/twilio
- Canonical URL: https://www.home-assistant.io/integrations/twilio/
- Fetched at: 2026-06-28T03:24:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Twilio notifications to Home Assistant.

## Extracted Text

On this page
Configuration
Usage
The Twilio integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables the sending of notifications via SMS and the creation of calls with Twilio .
A free trial account is available at Twilio website providing free calls to verified phone numbers.
Calls are limited to 10 minutes and will play a short trial message before your message runs. Upgraded accounts have no limitation.
To use this notification integration in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry twilio : account_sid : ACCOUNT_SID_FROM_TWILIO auth_token : AUTH_TOKEN_FROM_TWILIO
Configuration Variables
Looking for your configuration file?
account_sid string Required
Your Twilio Account SID which can be found in your console . It starts with the letters AC .
auth_token string Required
Your Twilio AUTH TOKEN which can be found in your console . It should be directly under where you found the account_sid .
After configuring the base Twilio integration, add and configure either or both of the Twilio SMS and Twilio Phone integrations to use the notification functionality.
To be able to receive events from Twilio, your Home Assistant instance needs to be accessible from the web and you need to have the external URL configured in Home Assistant.
To set it up, go to the integrations page in the configuration screen and find Twilio. Click on configure. Follow the instructions on the screen to configure Twilio.
You will get a URL of the following format: https://<home-assistant-domain>/api/webhook/9940e99a26fae4dcf6fe0a478124b6b58b578ea4c55c9a584beb1c9f5057bb91 . To generate inbound events, you have to configure your webhooks with Twilio :
Go to your Twilio console .
Under phone numbers > manage > active numbers > (select number) > configure .
Paste your URL in the webhook URL box for A call comes in and A message comes in and save.
Events coming in from Twilio will be available as events in Home Assistant and are fired as twilio_data_received . The data specified by Twilio will be available as the event data. You can use this event to trigger automations.
Here is an example:
automation : triggers : - trigger : event event_type : twilio_data_received event_data : From : ' +1XXXXXXXXXXX' To : ' +1YYYYYYYYYYY' CallStatus : ringing Direction : inbound actions : - action : cover.open_cover target : entity_id : cover.garage_door
The above opens the garage door when the number +1XXXXXXXXXXX calls +1YYYYYYYYYYY (considering that +1YYYYYYYYYYY is one of your numbers registered in Twilio).
An example of an SMS handler:
alias : " Twilio incoming" triggers : - trigger : event event_type : twilio_data_received actions : - variables : sender : | {{ trigger.event.data.From }} message : | {{ trigger.event.data.Body }} - action : notify.persistent_notification data : message : | incoming twilio message from {{sender}}: {{ message }} all event data: {{ trigger.event.data }}
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Twilio service was introduced in Home Assistant 0.40, and it's used by
1456 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Hub
Back to top
