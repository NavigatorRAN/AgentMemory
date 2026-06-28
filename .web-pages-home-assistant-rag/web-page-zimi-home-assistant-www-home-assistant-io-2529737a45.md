---
source_url: "https://www.home-assistant.io/integrations/zimi"
final_url: "https://www.home-assistant.io/integrations/zimi"
canonical_url: "https://www.home-assistant.io/integrations/zimi/"
source_handle: "web:www-home-assistant-io:2529737a45eb"
source_section: "integrations-zimi"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b6598dcb2e3f5d24dde33bdf2078a8b4de705eafa738009bec45b2619a3abaa1"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# zimi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/zimi
- Final URL: https://www.home-assistant.io/integrations/zimi
- Canonical URL: https://www.home-assistant.io/integrations/zimi/
- Fetched at: 2026-06-28T03:31:08Z
- Content type: text/html; charset=UTF-8

## Description

Access and control your Zimi Cloud Controller and its connected Zimi-based devices.

## Extracted Text

On this page
Supported devices
Unsupported devices
Prerequisites
Configuration
Supported functionality
Zimi cover
Zimi fan
Zimi light
Zimi sensor
Zimi switch
Data updates
Known limitations
Troubleshooting
Missing Zimi devices
Device authorization failure
Removing the integration
To remove an integration instance from Home Assistant
Related links
The Zimi Cloud Controller integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Zimi Cloud Controller to Home Assistant and, via this integration, control local devices connected to the Zimi mesh.
For a detailed description of the Zimi portfolio, refer to the Zimi’s website .
This integration supports the following Zimi devices:
Zimi Cloud Connect ( links to specifications )
The following Zimi devices are yet to be supported:
Zimi Matter Connect ( links to specifications )
A configured Zimi Cloud Connect and internet connection is needed for this integration to work.
Open the app store and install the Zimi app.
Open the Zimi app and configure a Zimi network by adding and naming all Zimi devices.
Open the Zimi app and configure a Zimi Cloud Connect device.
Take a note of the Zimi Cloud Connect IP address and MAC address.
Configure the Zimi integration using standard configuration flow.
To add the zimi hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select zimi .
Follow the instructions on screen to complete the setup.
You will be prompted to configure the Zimi Cloud Connect through the Home Assistant interface.
If the Zimi discovery process is successful and there is a single Zimi Cloud Connect, then the integration will be configured without further user input.
If the Zimi discovery process is successful and there are multiple Zimi Cloud Connects present, then you will be prompted to select the desired Zimi Cloud Connect.
If the Zimi discovery process is unsuccessful (that is, if the Zimi Cloud Connect is not reachable on the local LAN), then you will be prompted for the following parameters:
host
The IP address of your Zimi Cloud Connect. You can find it via your router admin interface.
port
The port number used to connect to your Zimi Cloud Connect. If no port number is entered, the integration will use the default port. (The default port will be correct in almost all deployment scenarios)
It is possible to add multiple Zimi Cloud Connect devices.
The integration will support all Zimi devices. Note that the naming conventions and default integration types may not be what you expect.
Zimi devices that are generic switches will be shown in the UI as a switch and not as a light. The Identify as light for voice control is not available in the API to pass the necessary information to Home Assistant to correctly classify. For more details on the concept and how to change your device to the correct type after the initial integration, see Change device type of a switch .
Zimi devices and names will be mapped per HA guidelines in the table below. The user may change these names to more friendly names - see Customizing entities .
When you add a supported device, the following entities will be created:
Zimi product HA device name HA entities HA default friendly name Blind Controller Cover 1xCover Cover {Name} Fan and Light Controller Fan 1xFan
1xSwitch Fan {Name}
Fan {Name} Garage Door Controller Cover 1xCover
2xSensor Garage {Name}
Garage {Temperature}
Garage {Humidity} Light Dimmer Switch Light 1xLight Light {Name} Multi Dimmer Switch (2 button) Light 1xLight Light {Name} Multi Dimmer Switch (4 button) Light 2xLight Light {Name}
Light {Name} Multi-Purpose Switch (1 button) Switch 1xSwitch Switch {Name} Multi-Purpose Switch (2 button) Switch 2xSwitch Switch {Name}
Switch {Name} Multi-Purpose Switch (3 button) Switch 3xSwitch Switch {Name}
Switch {Name}
Switch {Name} Multi-Purpose Switch (4 button) Switch 4xSwitch Switch {Name}
Switch {Name} Power Point Outlet 2xOutlet Outlet {Name}
Cover entity: Basic open/close and open to percentage
Fan entity: Basic on/off and speed control
Light entity: Basic on/off and brightness control
Battery Level (in %)
Garage Temperature (in degrees)
Garage Humidity (in %)
Outside Temperature (in degrees)
Switch entity: Basic on/off
The integration receives updates instantly from the Zimi Cloud Controller via the Zimi API.
Entity name changes made in the Zimi app will not be reflected in Home Assistant until after a restart. This is because entity names are only read during integration setup and Home Assistant startup.
If there are missing Zimi devices after the initial integration, you may have to run the discovery process again.
To do this:
Select Zimi .
Select Add Hub .
This will re-run the discovery process.
Due to the authorization lifecycle of the Zimi Cloud Controller, the device implements rate limiting on authorization requests. If you exceed these limits
(typically more than 3-5 requests within a few minutes), the device will temporarily reject new connection attempts. If you encounter this issue, you’ll
need to wait for the rate limit to reset.
Remove the integration from Settings > Devices & services > Zimi .
Wait for approximately 5 minutes.
Try adding the integration again.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
https://zimi.life/
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The zimi hub was introduced in Home Assistant 2025.6, and it's used by
41 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@markhannon
Categories
Cover
Fan
Light
Sensor
Switch
Back to top
