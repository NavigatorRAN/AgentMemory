# EDL21 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/edl21
- Final URL: https://www.home-assistant.io/integrations/edl21
- Canonical URL: https://www.home-assistant.io/integrations/edl21/
- Fetched at: 2026-06-28T02:39:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate SML-based EDL21 smart meters into Home Assistant.

## Extracted Text

On this page
Configuration
InF Mode
ser2net
The EDL21 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you read German EDL21 smart meters using SML from Home Assistant.
To connect to the smart meter, an infrared transceiver is required.
Compatible transceivers:
DIY
Weidmann Elektronik Schreib-/Lesekopf USB
Wattwächter
Tested smart meters:
APATOR Norax 3D (enable InF Mode as described in manual to retrieve full data)
DZG DWS76 (enable InF as described in manual to retrieve full data)
Iskraemeco MT175 (ISKRA MT175-D2A51-V22-K0t)
EMH metering eHZ Generation K (enable InF as described in manual to retrieve full data)
efr SGM-C4 (enable InF as described in manual to retrieve full data)
easymeter Q3 ( Link )
EBZ DD3 (tested version: DD3 2R06 DTA - SMZ1)
To add the EDL21 device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select EDL21 .
Follow the instructions on screen to complete the setup.
To enable InF mode there are different steps needed based on the meter type but most commonly you have to enter the PIN you received from your grid operator. Once you have it, enter it into the meter and switch to the InF menu where you can switch from InF=Off to InF=On.
Entering this can be done using a flashlight or (if available) via the physical button on the meter.
For the efr SGM-C4 it is:
flashing three times to enter pin mode
entering pin using quicker flashes, wait for 3 seconds for next digit
pin accepted
flashing 7 times to get to InF=OFF
5-second flash to switch to InF=ON
You will now get more readings like current Power, Voltage, and phase angle. Some meters don´t have this, in that case only an overall reading is provided.
To use this integration with a remote transceiver you could use ser2net .
Example ser2net.conf configuration file:
2001:raw:0:/dev/ttyUSB0:9600 8DATABITS NONE 1STOPBIT
Example ser2net.yaml ( ser2net version 4.3.3) configuration entry:
connection : &con2001 enable : on accepter : tcp,2001 options : telnet-brk-on-sync : false kickolduser : true connector : serialdev,/dev/ttyUSB0,9600n81,local
Use socket://<ip-of-host>:2001 when adding the Smart Meter and asked for a “USB device path”.
This trick also works for RS485-based reading heads connected over a Waveshare RS485-to-Ethernet converter if you need to place reading heads at a remote location.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The EDL21 device was introduced in Home Assistant 0.107, and it's used by
612 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
