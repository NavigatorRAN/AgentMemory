# Rollease Acmeda Automate - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/acmeda
- Final URL: https://www.home-assistant.io/integrations/acmeda
- Canonical URL: https://www.home-assistant.io/integrations/acmeda/
- Fetched at: 2026-06-28T02:25:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on setting up Rollease Acmeda Automate within Home Assistant.

## Extracted Text

On this page
Supported devices
Configuration
Multiple hubs
Caveats
The Rollease Acmeda Automate integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control and monitor covers via your Rollease Acmeda Automate hub. The integrations communicates directly with hubs on the local network, rather than connecting via the cloud or via RS-485. Devices are represented as a cover for monitoring and control as well as a sensor for monitoring battery condition.
Automate Pulse Hub v1
To add the Rollease Acmeda Automate integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Rollease Acmeda Automate .
Follow the instructions on screen to complete the setup.
Multiple hubs work transparently with discovery, so you don’t have to do anything special to set them up.
If the IP address for the hub changes, you will need to re-register it with Home Assistant again. To avoid this, you may set up a DHCP reservation on your router for your hub so that it always has the same IP address.
The integration has the following limitations:
Covers with position as well as tilt are not supported.
The integration doesn’t use rooms and scenes configured in the hub, use the equivalent functionality in Home Assistant instead.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rollease Acmeda Automate integration was introduced in Home Assistant 0.111, and it's used by
9 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@atmurray
Categories
Cover
Hub
Back to top
