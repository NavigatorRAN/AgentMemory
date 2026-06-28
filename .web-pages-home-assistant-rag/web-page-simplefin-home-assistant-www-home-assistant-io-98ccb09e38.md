# SimpleFin - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/simplefin
- Final URL: https://www.home-assistant.io/integrations/simplefin
- Canonical URL: https://www.home-assistant.io/integrations/simplefin/
- Fetched at: 2026-06-28T03:16:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on the SimpleFIN Integration for personal finance.

## Extracted Text

On this page
Configuration
Setup Guide
Accounts & Devices
SimpleFIN allows users to share read-only financial data. This is a paid service although it is quite affordable ($1.50 a month).
To add the SimpleFin service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SimpleFin .
Follow the instructions on screen to complete the setup.
Within the SimpleFIN Interface, you can create a Claim Token , a one-time token that can be exchanged for an Access URL . You can enter either a Claim Token or an Access URL as a configuration element for this integration.
Each account will be set up as a device in Home Assistant, and it will contain the following sensors:
Sensor Description Age This sensor shows when the data was retrieved by the SimpleFin API Balance Account balance Problem Binary sensor that indicates whether the account sync may have a problem
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SimpleFin service was introduced in Home Assistant 2024.8, and it's used by
53 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@scottg489
@jeeftor
Categories
Finance
Sensor
Back to top
