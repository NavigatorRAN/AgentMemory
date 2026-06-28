# OpenAI - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/openai_conversation
- Final URL: https://www.home-assistant.io/integrations/openai_conversation
- Canonical URL: https://www.home-assistant.io/integrations/openai_conversation/
- Fetched at: 2026-06-28T03:05:46Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate OpenAI as a conversation agent

## Extracted Text

On this page
Prerequisites
Configuration
Options
Talking to Super Mario over the phone
Known Limitations
Removing the integration
To remove an integration instance from Home Assistant
Related topics
Related links
The OpenAI integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds a conversation agent powered by OpenAI in Home Assistant.
Controlling Home Assistant is done by providing the AI access to the Assist API of Home Assistant. You can control what devices and entities it can access from the exposed entities page . The AI can provide you information about your devices and control them.
This integration does not integrate with sentence triggers .
This integration requires an API key to use, which you can generate here. . This is a paid service, we advise you to monitor your costs in the OpenAI portal closely and configure usage limits to avoid unwanted costs associated with using the service.
Important
This integration works only with the official OpenAI API endpoint and does not support OpenAI-API-compatible third-party services, proxies, or alternative backends. If you need support for other providers, consider using the OpenRouter integration as an alternative.
The OpenAI key is used to authenticate requests to the OpenAI API. To generate an API key take the following steps:
Log in to the OpenAI portal or sign up for an account.
Enable billing with a valid credit card
Configure usage limits .
Visit the API Keys page to retrieve the API key you’ll use to configure the integration.
To add the OpenAI service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OpenAI .
Follow the instructions on screen to complete the setup.
API key
API key from OpenAI for authentication.
To define options for OpenAI, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of OpenAI are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
The integration provides the following types of subentries:
Conversation
AI Task
Speech-to-text (STT)
Text-to-speech (TTS)
The Conversation and AI Task subentries have the following configuration options (some of them may be unavailable due to subentry type or model choice):
Instructions
Instructions for the AI on how it should respond to your requests. It is written using Home Assistant Templating .
Control Home Assistant
If the model is allowed to interact with Home Assistant. It can only control or provide information about entities that are exposed to it.
Recommended settings
If enabled, the recommended model and settings are chosen.
If you choose to not use the recommended settings, you can configure the following options:
Model
The GPT language model is used for text generation. You can find more details on the available models in the ChatGPT Documentation . The default is “gpt-4o-mini”.
Maximum Tokens to Return in Response
The maximum number of words or “tokens” that the AI model should generate in its completion of the prompt. For more information, see the OpenAI Completion Documentation .
Temperature
A value that determines the level of creativity and risk-taking the model should use when generating text. A higher temperature means the model is more likely to generate unexpected results, while a lower temperature results in more deterministic results. See the OpenAI Completion Documentation for more information.
Top P
An alternative to temperature, top_p determines the proportion of the most likely word choices the model should consider when generating text. A higher top_p means the model will only consider the most likely words, while a lower top_p means a wider range of words, including less likely ones, will be considered. For more information, see the OpenAI Completion API Reference .
Store requests and responses in OpenAI
If enabled, OpenAI stores requests and responses and you can view them in your OpenAI dashboard logs. Disabled by default.
Service tier
The available service tiers are Auto, Standard, Flex, and Priority. Flex tier offers lower costs in exchange for slower response times, which can be useful for background automations. Priority processing delivers significantly lower and more consistent latency than the Standard tier at a higher price. Auto is the default value, which uses the project settings . See the Pricing for details on the supported models. When the selected tier is unavailable due to capacity or ramp rate limits, the request is processed at the Standard tier, and you are charged the Standard tier price.
Enable web search
Enable OpenAI-provided Web search tool . Note that it is only available for gpt-4o and newer models.
Search context size
The search is performed with a separate fine-tuned model with its own context and its own pricing . This parameter controls how much context is retrieved from the web to help the tool formulate a response. The tokens used by the search tool do not affect the context window of the main model. These tokens are also not carried over from one turn to another — they’re simply used to formulate the tool response and then discarded. This parameter would affect the search quality, cost, and latency.
Include home location
This parameter allows using the location of your Home Assistant instance during search to provide more relevant search results.
The Speech-to-text (STT) subentries have the following configuration options:
Instructions that can be used to improve the quality of the transcripts by giving the model additional context similarly to how you would prompt other LLMs. The model will try to match the style, language, and context of the prompt. You can also use it to pass a dictionary of the correct spellings of common misunderstood words. Check the OpenAI guide on prompting STT models for additional hints. Templates are not supported here.
The Speech-to-text model for audio transcription.
The Text-to-speech (TTS) subentries have the following configuration options:
Instructions for the AI on how it should read your text. You can prompt the model to control aspects of speech, including accent, emotional range, intonation, impressions, speed of speech, tone, whispering, and more. Templates are not supported here.
Speed
Additionally adjust the speed of the generated speech. Accepts values between 0.25 and 4.0, where 1.0 is the default speed.
You can use an OpenAI Conversation integration to talk to Super Mario and, if desired, have it control devices in your home.
Currently the integration does not have any known limitations.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Exposing entities to assist
Create an ai personality
OpenAI API key
OpenAI
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenAI service was introduced in Home Assistant 2023.2, and it's used by
4.5% of the active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Shulyaka
Categories
AI
Voice
Back to top
