---
source_url: "https://www.home-assistant.io/integrations/freebox"
final_url: "https://www.home-assistant.io/integrations/freebox"
canonical_url: "https://www.home-assistant.io/integrations/freebox/"
source_handle: "web:www-home-assistant-io:460c7c38ecf7"
source_section: "integrations-freebox"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "474d862be0afd9c8c7c17d097e0cbc85044e26500330fabb4e2061614c9769dc"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Freebox - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/freebox
- Final URL: https://www.home-assistant.io/integrations/freebox
- Canonical URL: https://www.home-assistant.io/integrations/freebox/
- Fetched at: 2026-06-28T02:44:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Freebox routers into Home Assistant.

## Extracted Text

On this page
Configuration
Initial setup
Supported routers
Presence detection
Notes
Sensor
Binary sensor
Camera
Binary
Alarm control panel
Action
Action: Reboot
Switch
The Freebox integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to observe and control Freebox router .
There is currently support for the following device types within Home Assistant:
Sensor with metrics for connection speed, internal temperature, free partition space and missed calls
Binary sensor for monitoring Raid arrays health
Device tracker for connected devices
Switch to control Wi-Fi
Binary sensors
Alarm_control_panel
To add the Freebox device to your Home Assistant instance, use this My button:
Freebox can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Freebox .
Follow the instructions on screen to complete the setup.
You can find out your Freebox host and port by opening this address http://mafreebox.freebox.fr/api_version in your browser.
The returned JSON should contain an api_domain ( host ) and a https_port ( port ).
Please consult the API documentation for more information.
Tip
The host (ex: xxxxxxxx.fbxos.fr) and port given by http://mafreebox.freebox.fr/api_version refers to your Freebox public IP address and may not work if your Home Assistant server is located inside your local LAN. For local API access, you can alternatively use host = mafreebox.freebox.fr and port = 443 .
Important
You must have set a password for your Freebox router web administration page. Enable the option “Permettre les nouvelles demandes d’associations” and check that the option “Accès à distance sécurisé à Freebox OS” is active in “Gestion des ports” > “Connexions entrantes”.
The first time Home Assistant will connect to your Freebox, you will need to authorize it by pressing the right arrow on the facade of the Freebox when prompted to do so.
To make the Wi-Fi switch and the reboot action working, you will have to add “Modification des réglages de la Freebox” permission to Home Assistant application in “Paramètres de la Freebox” > “Gestion des accès” > “Applications”.
To use cameras from the Freebox Delta, you will have to add “Gestion de l’alarme et maison connectée” permission to Home Assistant application in “Paramètres de la Freebox” > “Gestion des accès” > “Applications”.
Only the routers with Freebox OS are supported:
Freebox V9 also known as Freebox Ultra
Freebox V8 also known as Freebox Pop
Freebox V7 also known as Freebox Delta
Freebox V6 also known as Freebox Revolution
Freebox mini 4k
This platform offers presence detection by keeping track of the devices connected to a Freebox router.
Note that the Freebox waits for some time before marking a device as
inactive, meaning that there will be a small delay (1 or 2 minutes)
between the time you disconnect a device and the time it will appear
as “away” in Home Assistant. You should take this into account when specifying
the consider_home parameter.
On the contrary, the Freebox immediately reports devices newly connected, so
they should appear as “home” almost instantly, as soon as Home Assistant
refreshes the devices states.
This platform offers you sensors to monitor a Freebox router.
The monitored metrics are:
Internal temperature
Upload and download rates (in KB/s)
Free partition space of used disks
Number of missed calls
The health status of each RAID array can be monitored with a diagnostics binary sensor reflecting the degraded state (OK means not degraded, PROBLEM means degraded).
Cameras are only available in Freebox V7 (also known as Freebox Delta).
This platform offers you sensors to monitor:
motion sensor
door opener
plastic cover
This integration allows you to view and control the Freebox alarm control panel.
The freebox.reboot action allows you to reboot your Freebox router. It does not take any parameter. Be aware there is no confirmation.
This platform offers you a switch to toggle the Wi-Fi on or off. This will toggle all Wi-Fi interfaces of the router (all SSID and all bands).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Freebox device was introduced in Home Assistant 0.85, and it's used by
1.1% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hacf-fr/reviewers
@Quentame
Categories
Alarm
Network
Back to top
