# Steam - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/steam_online
- Final URL: https://www.home-assistant.io/integrations/steam_online
- Canonical URL: https://www.home-assistant.io/integrations/steam_online/
- Fetched at: 2026-06-28T03:18:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Steam sensors in Home Assistant.

## Extracted Text

On this page
Configuration
Setup
Examples
The Steam integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will allow you to track the online status of public Steam accounts.
To add the Steam service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Steam .
Follow the instructions on screen to complete the setup.
Important
Steam has a friends list privacy feature that interferes with easily adding sensors to track friends’ activities. Setting the friends list to Public during initial setup will allow the integration to see them for easy adding. It is not necessary to keep the friends list Public.
Go to your profile, select “Edit Profile”, “Privacy Settings”.
You need a free API key to use the platform. The domain name appears to not have any effect, but it’s recommended to set this to your Home Assistant domain name. If you wish to avoid the proprietary Steam mobile application (needed because API key creation requires Steam Guard Mobile Authenticator), you can temporarily enroll in Steam Guard in the app, create an API key, then unregister Steam Guard again. The new API key will continue to function.
To find an account’s 64-bit SteamID:
Open Steam.
Open the dropdown menu labeled with your username.
Select Account details .
Your Steam ID is displayed just below the label Your-Account-Name Account .
If you want to add the accounts to a group for example you will have to use:
# Example configuration.yaml entry group : steam : name : Steam entities : - sensor.steam_account1 - sensor.steam_account2
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Steam service was introduced in Home Assistant 0.14, and it's used by
2839 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Social
Back to top
