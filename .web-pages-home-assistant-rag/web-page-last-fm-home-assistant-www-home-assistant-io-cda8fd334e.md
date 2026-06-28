# Last.fm - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/lastfm
- Final URL: https://www.home-assistant.io/integrations/lastfm
- Canonical URL: https://www.home-assistant.io/integrations/lastfm/
- Fetched at: 2026-06-28T02:55:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Last.fm sensors into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Configuration options
Supported functionality
Sensors
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Last.fm integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you monitor the listening activity of Last.fm users. It creates a sensor for each user you add, showing whether they are currently scrobbling and what they are listening to.
A Last.fm account.
A Last.fm API key. You can create one by registering an API account on the Last.fm website.
To add the Last.fm service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Last.fm .
Follow the instructions on screen to complete the setup.
API key
The API key from your Last.fm API account.
Last.fm username
Your Last.fm username. This is the main user for the integration and is used to look up your friends list in the next step.
After entering your API key and Last.fm username, you are asked to select additional Last.fm users to track. Your friends list is shown for convenience, but you can also enter any Last.fm username manually.
To add or remove tracked users after setup, go to Settings > Devices & services , select the Last.fm integration, and select Configure .
Last.fm usernames
The Last.fm users to track. You can select from your friends list or enter usernames manually.
The integration creates one sensor per tracked Last.fm user.
State : The currently playing track, formatted as “Artist - Title”. When the user is not listening, the state is “Not Scrobbling”.
Entity picture : The user’s Last.fm avatar.
Each sensor also provides the following attributes:
last_played : The last track the user scrobbled, formatted as “Artist - Title”.
play_count : The total number of tracks the user has scrobbled on Last.fm.
top_played : The user’s most played track, formatted as “Artist - Title”.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] Last.fm every 30 seconds for updated listening data.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Last.fm service was introduced in Home Assistant 0.20, and it's used by
538 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Social
Back to top
