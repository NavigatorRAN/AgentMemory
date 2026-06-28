# Crownstone - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/crownstone
- Final URL: https://www.home-assistant.io/integrations/crownstone
- Canonical URL: https://www.home-assistant.io/integrations/crownstone/
- Fetched at: 2026-06-28T02:35:37Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up the Crownstone integration within Home Assistant.

## Extracted Text

On this page
Configuration
Options
Crownstones
Crownstone USB
The Crownstone integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control your Crownstones either via the cloud or using a Crownstone USB dongle.
The Crownstone integration supports the following Crownstone devices:
Crownstone Plug (This can be plugged directly into an existing power outlet)
Crownstone Built-In One (This can be put behind power outlets, lamp fixtures, or switches)
To add the Crownstone integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Crownstone .
Follow the instructions on screen to complete the setup.
To define options for Crownstone, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Crownstone are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Use a Crownstone USB dongle to enable local data transmission
Enabling this option will launch a flow, which will allow you to configure a Crownstone USB dongle. Disabling this option will remove current configuration.
Crownstone Sphere where the USB is located
This option is available when a Crownstone USB dongle is configured, and there are multiple Crownstone Spheres available. You can select in which Sphere the USB dongle is currently located.
Crownstones can dim, however dimming is disabled by default. To enable dimming for a Crownstone:
Go to your Crownstone app
Tap on a Crownstone that you want to enable the dimming functionality
Tap on Abilities
Toggle Dimming on
When you have changed an ability through the Crownstone app, the change will be automatically updated in Home Assistant. Note that Home Assistant will reload the entry when dimming is changed.
Enabling dimming is at own risk. It is recommended to only use dimming on lights.
The default connection method of the Crownstone integration is Cloud Polling. However, a Crownstone USB is available. Instead of switching and dimming Crownstones using the Cloud, this dongle hooks directly into the Crownstone mesh to switch Crownstones, which means the latencies are really low.
Furthermore, the Crownstone USB dongle allows for independent switching of Crownstones. When using the Cloud, a smartphone must be in
the Sphere to switch the Crownstone.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Crownstone integration was introduced in Home Assistant 2021.10, and it's used by
2 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Crownstone
@RicArch97
Categories
Light
Back to top
