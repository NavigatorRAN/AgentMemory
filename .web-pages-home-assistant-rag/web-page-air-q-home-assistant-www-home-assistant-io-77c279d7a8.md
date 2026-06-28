# air-Q - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/airq
- Final URL: https://www.home-assistant.io/integrations/airq
- Canonical URL: https://www.home-assistant.io/integrations/airq/
- Fetched at: 2026-06-28T02:26:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate air-Q into Home Assistant

## Extracted Text

On this page
Configuration
Sensors
Virtual sensors and indices
Additional configuration
LED Control
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The air-Q integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows integrating the sensors, provided by your air-Q device, into Home Assistant.
To add the air-Q hub to your Home Assistant instance, use this My button:
air-Q can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select air-Q .
Follow the instructions on screen to complete the setup.
Your air-Q device can be automatically discovered on your network. When Home Assistant discovers a new air-Q device, it appears as a notification in the UI. Select the notification and enter your device password to complete the setup.
If your device is not discovered automatically, you can set it up manually. During the manual configuration, you are prompted for the IP address of the device A device is a model representing a physical or logical unit that contains entities. or the first 5 characters of the serial number, as well as the device password.
For this integration to communicate with the device, both must be connected to the same Wi-Fi network.
After the setup, separate entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] will be created for each of the sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] , found in your device A device is a model representing a physical or logical unit that contains entities. .
Currently, the integration supports the following sensors:
Sensor name Unit of measurement Acetaldehyde µg/m³ Ammonia µg/m³ Arsine µg/m³ Bromine µg/m³ CH4S µg/m³ Chlorine µg/m³ ClO2 µg/m³ CO mg/m³ CO2 ppm CS2 µg/m³ Dew Point °C Ethanol µg/m³ Ethylene µg/m³ Formaldehyde µg/m³ F2 µg/m³ H2S µg/m³ HCl µg/m³ HCN µg/m³ HF µg/m³ Health Index % Humidity (relative) % Absolute Humidity g/m³ Hydrogen µg/m³ Hydrogen Peroxide µg/m³ Methane % Mold Index % N2O µg/m³ NO µg/m³ NO2 µg/m³ Organic Acid ppb Oxygen µg/m³ Ozone µg/m³ Performance Index % PH3 µg/m³ PM1, PM25, PM10 µg/m³ Pressure hPa Relative Pressure hPa Propane % Refrigerant R-32 % Refrigerant R-454B % Refrigerant R-454C % SiH4 µg/m³ SO2 µg/m³ Noise dBa Noise (Maximum) dBa Radon Bq/m³ Temperature °C Virus Index % VOC ppb VOC (Industrial) ppb
PM1, PM25, and PM10 correspond to concentrations of particulates with diameter less than 1µm, 2.5µm, and 10µm respectively
All four supported indices—Health, Performance, Mold, and Virus—operate on a consistent scale: 0% (High Risk) to 100% (No Risk/Optimal).
Virus Index: Uses CO2 as a proxy for aerosol load. It evaluates the sufficiency of room ventilation to minimize the risk of airborne pathogen transmission.
Mold Index: Assesses the long-term risk of mold formation by analyzing temperature and relative humidity trends.
Activation: Virtual sensors such as “Relative Pressure,” “Virus Index,” and “Mold Index” are deactivated by default. You can enable them in the air-Q mobile app under Settings > Sensors .
After the integration has been initialized, the user can configure any of the following two parameters:
Show values averaged by the device . Default: on . In its default configuration, air-Q averages the stream of sensor values. The strength of this averaging can be configured on the device side (not exposed through the HA). However, this integration allows you to switch between polling the averaged and the raw data from the device. To poll noisy sensor readings from the device, set Show values averaged by the device to off .
Clip negative values . Default: on . For baseline calibration purposes, certain sensor values may briefly become negative. The default behavior is to clip such values to 0.
In addition to sensor readings, this integration exposes the brightness of the device’s LED strips as a number entity named number.<device_name>_led_brightness . You can set the brightness (0–100) manually from the Overview panel or in automations. Setting it to 0 will turn the LEDs off.
For troubleshooting or when reporting an issue, please enable debug logging and restart the integration. As soon as the issue reoccurs stop the debug logging, which will trigger the download of the debug log file.
Enabling debug logging has a slight performance impact on the system and is not recommended for long-term use.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The air-Q hub was introduced in Home Assistant 2022.12, and it's used by
185 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@Sibgatulin
@dl2080
Categories
Environment
Health
Sensor
Back to top
