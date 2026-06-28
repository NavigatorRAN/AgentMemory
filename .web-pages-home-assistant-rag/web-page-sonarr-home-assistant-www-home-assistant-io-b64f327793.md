# Sonarr - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sonarr
- Final URL: https://www.home-assistant.io/integrations/sonarr
- Canonical URL: https://www.home-assistant.io/integrations/sonarr/
- Fetched at: 2026-06-28T03:18:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sonarr with Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
List of actions
The Sonarr integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] pulls data from a given Sonarr instance.
To add the Sonarr service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sonarr .
Follow the instructions on screen to complete the setup.
URL
The URL of your Sonarr instance, including the port number and base path if applicable (for example, http://localhost:8989 or http://192.168.1.100:8989/sonarr ).
API Key
Your Sonarr API key. To find it, open your Sonarr web interface and navigate to Settings > General . The API key is listed under the Security section.
The Sonarr integration will add the following sensors:
Upcoming : The number of upcoming episodes.
Commands : The number of commands being run. (disabled by default)
Disk space : Available disk space in gigabytes. (disabled by default)
Queue : The number of episodes in the download queue. (disabled by default)
Shows : The number of series in Sonarr. (disabled by default)
Wanted : The number of episodes still wanted. (disabled by default)
The sensors provide summary counts. For detailed information about each item, such as series details or download progress, use the corresponding actions Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] described below.
The Sonarr integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get disk space ( sonarr.get_diskspace )
Retrieves the disk space information for all storage locations configured in Sonarr.
Get episodes ( sonarr.get_episodes )
Retrieves all episodes for a specific series in your Sonarr library.
Get queue ( sonarr.get_queue )
Retrieves the episodes currently in the Sonarr download queue with their progress and details.
Get series ( sonarr.get_series )
Retrieves all series in your Sonarr library with their details and statistics.
Get upcoming ( sonarr.get_upcoming )
Retrieves upcoming episodes from the Sonarr calendar.
Get wanted ( sonarr.get_wanted )
Retrieves wanted (missing) episodes that Sonarr is searching for.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sonarr service was introduced in Home Assistant 0.34, and it's used by
4513 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ctalkington
Categories
Downloading
Back to top
