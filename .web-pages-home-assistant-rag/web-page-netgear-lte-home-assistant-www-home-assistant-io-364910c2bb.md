---
source_url: "https://www.home-assistant.io/integrations/netgear_lte"
final_url: "https://www.home-assistant.io/integrations/netgear_lte"
canonical_url: "https://www.home-assistant.io/integrations/netgear_lte/"
source_handle: "web:www-home-assistant-io:364910c2bb89"
source_section: "integrations-netgear-lte"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3732e494ecaba28ab56b59db052bd0605c0eac98096fd5092316834dd8d57453"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# NETGEAR LTE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/netgear_lte
- Final URL: https://www.home-assistant.io/integrations/netgear_lte
- Canonical URL: https://www.home-assistant.io/integrations/netgear_lte/
- Fetched at: 2026-06-28T03:02:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your NETGEAR LTE modem within Home Assistant.

## Extracted Text

On this page
Configuration
Notification Actions
Events
Event netgear_lte_sms
List of actions
Examples
The NETGEAR LTE integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to observe and control NETGEAR LTE modems .
There is currently support for the following device types within Home Assistant:
Notifications
Sensors
Binary sensors
The integration supports sending notifications with SMS, reporting incoming SMS with events and reporting the modem and connection state in several sensors and binary sensors.
Note
Splitting of long SMS messages is not supported so notifications can contain a maximum of 70 characters. Simple messages using the reduced GSM-7 alphabet can contain up to 160 characters. Most emojis are not supported.
To add the NETGEAR LTE device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select NETGEAR LTE .
Follow the instructions on screen to complete the setup.
The integration will create a notify actions matching the name of the integration entry. This is the model name of the device by default.
Messages arriving in the modem inbox are sent as events of type netgear_lte_sms with the following content.
Event data attribute Description host The modem that received the message. sms_id The inbox ID of the received message. from The sender of the message. message The SMS message content.
The NETGEAR LTE integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Connect LTE ( netgear_lte.connect_lte )
Asks the NETGEAR LTE modem to establish its LTE connection.
Delete SMS ( netgear_lte.delete_sms )
Deletes messages from the NETGEAR LTE modem inbox.
Disconnect LTE ( netgear_lte.disconnect_lte )
Asks the NETGEAR LTE modem to close its LTE connection.
Set option ( netgear_lte.set_option )
Sets connection options on the NETGEAR LTE modem.
For an overview of every action across all integrations, see the actions reference .
The following automation example processes incoming SMS messages with the Conversation integration and then deletes the message from the inbox.
automation : - alias : " SMS conversation" triggers : - trigger : event event_type : netgear_lte_sms actions : - action : conversation.process data : text : " {{ trigger.event.data.message }}" - action : netgear_lte.delete_sms data : host : " {{ trigger.event.data.host }}" sms_id : " {{ trigger.event.data.sms_id }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NETGEAR LTE device was introduced in Home Assistant 0.72, and it's used by
79 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Binary sensor
Network
Sensor
Back to top
