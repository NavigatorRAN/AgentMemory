---
source_url: "https://www.home-assistant.io/integrations/flic"
final_url: "https://www.home-assistant.io/integrations/flic"
canonical_url: "https://www.home-assistant.io/integrations/flic/"
source_handle: "web:www-home-assistant-io:761c793d33e6"
source_section: "integrations-flic"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c6b4876f0fd5049fc9572f179edd782c9baab167a18742aebddc07c060cff3f4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Flic - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/flic
- Final URL: https://www.home-assistant.io/integrations/flic
- Canonical URL: https://www.home-assistant.io/integrations/flic/
- Fetched at: 2026-06-28T02:43:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate flic buttons within Home Assistant.

## Extracted Text

On this page
Action setup
Configuration
Discovery
Timeout
Events
Ignoring click types
Related topics
The Flic integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to receive click events from flic smart buttons.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] does not directly interact with the buttons, but communicates with a flic service that manages the buttons. The service can run on the same instance as Home Assistant or any other reachable machine.
If you are using the Home Assistant Operating System, you can run the service locally by installing the Home Assistant flicd app from pschmitt’s repository .
For instructions on how to install the service manually, visit the GitHub repository of the service for Linux , macOS or Windows .
To use your flic buttons in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry binary_sensor : - platform : flic
Configuration Variables
Looking for your configuration file?
host string ( Optional , default: localhost )
The IP or hostname of the flic service server.
port integer ( Optional , default: 5551 )
The port of the flic service.
discovery boolean ( Optional , default: true )
If true then the integration is configured to constantly scan for new buttons.
ignored_click_types list ( Optional )
List of click types whose occurrence should not trigger a flic_click event. Click types are single , double , and hold .
timeout integer ( Optional , default: 3 )
The maximum time in seconds an event can be queued locally on a button before discarding the event.
If discovery is enabled, you can add a new button by pressing it for at least 7 seconds. The button will be paired with the flic service and added to Home Assistant. Otherwise, you have to manually pair it with the flic service. The Home Assistant platform will not scan for new buttons and will only connect to buttons already paired.
When the flic button is triggered while disconnected from flic service, it will queue all events and try to connect and transmit them as soon as possible. The timeout variable can be used to stop events from triggering if too much time passed between the action and the notification in Home Assistant.
The flic integration fires flic_click events on the bus. You can capture the events and respond to them in automation scripts like this:
# Example configuration.yaml automation entry automation : - alias : " Turn on lights in the living room when flic is pressed once" triggers : - trigger : event event_type : flic_click event_data : button_name : flic_81e4ac74b6d2 click_type : single actions : - action : homeassistant.turn_on target : entity_id : group.lights_livingroom
Event data:
button_name : The name of the button, that triggered the event.
button_address : The Bluetooth address of the button, that triggered the event.
click_type : The type of click. Possible values are single , double and hold .
queued_time : The amount of time this event was queued on the button, in seconds.
To help detect and debug flic button clicks, you can use this automation that send a notification on very click type of every button. This example uses the HTML5 push notification platform . Visit the notification integration page for more information on setting up notifications.
automation : - alias : " FLIC Html5 notify on every click" triggers : - trigger : event event_type : flic_click actions : - action : notify.html5 data : title : " flic click" message : " flic {{ trigger.event.data.button_name }} was {{ trigger.event.data.click_type }} clicked"
For some purposes it might make sense to exclude a specific click type from triggering click events. For example, when ignoring double clicks, pressing the button twice fast results in two single instead of a double click event. This is very useful for applications where you want to click fast.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Flic integration was introduced in Home Assistant 0.35, and it's used by
281 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Binary sensor
Back to top
