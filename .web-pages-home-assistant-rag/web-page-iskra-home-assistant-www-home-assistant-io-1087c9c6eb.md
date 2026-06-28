# iskra - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iskra
- Final URL: https://www.home-assistant.io/integrations/iskra
- Canonical URL: https://www.home-assistant.io/integrations/iskra/
- Fetched at: 2026-06-28T02:53:18Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to connect your Iskra energy meters to Home Assistant.

## Extracted Text

On this page
Supported devices
Energy meters
Power quality analyzers
Configuration options
Smart Gateway with REST API
Modbus TCP connection
Configuration
Sensors
The Iskra integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect Iskra energy meters and power quality analyzers to Home Assistant. Data is polled using Modbus TCP or the Iskra Smart Gateway’s REST API.
This integration supports Iskra’s devices, which should not be confused with Iskraemeco, another manufacturer of energy meters commonly used by electrical distributors for billing purposes.
Most Iskra’s DIN rail mountable energy meters support Modbus RTU over RS485 and IR. To integrate them, you will need a Modbus TCP gateway or Iskra’s Smart Gateway:
Impact series ( IE38XX / IE14XX )
WM series ( WM3XX / WM1XX )
These devices typically support Ethernet connections and use Modbus TCP for data polling:
iMT/MT series ( MTXXX / iMTXXX )
iMC/MC series ( MCXXX / iMCXXX )
There are two ways to configure your devices with Home Assistant:
Using a Smart Gateway with REST API
Using a Modbus TCP connection
If your device supports Modbus RTU over RS485/IR, you can use Iskra’s Smart Gateway to connect them via the REST API:
Smart Gateway : Connect your devices to the Smart Gateway and add your devices to the Smart Gateway’s configuration. It’s also recommended to set a static IP on your smart gateway.
Home Assistant : Add the Iskra integration, enter the Smart Gateway’s IP address , and select RestAPI as the connection type within the Home Assistant integration. If authentication is required, Home Assistant will prompt you to enter the Smart Gateway’s credentials . All devices configured on the Smart Gateway will be automatically added to your Home Assistant.
If your device supports a direct internet connection, such as PQ meters (iMC/MC series/ iMT/MT series usually), you can use Modbus TCP:
Device : Find your device using the MiQen software and configure it to use a static IP.
Home Assistant : Add the Iskra integration, enter the device’s IP address , and select Modbus TCP as the connection type within the Home Assistant integration. Home Assistant will prompt you to enter the Modbus TCP port and Modbus address of your device.
To add the iskra hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select iskra .
Follow the instructions on screen to complete the setup.
The integration provides detailed information about power, current, and voltage for each phase. The data is updated every minute.
Name Unit Description total_active_power W Total active power total_reactive_power var Total reactive power total_apparent_power VA Total apparent power phase1_power W Phase 1 active power phase2_power W Phase 2 active power phase3_power W Phase 3 active power phase1_voltage V Phase 1 voltage phase2_voltage V Phase 2 voltage phase3_voltage V Phase 3 voltage phase1_current A Phase 1 current phase2_current A Phase 2 current phase3_current A Phase 3 current frequency Hz Frequency non_resettable_counter_x Wh/varh/VAh Non-resettable energy counters as configured on device resettable_counter_x Wh/varh/VAh Resettable energy counters as configured on device
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The iskra hub was introduced in Home Assistant 2024.10, and it's used by
3 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@iskramis
Categories
Energy
Sensor
Back to top
