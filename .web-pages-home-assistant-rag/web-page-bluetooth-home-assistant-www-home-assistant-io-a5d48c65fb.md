# Bluetooth - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/bluetooth
- Final URL: https://www.home-assistant.io/integrations/bluetooth
- Canonical URL: https://www.home-assistant.io/integrations/bluetooth/
- Fetched at: 2026-06-28T02:31:55Z
- Content type: text/html; charset=UTF-8

## Description

Discover, connect, and monitor bluetooth devices.

## Extracted Text

On this page
Configuration
Before you begin
Requirements for Linux systems
Additional requirements by install method
Additional details for Container
Installing a USB Bluetooth adapter
Known working high-performance adapters
Known working adapters
Unsupported adapters
Multiple adapters
Scanning modes
Options
Remote adapters (Bluetooth proxies)
Troubleshooting
Advertisement monitor
Connection monitor
Improving connection times
Integrations that require exclusive use of the Bluetooth Adapter
Bluetooth interference with other devices
Discovered integrations
Related topics
Related links
The Bluetooth integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will detect nearby Bluetooth devices. Discovered devices will show up in the discovered section on the integrations page in the configuration panel.
To add the Bluetooth integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Bluetooth .
Follow the instructions on screen to complete the setup.
In many cases, a better approach than a directly connected adapter or card is to use a Bluetooth proxy using an ESP32 since Linux kernel updates have previously broken Bluetooth functionality and Bluetooth driver support Linux generally falls behind other operating systems for newer adapters. A Bluetooth proxy is particularly interesting to users who virtualize their instance, where the USB pass-through may cause additional problems. More information is available in the Remote Adapters section below or by visiting ESPhome’s Bluetooth proxy page .
Suppose a Bluetooth proxy is not a good fit for your use case. Consider using the Home Assistant Operating System when using a local adapter because it includes Bluetooth patches for issues unsolved in other operating systems.
While this integration is part of default_config: to enable automatic discovery of the Bluetooth Adapter, it will only be enabled by setting up the configuration flow, or manually adding it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry bluetooth :
For Bluetooth to function on Linux systems:
The D-Bus socket must be accessible to Home Assistant.
The Bluetooth adapter must be accessible to D-Bus and running BlueZ >= 5.43. It is highly recommended to use BlueZ >= 5.63 as older versions have been reported to be unreliable.
The D-Bus implementation should be dbus-broker .
The host system should be running Linux kernel 5.15.62 or later.
Home Assistant Operating System: Upgrade to Home Assistant OS version 9.0 or later. All Bluetooth requirements are automatically configured.
Home Assistant Container: The host system must run BlueZ, and the D-Bus socket must be accessible to Home Assistant inside the container. Additional configuration is required (see below).
Container configuration for Bluetooth
Note
You only need these configuration steps for Home Assistant Container installations. Home Assistant Operating System automatically handles all Bluetooth configuration.
Home Assistant Container requires specific configuration to access Bluetooth adapters.
Required capabilities:
Add the following Linux capabilities to your container configuration to enable full Bluetooth management:
Docker Compose:
cap_add : - NET_ADMIN - NET_RAW volumes : - /run/dbus:/run/dbus:ro
Docker run:
docker run --cap-add = NET_ADMIN --cap-add = NET_RAW -v /run/dbus:/run/dbus:ro ...
D-Bus socket:
For most systems, the D-Bus socket is in /run/dbus . You need to make the socket available in the container for Home Assistant to connect to D-Bus and access the Bluetooth adapter. If the D-Bus socket is in /var/run/dbus on your host system, use -v /var/run/dbus:/run/dbus:ro instead.
What happens without these capabilities:
If NET_ADMIN and NET_RAW capabilities are missing:
Your Bluetooth will operate in a degraded mode with limited functionality
Automatic adapter recovery is unavailable - your adapters cannot be reset when they stop responding
Connection parameters and management API commands will fail
Raw advertising data will be missing, causing unreliable updates for your devices
An error will appear in your logs: “Missing required permissions for Bluetooth management”
Switching from dbus-daemon to dbus-broker
Follow the instructions to switch to dbus-broker.
Installing BlueZ
On Debian based host systems, the sudo apt-get -y install bluez command will install BlueZ.
Some systems may not come with Bluetooth and require a USB adapter. Installing an adapter for the first time may require multiple restarts for the device to be fully recognized.
If you experience an unreliable Bluetooth connection, installing a short USB extension cable between your Bluetooth adapter and your Home Assistant server may improve reliability.
For development and testing, the developers of this Bluetooth integration primarily use a Feasycom FSC-BP119 (CSR8510A10) 📶.
Cambridge Silicon Radio (CSR) -based adapters
ANNE PRO CSR 4.0 (CSR8510A10)
Avantree BTDG-40S (CSR8510A10)
DIGITUS DN-30210-1 (CSR8510A10)
Enbiawit BT403 (CSR8510A10)
Feasycom FSC-BP119 (CSR8510A10) 📶
Gold Touch E-USB-BT4 (CSR8510A10)
HIDEEZ BT0015-01 (CSR8510A10)
Maxesla CSR 4.0 (CSR8510A10)
Nuu You BT40 (CSR8510A10)
ORICO BTA-403 (CSR8510A10)
ORICO BTA-409 (CSR8510A10)
Panda Wireless PBU40 (CSR8510A10)
PlanexCOMM BT-Micro4 (CSR8510A10)
QGOO BT-06A (CSR8510A10)
ROCKETEK BT4Y (CSR8510A10)
SABRENT BT-UB40 (CSR8510A10)
Sena UD100-G03 (CSR8510A10) 📶
StarTech USBBT1EDR4 (CSR8510A10)
Techkey PBT06H (CSR8510A10)
TRENDnet TBW-106UB (CSR8510A10)
TRENDnet TBW-107UB (CSR8510A10)
UGREEN CM109 (CSR8510A10)
Warmstor WBT-AD01 (CSR8510A10)
WAVLINK WL-BT4001 (CSR8510A10)
📶 Denotes external antenna
Most of these adapters can hold five (5) connections at the same time.
These adapters generally offer the fastest connect times and do not require additional drivers or patch files.
Broadcom (BCM) based adapters
Warning
These adapters may require additional patch files available at https://github.com/winterheart/broadcom-bt-firmware for stable operation.
There is currently no supported method to install these patch files when using Home Assistant Operating System.
ASUS USB-BT400 (BCM20702A0)
Cable Matters 604002-BLK (BCM20702A0)
GMYLE 3340 (BCM20702A0)
IOGEAR GBU521W6 (BCM20702A0)
INSIGNIA NS-PCY5BMA (BCM20702A0)
Kinivo BTD-400 (BCM20702A0)
LM Technologies LM506 (BCM20702A1)
LM Technologies LM1010 (BCM20702A0) 📶
Plugable USB-BT4LE (BCM20702A0)
SoundBot SB342 (BCM20702A0)
StarTech USBBT2EDR4 (BCM20702A0)
Targus ACB10US1 (BCM20702A0)
Most of these adapters can hold seven (7) connections at the same time.
Cypress based adapters
Raspberry Pi 3B+ (CYW43455)
Raspberry Pi 4B (CYW43455)
These adapters are connected via the UART bus which may limit their performance.
High-performance determination methodology
Performance is primarily determined by a combination of the chip and the Linux drivers for the adapter. Some vendors using the same chip had an unacceptable performance and are listed as unsupported.
The following requirements must be met for an adapter to be labeled as High Performance:
Establish a connection in about 1s or less
Process at least one advertisement per second from a device without dropping data
95% of connection attempts are successful within two tries
Meets the above requirements with Home Assistant 2022.11.1 or later and Home Assistant Operating System 9.3 or later
Must be able to hold five (5) connections at the same time
Performance testing used the following hardware:
Active connection to Nanoleaf A19 Bulb NL45-0800 after GATT services were cached by BlueZ
Advertisements from an Oral-B iO Series 8
External Adapters only: Home Assistant Blue running Home Assistant Operating System 9.3 with a USB extension cable.
Known working adapters list adapters that do not meet high-performance requirements but will generally work. These adapters vary widely in performance and may take as long as thirty seconds or more to establish a connection. These adapters may also miss advertisements such as button presses or temperature updates.
Realtek RTL8761BU adapters
These adapters do not have a reset pin. When they stop responding, there is currently no way for the kernel to reset them automatically, and they may have to be physically unplugged and replugged to restore operation.
ASUS USB-BT500 (RTL8761BU)
Avantree DG45 (RTL8761BU)
COMCAST CF-B03 (RTL8761BU)
COMCAST CF-B05 (RTL8761BU) 📶
EDUP LOVE EP-B3536 (RTL8761BU) 📶
ISEKIE KW-B3519 (RTL8761BU)
Maxuni BT-501 (RTL8761BU)
MPOW BH45A (RTL8761BU)
Plugable USB-BT5 (RTL8761BU)
StarTech USBA-BLUETOOTH-V5-C2 (RTL8761BU)
SUMEE BT501 (RTL8761BU)
UGREEN CM390 (RTL8761BU)
XDO BT802 (RTL8761BU) 📶
ZEXMTE BT-505 (RTL8761BU) 📶
ZEXMTE BT-DG54 (RTL8761BU) 📶
ZEXMTE Z01 (RTL8761BU) 📶
ZETSAGE BH451A (RTL8761BU) 📶
Alfa AWUS036EACS (RTL8821CU) - Frequent connection failures and drop outs
BASEUS BR8651A01 BA04 - Advertisement drops out
Belkin F8T003 ver 2. - Fails to set up and add successfully
Bluegiga BLED112 - No driver available yet for USB ID 2458:0001
EDIMAX EW-7611ULB (RTL8723BU) - Frequent connection failures and drop outs
EDUP EP-AC1661 (RTL8821CU) - Frequent connection failures and drop outs
eppfun AK3040G (ATS2851) - No driver available yet for USB ID 10d7:b012
eppfun AK3040A (ATS2851) - No driver available yet for USB ID 10d7:b012
KOAMTAC KBD 401G (CSR8510A10) - Adapter is unstable and drops out
TRIPP-LITE CU885A/U261-001-BT4 (CSR8510A10) - Adapter is unstable and drops out
QUMOX Bluetooth 5.0 (Barrot 8041A02) - No working driver
UGREEEN CM591 (ATS2851) - No driver available yet for USB ID 10d7:b012
UGREEEN CM749 (Barrot chipset) 📶 - No driver available yet for USB ID 33fa:0010
tp-link UB400 (CSR4) - Frequent connection failures with active connections
tp-link UB500 (RTL8761BU) - Frequent connection failures with active connections
CSR 4.0 clones with USB ID 0a12:0001 - Unrecoverable driver failure: These clones will usually show a message like CSR: Unbranded CSR clone detected; adding workarounds and force-suspending once... in the system log when they are plugged in.
Multiple unbranded adapters labeled with CSR 4.0
5 CORE CSR 4.0
The Bluetooth integration employs automatic failover and connection path logic to achieve high availability.
Support for multiple local Bluetooth adapters is available on Linux systems only. Place adapters far enough away from each other to reduce interference.
The following methods are known to work to add multiple adapters:
Remote Adapters (Bluetooth proxies)
Long USB Extension cables
USB-Ethernet extenders
USB/IP
Integrations that have followed the Best practices for library authors will automatically connect via the adapter with the best signal and failover to an active adapter if one becomes unavailable.
Each Bluetooth adapter can be configured to use one of three scanning modes. Auto is recommended for most setups. To change it, follow the steps in the Options section below.
Auto : Listens passively most of the time and only briefly switches to active scanning when a device or integration needs more details. Compared to running continuously active, this saves around 95 to 96 percent of the scan-related battery drain on your Bluetooth devices while still discovering devices and updates quickly.
Active : Continuously asks devices for full information. Updates are the fastest, but it uses more battery on the devices around you.
Passive : Only listens; never asks devices for extra information. Uses the least battery on your devices, but some details may be missing because some integrations need active scanning to work.
Auto and Passive both require an adapter that supports passive scanning. On Linux, this needs BlueZ 5.63 or later with experimental features enabled (available with Home Assistant Operating System 9.4 and later). On adapters that do not support passive scanning, Auto falls back to Active automatically.
In Home Assistant, go to Settings > Bluetooth .
Select Adapters .
On the adapter of interest, select the cogwheel , then select your options.
Not all adapters have options. If you don’t see a cogwheel icon, your adapter does not support options.
Under Scanning mode , pick Auto , Active , or Passive .
The Bluetooth integration supports receiving advertisement data from external adapters for devices and sensors that do not need an active connection, as well as establishing active connections. The number of remote scanners is limited only by the performance of the host system.
When adding multiple remote adapters to increase range or available connection slots, separate them enough to avoid interference with each other.
For development and testing of Bluetooth proxies, the Home Assistant Bluetooth integration team primarily uses the Olimex ESP32-POE-ISO-EA together with the Olimex BOX-ESP32-POE-ISO-EA-F . These devices are compatible with ESPHome ready-made projects .
Tip
The -EA variant offers significantly better RF performance compared to the standard non- EA model.
If the ESP32-POE-ISO-EA is out of stock, the ESP32-POE-ISO-EA-IND is a good alternative.
The ESP32-POE-ISO-WROVER-EA model is not recommended , as it uses a different pin configuration and is not compatible with ESPHome ready-made projects.
The following remote adapters are supported:
ESPHome
Bluetooth advertisement listening: ESPHome ESP32 device with firmware 2022.8.2 or later
Bluetooth advertisement bundling: ESPHome ESP32 device with firmware 2023.6.0 or later
Single active connection: ESPHome ESP32 device with firmware 2022.9.3 or later
Multiple active connections: ESPHome ESP32 device with firmware 2022.11.0 or later
Shelly
Bluetooth advertisement listening: Shelly Gen2+ device
Bluetooth advertisement bundling: Shelly Gen2+ device
Single active connection: not supported
Multiple active connections: not supported
Bluetooth advertisement bundling reduces traffic between Home Assistant and the proxy, significantly improving performance and reducing the time that Bluetooth and WiFi compete for air time for devices that share a radio.
Once Bluetooth is configured, the Bluetooth Advertisement Monitor will allow you to view devices in range that are advertising.
Once Bluetooth is configured, the Bluetooth Connection Monitor will allow you to view currently connected devices.
Connection time and performance vary greatly depending on the Bluetooth adapter and interference.
When switching to an adapter with better performance, disable the old, less performant adapters. The best signal and available connection slots are considered when making connections, and performance will be limited to the worst-performing adapter with the best signal to reach the remote device.
The below adapters are listed from best-performing to worst-performing:
Ethernet-connected Bluetooth proxies running ESPHome 2023.6.0 or later with passive scanning
USB High performance adapter with passive scanning
Wi-Fi-connected Bluetooth proxies running ESPHome 2023.6.0 or later with passive scanning
Ethernet-connected Bluetooth proxies running ESPHome 2023.6.0 or later with active scanning
USB High performance adapter with active scanning
Wi-Fi-connected Bluetooth proxies running ESPHome 2023.6.0 or later with active scanning
Onboard high performance adapter with passive scanning
Onboard high performance adapter with active scanning
Known working adapters with passive scanning
Known working adapters with active scanning
While newer integrations can share the Bluetooth Adapter, some legacy integrations require exclusive use of the adapter. Enabling this integration may prevent an integration that has not been updated to use newer methods from functioning.
Deleting the config entry for this integration will release control of the adapter and allow another integration to gain exclusive use of the Bluetooth adapter. If you have manually added bluetooth: to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] , you must also remove it to prevent the configuration from being recreated. Consider adding a second Bluetooth adapter on Linux systems if you need to continue using legacy integrations, as more integrations will move to use the Bluetooth integration in the future.
Sources of interference for radios can lead to transmission/reception loss or connection problems and show symptoms such as errors/failures when sending and receiving Bluetooth messages that can cause significant degradation in performance. Below are some basic but essential tips for getting a good setup starting point to achieve better signal quality, coverage, and extended range.
Following all these optimization tips below should significantly improve the reception of your Bluetooth radio adapter. The below insights describe working around the well-known limitations of low-power 2.4 GHz digital radio. It can resolve or avoid many known issues caused by interference or poor placement of your Bluetooth radio adapter or devices.
Computers, peripherals, and devices generate electromagnetic interference (also known as EMI/EMI/RMI) , which can interfere with signals transmissions on the 2.4 GHz radio band frequency, and degrade the wireless communication with your Bluetooth adapter/devices.
For example, unshielded USB 3 port and their cables are especially infamously known to affect 2.4 GHz radio reception. Place your Bluetooth adapter far away as possible from any potential sources of EMI/EMI/RMI by using a long, adequately shielded USB extension cable.
Simple actions that should improve most Bluetooth setups and common root causes of interference
Bluetooth adapter hardware:
Bad performance from old/outdated Bluetooth adapter hardware or poor Bluetooth adapter antenna:
Buy and use a supported Bluetooth USB adapter based on newer/modern chip hardware.
Consider a Bluetooth adapter that has an external antenna.
While older adapters might work, they could have obsolete hardware or old firmware, which prevents reliable operation.
Poor or outdated Bluetooth adapter firmware on the Bluetooth adapter:
Update to the latest Bluetooth chip firmware on the Bluetooth adapter. Updating firmware is usually straightforward if the manufacturer or the chip maker provides one.
Bluetooth adapters are RFI sensitive and can be very susceptible to all types of EMI/EMF interference:
Poor placement of the Bluetooth adapter or wrong orientation of Bluetooth adapter antenna:
Use a long USB extension cable to place the Bluetooth adapter away from interference and obstacles.
Ensure the USB extension cable is adequately shielded (thick cables usually have this).
A USB extension cable makes orienting the Bluetooth adapter/antenna easier.
Try different physical placement and orientations of the Bluetooth adapter or its antenna:
The optimal placement of the Bluetooth adapter is close to the middle of the house as possible.
Try to place the Bluetooth adapter at some distance away from walls, ceilings, and floors.
Try different orientations of the adapter’s external antenna (or whole Bluetooth adapter).
USB 3.0 ports/computers/peripherals are known culprits of RFI/EMI/EMF disruption. (See Ref. 1 and 2 ).
Make sure to only connect the Bluetooth USB adapter to a USB 2.0 port (and not to a USB 3.x port).
If your computer only has a USB 3.x port then connect the adapter via a powered USB 2.0 hub:
A USB 2.0 hub will convert USB 3.0 to a USB 2.0 port and avoid USB 3.0 EMF.
A USB 2.0 hub that uses an external power supply will ensure power requirements are fulfilled.
Shield any unshielded computers/peripherals/devices by adding all-metal enclosures/chassis/casings.
Single-board-computers and USB 3.x hard drives are especially known as source of EMF/EMI/RFI.
Be aware metal casings can decrease the performance of internal/built-in Bluetooth adapters.
Also, be sure to use adequately shielded USB cables for any such peripherals/devices too.
2.4 GHz RF Interference (RFI) from Wi-Fi Routers and Wi-Fi Access Points or other devices:
While Bluetooth is designed to coexist with Wi-Fi, its stronger signal can interfere.
To play it safe, try to place your Bluetooth adapter away from Wi-Fi access points.
Place Bluetooth adapters far away from electrical/power wires/cables, power supplies, and household appliances.
The following integrations are automatically discovered by the Bluetooth integration:
Acaia
Airthings BLE
Aranet
BlueMaestro
BTHome
Dormakaba dKey
eQ-3 Bluetooth Smart Thermostats
EufyLife
Fjäråskupan
Gardena Bluetooth
Govee Bluetooth
HomeKit Device
Husqvarna Automower BLE
iBeacon Tracker
IKEA Idasen Desk
Improv via BLE
INKBIRD
IronOS
Kegtron
Keymitt MicroBot Push
Kuler Sky
La Marzocco
LD2410 BLE
LED BLE
Medcom Bluetooth
Melnor Bluetooth
Moat
Mopeka
Motionblinds Bluetooth
Oral-B
Probe Plus
Qingping
RAPT Bluetooth
Ruuvi BLE
Sensirion BLE
SensorPro
SensorPush
Snooz
SwitchBot Bluetooth
ThermoBeacon
ThermoPro
Tilt Hydrometer BLE
Xiaomi BLE
Yale Access Bluetooth
Configuration file
Default config
Bluetooth proxy page
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Bluetooth integration was introduced in Home Assistant 2022.8, and it's used by
49.2% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
Categories
Utility
Back to top
