# madVR Envy - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/madvr
- Final URL: https://www.home-assistant.io/integrations/madvr
- Canonical URL: https://www.home-assistant.io/integrations/madvr/
- Fetched at: 2026-06-28T02:58:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a madVR Envy into Home Assistant.

## Extracted Text

On this page
Supported Devices
Configuration
Remote
Single Commands
Commands with Parameters
Binary sensor
Sensor
The madVR Envy integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows for the automation and control of madVR Envy devices .
This integration supports all current madVR Envy models.
To add the madVR Envy device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select madVR Envy .
Follow the instructions on screen to complete the setup.
The madVR Envy remote platform will create a remote entity for the device. This entity allows you to send the following commands via the remote.send_command action.
The command structure uses the same keywords as the official documentation and simply sends the corresponding command to the device. Please refer to the official documentation for more details and usage.
Using these commands, you can create a digital remote in the UI.
Example:
# Command with parameters action : remote.send_command data : command : KeyPress, SETTINGS target : entity_id : remote.madvr_envy
# Single command action : remote.send_command data : command : Restart target : entity_id : remote.madvr_envy
These are commands that can be sent standalone, no parameters.
PowerOff
Standby
Restart
ReloadSoftware
Bye
ResetTemporary
CloseMenu
GetMaskingRatio
GetMacAddress
ToneMapOn
ToneMapOff
Hotplug
RefreshLicenseInfo
Force1080p60Output
These are commands that have parameters with a comma separating them.
ActivateProfile (SOURCE | DISPLAY | CUSTOM)
OpenMenu (Info | Settings | Configuration | Profiles | TestPatterns)
KeyPress (MENU | UP | DOWN | LEFT | RIGHT | OK | INPUT | SETTINGS | RED | GREEN | BLUE | YELLOW | POWER)
KeyHold (MENU | UP | DOWN | LEFT | RIGHT | OK | INPUT | SETTINGS | RED | GREEN | BLUE | YELLOW | POWER)
The integration creates the following binary sensors:
Power state is On when the device is turned on.
Signal state is On when the device is receiving a signal from the source.
HDR flag is On when the device is receiving an HDR signal. This is useful to trigger automations based on the HDR flag, such as changing projector settings.
Outgoing HDR flag is On when the device is sending an HDR signal.
These can be used for various purposes, such as triggering your masking system based on the detected aspect ratio.
The following sensors are enabled by default:
Aspect ratio decimal : The aspect ratio as a decimal value.
Incoming bit depth : The bit depth of the incoming video signal.
Incoming black levels : The black level setting of the incoming video signal.
Incoming color space : The color space of the incoming video signal.
Incoming colorimetry : The colorimetry of the incoming video signal.
Incoming frame rate : The frame rate of the incoming video signal.
Incoming resolution : The resolution of the incoming video signal.
Masking decimal : The masking ratio as a decimal value.
Outgoing bit depth : The bit depth of the outgoing video signal.
Outgoing black levels : The black level setting of the outgoing video signal.
Outgoing color space : The color space of the outgoing video signal.
Outgoing colorimetry : The colorimetry of the outgoing video signal.
Outgoing frame rate : The frame rate of the outgoing video signal.
Outgoing resolution : The resolution of the outgoing video signal.
The following sensors are disabled by default:
Aspect ratio integer : The aspect ratio as an integer ratio.
Aspect ratio name : The name of the current aspect ratio.
Aspect ratio resolution : The resolution corresponding to the current aspect ratio.
CPU temperature : The temperature of the CPU.
GPU temperature : The temperature of the GPU.
HDMI temperature : The temperature of the HDMI interface.
Incoming aspect ratio : The aspect ratio of the incoming video signal.
Incoming signal type : The type of the incoming signal (3D or 2D).
Mainboard temperature : The temperature of the mainboard.
Masking integer : The masking ratio as an integer ratio.
Masking resolution : The resolution for the current masking setting.
Outgoing signal type : The type of the outgoing signal (3D or 2D).
These sensors are disabled because their values are not commonly needed but they can be enabled in the UI according to your needs.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The madVR Envy device was introduced in Home Assistant 2024.8, and it's used by
25 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@iloveicedgreentea
Categories
Binary Sensor
Back to top
