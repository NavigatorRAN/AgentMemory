# Monoprice 6-Zone Amplifier - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/monoprice
- Final URL: https://www.home-assistant.io/integrations/monoprice
- Canonical URL: https://www.home-assistant.io/integrations/monoprice/
- Fetched at: 2026-06-28T03:01:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Monoprice 6-Zone Home Audio Controller into Home Assistant.

## Extracted Text

On this page
Configuration
Configuration notes
Zone management
List of actions
The Monoprice 6-Zone Amplifier integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Monoprice 6-Zone Amplifier using a serial connection.
To add the Monoprice 6-Zone Amplifier hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Monoprice 6-Zone Amplifier .
Follow the instructions on screen to complete the setup.
If you are using an IP232 module instead of a direct serial connection, then use socket://<host>:<port> in the port setting.
Sources can also be later edited from the integration options (gear icon in the top right when selecting the integration). Note that editing sources will remove the snapshot you may have saved.
Devices and entities are created for each of the possible 18 zones, and can be enabled, disabled and renamed through regular Home Assistant methods.
By default, the first 6 zones (11..16) are enabled, and there’s an attempt to automatically detect the 12 extension zones (21..26, and 31..36) on the first run.
The Monoprice 6-Zone Amplifier integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Restore a saved Monoprice zone snapshot ( monoprice.restore )
Restores one or more Monoprice amplifier zones to a previously saved state.
Snapshot the current state of a Monoprice zone ( monoprice.snapshot )
Saves the current state of one or more Monoprice amplifier zones so you can restore it later.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Monoprice 6-Zone Amplifier hub was introduced in Home Assistant 0.56, and it's used by
151 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@etsinko
@OnFreund
Categories
Media player
Back to top
