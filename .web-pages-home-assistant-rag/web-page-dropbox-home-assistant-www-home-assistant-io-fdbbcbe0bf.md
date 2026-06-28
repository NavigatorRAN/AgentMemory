# Dropbox - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dropbox
- Final URL: https://www.home-assistant.io/integrations/dropbox
- Canonical URL: https://www.home-assistant.io/integrations/dropbox/
- Fetched at: 2026-06-28T02:38:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up backup to a Dropbox account within Home Assistant.

## Extracted Text

On this page
Configuration
Using the integration
Removing the integration
To remove an integration instance from Home Assistant
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Dropbox account with Home Assistant Backups.
To add the Dropbox service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Dropbox .
Follow the instructions on screen to complete the setup.
Note
By default, this integration will use the Home Assistant Cloud Account Linking service to authenticate with Dropbox. This does not require a Home Assistant Cloud subscription, and is the easiest and recommended way to set up the integration. If you want to use your own Dropbox application credentials instead, please follow the instructions in the “Using custom application credentials” section below.
Using custom application credentials
Go to the Dropbox App Console and create an app.
Choose Scoped access for the API and App folder for the access type.
Give the app a unique name.
Take note of the App key and App secret . These are the application credentials for your newly created app.
In the OAuth 2 section, under Redirect URIs , enter the following URL: https://my.home-assistant.io/redirect/oauth and select Add .
On the Permissions tab, enable files.content.write and files.content.read .
In Home Assistant, in Settings > Devices & services in the top-right three dots menu > Application credentials , select the button to add an application credential.
Select Dropbox and enter the name of your app. For the client ID and client secret, enter the app key and app secret from step 4 and select Add .
After the integration is set up, Dropbox will appear as a backup location in Home Assistant’s Backup feature. Backups will be stored in a folder named “Home Assistant” within the Apps folder of your Dropbox. You can rename or move this folder anywhere you want and backups will still be stored there.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
If you remove the integration, the Home Assistant folder in Dropbox containing your backups is not automatically deleted. If you want to delete the backup files, you need to manually delete the Home Assistant folder in Dropbox.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Dropbox service was introduced in Home Assistant 2026.4, and it's used by
53 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdr99
Categories
Backup
Back to top
