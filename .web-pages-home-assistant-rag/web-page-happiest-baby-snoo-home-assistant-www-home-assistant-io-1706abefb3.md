---
source_url: "https://www.home-assistant.io/integrations/snoo"
final_url: "https://www.home-assistant.io/integrations/snoo"
canonical_url: "https://www.home-assistant.io/integrations/snoo/"
source_handle: "web:www-home-assistant-io:1706abefb316"
source_section: "integrations-snoo"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e123a032b082725641362426ff39499defcb59265b278ae168bbbdfac92af802"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Happiest Baby Snoo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/snoo
- Final URL: https://www.home-assistant.io/integrations/snoo
- Canonical URL: https://www.home-assistant.io/integrations/snoo/
- Fetched at: 2026-06-28T03:17:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Snoo into Home Assistant

## Extracted Text

On this page
Installing the integration
Configuration
Binary Sensors
Left and right safety clips
Events
Snoo events
Sensors
State
Time left
Select
Intensity
Switch
Level lock
Sleepytime sounds
Button
Start
Removing the integration
To remove an integration instance from Home Assistant
The Snoo is a smart bassinet made by Happiest Baby that helps get your baby to sleep and helps keep them asleep.
This integration follows standard integration installation. No extra steps are required.
To add the Happiest Baby Snoo hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Happiest Baby Snoo .
Follow the instructions on screen to complete the setup.
States if the left or right safety clip is connected to the baby’s swaddle.
These are the events broadcasted by your device. The most notable event is your baby crying.
They can be:
Timer - A timer has started or updated for the current Snoo level.
Cry - The Snoo has detected your baby crying.
Command sent - A command has been received by the Snoo.
Safety clip changed - The left or right safety clip has been disconnected or connected.
Long activity press - The activity button has been held down.
Activity press - The activity button has been pressed.
Power button pressed - The power button has been pressed.
Status requested - Either the integration or your mobile app has requested a status update.
Sleepytime sounds updated - The Sleepytime sounds were turned on or off.
Config change - A config has changed such as the motion limiter.
The Snoo can have one of 8 states
Baseline - This is the basic state the snoo starts with. It has not detected the need to do any further soothing.
Level 1 - This is the lowest level of soothing
Level 2
Level 3
Level 4
Stop - The snoo is no longer running
Pre-timeout - the snoo is preparing to go back to stop rotating
Timeout - the snoo is stopping rotating.
This describes how long until the Snoo will change levels or it is Unknown if it is not currently planning to change levels.
This allows you to set the soothing level of your Snoo.
Weaning baseline - Same as baseline but does not include motion.
Level 1 - This is the lowest level of soothing.
Stop - The snoo is no longer running.
Keep SNOO’s rhythms locked on your baby’s favorite level (Baseline, Level 1, or Level 2).
Allows you to turn on SNOO’s soothing sounds before you put your baby in SNOO or after you took your baby out of SNOO for a diaper change or feeding.
Starts sleepytime sounds and motion for the SNOO. This adheres to settings such as car ride or weaning mode.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Happiest Baby Snoo hub was introduced in Home Assistant 2025.3, and it's used by
73 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Lash-L
Categories
Binary Sensor
Event
Sensor
Back to top
