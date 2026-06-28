---
source_url: "https://www.home-assistant.io/integrations/brother"
final_url: "https://www.home-assistant.io/integrations/brother"
canonical_url: "https://www.home-assistant.io/integrations/brother/"
source_handle: "web:www-home-assistant-io:8732e6c404a0"
source_section: "integrations-brother"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "69745445c3ee4feea010a0eae37130fb810c44a6b5272b08e584e190ec7d915a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Brother Printer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/brother
- Final URL: https://www.home-assistant.io/integrations/brother
- Canonical URL: https://www.home-assistant.io/integrations/brother/
- Fetched at: 2026-06-28T02:32:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Brother printer into Home Assistant.

## Extracted Text

On this page
Prerequisites
Unsupported devices
Configuration
Supported functionality
Sensors
Data updates
Possible use-cases
Examples
Known limitations
Troubleshooting
Printer is unavailable after changing SNMP community
Integration reports problems with communication or data updating
Removing the integration
To remove an integration instance from Home Assistant
The Brother Printer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to read current data from your local Brother printer.
It usually provides information about the device’s state, the left amount of ink or toner and the remaining lifetime of the drum or other parts of the printer.
The integration monitors every supported part.
To enable SNMP, navigate to the printer’s web interface (for example: http://192.168.5.6 ) and turn it on under Network > Protocol > SNMP .
For some models, access to the web interface is password-protected.
For some printers, the default password is printed on a sticker on the back of the printer, preceded by Pwd .
If the printer does not have a password on the sticker, the default password is initpass .
For some Brother devices, SNMPv3 read-write access and v1/v2c read-only access is the option required (under advanced settings).
The following devices are not supported by the integration:
MFC-8660DN
MFC-8860DN
To add the Brother Printer device to your Home Assistant instance, use this My button:
Brother Printer can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Brother Printer .
Follow the instructions on screen to complete the setup.
Host
The hostname or IP address of the Brother printer to control.
Port
The SNMP port of the Brother printer.
SNMP Community
A simple password for devices to communicate to each other.
Type of the printer
Brother printer type: ink or laser.
The Brother integration provides the following entities.
Belt unit remaining lifetime
Description : Remaining lifetime percentage of the belt unit
Black drum page counter
Description : Total number of pages printed with the black drum
Black drum remaining lifetime
Description : Remaining lifetime percentage of the black drum
Black drum remaining pages
Description : Estimated number of pages remaining for the black drum
Black ink remaining
Description : Percentage of black ink remaining
Black toner remaining
Description : Percentage of black toner remaining
B/W pages
Description : Total number of black and white pages printed
Color pages
Description : Total number of color pages printed
Cyan drum page counter
Description : Total number of pages printed with the cyan drum
Cyan drum remaining lifetime
Description : Remaining lifetime percentage of the cyan drum
Cyan drum remaining pages
Description : Estimated number of pages remaining for the cyan drum
Cyan ink remaining
Description : Percentage of cyan ink remaining
Cyan toner remaining
Description : Percentage of cyan toner remaining
Drum page counter
Description : Total number of pages printed using the main drum
Drum remaining lifetime
Description : Remaining lifetime percentage of the main drum
Drum remaining pages
Description : Estimated number of pages remaining for the main drum
Duplex unit page counter
Description : Total number of pages printed using the duplex unit
Fuser remaining lifetime
Description : Remaining lifetime percentage of the fuser unit
Laser remaining lifetime
Description : Remaining lifetime percentage of the laser unit
Uptime
Description : Date and time of the last printer restart
Remarks : This entity is disabled by default
Magenta drum page counter
Description : Total number of pages printed with the magenta drum
Magenta drum remaining lifetime
Description : Remaining lifetime percentage of the magenta drum
Magenta drum remaining pages
Description : Estimated number of pages remaining for the magenta drum
Magenta ink remaining
Description : Percentage of magenta ink remaining
Magenta toner remaining
Description : Percentage of magenta toner remaining
Page counter
Description : Total number of pages printed by the printer
PF Kit 1 remaining lifetime
Description : Remaining lifetime percentage of paper feed kit 1
PF Kit MP remaining lifetime
Description : Remaining lifetime percentage of multipurpose tray feed kit
Status
Description : Current printer status or condition
Yellow drum page counter
Description : Total number of pages printed with the yellow drum
Yellow drum remaining lifetime
Description : Remaining lifetime percentage of the yellow drum
Yellow drum remaining pages
Description : Estimated number of pages remaining for the yellow drum
Yellow ink remaining
Description : Percentage of yellow ink remaining
Yellow toner remaining
Description : Percentage of yellow toner remaining
Note
Not all printer models support all the listed entities, the set of entities is tailored to a specific printer model.
By default, the integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the device every 30 seconds.
Monitor printer status and send notifications when paper jams or other unexpected events occur.
You can configure Home Assistant to alert you when the printer jams or runs out of paper as follows. First, add the following to configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] under the template: section.
Replace sensor.hl_l2340d_status with the actual name of your sensor.
template : - binary_sensor : - name : ' Laser Printer Out Of Paper' state : > {{ is_state('sensor.hl_l2340d_status', 'no paper') }} - binary_sensor : - name : ' Laser Printer Paper Jam' state : > {{ is_state('sensor.hl_l2340d_status', 'paper jam') }}
Then, add this under the alert: section:
laser_out_of_paper : name : Laser Printer is Out of Paper done_message : Laser Printer Has Paper entity_id : binary_sensor.laser_printer_out_of_paper can_acknowledge : true notifiers : - my_phone_notify laser_paper_jam : name : Laser Printer has a Paper Jam done_message : Laser Printer Paper Jam Cleared entity_id : binary_sensor.laser_printer_paper_jam can_acknowledge : true notifiers : - my_phone_notify
The above will send an alert for paper jam or out of paper whenever the condition is detected, assuming you have the Home Assistant app configured on your phone so that alerts can be sent directly to it. If you don’t use the Home Assistant app, you will need to set up a different notifier.
Change my_phone_notify to the actual notifier you are using.
Some very old Brother printers use a different data format. Those models are not supported. The integration will show information about that during configuration.
After changing the SNMP community in the printer configuration, you need to reconfigure the device in Home Assistant. To do this:
Select Brother Printer .
Click .
Select Reconfigure .
Check if the printer is online and available on the local network.
Check in the printer’s web interface if SNMP is enabled.
In the printer’s web interface, verify that SNMPv3 read/write access and v1/v2c read-only access is enabled, if available.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Brother Printer device was introduced in Home Assistant 0.104, and it's used by
8.6% of the active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bieniu
Categories
System monitor
Back to top
