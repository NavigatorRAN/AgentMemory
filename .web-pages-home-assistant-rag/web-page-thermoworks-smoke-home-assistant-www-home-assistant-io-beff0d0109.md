# ThermoWorks Smoke - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/thermoworks_smoke
- Final URL: https://www.home-assistant.io/integrations/thermoworks_smoke
- Canonical URL: https://www.home-assistant.io/integrations/thermoworks_smoke/
- Fetched at: 2026-06-28T03:22:02Z
- Content type: text/html; charset=UTF-8

## Description

Pulls temperature data for a ThermoWorks Smoke Thermometer connected with Smoke Gateway.

## Extracted Text

On this page
Configuration
Examples
Only Probe 1
Ignore a Device
Notify when Probe 1 goes above a certain temperature
The ThermoWorks Smoke integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] pulls data for your ThermoWorks Smoke Thermometer .
This requires a Smoke WiFi Gateway with an internet connection.
You will need to have previously registered your smoke to your account via the mobile app and provide
the email and password you used to in the configuration for this sensor to connect and pull your data.
To add the sensors to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : thermoworks_smoke email : " your email here" password : !secret thermoworks_pass
Configuration Variables
Looking for your configuration file?
email string Required
The email address with the device registered in the thermoworks smoke mobile app.
password string Required
The password registered in the thermoworks smoke mobile app.
monitored_conditions list ( Optional )
The sensors to add. Default is probe1 and probe2 . The full list is probe1 , probe2 , probe1_min , probe1_max , probe2_min , probe2_max .
exclude list ( Optional )
Device serial numbers to ignore.
This section includes some examples of how to use this sensor.
This will show only Probe 1 with min and max data.
# Example configuration.yaml entry sensor : - platform : thermoworks_smoke email : " your email here" password : !secret thermoworks_pass monitored_conditions : - probe1 - probe1_min - probe1_max
This will exclude a device from creating sensors. You would replace "00:00:00:00:00:00" with your device’s serial number.
# Example configuration.yaml entry sensor : - platform : thermoworks_smoke email : " your email here" password : !secret thermoworks_pass exclude : - " 00:00:00:00:00:00"
This will use an automation to trigger a notification when Probe 1 goes above a temperature stored in an input_number variable.
By default, your smoke is named “My Smoke” in the app. If you have changed it you will need to change the sensor name from my_smoke_probe_1 to your_name_probe_1 .
# Example configuration.yaml entry sensor : - platform : thermoworks_smoke email : " your email here" password : !secret thermoworks_pass input_number : smoke_probe_1_threshold : name : Smoke Probe 1 Threshold min : -40 max : 500 step : 0.5 unit_of_measurement : " °F" icon : mdi:thermometer automation : - alias : " Alert when My Smoke Probe 1 is above threshold" triggers : - trigger : template value_template : >- {% if (states("sensor.my_smoke_probe_1") | float) > (states("input_number.smoke_probe_1_threshold") | float) %} True {% else %} False {% endif %} actions : - action : notify.all data : message : > {{- state_attr('sensor.my_smoke_probe_1','friendly_name') }} is above {{- ' '+states("input_number.smoke_probe_1_threshold") -}} {{- state_attr('sensor.my_smoke_probe_1','unit_of_measurement') }} at {{- ' '+states("sensor.my_smoke_probe_1") -}} {{- state_attr('sensor.my_smoke_probe_1','unit_of_measurement') }}
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ThermoWorks Smoke integration was introduced in Home Assistant 0.81, and it's used by
0 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
