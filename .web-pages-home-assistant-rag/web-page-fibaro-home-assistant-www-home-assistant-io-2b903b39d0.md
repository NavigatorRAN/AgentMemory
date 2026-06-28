# Fibaro - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fibaro
- Final URL: https://www.home-assistant.io/integrations/fibaro
- Canonical URL: https://www.home-assistant.io/integrations/fibaro/
- Fetched at: 2026-06-28T02:42:22Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Fibaro Home Center and Yubii Home within Home Assistant.

## Extracted Text

On this page
Supported hub models
Features
Configuration
Supported platforms
Troubleshooting
Enable events on Z-Wave devices
The Fibaro integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect Home Assistant to Fibaro Home Center, Nice Yubii Home, or a Zooz Z-Box Hub, enabling control and monitoring of connected devices and scene execution. Home Assistant uses a local connection to the hub.
Fibaro Home Center 2, Home Center Lite, Home Center 3, Home Center 3 Lite, Nice Yubii Home, Yubii Home Pro, and Zooz Z-Box Hub.
Control devices connected to the hub and synchronize the state of the devices (see platforms for supported devices and capabilities).
Entities are automatically added when configuring the Fibaro integration and upon restart of Home Assistant when changed in the Fibaro hub.
Support for multiple hubs.
Activate scenes defined in the Fibaro hub.
Use event entities to trigger your Home Assistant automations based on a button press event on a device.
To add the Fibaro hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Fibaro .
Follow the instructions on screen to complete the setup.
Tip
It is recommended to assign a static IP address to your Fibaro controller. This ensures that it won’t change its IP address, so you won’t have to change the url if the controller reboots and comes up with a different IP address. See your router’s manual for details on how to set this up. If you need the MAC address of your Fibaro, check the label on the bottom.
Binary sensor
Climate
Cover
Event
Light
Lock
Scene
Sensor
Switch
The event platform uses the central scene events sent by Z-Wave devices.
This works out of the box for switch devices.
For relay devices with switches or inputs to connect a switch, you often need to change the Z-Wave parameter ‘Scenes sent’ because the events are usually disabled by default.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fibaro hub was introduced in Home Assistant 0.83, and it's used by
1199 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rappenze
Categories
Hub
Back to top
