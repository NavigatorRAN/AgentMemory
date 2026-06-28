# OPNsense - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/opnsense
- Final URL: https://www.home-assistant.io/integrations/opnsense
- Canonical URL: https://www.home-assistant.io/integrations/opnsense/
- Fetched at: 2026-06-28T03:06:25Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure OPNsense integration

## Extracted Text

On this page
Configuration
Presence detection
OPNsense is an open source FreeBSD based firewall
and routing platform. There is currently support for the following device types
within Home Assistant:
To add the OPNsense hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OPNsense .
Follow the instructions on screen to complete the setup.
URL
The full URL for the router API. For example, https://router.local:443/api
API key
The API key.
API secret
The secret that pairs with your API key and is required for authentication.
Verify SSL
Whether to verify the router’s SSL certificate. Keep this enabled unless your router uses a self-signed certificate in a trusted environment. Disabling certificate verification reduces security, because Home Assistant can no longer confirm that it is connecting to the correct router.
Tracker interfaces
Optionally restrict the interfaces used for device scanning.
The API key and API secret values are acquired from your OPNsense
router using the web interface. For more information on this procedure, refer
to the OPNsense documentation .
The API user requires the following privileges:
GUI Name: Diagnostics: ARP Table
GUI Name: Status: Interfaces
GUI Name: System: Firmware
This platform allows you to detect presence by looking at devices connected to an OPNsense router.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OPNsense hub was introduced in Home Assistant 0.105, and it's used by
445 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@HarlemSquirrel
@Snuffy2
Categories
Hub
Back to top
