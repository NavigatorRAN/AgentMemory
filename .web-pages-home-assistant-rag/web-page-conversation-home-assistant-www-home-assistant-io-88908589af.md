---
source_url: "https://www.home-assistant.io/integrations/conversation"
final_url: "https://www.home-assistant.io/integrations/conversation"
canonical_url: "https://www.home-assistant.io/integrations/conversation/"
source_handle: "web:www-home-assistant-io:88908589af8a"
source_section: "integrations-conversation"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "318914587a698ab7c6a79f593d1b7d36ed94c040ca59e5483e9fbcd1fb9419ba"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Conversation - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/conversation
- Final URL: https://www.home-assistant.io/integrations/conversation
- Canonical URL: https://www.home-assistant.io/integrations/conversation/
- Fetched at: 2026-06-28T02:35:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to have conversations with your Home Assistant.

## Extracted Text

On this page
Default sentences
Adding custom sentences
Extending built-in intents
List of actions
The Conversation integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to converse with Home Assistant. You can either converse by pressing the microphone in the frontend (supported browsers only (no iOS)) or by calling the conversation.process action with the transcribed text.
Screenshot of the conversation interface in Home Assistant.
# Example base configuration.yaml entry conversation :
By default, a collection of community contributed sentences are supported in a growing list of languages .
In English, you can say things like “turn on kitchen lights” or “turn off lights in the bedroom” if you have an area named “bedroom”.
You can add your own sentence templates to teach Home Assistant about new sentences. These sentences can work with the built-in intents or trigger a custom action by defining custom intents Intent is a term used with voice assistants. The intent is what Home Assistant thinks you want it to do when it extracts a command from your voice or text utterance. [Learn more] with the intent script integration .
To get started, create a custom_sentences/<language> directory in your Home Assistant config directory where <language> is the language code of your language, such as en for English. These YAML files are automatically merged, and may contain intents, lists, or expansion rules.
For an English example, create the file config/custom_sentences/en/temperature.yaml and add:
# Example temperature.yaml entry language : " en" intents : CustomOutsideHumidity : data : - sentences : - " What is the humidity outside"
To teach Home Assistant how to handle the custom CustomOutsideHumidity intent Intent is a term used with voice assistants. The intent is what Home Assistant thinks you want it to do when it extracts a command from your voice or text utterance. [Learn more] , create an intent_script entry in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry intent_script : CustomOutsideHumidity : speech : text : " It is currently {{ states('sensor.outside_humidity') }} percent humidity outside."
More complex actions can be done in intent_script , such as performing actions and firing events.
Extending the built-in intents Intent is a term used with voice assistants. The intent is what Home Assistant thinks you want it to do when it extracts a command from your voice or text utterance. [Learn more] , such as HassTurnOn and HassTurnOff , can be done as well.
For example, create the file config/custom_sentences/en/on_off.yaml and add:
# Example on_off.yaml entry language : " en" intents : HassTurnOn : data : - sentences : - " engage [the] kitchen lights" slots : name : " kitchen lights" HassTurnOff : data : - sentences : - " disengage [the] kitchen lights" slots : name : " kitchen lights"
Now when you say “engage the kitchen lights”, it will turn on a light named “kitchen lights”. Saying “disengage kitchen lights” will turn it off.
Let’s generalize this to other entities. The built-in {name} and {area} lists contain the names of your Home Assistant entities and areas.
Adding {name} to config/custom_sentences/en/on_off.yaml :
# Example on_off.yaml entry language : " en" intents : HassTurnOn : data : - sentences : - " engage [the] {name}" HassTurnOff : data : - sentences : - " disengage [the] {name}"
You can now “engage” or “disengage” any entity.
Lastly, let’s add sentences for turning lights on and off in specific areas:
# Example on_off.yaml entry language : " en" intents : HassTurnOn : data : - sentences : - " engage [the] {name}" - sentences : - " engage [all] lights in [the] {area}" slots : name : " all" domain : " light" HassTurnOff : data : - sentences : - " disengage [the] {name}" - sentences : - " disengage [all] lights in [the] {area}" slots : name : " all" domain : " light"
It’s now possible to say “engage all lights in the bedroom”, which will turn on every light in the area named “bedroom”.
The Conversation integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Process conversation ( conversation.process )
Sends text to a conversation agent for processing.
Reload conversation agents ( conversation.reload )
Reloads the intent configuration of conversation agents.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Conversation entity was introduced in Home Assistant 0.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Voice
Back to top
