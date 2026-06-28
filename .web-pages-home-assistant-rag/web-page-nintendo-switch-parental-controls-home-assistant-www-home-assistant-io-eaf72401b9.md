# Nintendo Switch parental controls - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nintendo_parental_controls
- Final URL: https://www.home-assistant.io/integrations/nintendo_parental_controls
- Canonical URL: https://www.home-assistant.io/integrations/nintendo_parental_controls/
- Fetched at: 2026-06-28T03:03:27Z
- Content type: text/html; charset=UTF-8

## Description

The Nintendo Switch Parental Controls integration allows you to monitor and control screentime for children via the Nintendo Switch Parental Controls service.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Entities
List of actions
Known limitations
Troubleshooting
Data is not updating in Home Assistant
Removing the integration
To remove an integration instance from Home Assistant
The Nintendo Switch Parental Controls integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates with the Nintendo Switch Parental Controls service, allowing parents to monitor and control screentime for their children.
Devices supported by the Nintendo Switch Parental Controls mobile app are supported by this integration.
To use the Nintendo Switch Parental Controls integration, you must access your Nintendo account’s authentication tokens. This process must be performed on a device without the official Nintendo Switch Parental Controls mobile app installed. The integration needs to intercept the authentication flow, which the app typically handles automatically.
You will need:
Your Nintendo account credentials.
A computer or mobile device without the official app installed.
In the Home Assistant UI, go to Settings > Devices & services .
Select Add integration and search for Nintendo Switch Parental Controls .
You will be prompted to provide an Access token . Select the link provided in the dialog description. This link is unique to your setup session.
A new browser tab will open. Log in to your Nintendo account using your credentials.
After successful login, you will see a Linking an External Account screen. For the Nintendo account you wish to link, right-click the red button Select this person and choose Copy Link (or Copy Link Address / Copy URL depending on your browser).
Important : Do not select the button directly, as this can redirect you and prevent you from getting the necessary token.
The copied link should have a format similar to npf54789befxxxxxxxx://auth#session_token_code={redacted}&state={redacted}&session_state={redacted} .
Close the Nintendo Account browser tab.
Paste the entire copied link (the full string) into the Access Token field in the Home Assistant configuration dialog.
Select Submit .
The configuration flow should then present additional options.
Select Submit to finalize the setup.
The Nintendo Switch Parental Controls integration provides the following entities.
Number
Max screentime today
Description : Maximum amount of screentime to allow today, for unlimited screentime, set to -1 . By setting this to 0 and turning the Suspend software switch on, you can ‘lock’ your Nintendo Switch.
Select
Restriction mode
Description : Controls whether the same screen time limits are applied every day or if each day of the week has its own separate limit.
Sensors
Used screen time
Description : The current used screen time for a given device.
Unit of measurement : minutes
Device class : duration
Time remaining
Description : The amount total amount of time remaining for a device.
Switch
Suspend software
Description : Enable to automatically suspend running software when the Bedtime alarm is reached or the maximum screen time is exceeded. Turn off to allow software to continue running past these limits.
Time
Bedtime alarm
Description : A set bedtime for a given device, at this time, the Switch can either “lock” or show an alert in the top left corner.
Bedtime end time
Description : The time that bedtime should end. Set to 00:00 to disable. Accepts values between 05:00 and 09:00 for the bedtime end time.
The Nintendo Switch parental controls integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add bonus time ( nintendo_parental_controls.add_bonus_time )
Adds bonus screen time to a Nintendo Switch.
For an overview of every action across all integrations, see the actions reference .
The integration currently does not provide all the functionality found in the mobile app. Future updates will see this extended.
Further, this integration relies on the cloud and cannot make a local connection to your Switch.
The range used for bonus time is set by Nintendo and therefore cannot be changed.
Make sure the Switch has access to the internet, without this, usage data is not being sent to Nintendo.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nintendo Switch parental controls service was introduced in Home Assistant 2025.11, and it's used by
1249 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pantherale0
Back to top
