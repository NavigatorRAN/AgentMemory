---
source_url: "https://www.home-assistant.io/integrations/letpot"
final_url: "https://www.home-assistant.io/integrations/letpot"
canonical_url: "https://www.home-assistant.io/integrations/letpot/"
source_handle: "web:www-home-assistant-io:cd43675bcf88"
source_section: "integrations-letpot"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4f5c209b2f18c8b78831431ac18df8437d477e489b5e21ccda04f714e3ad506f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# LetPot - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/letpot
- Final URL: https://www.home-assistant.io/integrations/letpot
- Canonical URL: https://www.home-assistant.io/integrations/letpot/
- Fetched at: 2026-06-28T02:55:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate LetPot hydroponic gardens into Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Binary sensors
Numbers
Selects
Sensors
Switches
Times
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The LetPot integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to integrate your LetPot hydroponic gardens/systems into Home Assistant.
The following devices are supported by this integration:
LetPot Air (LPH-AIR)
LetPot Max (LPH-MAX)
LetPot Mini (LPH-MINI)
LetPot Pro (LPH-PRO)
LetPot Senior (LPH-SE)
To use this integration, you must first create a LetPot account and connect your hydroponic garden to Wi-Fi using the official app.
To add the LetPot hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select LetPot .
Follow the instructions on screen to complete the setup.
Email
The email address of your LetPot account.
Password
The password of your LetPot account.
The LetPot integration provides the following entities.
Pump : Indicates if the water pump is running (on) or idle (off). Updates may be delayed by the device until another entity updates.
Available for LetPot Air devices, and other device models which report this value.
Not available for LetPot Pro devices.
Additionally, binary sensors for possible issues are available:
Low nutrients : Indicates if the nutrient solution tank used for auto mode is (almost) empty and should be refilled.
Available for LetPot Max devices.
Low water : Indicates if the water tank is (almost) empty and should be refilled.
Available for all devices except LetPot Pro.
Pump error : Indicates if the water pump detected a flow issue and should be cleaned.
Available for some LetPot Mini and LetPot SE devices which report this value.
Refill error : Indicates that the external water tank/input used for refilling in auto mode is not filling up the main water tank. If you see a refill error, check the external water tank/input and the connection to the main water tank.
Important
Binary sensors for issues are disabled by default. If you want to use them, you need to enable them first. See the enabling or disabling entities documentation for information on how to do this.
Plants age : The number of days the plants in the hydroponic garden have been growing/since planting. This value is automatically updated by the device while the Power switch is on. Edit the value to restart the counter or use your own logic.
For LetPot Max devices, the following number is also available:
Light brightness : Set the built-in light brightness level. Accepted values are 1 (lowest) to 8 (highest).
Light mode : Set the built-in light mode to fruits/flowers (red and white LEDs enabled) or veggies/herbs (red, white and blue LEDs enabled).
Depending on device support, more selects are available:
Light brightness : Set the built-in light brightness to low or high.
Available for LetPot Air devices, and some LetPot SE devices which support changing the brightness.
Temperature unit on display : Set the temperature unit for the temperature shown on the device’s display.
Available for LetPot Max devices, excluding devices with a serial number starting with LPH63 .
For LetPot Max devices, the following sensors are available:
Temperature : Ambient temperature measured by the device.
Water level : Percentage of the water tank filled with water. The official app will display 0-30% as “Low”, 30-90% as “Medium”, and 90% or more as “High”.
Power : Main switch to turn on/off the device. Device features (like the built-in light and pump) will only operate when the power is on.
Pump cycling : Turn on/off cycling of the water pump. When on, the pump will run intermittently (controlled by the device), which can be tracked using the Pump binary sensor.
For devices with an alarm that allows muting the sound, the following switch is also available:
Alarm sound : Turn on/off the alarm sound.
For LetPot Max devices, the following switch is also available:
Auto mode : Turn on/off auto mode, which automatically adds water and nutrients to the garden when needed.
Light on : Time when the built-in light turns on.
Light off : Time when the built-in light turns off.
Note
When Light on and Light off are set to the same time, the built-in light will be turned off.
The integration receives push updates when the device state changes, enabling immediate updates of the data in Home Assistant.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The LetPot hub was introduced in Home Assistant 2025.2, and it's used by
161 active installations.
Its IoT class is Cloud Push.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jpelgrom
Categories
Binary sensor
Number
Select
Sensor
Switch
Time
Back to top
