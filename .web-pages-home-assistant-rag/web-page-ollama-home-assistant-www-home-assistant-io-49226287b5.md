# Ollama - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ollama
- Final URL: https://www.home-assistant.io/integrations/ollama
- Canonical URL: https://www.home-assistant.io/integrations/ollama/
- Fetched at: 2026-06-28T03:05:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Ollama

## Extracted Text

On this page
Configuration
Options
Controlling Home Assistant
Related topics
The Ollama integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds a conversation agent in Home Assistant powered by a local Ollama server.
Controlling Home Assistant is an experimental feature that provides the AI access to the Assist API of Home Assistant. You can control what devices and entities it can access from the exposed entities page . The AI can provide you information about your devices and control them.
This integration does not integrate with sentence triggers .
This integration requires an external Ollama server, which is available for macOS, Linux, and Windows. Follow the download instructions to install the server. Once installed, configure Ollama to be accessible over the network .
To add the Ollama service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ollama .
Follow the instructions on screen to complete the setup.
To define options for Ollama, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Ollama are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
URL
The URL of the external Ollama server, such as http://localhost:11434 .
API Key
The API key to use when connecting to the Ollama server. This is optional if your Ollama server does not require authentication.
Model
Name of the Ollama model to use, such as mistral or llama2:13b . Models will be automatically downloaded during setup.
Instructions
Instructions for the AI on how it should respond to your requests. It is written using Home Assistant Templating .
Control Home Assistant
If the model is allowed to interact with Home Assistant. It can only control or provide information about entities that are exposed to it. This feature is considered experimental and see Controlling Home Assistant below for details on model limitations.
Context window size
The context window size is the number of tokens the model can take as input. Home Assistant defaults to 8k, which is larger than the default value in Ollama Server (2k), and you may adjust it based on the maximum context size of the specific model used. A larger value will better support larger homes with more entities, and smaller values may lower Ollama server RAM usage.
Max history messages
Maximum number of messages to keep for each conversation (0 = no limit). Limiting this value will cause older messages in a conversation to be dropped.
Keep alive
Duration in seconds for the Ollama host to keep the model in memory after receiving a message (-1 = no limit, 0 = no retention). Default value is -1.
Think before responding
If the AI should think about its response before responding. This will cause the AI to take longer to respond, but may result in better responses. Default value is false . Thinking is not supported by all models and displaying thinking content is not supported by frontend clients yet.
If you want to experiment with local LLMs using Home Assistant, we recommend exposing fewer than 25 entities. Note that smaller models are more likely to make mistakes than larger models.
Only models that support Tools may control Home Assistant.
Smaller models may not reliably maintain a conversation when controlling
Home Assistant is enabled. However, you may use multiple Ollama configurations that
share the same model, but use different prompts:
Add the Ollama integration without enabling control of Home Assistant. You can use
this conversation agent to have a conversation.
Add an additional Ollama integration, using the same model, enabling control of Home Assistant.
You can use this conversation agent to control Home Assistant.
Home assistant templating
Exposing entities to assist
Sentence trigger
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ollama service was introduced in Home Assistant 2024.4, and it's used by
2.1% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@synesthesiam
Categories
AI
Voice
Back to top
