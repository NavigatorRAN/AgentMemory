# File size - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/filesize
- Final URL: https://www.home-assistant.io/integrations/filesize
- Canonical URL: https://www.home-assistant.io/integrations/filesize/
- Fetched at: 2026-06-28T02:42:32Z
- Content type: text/html; charset=UTF-8

## Description

Integration for monitoring the size of a file.

## Extracted Text

On this page
Configuration
The File size integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is for displaying the size in MB of a file.
Important
File paths must also be added to allowlist_external_dirs in your configuration.yaml .
Example allowlist_external_dirs configuration to monitor a file in your configuration folder.
homeassistant : allowlist_external_dirs : - " /config" # Default configuration directory
File paths should be absolute paths. For example: /config/home-assistant_v2.db to monitor the size of the default database.
To add the File size integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select File size .
Follow the instructions on screen to complete the setup.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The File size integration was introduced in Home Assistant 0.64, and it's used by
3959 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Sensor
Utility
Back to top
