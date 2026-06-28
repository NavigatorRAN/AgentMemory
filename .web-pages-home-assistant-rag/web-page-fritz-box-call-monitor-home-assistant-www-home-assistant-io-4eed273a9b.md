---
source_url: "https://www.home-assistant.io/integrations/fritzbox_callmonitor"
final_url: "https://www.home-assistant.io/integrations/fritzbox_callmonitor"
canonical_url: "https://www.home-assistant.io/integrations/fritzbox_callmonitor/"
source_handle: "web:www-home-assistant-io:4eed273a9bbe"
source_section: "integrations-fritzbox-callmonitor"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8e09ec45b54e571b21dbc1a8168caa3f9c43d0a40d7020bb5faa0356fcad6065"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# FRITZ!Box Call Monitor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fritzbox_callmonitor
- Final URL: https://www.home-assistant.io/integrations/fritzbox_callmonitor
- Canonical URL: https://www.home-assistant.io/integrations/fritzbox_callmonitor/
- Fetched at: 2026-06-28T02:44:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a phone call monitor for FRITZ!Box routers into Home Assistant.

## Extracted Text

On this page
Prerequisites
Setup
Configuration
Examples
Send notifications on state change
The FRITZ!Box Call Monitor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] monitors the call monitor exposed by FRITZ!Box routers (by FRITZ!, formerly AVM) on TCP port 1012. It will assume the values idle , ringing , dialing or talking with the phone numbers involved contained in the state attributes.
It can also access the internal phone book of the router to look up the names corresponding to the phone numbers and store them in the state attributes.
To use the FRITZ!Box call monitor in your installation, a user with at least Voice messages, faxes, FRITZ!App Fon and call list rights has to be created:
Open the web user interface via fritz.box or the IP address of your FRITZ!Box (e.g. 192.168.1.1 ).
Log in with your admin user credentials. The default admin user credentials can be found at the bottom of your FRITZ!Box.
Navigate to System > FRITZ!Box User .
Click the Add User button.
Enable the option User account enabled .
Enter a username and password.
Check the rights box next to Voice messages, faxes, FRITZ!App Fon and call list .
Click the Apply button.
You also need network access from HA to your FRITZ!Box on port tcp/1012 for the call monitoring, as well as one time access to port tcp/80 for setting up the integration.
To activate the call monitor on your FRITZ!Box, dial #96*5* from any phone connected to it. When using a DECT phone, the phone must not be connected via a DECT-Repeater, it must be directly connected to your FRITZ!Box.
To add the FRITZ!Box Call Monitor device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select FRITZ!Box Call Monitor .
Follow the instructions on screen to complete the setup.
If you want Home Assistant to resolve numbers to names based on your FRITZ!Box phone book, you have to configure the correct prefixes. Usually, you just need one single prefix, which equals your country calling code, e.g. +49 for Germany or +33 for France. Find the right prefix on Wikipedia and add it on the configurations page.
This example shows how to send notifications whenever the sensor’s state changes. You will get notified both when you receive a call and also when a call is placed.
# Example configuration.yaml entry. automation : - alias : " Notify about phone state" triggers : - trigger : state entity_id : sensor.phone actions : - action : notify.notify data : title : " Phone" message : >- {% if is_state("sensor.phone", "idle") %} Phone is idle {% elif is_state("sensor.phone", "dialing") %} Calling {{ state_attr('sensor.phone', 'to_name') }} \({{ state_attr('sensor.phone', 'to') }}\) {% elif is_state("sensor.phone", "ringing") %} Incoming call from {{ state_attr('sensor.phone', 'from_name') }} \({{ state_attr('sensor.phone', 'from') }}\) {% else %} Talking to {{ state_attr('sensor.phone', 'with_name') }} \({{ state_attr('sensor.phone', 'with') }}\) {% endif %}
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The FRITZ!Box Call Monitor device was introduced in Home Assistant 0.27, and it's used by
4189 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
System monitor
Back to top
