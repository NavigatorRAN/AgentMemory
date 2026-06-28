---
source_url: "https://www.home-assistant.io/integrations/repetier"
final_url: "https://www.home-assistant.io/integrations/repetier"
canonical_url: "https://www.home-assistant.io/integrations/repetier/"
source_handle: "web:www-home-assistant-io:30bbcac16f02"
source_section: "integrations-repetier"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d35ba931792832db29c48f8d849bec27b7582efd242d619e70eae30134789500"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Repetier-Server - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/repetier
- Final URL: https://www.home-assistant.io/integrations/repetier
- Canonical URL: https://www.home-assistant.io/integrations/repetier/
- Fetched at: 2026-06-28T03:12:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to add Repetier-Server sensors to Home Assistant.

## Extracted Text

On this page
Configuration
Retrieve API-key
Repetier-Server is a 3D printer/CNC server, able to control multiple devices on the same server.
This integration handles the main integration to the server.
There is currently support for the following device types within Home Assistant:
Sensor
repetier : - host : REPETIER_HOST api_key : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
repetier list Required
Repetier integration
host string Required
The host IP or hostname of your Repetier-Server.
api_key string Required
API-key for the user used to connect to Repetier-Server
port integer ( Optional , default: 3344 )
The port used to connect to the host
sensors map ( Optional )
Configuration for the sensors.
monitored_conditions list
The sensors to activate.
current_state
Text of current state.
extruder_temperature
Temperatures of all available extruders. These will be displayed as printer_name_extruder_N .
bed_temperature
Temperatures of all available heated beds. These will be displayed as printer_name_bed_N .
chamber_temperature
Temperatures of all available heated chambers. These will be displayed as printer_name_chamber_N .
current_job
Returns percentage done of current job in state, and current job information as attributes.
job_start
Start timestamp of job start.
job_end
Estimated job end timestamp.
Example with multiple Repetier Servers:
repetier : - host : REPETIER_HOST api_key : YOUR_API_KEY sensors : monitored_conditions : - ' current_state' - ' current_job' - host : REPETIER_HOST api_key : YOUR_API_KEY port : 3344
If the Repetier-Server host is equipped with a web camera it is possible to add this as well.
camera : - platform : mjpeg name : Repetier still_image_url : http://YOUR_REPETIER_HOST_IP:8080/?action=snapshot mjpeg_url : http://YOUR_REPETIER_HOST_IP:8080/?action=stream
To generate the needed API-key do the following:
Go to your Repetier Server web-console
Push the settings icon (the gear icon)
Select User Profiles.
Create a new user, deselect all options and click Create User.
Edit the newly created user and take note of the API-key for this user, that’s the one to use in the Home Assistant Settings
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Repetier-Server integration was introduced in Home Assistant 0.94, and it's used by
15 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ShadowBr0ther
Categories
Hub
Back to top
