# Deutscher Wetterdienst (DWD) Weather Warnings - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dwd_weather_warnings
- Final URL: https://www.home-assistant.io/integrations/dwd_weather_warnings
- Canonical URL: https://www.home-assistant.io/integrations/dwd_weather_warnings/
- Fetched at: 2026-06-28T02:38:36Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Deutscher Wetterdienst weather warnings into Home Assistant.

## Extracted Text

On this page
Configuration
Attributes
Some example automations
The Deutscher Wetterdienst Weather Warnings integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses the Deutscher Wetterdienst (DWD) as a source for current and advance weather warnings. The configured sensor checks for data every 15 minutes.
To add the Deutscher Wetterdienst (DWD) Weather Warnings service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Deutscher Wetterdienst (DWD) Weather Warnings .
Follow the instructions on screen to complete the setup.
Warncell ID or name
Identifier of the region. It can be a warncell ID (integer) or a warncell name. It is heavily advised to use warncell ID because a warncell name is sometimes not unique. A list of valid warncell IDs and names can be found here . Some of the warncells are outdated but still listed. If the setup fails, search the list for a similar sounding warncell. If the warncell name is not unique, " (not unique used ID)!" will be added to the reported region_name .
Device tracker entity
A device_tracker entity that will be used to identify the warncell. The entity has to contain the attributes latitude and longitude . Setting either this field or Warncell ID or name is required, but not both.
Attribute Description last_update (time) Time and date (UTC) of last update from DWD. region_name (str) Requested region name. This should be the same as the region name in the configuration, if a name was given. region_id (int) Region ID assigned by DWD. This should be the same as the region id in the configuration, if an id was given. warning_count (int) Number of issued warnings. There can be more than one warning issued at once. warning_<x> (list) The warning as a whole object containing the following attributes as nested attributes. warning_<x>_level (int) Issued warning level (0 - 4).
0: Keine Warnungen
1: Wetterwarnungen
2: Warnungen vor markantem Wetter
3: Unwetterwarnungen
4: Warnungen vor extremem Unwetter warning_<x>_type (int) Issued warning type. More information can be found here . warning_<x>_name (str) Warning name correlated with the warning type and represented as a short string. warning_<x>_headline (str) Official headline of the weather warning. warning_<x>_start (time) Starting time and date (UTC) of the issued warning. warning_<x>_end (time) Ending time and date (UTC) of the issued warning. warning_<x>_description (str) Details for the issued warning. warning_<x>_instruction (str) The DWD sometimes provides helpful information about precautions to take for the issued warning. warning_<x>_parameters (list) A list of additional warning parameters. More information can be found here . warning_<x>_color (str) The DWD color of the warning encoded as #rrggbb .
Note
In the attribute name x is the counter of the warning starting from 1 .
The following example reads out the headline and its description of the DWD warnings above 2 to your local media player.
alias : DWD-Warning at level 3 description : DWD-Warnings at level 3 triggers : - entity_id : sensor.<your_city>_current_warning_level above : 2 trigger : numeric_state conditions : - condition : state entity_id : sensor.<your_city>_current_warning_level state : " 3" - condition : time after : " 06:20:00" - condition : time before : " 22:00:00" actions : - data : volume_level : 0.14 target : device_id : <your_device_id> action : media_player.volume_set - target : entity_id : media_player.<your_mediaplayer> data : message : > Warning! There are {{ state_attr('sensor.<your_city>_current_warning_level', 'warning_count') }} weather-warnings from DWD.· {% for i in range(0, (state_attr('sensor.<your_city>_current_warning_level', 'warning_count')|int) + 1 | int ) %} {% set headline = state_attr('sensor.<your_city>_current_warning_level', 'warning_' ~ i ~ '_headline') %} {% set description = state_attr('sensor.<your_city>_current_warning_level', 'warning_' ~ i ~ '_description') %} {% set instruction = state_attr('sensor.stadt_osnabruck_current_warning_level', 'warning_' ~ i ~ '_instruction') %} {% if headline and description %} Warning {{ i }}: {% if headline %} {{ headline }} {% endif %} {% if description %} {{ description }} {% endif %} {% if instruction %} {{ instruction }} {% endif %} {% endif %} {% endfor %} action : tts.google_translate_say enabled : true mode : single
Substitute <your_city> , your <your_device_id> and <your_mediaplayer> with your entity-names.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Deutscher Wetterdienst (DWD) Weather Warnings service was introduced in Home Assistant 0.51, and it's used by
1.8% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@runningman84
@stephan192
Categories
Weather
Back to top
