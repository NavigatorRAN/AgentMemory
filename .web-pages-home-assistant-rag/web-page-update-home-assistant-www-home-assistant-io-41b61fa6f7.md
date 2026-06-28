# Update - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/update
- Final URL: https://www.home-assistant.io/integrations/update
- Canonical URL: https://www.home-assistant.io/integrations/update/
- Fetched at: 2026-06-28T03:25:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use update entities with Home Assistant.

## Extracted Text

On this page
The state of an update entity
Device class
List of triggers
List of conditions
List of actions
Update automation examples
Automation: send a notification when an update becomes available
Automation: install an update during the evening if it is still available
Related topics
An update entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] is an entity that indicates if an update is available for a
device or service. This can be any update, including update of a firmware
for a device like a light bulb or router, or software updates for things like
add-ons or containers.
Note
Building block integration
This update is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this update building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the update building block offers.
For a list of integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] offering update entities, on the integrations page, select the “Update” category .
The state of an update entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] reflects whether an update is available or not.
When the state is On , it means there is an update available; when everything
is up-to-date, the state is Off .
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The following state attributes are exposed to provide more
information on the update state:
title : The title/name of the available software or firmware. As the device
name or entity name can be changed in Home Assistant, this title will provide
the actual name of the software or firmware.
installed_version : The current version that is currently installed and in use.
latest_version : The latest version that is available for installation.
skipped_version : If a version update is skipped, this attribute will be set
and contains the actual version that was skipped.
release_summary : A summary of the release notes for the update available.
release_url : A link to the full release announcement for the update available.
A device class is a measurement categorization in Home Assistant. It influences how the entity is represented in the dashboard . This can be modified in the customize section . For example, different states may be represented by different icons, colors, or text.
The following device classes are supported for update entities:
None : A generic software update. This is the default and doesn’t need
to be set.
firmware : This update integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides firmwares.
The Update integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following triggers. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Update became available ( update.update_became_available )
Triggers after one or more updates become available.
For an overview of every trigger across all integrations, see the triggers reference .
The Update integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following conditions. Each link below opens a dedicated page with examples, fields, and a step-by-step UI walkthrough.
Update is available ( update.is_available )
Tests if one or more updates are available.
Update is not available ( update.is_not_available )
Tests if one or more updates are not available.
For an overview of every condition across all integrations, see the conditions reference .
The Update integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Clear skipped update ( update.clear_skipped )
Removes the skipped version marker from an update.
Install update ( update.install )
Installs an update for a device or service.
Skip update ( update.skip )
Marks a currently available update as skipped.
For an overview of every action across all integrations, see the actions reference .
Update entities are useful when you want to stay informed about available updates or take action at the right time. Here are a few examples to help you get started.
Labs
Requires the Purpose-specific triggers and conditions Labs preview feature . Enable it at Settings > System > Labs .
Tip
You don’t need to edit YAML to use these examples. Copy a YAML snippet from this page, open the automation editor in Home Assistant, and press Ctrl + V (or Cmd + V on Mac). Home Assistant automatically converts the pasted YAML into the visual editor format, whether it’s a full automation, a single trigger, a condition, or an action.
If an update for a device or service becomes available, this automation sends a
notification to your phone right away.
Trigger : Update became available
Target : Office router update
Action : Send a notification message
Target : My Device ( notify.my_device )
YAML example for notifying you about a new update
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Send a notification when an update becomes available"
triggers:
- trigger: update.update_became_available
target:
entity_id: update.office_router_firmware
actions:
- action: notify.send_message
entity_id: notify.my_device
data:
title: "Update available"
message: >
A new update is available for the office router.
If you prefer to install updates at a quieter time, this automation checks each
evening whether an update is still available and starts the installation.
Trigger : Time: 21:00
Condition : Update is available
Action : Install update
YAML example for installing an update in the evening
Automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] alias: "Install an update during the evening if it is still available"
- trigger: time
at: "21:00:00"
conditions:
- condition: update.is_available
- action: update.install
Customizing devices
Dashboard
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Update entity was introduced in Home Assistant 2022.4.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Back to top
