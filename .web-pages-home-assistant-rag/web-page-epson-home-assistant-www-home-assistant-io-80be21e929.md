# Epson - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/epson
- Final URL: https://www.home-assistant.io/integrations/epson
- Canonical URL: https://www.home-assistant.io/integrations/epson/
- Fetched at: 2026-06-28T02:41:01Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Epson projector into Home Assistant.

## Extracted Text

On this page
Configuration
Supported features
Supported devices
Tested devices
LAN connection
Serial connection
The Epson integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Epson projector from Home Assistant.
The device has to be turned on during initial configuration.
When you want to add a device for the first time, turn it on before following the integration steps.
To add the Epson device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Epson .
Follow the instructions on screen to complete the setup.
turn on/off
set input
set/get color mode including high/low lamp
increase/decrease volume
mute/unmute audio
send next/previous track
Epson projectors supporting ESC/VP21 protocol.
Epson EH-TW5350
Epson EH-TW7000
Epson EH-TW9400W (shares platform with 7400/8400/9400(w))
Epson EH-TW3200
Epson Powerlite W39
This integration supports connecting to an Epson projector via LAN or Serial.
Connect the projector to your LAN and enter the IP address of the projector when prompted, selecting either HTTP or TCP depending on what the projector model supports.
The iProjection app by Epson can be used to test if it is working.
Connect projector directly to Home Assistant via a serial cable, or ser2net can be used as a Serial to network proxy.
ser2net configuration
A ser2net configuration similar to below can be used to expose the projector connected to /dev/ttyUSB0 on port 3629 .
connection : &con1 accepter : tcp,3629 connector : serialdev,/dev/ttyUSB0,9600n81
Then the projector can be added to the integration using socket://<ser2net_ip>:3629 .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Epson device was introduced in Home Assistant 0.72, and it's used by
354 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@pszafer
Categories
Media player
Back to top
