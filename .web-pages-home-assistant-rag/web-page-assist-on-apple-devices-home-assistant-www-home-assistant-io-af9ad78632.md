# Assist on Apple devices - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/apple
- Final URL: https://www.home-assistant.io/voice_control/apple
- Canonical URL: https://www.home-assistant.io/voice_control/apple/
- Fetched at: 2026-06-28T03:31:45Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Assist on iPhones
Prerequisites
Starting Assist in Home Assistant
Starting Assist on your iPhone using a shortcut
Adjusting the language
Multiple servers
Related topics
Related links
Assist is available on iPhones, iPads, and Macbooks.
Demo showing Assist being triggered from the iPhone 15 Pro action button and from the lock screen widget.
Home Assistant Companion App installed
Have an Assistant set up: either cloud (recommended, more performant) or local .
The devices you want to control with Assist are exposed to Assist and you have checked most of the best practices
On your phone, open Home Assistant.
In the top-right corner, select the three-dots menu and select Assist .
Give a command .
This section was written using an iOS 18. Depending on your model and version, the exact steps may vary.
To use Home Assistant Assist as your voice assistant, follow these steps:
Create a shortcut to Assist in app
Choose one of following options to activate Assist:
Start Assist using a back tap .
Start Assist using the action button .
Start Assist using control center .
Start Assist from Lock Screen .
Start Assist using Voice Control .
To create a shortcut to Assist in App
On the phone, open the Shortcuts app, and select New .
Type Home Assistant and select Assist in app .
Choose the pipeline.
Select Done . You now have a shortcut to Assist in app .
To start Assist using a back tap
Follow the Apple documentation on Running shortcuts by tapping the back of your iPhone and select the shortcut to Assist in app .
Start Assist by tapping the back of your phone.
To start Assist using the Action button
Go to Settings > Action Button , and scroll until you see Controls .
Under Home Assistant , select Assist .
Select your preferred pipeline.
Start the Assist by holding the action button.
For control center and lock screen:
To start Assist using control center
Open control center.
Press and hold an empty space and look for Home Assistant .
Select Assist .
After you see the icon in control center, tap on it again to choose which pipeline you want to use.
To start Assist from Lock Screen
Tap and hold an empty space in Lock Screen.
Choose one of the two bottom items where you want to replace using Assist.
Remove the item.
Tap on it to add a new item and find Home Assistant Assist in the list.
After you see the icon in lock screen, tap once more to choose which pipeline you want to use.
Alternatively you can execute the same steps but add a widget below the lock screen clock.
To start Assist using Voice Control
iOS includes an accessibility feature called Voice Control that allows you to operate your iPhone entirely with voice commands. Using custom commands , you can trigger the Assist in app shortcut with your own wake phrase.
For example, you could create a custom command such as “Okay Nabu” that runs the Assist in app shortcut.
To set this up:
Go to Settings > Accessibility > Voice Control .
Enable Voice Control .
Tap Customize Commands > Create New Command .
Enter the phrase you want to use (for example, Okay Nabu ).
Under Action , select Run Shortcut .
Choose the Assist in app shortcut you created earlier.
Save the command.
After this is configured, saying your custom phrase will launch Assist.
Note
While this approach works well, it may not be as fast as triggering Siri or using hardware buttons. Also note that enabling Voice Control means full system voice navigation is active, which may occasionally trigger other commands unintentionally.
Shortcuts triggered via Siri will always use the same language as Siri is set to. The Assist Button shortcut is meant to be manually triggered and can be configured for any language.
Open the shortcuts app, and edit the Button Assist shortcut. The text in quotes will be shown in the language of your device.
Use the arrow to expand the “Dictate text” action options, and select your language
Use the arrow to expand the “Assist with Provided Input ” options, and select your language.
Important
You can import the button shortcut multiple times to create versions for different languages, when asked if you would like to replace your Shortcut, choose “Keep Both”.
The Assist shortcut works also if you have configured multiple Home Assistant servers. By default it will prompt you to pick the server to sent the command to. This is not very hands-off, and so you can update the shortcut to point at a specific server. You will need to import the shortcuts multiple times, once for each server.
Open the shortcuts app and edit each Assist shortcut. The text in quotes will be shown in the language of your device.
Use the arrow to expand the “Assist with Provided Input ” action, and select your Home Assistant server.
Exposing devices to assist
Best practices with assist
Home Assistant Companion App
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
