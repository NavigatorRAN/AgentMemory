# Redgtech - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/redgtech
- Final URL: https://www.home-assistant.io/integrations/redgtech
- Canonical URL: https://www.home-assistant.io/integrations/redgtech/
- Fetched at: 2026-06-28T03:11:41Z
- Content type: text/html; charset=UTF-8

## Description

Integrate your Redgtech smart switches with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Switches
Data updates
Troubleshooting
The integration can’t connect
Devices don’t appear after setup
Authentication errors
Removing the integration
To remove an integration instance from Home Assistant
The Redgtech integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects your Redgtech smart switches to Home Assistant. Redgtech is a Brazilian smart home brand that makes cloud-connected switches and relays. With this integration, you can control and monitor your Redgtech switches directly from Home Assistant.
Create a Redgtech account if you do not already have one.
Add your devices to the account using the Redgtech app.
To add the Redgtech service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Redgtech .
Follow the instructions on screen to complete the setup.
Email
The email address associated with your Redgtech account.
Password
The password for your Redgtech account.
The Redgtech integration provides a switch entity for each smart switch in your Redgtech account. Each switch entity supports turning on and off.
The Redgtech integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the Redgtech cloud API for device states every 15 seconds. The integration automatically handles token renewal when needed, so you will not need to re-authenticate manually.
Make sure your internet connection is working and that your Redgtech devices are visible and controllable in the Redgtech app. If they are not, check the device’s power and network connection.
Make sure your devices are properly configured in the Redgtech app and that your Redgtech account has access to them. If devices are still missing, try removing and re-adding the integration.
Verify that your email address and password are correct and that your Redgtech account is active. You can confirm your credentials by logging in to the Redgtech app.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Redgtech service was introduced in Home Assistant 2026.3, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jonhsady
@luan-nvg
Categories
Switch
Back to top
