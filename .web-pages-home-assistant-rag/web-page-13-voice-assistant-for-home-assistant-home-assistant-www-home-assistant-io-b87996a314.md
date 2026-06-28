# $13 voice assistant for Home Assistant - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/thirteen-usd-voice-remote
- Final URL: https://www.home-assistant.io/voice_control/thirteen-usd-voice-remote
- Canonical URL: https://www.home-assistant.io/voice_control/thirteen-usd-voice-remote/
- Fetched at: 2026-06-28T03:32:26Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Prerequisites
Installing the software onto the ATOM Echo
Controlling Home Assistant over the ATOM Echo
Troubleshooting
Removing the Wi-Fi credentials from the ATOM Echo
Related topics
This tutorial will guide you to turn an ATOM Echo into a voice assistant. Pick up the tiny device to talk to
your smart home. Issue commands and get responses!
Home Assistant 2023.10 or later, installed with the Home Assistant Operating System. If you do not have Home Assistant installed yet, refer to the installation page for instructions.
Home Assistant Cloud or a manually configured Assist Pipeline
Have enabled a wake word for your voice assistant
The password to your 2.4 GHz Wi-Fi network
Chrome (or a Chromium-based browser like Edge) on desktop (not Android/iOS)
M5Stack ATOM Echo Development Kit
USB-C cable to connect the ATOM Echo
Before you can use this device with Home Assistant, you need to install a bit of software on it.
Make sure this page is opened in a Chromium-based browser on a desktop. It does not work on a tablet or phone.
Select the Connect button below. If your browser does not support web serial, you will see a warning instead of a button.
To customize the configuration : The configuration file is available on GitHub .
To connect the ATOM Echo to your computer, follow these steps:
In the pop-up window, view the available ports.
Plug the USB-C cable into the ATOM Echo and connect it to your computer.
In the pop-up window, there should now appear a new entry. Select this USB serial port and select Connect .
Troubleshooting: If no new port shows, your system may be missing a driver. Close the pop-up window.
In the dialog, select the CH342 driver, install it, then Try again .
Select Install Voice Assistant , then Install .
Once the installation is complete, select Next .
Add the ATOM Echo to your Wi-Fi:
When prompted, select your network from the list and enter the credentials to your 2.4 GHz Wi-Fi network.
Select Connect .
The ATOM Echo now joined your network. Select Add to Home Assistant .
This opens the My link to Home Assistant.
If you have not used My Home Assistant before, you will need to configure it. If your Home Assistant URL is not accessible on http://homeassistant.local:8123 , replace it with the URL to your Home Assistant instance.
Open the link.
Select OK .
This starts the a wizard to customize the your voice assistant.
Follow the wizard steps to define the wake word and choose the voice.
When you are finished, select Done .
Your ATOM Echo is connected to Home Assistant over Wi-Fi. You can now move it to any place in your home with a USB power supply.
Congratulations! You can now voice control Home Assistant. Now give some commands.
Say the wake word you configured. For example, use “OK, Nabu”.
Wait for the LED to start blinking in blue.
Say a supported voice command . For example, Turn off the light in the kitchen .
While you are speaking, the blue LED keeps pulsing.
Once the intent has been processed, the LED lights up in green and Home Assistant confirms the action.
Make sure you’re using the area name exactly as you defined it in Home Assistant.
You can also ask a question, such as
Is the front door locked?
Which lights are on in the living room?
Your command is not supported? Add your own commands using a sentence trigger .
You find ATOM Echo takes too long to start processing your command?
Adjust the silence detection settings.
Go to Settings > Devices & services and select the ESPHome integration.
Under M5Stack ATOM Echo , select 1 device . Under Configuration , change the Finished speaking detection .
This setting defines how much silence is needed for Assist to find you’re done speaking and it can start processing your command.
Are things not working as expected?
Checkout the general troubleshooting section for Assist .
If you no longer use the device or want to pass it on to someone else, you can remove the Wi-Fi credentials that are stored on the device.
In the dialog, select Erase user data .
Result: Your Wi-Fi credentials are deleted from the device.
The firmware stays on the device.
Enable a wake word
Create your own wake words
Creating a cloud assistant
General troubleshooting section for assist
Using a sentence trigger
Access to your configuration files
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
