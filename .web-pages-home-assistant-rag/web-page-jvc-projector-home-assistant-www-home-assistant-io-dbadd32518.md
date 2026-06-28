# JVC Projector - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/jvc_projector
- Final URL: https://www.home-assistant.io/integrations/jvc_projector
- Canonical URL: https://www.home-assistant.io/integrations/jvc_projector/
- Fetched at: 2026-06-28T02:53:59Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate JVC Projector into Home Assistant.

## Extracted Text

On this page
Supported models
Prerequisites
Configuration
Remote
Binary sensor
Sensor
Select
Switch
The JVC Projector integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows for the automation of JVC Projectors .
This integration is intended for the automation of any modern JVC Projector with a network port.
JVC is requiring newer 2024+ models to use a user-generated password to access the network port for security reasons.
To set up these models:
Set a password on the projector’s network setup page.
Use this password when adding the JVC Projector integration in Home Assistant.
To add the JVC Projector device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select JVC Projector .
Follow the instructions on screen to complete the setup.
The JVC Projector remote platform will create a Remote entity for the device. This entity allows you to send the following commands via the remote.send_command action.
menu
up
down
left
right
ok
back
info
input
hide
mpc
cmd
advanced-menu
anamorphic
cinema
color-profile
color-temp
gamma-settings
gamma
hdmi1
hdmi2
lens-aperture
lens-control
mode-1
mode-2
mode-3
mode-4
mode-5
mode-6
mode-7
mode-8
mode-9
mode-10
natural
picture-adjust
picture-mode
setting-memory
3d-format
The JVC Projector binary sensor platform will create the following Binary Sensor entity:
Power
Description : Indicates whether the projector is powered on. Returns true when the projector has a status of “on” or “warming”, and false when the status is “cooling” or “standby”.
Available for models : all
The JVC Projector sensor platform will create the following Sensors entities. Some of these sensors are disabled by default and may not be available for your model.
Model name
Description : The model series of the JVC Projector. Note this value will be different than your projector model name since the JVC communication protocol only identifies the model series by an internal code. In parentheses is the library’s own identifier for the communication protocol version being used.
Status
Description : The power status of the projector.
Light time
Description : The number of hours on the light source (lamp/laser).
Color depth
Description : The signal color depth.
Color space
Description : The signal color space.
HDR
Description : The signal HDR mode.
Available for models : 2017-present
The JVC Projector select platform will create the following Select entities. Some of these selects are disabled by default and may not be available for your model.
Input
Description : The HDMI input source.
Options : hdmi1, hdmi2
Installation mode
Description : The installation mode.
Options : Dependent on your detected model.
Light power
Description : The light power setting.
Dynamic control
Description : The dynamic control setting.
Clear motion drive
Description : The clear motion drive setting.
Anamorphic
Description : The anamorphic setting.
HDR processing
Description : The HDR processing mode setting.
Picture mode
Description : The picture mode setting.
The JVC Projector switch platform will create the following Switch entities. Some of these switches are disabled by default and may not be available for your model.
E-Shift
Description : The E-Shift mode setting.
Available for models : 2014-present
Low Latency Mode
Description : The low latency mode setting.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The JVC Projector device was introduced in Home Assistant 2023.6, and it's used by
157 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@SteveEasley
Categories
Back to top
