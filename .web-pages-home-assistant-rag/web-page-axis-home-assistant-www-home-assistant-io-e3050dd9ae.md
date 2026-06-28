# Axis - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/axis
- Final URL: https://www.home-assistant.io/integrations/axis
- Canonical URL: https://www.home-assistant.io/integrations/axis/
- Fetched at: 2026-06-28T02:30:20Z
- Content type: text/html; charset=UTF-8

## Description

Integration between network devices from Axis Communications with Home Assistant.

## Extracted Text

On this page
Configuration
Debugging integration
Troubleshooting
Troubleshooting discovery
Internet access required for full integration
Reporting a problem
Binary sensor
Camera
Stream profile
Video source
Event
Light
Switch
Axis Communications devices are surveillance cameras, speakers, access control and other security-related network connected hardware. Event API works with firmware 5.50 and newer.
To add the Axis device to your Home Assistant instance, use this My button:
Axis can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Axis .
Follow the instructions on screen to complete the setup.
Tip
It is recommended that you create a user on your Axis device specifically for Home Assistant. For sensor functionality, it is enough to create a user with viewer privileges. If you want additional functional control you will need admin privileges.
If you have problems with a device or the integration you can add debug prints to the log.
logger : default : info logs : axis : debug homeassistant.components.axis : debug
If you are having issues and want to report a problem, always start with making sure that you’re on the latest Axis OS version .
If your device is not discovered. On your camera, go to System Options > Advanced > Plain Configuration . Change the drop-down box to network and click Select Group . If Network Interface I0 ZeroConf contains the 169.x.x.x IP address, unchecked the box next to Enabled for this section and click Save .
If the Axis device does not have internet access, Home Assistant may only display the camera stream. Other entities such as sensors and output controls might not appear. To ensure all device features are available, make sure the camera has internet access during initial setup.
When creating an issue detailing a problem related to the integration make sure to share the device model and firmware as well as prepare logs. Logs might contain sensitive information so make sure to look through it before sharing.
The following sensor types are supported:
Motion detection (Fence guard/Loitering guard/Motion guard/Object analyzer/VMD3/VMD4)
Passive IR motion detection
Sound detection
Day/night mode
Inputs and Supervised Inputs
The Axis camera platform is configurable through integration options. Available options (device dependent) are to select what stream profile to use and what video source to show.
A Stream profile makes up settings such as resolution, frame rate and compression and is configured on the device.
If this setting is disabled (default) it will use camera default stream settings.
A Video source (view area) defines a subsection of the camera’s sensor typically a more focused area of interest. Additional view areas can be configured on the device.
If this setting is disabled (default) it will use the camera default source.
The Axis I8116-E Intercom is supported with a Doorbell event entity. This event entity is triggered when the doorbell button is pressed, allowing you to create automations or notifications in response to doorbell activity.
Control brightness and state of IR LED lights connected to device.
The following controllable port types are supported:
Output
Relay
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Axis device was introduced in Home Assistant 0.45, and it's used by
1565 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Kane610
Categories
Back to top
