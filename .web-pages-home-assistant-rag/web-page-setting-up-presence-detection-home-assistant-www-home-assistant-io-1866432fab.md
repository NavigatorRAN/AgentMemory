---
source_url: "https://www.home-assistant.io/getting-started/presence-detection"
final_url: "https://www.home-assistant.io/getting-started/presence-detection"
canonical_url: "https://www.home-assistant.io/getting-started/presence-detection/"
source_handle: "web:www-home-assistant-io:1866432fab74"
source_section: "getting-started-presence-detection"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "f8f57740d10cacaba3b34c3c4dc49c5366b08575c8a11078691cfc6367ef83c5"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Setting up presence detection - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/getting-started/presence-detection
- Final URL: https://www.home-assistant.io/getting-started/presence-detection
- Canonical URL: https://www.home-assistant.io/getting-started/presence-detection/
- Fetched at: 2026-06-28T02:25:04Z
- Content type: text/html; charset=UTF-8

## Description

Set up presence detection in Home Assistant to trigger automations when people arrive home or leave.

## Extracted Text

On this page
About setting up zone presence detection
Adding zone presence detection with a mobile phone
Prerequisites
To add zone presence detection with a mobile phone
Adding presence detection for other persons in your home
Presence detection tells Home Assistant who is at home and where they are. That is one of the most useful pieces of information you can give your smart home, because it lets your automations react to people arriving and leaving:
Send me a notification when my child arrives at school
Turn on the AC when I leave work
Map dashboard showing a school, work, and a home zone and the location of two people.
There are different ways of setting up zone presence detection. One way is to run an app on your phone to send detailed location information to your Home Assistant instance. Another way to detect presence is by checking which devices A device is a model representing a physical or logical unit that contains entities. are connected to the network. You can do that if you have one of our supported routers . By leveraging what your router already knows, you can detect if people are at home.
Home Assistant installed
Onboarding steps completed
Remote access enabled
The easiest way to do this is by enabling
Home Assistant Cloud
Mobile phone:
Android (Android 6 or later) or iPhone (iOS 15 or later)
Phone plan with Internet access
Access to your local network where Home Assistant is running
Home Assistant Companion app installed on your phone.
During the setup procedure, make sure to grant Location access .
Location access creates a device_tracker entity for that device. This entity can be used in automations and conditions.
Open the Home Assistant Companion app on your phone and log in to your Home Assistant instance.
On the screen to Connect to Home Assistant , make sure you activate Enable location tracking .
Select Continue .
Go to Settings > Devices & Services and look for the new integration that was added: Mobile App .
On the integration card, select 1 Device . This opens the device info page.
You now see your phone name and its entities.
To view the location of your phone on the map, open the Map dashboard.
You now see a circle on that map with your initial.
It shows the current location of your phone.
To view the details, select that initial.
Open the Attributes list to see the phone’s Latitude , Longitude , and the Source of information.
The source is the device_tracker entity for that device, for example device_tracker.pixel_7_pro .
To view the entity details and the history, go to Settings > Devices & services > Entities and in the search field, enter devi and select your device_tracker entity from the list.
Check your Zones to prepare them for automations.
Your home zone was set up during onboarding, but you can edit it.
You can add other zones if you want to automate on them.
For example, if you want the heating to start when you leave your office, you can add a zone called Office .
In this case, leaving the office zone would be an automation trigger A trigger is a set of values or conditions of a platform that are defined to cause an automation to run. [Learn more] .
You could also use the location information as an automation condition Conditions are an optional part of an automation that will prevent an action from firing if they are not met. [Learn more] , for example, when you have an automation to turn on the light at sunset, but only when you are home.
For each person you want to have presence detection, add a device tracker (for example, their phone).
You can also use a smartwatch for presence detection. To do this, install the Home Assistant Companion app on the device. Make sure to allow location tracking.
To use it for zone presence detection outside your home, the smartwatch requires a mobile plan.
Go to Settings > People and select the person.
Scroll down and under Select the devices that belong to this person , select the device.
Join the Community
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Getting started
Installation
Onboarding
Concepts and terminology
Editing the dashboard
Adding integrations
Automating devices
Presence detection
Join the community
Next steps
Back to top
