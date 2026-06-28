# Anova - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/anova
- Final URL: https://www.home-assistant.io/integrations/anova
- Canonical URL: https://www.home-assistant.io/integrations/anova/
- Fetched at: 2026-06-28T02:28:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Anova Wi-Fi Sous Vide into home assistant.

## Extracted Text

On this page
Configuration
Sensor
The Anova integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Anova sous vides with Wi-Fi capability.
Supported devices (tested):
AN500-10 (Anova Precision Cooker)
AN500-US00 (Anova Precision Cooker)
AN600-10 (Anova Precision Cooker Pro)
The ‘nano’ versions of the sous vide are not supported, but as long as your app is connected to the sous vide, the data should update. They would be better served using BLE instead of API calls.
To add this platform to your installation, You will need your Anova username and password, and you need to have at least one sous vide connected to your account.
Important
The Anova integration requires login via email and password.
If your Anova account sign-in is through Google/Facebook/Apple, you will need to switch to the password login method.
You can do this via the Anova password reset page and then enter your new password in the Anova integration configuration.
To add the Anova hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Anova .
Follow the instructions on screen to complete the setup.
Cook Time - How long the sous vide has been cooking in seconds
Mode - The current mode of the sous vide (“Idle”, “Cook”, “Low water”).
State - The current state of the sous vide (“Preheating”, “Cooking”, “Maintaining”).
Target Temperature - The temperature the sous vide is set to heat to.
Cook Time Remaining - How long is left in the cook in seconds.
Heater Temperature - The current temperature of the heater.
Triac Temperature - The current temperature of the triac.
Water Temperature - The current temperature of the water.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Anova hub was introduced in Home Assistant 2023.5, and it's used by
449 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Lash-L
Categories
Back to top
