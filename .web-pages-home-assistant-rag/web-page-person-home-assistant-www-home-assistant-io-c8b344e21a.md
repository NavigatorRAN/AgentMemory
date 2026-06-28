---
source_url: "https://www.home-assistant.io/integrations/person"
final_url: "https://www.home-assistant.io/integrations/person"
canonical_url: "https://www.home-assistant.io/integrations/person/"
source_handle: "web:www-home-assistant-io:c8b344e21a30"
source_section: "integrations-person"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "beb3d1b15abca5c59e607cf386bd669237c4c625eb72b8fcf2074444286fb183"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Person - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/person
- Final URL: https://www.home-assistant.io/integrations/person
- Canonical URL: https://www.home-assistant.io/integrations/person/
- Fetched at: 2026-06-28T03:07:52Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up people tracking within Home Assistant.

## Extracted Text

On this page
Adding a person to Home Assistant
Customizing the picture for a person
Configuring the person integration via the Home Assistant configuration panel
Configuring the person integration via YAML
List of actions
Related topics
The Person integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows connecting device tracker entities to one or more person entities. You can use person entities with zones to create automations that react when someone enters or leaves a place. The state updates of a connected device tracker set the state of the person. When you use multiple device trackers, the state of the person is determined in this order:
If there are stationary trackers (non-GPS trackers, such as a router or Bluetooth device tracker) presenting the state home , the tracker most recently updated will be used.
If there are trackers of type gps , then the most recently updated tracker will be used.
Otherwise, the latest tracker with state not_home will be used.
Let’s say, for example, that you have three trackers: tracker_gps , tracker_router , and tracker_ble .
You’re at home, and all three devices show state home . The state of your Person entity will be home with source tracker_router or tracker_ble , whichever was most recently updated.
You just left home. tracker_gps shows state not_home , but the other two trackers show state home (they may not have yet updated due to their consider_home setting, see device_tracker ). Since the stationary trackers have priority, you are considered home .
After some time, both stationary trackers show state not_home . Now your Person entity has state not_home with source tracker_gps .
While you are away from home, your Home Assistant instance is restarted. Until the tracker_gps receives an update, your status will be determined by the stationary trackers, since they will have the most recent update after a restart. The state will be not_home .
Then you’re going into a zone you have defined as zone1 , tracker_gps sends an update, and now your state is zone1 with source tracker_gps .
You’ve returned home and your mobile device has connected to the router, but tracker_gps hasn’t updated yet. Your state will be home with source tracker_router .
After the tracker_gps update occurs, your state will still be home with source tracker_router or tracker_ble , whichever has the most recent update.
In short, when you’re at home, your position is determined first by stationary trackers (if any) and then by GPS. When you’re outside your home, your position is determined first by GPS and then by stationary trackers.
Tip
When you use multiple device trackers together, especially stationary and GPS trackers, it’s advisable to set consider_home for stationary trackers as low as possible (see device_tracker ).
You can manage persons via the UI from the person page inside the configuration panel or via YAML in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
If you have administrator rights, you can add other persons to Home Assistant and create user accounts for them. Depending on the rights you give them, they can then use Home Assistant on their own devices, have their own dashboards, and be included in automations.
Go to Settings > People and select Add person .
Enter their Name .
Add an image if you like.
Decide whether they should be able to sign in.
If they cannot sign in, they do not get a user account and cannot do much with Home Assistant.
They cannot have their own dashboard, for example.
But they can still be used for device tracking, show up on a map, and be included in automations.
If they can sign in, turn on Allow login . This opens the Add user dialog, where you fill in the user information.
Check if the username is correct. Home Assistant suggests one based on the person name, but the two do not have to be identical.
The username must be lowercase and contain no spaces.
The username is required to sign in.
The person name is the name displayed in the UI.
Enter a password, confirm it, and store it in a safe location.
Define if they should have Local access only .
If this is enabled, they won’t have access to Home Assistant when they are outside your network, for example, from their phone.
Define if they should have Administrator rights.
Select Create to create the user account and return to the person dialog.
If you have already set up devices for presence detection , select the devices that belong to this person.
To save the person, select Add .
To upload a picture in the frontend, open a person’s page, select an image file or drag and drop one into the input field, and then crop it.
See the documentation about hosting files for more information about the www folder.
This integration is enabled by default, unless you’ve disabled or removed the default_config: line from your configuration. If that is the case, enable it manually by adding the following to your configuration:
person :
If you prefer YAML, you can also configure your persons via the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry person : - name : Ada id : ada6789 device_trackers : - device_tracker.ada
Configuration Variables
Looking for your configuration file?
id string Required
A unique ID for the person.
name string Required
The name of the person.
user_id string ( Optional )
The user ID of the Home Assistant user account for the person. You can find the user_id (also shown as ID ) under Settings > People , on the Users tab.
device_trackers string | list ( Optional )
A list of device tracker entity IDs to track. These will represent the state of the person.
Here’s an extended example:
# Example configuration.yaml entry person : - name : Ada id : ada6789 device_trackers : - device_tracker.ada - name : Stacey id : stacey12345 user_id : 12345678912345678912345678912345 device_trackers : - device_tracker.stacey - device_tracker.beacon
If you change the YAML, you can reload it by calling the person.reload action.
The Person integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Reload persons ( person.reload )
Reloads persons from the YAML configuration.
For an overview of every action across all integrations, see the actions reference .
Device tracker
Zone
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Person system was introduced in Home Assistant 0.88, and it's used by
99.5% of the active installations.
Its IoT class is Calculated.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Presence detection
Back to top
