---
source_url: "https://www.home-assistant.io/integrations/viaggiatreno"
final_url: "https://www.home-assistant.io/integrations/viaggiatreno"
canonical_url: "https://www.home-assistant.io/integrations/viaggiatreno/"
source_handle: "web:www-home-assistant-io:dc991e083313"
source_section: "integrations-viaggiatreno"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "7531503238a84a4742e300a79aa208b865006b7385fe065966373e8554cf9bcf"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Trenitalia ViaggiaTreno - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/viaggiatreno
- Final URL: https://www.home-assistant.io/integrations/viaggiatreno
- Canonical URL: https://www.home-assistant.io/integrations/viaggiatreno/
- Fetched at: 2026-06-28T03:26:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Italian Railroads data (from ViaggiaTreno API) into Home Assistant.

## Extracted Text

On this page
Related topics
The Trenitalia ViaggiaTreno integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will give you information about configured train ids and stations using the public ViaggiaTreno API.
To activate the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you need at least two parameters: the train_id and the station_id .
The first is available just looking at the ViaggiaTreno timetable, the latter can be obtained using the dedicated API endpoint:
http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/autocompletaStazione/<Station name>
(e.g., http://www.viaggiatreno.it/infomobilita/resteasy/viaggiatreno/autocompletaStazione/ROMA will list all station names (with ids) that starts with ROMA ).
Note
The station_id is referred to the train’s departing station . If a train number does not match with the station id, no data will be returned to the sensor.
Then add the data to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : viaggiatreno train_id : 12279 station_id : S08409
Configuration Variables
Looking for your configuration file?
train_id integer Required
The ID of the train.
station_id integer Required
The ID of the starting station.
train_name string ( Optional )
The name of the sensor. Defaults to ‘Train from ’.
In a future implementation, the station name could be used to automatically search best-matching station id, without the need to specify it.
The public timetables are coming from ViaggiaTreno .
Instructions (in Italian) for the API are available at:
https://github.com/bluviolin/TrainMonitor/wiki/API-del-sistema-Viaggiatreno
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Trenitalia ViaggiaTreno integration was introduced in Home Assistant 0.58, and it's used by
7 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Transport
Back to top
