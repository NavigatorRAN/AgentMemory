# Anthem A/V Receivers - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/anthemav
- Final URL: https://www.home-assistant.io/integrations/anthemav
- Canonical URL: https://www.home-assistant.io/integrations/anthemav/
- Fetched at: 2026-06-28T02:28:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Anthem A/V Receivers into Home Assistant.

## Extracted Text

On this page
Supported models
A/V Receiver
A/V Processor
Distribution solution
Configuration
Notes and limitations
Both Anthem ’s current and last generation of A/V receivers and processors support IP-based network control. This Home Assistant integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds proper “local push” support for any of these receivers on your network.
MRX 540 , MRX 740 , MRX 1140
MRX 520 , MRX 720 , MRX 1120
MRX 310 , MRX 510 , MRX 710
AVM 60 , AVM 70
MDX 8 , MDX 16
Martin Logan MDA 8 , MDA 16
If your model is not on the list, please give it a test. If everything works correctly, then add it to the list by selecting the Edit this page on GitHub link above.
Support is provided through the Python anthemav module. Older, RS-232 serial-based units like the D2v series use a different protocol entirely and are not currently supported.
To add the Anthem A/V Receivers device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Anthem A/V Receivers .
Follow the instructions on screen to complete the setup.
host
The host name or the IP address of the device.
port
The port number of the device.
The tuner is currently unsupported as are the media_player play, pause, prev, and next controls.
Enabling this platform will set and enforce Standby IP Control On within your Anthem device. You almost certainly want this. If you disable it on the device, it will just get re-enabled by Home Assistant.
Warning
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will maintain a persistent connection to the network control port which will prevent any other application from communicating with the receiver. This includes the Anthem iOS and Android remote control apps as well as the ARC-2 Anthem Room Calibration software. If you want to use another application that uses the network control port, disable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] and restart Home Assistant.
The underlying Python module has hooks for halting and resuming the network connection but those functions are currently unsupported by the Home Assistant platform.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Anthem A/V Receivers device was introduced in Home Assistant 0.37, and it's used by
255 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hyralex
Categories
Media player
Back to top
