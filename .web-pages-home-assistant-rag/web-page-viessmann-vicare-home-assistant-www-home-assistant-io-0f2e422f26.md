---
source_url: "https://www.home-assistant.io/integrations/vicare"
final_url: "https://www.home-assistant.io/integrations/vicare"
canonical_url: "https://www.home-assistant.io/integrations/vicare/"
source_handle: "web:www-home-assistant-io:0f2e422f26c8"
source_section: "integrations-vicare"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "28b529b0f14de262d017bf87cf6bda4343fc40ee0377917b7b6a9f603ba5ad3a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Viessmann ViCare - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vicare
- Final URL: https://www.home-assistant.io/integrations/vicare
- Canonical URL: https://www.home-assistant.io/integrations/vicare/
- Fetched at: 2026-06-28T03:26:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to integrate Viessmann heating devices with Home Assistant

## Extracted Text

On this page
Prerequisites
API limits
Configuration
Entities
Climate
Fan
Water heater
Sensor
Button
Number
Select
List of actions
Climate and water heater control
Setting the temperature
Setting the HVAC mode
Setting the preset mode
Troubleshooting
UTF-8 characters in passwords
GATEWAY_OFFLINE
Removing the integration
To remove an integration instance from Home Assistant
The Viessmann ViCare integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control Viessmann devices via the Viessmann ViCare (REST) API.
Most recent network-connected Viessmann heating devices (e.g., gas boilers) should be supported.
You will need to sign in on the Viessmann developer portal with your existing ViCare app user credentials .
Create a new API client by selecting Add in the Clients section on the developer dashboard with the following settings:
Name: HomeAssistant
Google reCAPTCHA: disabled
Redirect URIs: https://my.home-assistant.io/redirect/oauth
Copy the Client ID in the Clients section on the developer dashboard for the setup in Home Assistant.
Note
It may take up to an hour for your new client to become active and usable. Otherwise, you will not receive any devices in Home Assistant.
When Home Assistant prompts for application credentials during setup, enter the Client ID from the Viessmann developer portal. The Client Secret field is not used by the integration (ViCare uses PKCE), so you can enter any value.
The Viessmann API is rate-limited. In the “Basic” (free) tier of their API plans, if you exceed one of the limits below, you will be blocked for 24 hours:
120 calls for a time window of 10 minutes
1450 calls for a time window of 24 hours
For the paid API plans this limit increases to 3000 calls in 24 hours. The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] polls the API every 60 seconds and will work within these limits. However, any additional requests to the API, for example, by setting the temperature via the integration and interacting with the ViCare app, count into those limits.
Important
For any Viessmann API plan except the most expensive “Advanced” tier, Viessmann imposes certain limits on which APIs are accessible for end-user consumption. Unfortunately, this also affects APIs useful for smart home integrations, like controlling thermostats (TRVs) and climate sensors, which are only available in the “Advanced” plan API tier. In case you set up the integration with a lower-tier plan, TRVs and other smart home entities will not become accessible in your Home Assistant installation.
Please consider providing feedback to Viessmann as described in their FAQ “Where can I give feedback on the API?” in case you consider this as a limitation for your use-case.
If you have multiple Viessmann devices in Home Assistant, the limit is shared between them, meaning the poll interval is increased, and the values are less frequently updated!
To add the Viessmann ViCare hub to your Home Assistant instance, use this My button:
Viessmann ViCare can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Viessmann ViCare .
Follow the instructions on screen to complete the setup.
ViCare represents devices as a set of data points and the ViCare integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] maps those to entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] of different platforms Platforms are building blocks provided by some integrations to be used by other integrations. [Learn more] in Home Assistant. A single device may be represented by one or more platforms.
Represents the heating controls of your device.
Viessmann devices with room temperature sensing will show the current room temperature via current_temperature . All other devices will show the current supply temperature of the heating circuit.
Ventilation units are displayed as fans and enable the change of speed and use of presets.
Represents the domestic hot water controls of your device.
It is not possible to turn on/off water heating via the water heater integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] since this would conflict with the operation modes of the heating integration. Therefore, the operation mode of that integration is just available as an attribute and cannot be modified.
Additional data for a device is available as separate sensors. The sensors are automatically discovered based on the available API data points.
Button entities are available for triggering like a one-time charge of the water heater.
Number entities are available to adjust values like the predefined temperature for different heating programs or the heating curve shift and slope.
Select entities allow configuring the domestic hot water ( DHW ) operating mode of your Viessmann device. Available options depend on the specific device model and may include balanced , economical , or off modes.
The Viessmann ViCare integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set ViCare mode ( vicare.set_vicare_mode )
Sets the mode of the climate device as defined by Viessmann.
For an overview of every action across all integrations, see the actions reference .
The ViCare integration also provides the standard climate and water_heater actions. The ViCare integration provides set_temperature , set_hvac_mode , and set_preset_mode for climate entities, and set_temperature for the water heater. A few of these behave in ViCare-specific ways.
The climate.set_temperature action always affects the current normal temperature or, if a preset is set, the temperature of the preset (that is, a Viessmann program such as eco or comfort).
The ViCare integration maps the Home Assistant HVAC modes to Viessmann operation modes as follows:
off : maps to ForcedReduced , which permanently sets heating to the reduced temperature. This also deactivates domestic hot water.
heat : maps to ForcedNormal , which permanently sets heating to the normal temperature.
auto : maps to DHWandHeating , which switches between the reduced and normal temperature based on the heating schedule programmed in your device.
The climate.set_preset_mode action supports the eco and comfort preset modes. These are identical to the respective Viessmann programs and are only active temporarily for 8 hours. Eco mode reduces the target temperature by 3°C, whereas Comfort mode sets the target temperature to a configurable value. Consult your heating device manual for more information.
The underlying PyViCare Python library cannot handle UTF-8 characters in passwords, so do not use for example ü or ø in passwords.
The ViCare API tends to lose contact with the gateway from time to time. This will be logged in Home Assistant with:
Invalid data from Vicare server: {
'viErrorId': '...',
'statusCode': 400,
'errorType': 'DEVICE_COMMUNICATION_ERROR',
'message': '',
'extendedPayload': {
'httpStatusCode': 'NotFound',
'code': '404',
'reason': 'GATEWAY_OFFLINE'
}
Usually, this resolves itself after a while, but if this state persists, try to power cycle your gateway.
This integration follows standard integration removal. Once the integration is removed, you can remove the API client (assuming it was only used by this integration) by going to the Viessmann developer portal and deleting the client you created for Home Assistant.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Viessmann ViCare hub was introduced in Home Assistant 0.99, and it's used by
1.1% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@CFenner
@lackas
Categories
Back to top
