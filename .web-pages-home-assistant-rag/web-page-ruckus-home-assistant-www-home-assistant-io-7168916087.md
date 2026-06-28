---
source_url: "https://www.home-assistant.io/integrations/ruckus_unleashed"
final_url: "https://www.home-assistant.io/integrations/ruckus_unleashed"
canonical_url: "https://www.home-assistant.io/integrations/ruckus_unleashed/"
source_handle: "web:www-home-assistant-io:71689160877c"
source_section: "integrations-ruckus-unleashed"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "57c9d62aa1fafe103c7cbcd1222c93376176d5110c5115d584bff64155d08f31"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Ruckus - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ruckus_unleashed
- Final URL: https://www.home-assistant.io/integrations/ruckus_unleashed
- Canonical URL: https://www.home-assistant.io/integrations/ruckus_unleashed/
- Fetched at: 2026-06-28T03:13:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Ruckus Networks device into Home Assistant.

## Extracted Text

On this page
Prerequisites
Ruckus Unleashed
Ruckus One
Configuration
Options
Known limitations
Troubleshooting
The Ruckus integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect to Ruckus access points.
Ruckus Unleashed ,
Ruckus ZoneDirector ,
Ruckus SmartZone ,
and Ruckus One
access points are supported. Access points running Standalone/Solo firmware are not supported.
There is currently support for the following device types within Home Assistant:
Presence detection - The platform will look at devices connected to the access point and will
create a device_tracker for each discovered device.
IP address / hostname , Username and Password which you use to connect
to your Ruckus controller’s web dashboard.
You may enter the IP address / hostname of any access point as the Host.
If you’ve configured an Unleashed Management Interface, then use this instead.
You’ll need to use your Ruckus One dashboard to create an Application Token. Go to the bottom of the
Administration > Settings screen and select the Add Token link. Choose any
Application Name , for example Home Assistant . The Token Scope can be Read Only .
When Home Assistant prompts for Ruckus connection details, use the full URL of a Ruckus One
dashboard page as the Host (such as https://asia.ruckus.cloud/5dd1000334cc2a01fcf28a740a6c95cf/t/dashboard ),
your Token Client ID as the Username & your Token Shared Secret as the Password.
To add the Ruckus hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ruckus .
Follow the instructions on screen to complete the setup.
To define options for Ruckus, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Ruckus are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Clients to track
Select specific clients to track. If none are selected, all clients are tracked. Previously selected clients that are currently offline remain in the list.
You can filter which clients are tracked using the integration options. However, there is currently no way to filter by Venue or Zone, so this integration may not be suitable for large multi-venue SmartZone or Ruckus One networks.
If you’ve configured your access points with an extended Client Inactivity Timeout, then this is how long
you’ll need to wait for devices to be detected as not_home .
For this platform to work, the Ruckus controller or Unleashed AP will need to be accessible over HTTPS.
If you are having trouble with Home Assistant not connecting, make sure the user you have specified
can log in to the web dashboard and view AP, WLAN, and Client information.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ruckus hub was introduced in Home Assistant 0.117, and it's used by
245 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@lanrat
@ms264556
@gabe565
Categories
Presence detection
Back to top
