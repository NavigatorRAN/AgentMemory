---
source_url: "https://www.home-assistant.io/voice_control/assist_create_open_ai_personality"
final_url: "https://www.home-assistant.io/voice_control/assist_create_open_ai_personality"
canonical_url: "https://www.home-assistant.io/voice_control/assist_create_open_ai_personality/"
source_handle: "web:www-home-assistant-io:650ac4a50cd1"
source_section: "voice-control-assist-create-open-ai-personality"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "458053ba58cc2d480135a304cc5a2fbd6e37941e71596aa011d467b9ab767b4e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Create a personality with AI - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/assist_create_open_ai_personality
- Final URL: https://www.home-assistant.io/voice_control/assist_create_open_ai_personality
- Canonical URL: https://www.home-assistant.io/voice_control/assist_create_open_ai_personality/
- Fetched at: 2026-06-28T03:31:50Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
What can I do in Assist with AI exactly?
What LLM providers are available?
Prerequisites
Creating a voice assistant personality with an LLM-based conversation agent
Tutorial: Setting up Assist with OpenAI
Using the AI voice assistant on your devices
Demos
Related topics
Related links
You can give your voice assistant personality by using an AI conversation agent.
Pick the LLM provider of your choice, either local or cloud, as long as it has a conversational agent.
Select a personality based on a prompt.
Get replies with the character’s personality you defined.
Perform Home Assistant intents (turn on-off lights, etc), as long as Assist is correctly configured as per our best practices .
Check this 1-minute clip showing how Assist is using AI to control a smart home.
LLM-based agents are evolving constantly, and Home Assistant supports most of them. If you’d like to get a deeper knowledge on how to pick the best choice for your setup, here is a comparison study you can check.
There are cloud agents provided by Open AI or Anthropic and local ones provided by Ollama , and both cases are supported by Home Assistant.
Home Assistant and Assist is configured following our best practices .
An account in the conversational agent of the LLM provider of your choice. If you want to test the process, you can create a free account on Open AI.
In case of a local LLM solution, you need to have the model installed.
Go to Settings > Devices & services Add Integration , find your LLM provider and set it up with your API key.
In case of a provider of local agents like Ollama, you need to configure the local URL where the agent is installed. Follow the specific integration recommendations in this case.
Go to Settings > Voice Assistants > Add Assistant . Give it a name and pick a conversation agent from your AI’s option. In this example we are using Antropic and the agent picked is Claude.
Be mindful of your Text-to-speech and Speech-to-text configurations. These are not handled by the AI and should stay as you want them configured for Assist.
Configure the agent (gear icon next to the agent’s name).
In the Prompt template field, enter a text that will prompt the AI to become the character. For example::
You are Super Mario from Mario Bros. Be funny.
Define if the voice assistant is allowed to control the devices in your home.
No control : you can talk to the agent, but it cannot control devices.
Assist : you can talk to the agent and it can control devices. For example, it could turn on the lights.
Assist can only control entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] that are exposed to it.
Once your Assist agent has been created, you can go to Voice assistants and the three dots menu of your personality, and define if you want Home Assistant’s model to be the priority response, and therefore Assist would prefer to handling commands locally .
If you keep this option selected, if the intent can be answered by Home Assistant it will. It will not have the personality, but the response will be fast and efficient (since it doesn’t require to go through the LLM). This is recommended in cases where you can accept not having the AI character reply sometimes and would rather your lights are turned on faster.
If you deselect the option, all the intents will go through the agent. This is recommended when efficiency is not an issue and you need the agent never to break character (for example if your Assist personality is Santa Claus).
You can uncheck Recommended model settings, hit Submit and it will unblock extra customization. In the specific example of OpenAI, here a brief summary of the other settings.
You can test the agent directly from the Voice assistants panel, selecting Start a conversation from the agent’s menu. It will control your Home Assistant and reply exactly as it will do with any voice hardware.
In case you need troubleshooting with your LLM provider, check any specifics from your AI in our integrations documentation
Step-by-step tutorial with some background information, from the Home Assistant Release Party 2024.6 live stream.
To learn how to use the AI assistant with your devices, refer to one of the following tutorials, depending on the hardware you want to use to interact with it:
ESP32-S3-BOX voice assistant
$13 voice assistant using ATOM Echo
Assist on Android
Assist on Apple
Check this interview with an AI Mario personality
Cloud assistant pipeline
Local assistant pipeline
Google generative ai integration
Openai conversation integration
Exposing entities to assist
Home Assistant Cloud
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Assist up and running
Getting started - Local
Getting started - Home Assistant Cloud
Best practices
Exposing entities to Assist
Assigning areas to floors and an area to a device
Aliases for entities, areas and floors
Talking to Assist - Sentences starter pack
Expanding Assist
Creating a personality with AI
Custom sentences
Assist for Android
Assist for Apple
Experiment with Assist setups
The Home Assistant Approach to Wake Words
Wake words for Assist
Tutorial: ESP32-S3-BOX voice assistant
Tutorial: Customize the S3-BOX
Tutorial: $13 voice assistant
Tutorial: World's most private voice assistant
Tutorial: Your daily summary by Assist
Starting Assist from your dashboard
Contribute to the Voice initiative
Troubleshooting
Troubleshooting Assist
Troubleshooting the ESP32-S3-BOX
Using Piper TTS in automations
Organization
Home energy management
Templating
Common tasks
Configuration
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
