---
source_url: "https://www.home-assistant.io/voice_control/best_practices"
final_url: "https://www.home-assistant.io/voice_control/best_practices"
canonical_url: "https://www.home-assistant.io/voice_control/best_practices/"
source_handle: "web:www-home-assistant-io:15bed7685c37"
source_section: "voice-control-best-practices"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "9a35b2d7040f70b108da89e4caa858990c0fe379840393125ec224c6747e20a4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Best practices with Assist - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/best_practices
- Final URL: https://www.home-assistant.io/voice_control/best_practices
- Canonical URL: https://www.home-assistant.io/voice_control/best_practices/
- Fetched at: 2026-06-28T03:31:56Z
- Content type: text/html; charset=UTF-8

## Description

Tips to get the most out of Assist: which devices to expose, how to name your areas and entities, and small tweaks that make voice commands feel natural.

## Extracted Text

On this page
Expose (the minimum) entities
Check names and create aliases
Be aware of language specificity
Check domains and device classes
Ready?
Some examples to get you started
Related topics
Related links
Voice control feels effortless when it is set up well, and frustrating when it is not. The good news is that getting Assist to feel natural mostly comes down to a few simple choices: which devices it can see, how things are named, and how your home is organized into areas. This page collects the small habits that make a big difference.
In Home Assistant, you decide what Assist has access to. Every entity is opt-in: nothing is exposed to your voice assistant until you say so. That means you can give Assist exactly the devices and information you want it to handle, and nothing else.
Some best practices we recommend to have an efficient setup are:
Learn how in Exposing your entities to Assist .
It might be tempting to expose all entities to Assist, but doing so will come with a performance penalty. The more entity names and aliases the parser will have to go through, the more time it will spend matching. And if you’re using a LLM-based conversation agent, it will incur a higher cost per request, due to the larger context size. Only expose the bare minimum you know you are going to use with voice assistants.
Assist relies heavily on entity names, domains, and areas. Below you will find tips for tweaking these things to ensure the best experience. On top of exposing the needed data, it is worth noting that you will most likely target entities through areas and floors, like:
Turn off the office lights
So make sure your devices and entities are correctly assigned to areas, and your areas are correctly assigned to floors.
Learn how here .
Not having good ways to address entities in common speech will greatly hinder your voice experience with Assist. You can expect to have a hard time asking Assist to “turn on Tuya Light Controller 0E54B1 Light 1”. You should therefore name your devices and entities logically, using a schema such as <area> [<identifier_or_descriptor>] [<domain>].
For example, light.living_room_lamp might be the entity ID of Living room lamp . Kitchen light would be enough for the light.kitchen if you only have one light fixture in that room.
Note that this convention is only a recommendation, actual naming of your devices and entities might depend on your language or personal preference.
If you ever find yourself mentioning a certain device or entity in a certain way, make sure to add that as an alias , as it would probably be the most natural way to refer to the entity.
Names and aliases also apply to area , you need to address area names and aliases in the exact same manner as you would for entities.
If you have set up Home Assistant entity names in English but plan to use Assist in another language, don’t worry. You can add aliases to each entity, allowing them to be named in any language.
English has pretty simple grammar rules, but there are languages where definite articles are pre- or suffixes to words and where nouns have genders or numbers. Language leaders are making efforts to support most such declinations in each language, but they can’t control the stuff that you name. So try to think whether a certain entity having an unarticled name would be called out in a sentence requiring a definite article or vice versa. If so, add that version of the name as an alias as well.
Assist leverages domains to define the proper verbs for the action being taken (for example, turning on/off a light , or a fan , opening/closing a cover with a door device_class , opening/closing a valve or locking/unlocking a lock .).
It might not bother anyone to have a switch.main_valve in the UI instead of a valve, but you can’t ask Assist to open the main valve if the main valve is a switch. If it was a valve.main_valve , then the former sentence would have worked without a hitch.
To prevent this, you can use either the Change device type of a switch integration or create virtual entities using template entities or Generic X, such as the generic thermostat .
The same thing applies to some device classes. For example, if you have a binary_sensor.bedroom_window with no device_class set, you can only ask whether the bedroom window is on, which doesn’t even make sense. To be able to ask if it’s open, you need to set a proper device_class to that binary_sensor , such as window .
Once your devices and entities are correctly
Exposed to assist
Assigned to areas.
It is now time to speak to your device.
To talk to Assist, you can either use your phone or a custom device (and use their microphone and speaker). Check here how to do it on Android or Apple devices.
There are a few example commands to help you get started in our Sentences starter pack .
If you don’t get the right response, we recommend you check the Aliases. Sometimes, different household members may call an entity differently. You may say “TV”, whereas someone else may say “Television”
You can create aliases for exposed entities so that you can target them using different names with Assist. Aliases are available at entity, area, and floor level. Learn how in the Alias tutorial .
Build a 13$ voice remote using an esphome device
Home Assistant Cloud
Voice Preview Edition
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
