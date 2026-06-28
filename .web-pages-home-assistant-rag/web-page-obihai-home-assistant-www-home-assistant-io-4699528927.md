---
source_url: "https://www.home-assistant.io/integrations/obihai"
final_url: "https://www.home-assistant.io/integrations/obihai"
canonical_url: "https://www.home-assistant.io/integrations/obihai/"
source_handle: "web:www-home-assistant-io:469952892715"
source_section: "integrations-obihai"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6546376117464138f83d24f438aceda04fefecba4cdab9ddcf6ed60574b9923a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Obihai - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/obihai
- Final URL: https://www.home-assistant.io/integrations/obihai
- Canonical URL: https://www.home-assistant.io/integrations/obihai/
- Fetched at: 2026-06-28T03:04:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Obihai device into Home Assistant.

## Extracted Text

On this page
Configuration
The Obihai integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to view the call status for your Obihai devices .
To add the Obihai device to your Home Assistant instance, use this My button:
Obihai can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Obihai .
Follow the instructions on screen to complete the setup.
host
IP Address of Obihai device
username
Username for the Obihai device.
password
Password for the Obihai device.
The following is a list of expected sensors and their expected states when using the user account:
Sensor if the device requires a reboot ( True or False )
Sensor for each configured service ( 0 for no calls, 1 for a call and 2 for call waiting/3way calling)
Sensor for the last reboot date
Sensor for call direction ( No Active Calls , Inbound Call or Outbound Call )
In addition to the above list the admin account can expect to see the following sensors:
Obihai service status ( Normal , Down or other states from Obihais network)
Sensors for each phone port in use ( On Hook , Off Hook and Ringing )
Sensors for last caller name and number (this is also the current incoming call, will also show -- if no data provided)
You will also see a reboot button for each configured Obihai, this button will restart the Obihai when pressed.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Obihai device was introduced in Home Assistant 0.99, and it's used by
583 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dshokouhi
@ejpenney
Categories
Sensor
Back to top
