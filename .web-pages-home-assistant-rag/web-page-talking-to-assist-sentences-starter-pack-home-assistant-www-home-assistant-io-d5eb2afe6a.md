# Talking to Assist - Sentences starter pack - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/builtin_sentences
- Final URL: https://www.home-assistant.io/voice_control/builtin_sentences
- Canonical URL: https://www.home-assistant.io/voice_control/builtin_sentences/
- Fetched at: 2026-06-28T03:31:59Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Prerequisites
Device control
Turning entities on and off
Lights
Covers
Scenes and scripts
Media player
Vacuum
Lists
Date and time
Timers
Starting
Cancelling
Adding/Removing Time
Status
Combining timers and device control to add a delay
Aborting
Troubleshooting
More sentences
Related topics
Related links
Home Assistant comes with built-in sentences contributed by the community for dozens of languages .
The entities you want to control with Assist must be exposed to Assist .
When using the names of entities or areas, make sure to use them exactly as they are defined in Home Assistant, or, create an alias .
turn on the living room light
turn off ceiling fan
turn on the TV
lock all the doors
open the main door
Change kitchen lights brightness to 50%
Set bed light to green
set bed light brightness to 50%
set living room brightness to 50%
set brightness to 50%
Uses area of voice satellite
set kitchen lights to red
set lights to red
turn on the lights in the living room
Close the garage door
Open kitchen window
Which curtains are closed
Set bedroom curtain to 50%
Run stealth mode script
Activate dinner scene
Turn kitchen dinner scene on
next item on TV
next track
next track in office
previous track
previous track in office
skip song on the TV
skip track on the TV
skip to the next song on the TV
pause|resume
pauses or resumes music on voice satellite or in current area
pause|resume “area” music
pauses or resumes music in area
pause|resume “entity”
pauses or resumes music on media player
unpause TV
TV unpause
set TV volume to 90 percent
change the TV volume to 90
turn TV volume down to 90 percent
Mute my TV
Unmute the television
return rover to base
start rover
Add bread to my shopping list
Add decorating christmas tree to my december chores list
needs a todo list name “december chores”
add clean out garage to weekend list
needs a todo list named “Weekend”
what time is it?
what’s the date?
set a timer for 5 minutes
5 minute timer
set a 20 minute timer for pizza
set a timer for 1 hour and 3 minutes
Break it up into hours, minutes, and seconds instead of using a technical term like set a timer for 63 minutes .
cancel timer
can’t cancel multiple timers yet
cancel 5 minute timer
cancel pizza timer
cancel kitchen timer
Must have been set by a voice satellite in the kitchen
add 5 minutes to pizza timer
add 5 minutes to kitchen timer
remove 1 minute from timer
remove 1 minute from 5 minute timer
timer status
how much time is left on pizza timer?
how much time is left on kitchen timer?
how much time is left on 5 minute timer?
Timers running on an S3-Box-3B, with countdown text and a loading bar!
To learn how to set this up, refer to the ESP32-S3-Box-3B tutorial .
Unlike regular voice timers, delayed commands cannot be canceled or modified.
Turn off the lights in the living room in 5 minutes
Pause TV in 10 minutes
Open the blinds in 5 minutes
Nevermind : If you triggered the wake word by mistake and want to stop Home Assistant from listening
The list of supported sentences is constantly being updated for each language. There are so many possible sentences that they cannot be all listed here. To find out what works in your language, follow these steps.
If the voice assistant doesn’t understand you, you may need to rephrase your sentence a bit. Or check if the entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] or area An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] name is correct for your environment.
Take a look at the test sentences:
On GitHub, in the tests folder, open the subfolder for your language.
Look through the test files to see the example sentences that have been tested.
The second part of the file name shows the intent Intent is a term used with voice assistants. The intent is what Home Assistant thinks you want it to do when it extracts a command from your voice or text utterance. [Learn more] , the first part shows the domain Each integration in Home Assistant has a unique identifier: The domain. It is often shown as the first part (before the dot) of entity IDs. . For some domains Each integration in Home Assistant has a unique identifier: The domain. It is often shown as the first part (before the dot) of entity IDs. , such as covers, fans, and light, there are specific sentences.
The other domains Each integration in Home Assistant has a unique identifier: The domain. It is often shown as the first part (before the dot) of entity IDs. are covered by the generic homeassistant_ .
The screenshot below shows sentences used to test the command to turn on the lights. Note that Living room here is just a place holder.
It could be any area An area in Home Assistant is a logical grouping of devices and entities that are meant to match areas (or rooms) in the physical world: your home. For example, the living room area groups devices and entities in your living room. [Learn more] that you have in your home.
View the sentence definition for the tests:
On GitHub, in the sentences folder, open the subfolder for your language.
Open the file of interest.
() mean alternative elements.
[] mean optional elements.
<> mean an expansion rule. To view these rules, search for expansion_rules in the _common.yaml file.
The syntax is explained in detail in the template sentence syntax documentation .
View the sentence definition for your language.
View the response definition
If there are issues when asking for the weather forecast, check the troubleshooting section to see common errors.
You can extend the built-in sentences or add your own to trigger any action in Home Assistant.
Create aliases
Create your own sentences
Sentence troubleshooting
Best practices with assist
Built-in sentence definitions
Built-in response definitions
Template sentence syntax documentation
Sentence test cases
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
