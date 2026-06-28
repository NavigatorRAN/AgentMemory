# Xthings Cloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/xthings_cloud
- Final URL: https://www.home-assistant.io/integrations/xthings_cloud
- Canonical URL: https://www.home-assistant.io/integrations/xthings_cloud/
- Fetched at: 2026-06-28T03:29:50Z
- Content type: text/html; charset=UTF-8

## Description

Connect and control Xthings Cloud smart home devices with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Lights
Data updates
Known limitations
Troubleshooting
Unable to connect during setup
Incorrect password
Devices not showing up
Removing the integration
To remove an integration instance from Home Assistant
The Xthings Cloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor your Xthings smart home devices through the Xthings Cloud service. This integration currently supports the U-tec Bright A19 Color smart light bulb.
Use case: Control your Xthings smart lights from a single Home Assistant dashboard with real-time status updates via WebSocket push.
The following device types are supported:
U-tec Bright A19 Color light bulb (Xthings Cloud) : on/off, brightness, HS color, color temperature
Before setting up the integration, make sure you have:
A Xthings Cloud account. You can create one in the Xthings mobile app.
At least one light device added and online in the Xthings app.
If your account has two-factor authentication (2FA) enabled, have access to your registered email or phone to receive verification codes.
To add the Xthings Cloud hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Xthings Cloud .
Follow the instructions on screen to complete the setup.
Email
The email address used to register your Xthings Cloud account.
Password
Your Xthings Cloud account password. The password is only used during login and is not stored.
Verification code
The 6-digit verification code sent to your email or phone. Only required if your account has 2FA enabled.
The Xthings Cloud integration provides the following entities.
Smart light
Description : On/off, brightness (0–100%), HS color, and color temperature (2000–6500K) control.
Remarks : Devices with brightness in their status are automatically registered as light entities.
The Xthings Cloud integration uses a combination of push and polling Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] for data updates:
WebSocket push (primary): The integration maintains a persistent WebSocket connection to the Xthings Cloud. Device status changes and online/offline events are pushed in real-time, typically within 1–2 seconds.
Polling (fallback): As a safety net, the integration polls the cloud API every 30 minutes to ensure data consistency in case of missed WebSocket messages.
The integration communicates with devices through the Xthings Cloud service. If the cloud service is unavailable, devices cannot be controlled.
Symptom: “Unable to connect to Xthings Cloud”
The setup form shows the error “Unable to connect to Xthings Cloud”.
Resolution
Check your internet connection.
Verify that api.cloud.xthings.com is reachable from your network.
If you are behind a corporate firewall or proxy, ensure HTTPS traffic to api.cloud.xthings.com is allowed.
Symptom: “Incorrect password”
The setup form shows the error “Incorrect password”.
Double-check your password in the Xthings mobile app.
If you have forgotten your password, use the “Forgot Password” feature in the app to reset it.
After successful setup, some or all devices are missing.
Make sure the devices are added and online in the Xthings mobile app.
Go to Settings > Devices & services > Xthings Cloud > ⋮ > Reload to refresh.
Check the Home Assistant logs for any error messages from xthings_cloud .
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Xthings Cloud hub was introduced in Home Assistant 2026.6, and it's used by
22 active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@XthingsJacobs
Categories
Light
Back to top
