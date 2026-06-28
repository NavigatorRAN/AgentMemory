---
source_url: "https://www.home-assistant.io/voice_control/assist_daily_summary"
final_url: "https://www.home-assistant.io/voice_control/assist_daily_summary"
canonical_url: "https://www.home-assistant.io/voice_control/assist_daily_summary/"
source_handle: "web:www-home-assistant-io:e0fb29dcf50c"
source_section: "voice-control-assist-daily-summary"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ed310fa59484c298e8af183d44a9db04ec77dd3ba911f50e39499b993b85d370"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Daily summary by Assist - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/voice_control/assist_daily_summary
- Final URL: https://www.home-assistant.io/voice_control/assist_daily_summary
- Canonical URL: https://www.home-assistant.io/voice_control/assist_daily_summary/
- Fetched at: 2026-06-28T03:31:53Z
- Content type: text/html; charset=UTF-8

## Description

Open source home automation that puts local control and privacy first. Powered by a worldwide community of tinkerers and DIY enthusiasts. Perfect to run on a Raspberry Pi or a local server.

## Extracted Text

On this page
Prerequisites
Adding a calendar
Adding a weather integration
Connect Home Assistant to a messenger service
Creating an OpenAI voice assistant personality
Creating an automation from a blueprint
Related topics
Related links
In this tutorial, we are creating an automation that has Assist send you a daily summary. Assist will tell you about the weather and your calendar events today. It will also send you the summary to your messenger.
Daily summary notification - using a neutral tone
We will be using OpenAI, which requires an OpenAI account. For what we do in this tutorial, the free trial option is sufficient. No need to leave your credit card information.
This tutorial assumes you have a few things set up already:
Home Assistant Cloud or a manually configured local assistant pipeline .
This tutorial was done using the Local calendar , the Meteorologisk institutt , and the Telegram integrations. It has not been tested with other integrations of the notifications or calendar category.
Skip this if you’re already using a calendar.
Go to the integrations page and select the calendar Calendar filter.
Pick a calendar you like and install it as described in the documentation.
If you just want to follow along with this tutorial, install the local calendar integration.
When prompted for a name, call it Local calendar .
In the navigation bar on the left, you should now see a new entry for the calendar. Open it.
Add a few events for today and the next few days.
Skip this if you’re already using a weather integration.
Go to the integrations page and select the Weather filter.
If unsure, select Meteorologisk institutt and add the integration.
When prompted, enter the latitude and longitude of your home.
The coordinates allow the integration to show the weather forecast for your location.
Skip this if you’re already using a notification integration.
Go to the integrations page and select the Notifications filter.
Pick a messenger service you like and install it as described in the documentation.
If unsure, select Telegram and add the integration.
If you don’t have it already, install Telegram on your phone.
To get started with Telegram on Home Assistant, follow the set up instruction step by step.
Make sure not to copy and paste the following values from the example. Enter the real values:
api_key
allowed_chat_ids
name
chat_id
service
You now have a working Notification integration. Home Assistant can now send messages to you.
The OpenAI personality gives the messages a special touch.
Using OpenAI requires an OpenAI account. For this tutorial, the free trial option is sufficient. No need to leave your credit card information.
Create a Mario personality .
We are using a blueprint (courtesy of @allenporter ) that polls calendar events and collects weather information. It then asks ChatGPT to summarize it and ships that response to your phone.
To import the blueprint, select the button below:
Select Preview , then select Import blueprint .
Select the blueprint Conversation agent agenda notification from the list.
Enter the values for each category.
Under Notify service name , make sure not to leave the default but to use the one you set up previously. For example notify.nina .
Save your changes.
In the dialog, enter a name for your new automation. For example, Daily summary by Mario .
To view the automation, go to Settings > Automations & Scenes .
To test the automation, select the three dots on your automation, and select Run .
You should now receive a notification from Assist in your messenger app.
Local assistant pipeline
Local calendar
Telegram notification
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
