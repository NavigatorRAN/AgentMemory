# Dialogflow - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dialogflow
- Final URL: https://www.home-assistant.io/integrations/dialogflow
- Canonical URL: https://www.home-assistant.io/integrations/dialogflow/
- Fetched at: 2026-06-28T02:37:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how integrate Dialogflow with Home Assistant.

## Extracted Text

On this page
Configuring your Dialogflow account
Configuring Home Assistant
Examples
Related topics
The Dialogflow integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is designed to be used with the webhook integration of Dialogflow . After each phrase a user says, Dialogflow sends an action and parameters to the webhook.
To be able to receive messages from Dialogflow, your Home Assistant instance needs to be accessible from the web and you need to have the external URL configured . Dialogflow will return fallback answers if your server does not answer or takes too long (more than 5 seconds).
Dialogflow could be integrated with many popular messaging, virtual assistant and IoT platforms.
Note
After the Conversational Actions sunset on June 13, 2023 , Dialogflow can no longer be integreated with Google Assistant.
Using Dialogflow will be easy to create conversations like:
User: What is the temperature at home?
Bot: The temperature is 34 degrees
User: Turn on the light
Bot: In which room?
User: In the kitchen
Bot: Turning on kitchen light
To use this integration, you should define a conversation (intent) in Dialogflow, configure Home Assistant with the speech to return and, optionally, the action to execute.
To get the webhook URL, go to the integrations page in the configuration screen and find “Dialogflow”. Click on “configure”. Follow the instructions on the screen.
Login with your Google account.
Click on “Create Agent”.
Select name, language (if you are planning to use Google Actions check their supported languages ) and time zone.
Click “Save”.
Now go to “Fulfillment” (in the left menu).
Enable Webhook and set your Dialogflow webhook URL as the endpoint, for example, https://myhome.duckdns.org/api/webhook/800b4cb4d27d078a8871656a90854a292651b20635685f8ea23ddb7a09e8b417
Create a new intent.
Below “User says” type one phrase that you, the user, will say to Dialogflow, for example, What is the temperature at home? .
In “Action” enter an action name. This should match the name of an IntentScript within your Home Assistant configuration. In the example below, it is Temperature .
In “Response” enter “Cannot connect to Home Assistant or it is taking to long” (fall back response).
At the bottom of the page, expand “Fulfillment” and check “Use webhook”.
At the top right of the screen where it says “Try it now…”, type, or say, the phrase you have previously defined and hit enter.
Dialogflow will now send a request to your Home Assistant instance and display the response.
The V1 API will be deprecated on October 23, 2019. If you are still using the V1 API, it is recommended to change your settings in Dialogflow to use the V2 API. No changes to your intents YAML configuration need to take place after upgrading to the V2 API. Change to the V2 API by clicking on the cog button here and then select the V2 API.
Take a look to “Integrations”, in the left menu, to configure third parties.
When activated, the alexa integration will have Home Assistant’s native intent support handle the incoming intents. If you want to run actions based on intents, use the intent_script integration.
Download this zip and load it in your Dialogflow agent ( Settings > Export and Import ) for examples intents to use with this configuration:
# Example configuration.yaml entry dialogflow : intent_script : Temperature : speech : text : The temperature at home is {{ states('sensor.home_temp') }} degrees LocateIntent : speech : text : > {%- for state in states.device_tracker -%} {%- if state.name.lower() == User.lower() -%} {{ state.name }} is at {{ state.state }} {%- elif loop.last -%} I am sorry, I do not know where {{ User }} is. {%- endif -%} {%- else -%} Sorry, I don't have any trackers registered. {%- endfor -%} WhereAreWeIntent : speech : text : > {%- if is_state('device_tracker.adri', 'home') and is_state('device_tracker.bea', 'home') -%} You are both home, you silly {%- else -%} Bea is at {{ states("device_tracker.bea") }} and Adri is at {{ states("device_tracker.adri") }} {% endif %} TurnLights : speech : text : Turning {{ Room }} lights {{ OnOff }} actions : - action : notify.pushbullet data : message : Someone asked via apiai to turn {{ Room }} lights {{ OnOff }} - action : > {%- if OnOff == "on" -%} switch.turn_on {%- else -%} switch.turn_off {%- endif -%} target : entity_id : " switch.light_{{ Room | striptags | replace(' ', '_') }}"
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Dialogflow integration was introduced in Home Assistant 0.56, and it's used by
740 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Voice
Back to top
