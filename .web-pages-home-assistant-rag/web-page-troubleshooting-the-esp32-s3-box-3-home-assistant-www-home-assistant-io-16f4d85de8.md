---
source_url: "https://www.home-assistant.io/voice_control/troubleshooting_the_s3_box"
final_url: "https://www.home-assistant.io/voice_control/troubleshooting_the_s3_box"
canonical_url: "https://www.home-assistant.io/voice_control/troubleshooting_the_s3_box/"
source_handle: "web:www-home-assistant-io:16f4d85de8fd"
source_section: "voice-control-troubleshooting-the-s3-box"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c89a94a6d9dcd54e7bf6652f24e6c6e43c5710fd2d8171478f4452f72b78dac7"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Troubleshooting the ESP32-S3-BOX-3 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/troubleshooting_the_s3_box
- Final URL: https://www.home-assistant.io/voice_control/troubleshooting_the_s3_box
- Canonical URL: https://www.home-assistant.io/voice_control/troubleshooting_the_s3_box/
- Fetched at: 2026-06-28T03:32:31Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Error: Unable to connect to Wi-Fi
Symptom
Remedy
The Wi-Fi dialog never shows after the installation
Error: No Home Assistant
Description
Related topics
Related links
This section provides troubleshooting steps for the ESP32-S3-BOX-3 by Espressif.
The ESP32-S3-BOX-3 shows a message that it is unable to connect to Wi-Fi.
First, check if your network is ready in general.
Make sure your router is on and within reach.
Make sure you have chosen a Wi-Fi network that supports 2.4 GHz. The ESP32-S3-BOX-3 won’t show up on a 5 GHz network.
The next step is to make sure you entered the correct Wi-Fi password. Follow the steps either under Option 1 or Option 2 , depending on whether or not you have the ESPHome app installed.
Option 1 : You do not have the ESPHome app installed or you have the app but did not adopt the ESP32-S3-BOX-3. If the device is shown in green, it is not adopted.
Make sure the USB cable is plugged into the ESP32-S3-BOX-3.
Go to the ESPHome projects website , select the Connect button, then Change Wi-Fi .
Option 2 : You already have the ESPHome app installed and adopted the ESP32-S3-BOX-3 on your ESPHome dashboard.
In Home Assistant, go to Settings > Apps > ESPHome , and Open Web UI .
On the ESP32-S3-BOX-3 app, select edit.
Result: An editor opens, showing the configuration file.
In the wifi section, check if it refers to the secrets file (contains !secret ).
If it does not contain a wifi section, enter the section below:
wifi : ssid : !secret wifi_ssid password : !secret wifi_password
Close the editor and in the overview, select Secrets .
Enter your Wi-Fi credentials.
The installation wizard never shows the dialog to connect to the Wi-Fi, but directly returns to the screen with Install Voice Assistant .
Disconnect the USB cable connecting the ESP32-S3-BOX-3 and connect it again.
If this didn’t help, check if you are using a USB cable that is power only and does not transfer data.
The ESP32-S3-BOX-3 shows a message that there is no Home Assistant.
This message indicates that the device could connect to the Wi-Fi, but is unable to communicate with Home Assistant.
If you see this message during a restart or while an update is running, wait until the restart or update is finished.
In this case, there is nothing you need to do. It is expected that the device temporarily stops communicating.
Make sure your device is on the same network as Home Assistant.
If you have a complex network setup with VLAN, make sure it is in the same VLAN.
Go to Settings > Devices & services .
If the device is shown as Discovered , select Add .
If it was not discovered, select Add integration > ESPHome .
If you see the screen below, but the ESP32-S3-BOX-3 is not listed, select Setup another instance of ESPHome .
Go to your router, find the IP address or hostname of your device, and enter it.
Creating a esp32 s3 box 3 voice assistant
ESPHome projects website
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
