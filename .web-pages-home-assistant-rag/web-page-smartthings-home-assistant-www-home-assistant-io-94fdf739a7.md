# SmartThings - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/smartthings
- Final URL: https://www.home-assistant.io/integrations/smartthings
- Canonical URL: https://www.home-assistant.io/integrations/smartthings/
- Fetched at: 2026-06-28T03:17:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on setting up SmartThings within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Binary sensor
Button
Climate
Cover
Event
Fan
Light
Lock
Media player
Number
Scene
Select
Sensor
Switch
Time
Update
Vacuum
Valve
Water heater
Troubleshooting
Enabling debug logs
Viewing device diagnostics
Missing device functionality
SmartThings community
Removing the integration
To remove an integration instance from Home Assistant
SmartThings is a home automation platform for connecting with Samsung or third-party devices.
You need a Samsung account and account credentials.
To connect devices, you need the SmartThings app installed on your phone.
To add the SmartThings hub to your Home Assistant instance, use this My button:
SmartThings can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select SmartThings .
Follow the instructions on screen to complete the setup.
SmartThings represents devices as a set of capabilities . The SmartThings integration maps those capabilities to entities in Home Assistant. A single device may be represented by one or more entities.
In Home Assistant, a binary sensor entity will be created for each of the following SmartThings capabilities:
SmartThings capability accelerationSensor contactSensor custom.dryerWrinklePrevent custom.ovenCavityStatus custom.waterFilter filterStatus gasDetector motionSensor presenceSensor remoteControlStatus samsungce.doorState samsungce.kidsLock samsungce.steamClosetKeepFreshMode soundSensor switch (only for appliance categories such as washers, dryers, dishwashers, cooktops, microwaves, and clothing care machines) tamperAlert waterSensor
The SmartThings Button platform provides the following buttons:
SmartThings capability Button ovenOperatingState Stop custom.waterFilter Reset water filter samsungce.hoodFilter Reset hood filter
The SmartThings Climate platform lets you control devices that have air conditioner, thermostat, or heat pump related capabilities.
Air conditioners
For a SmartThings Air Conditioner to be represented by the climate entity, it must have all of the following required capabilities. If it does not have all the capabilities, the features will be represented in Home Assistant as individual sensors instead of a climate entity.
SmartThings capability Related climate features in Home Assistant airConditionerMode (required) hvac mode airConditionerFanMode (required) fan mode switch (required) turn on , turn off temperatureMeasurement (required) temperature thermostatCoolingSetpoint (required) target temp custom.airConditionerOptionalMode preset mode demandResponseLoadControl drlc_status_duration (state attribute), drlc_status_level (state attribute), drlc_status_override (state attribute), drlc_status_start (state attribute) fanOscillationMode swing mode Thermostats
For a SmartThings thermostat to be represented by the climate entity, it must have all of the required capabilities. If it does not have all the capabilities, the features will be represented in Home Assistant as individual sensors instead of a climate entity.
SmartThings capability Related climate features in Home Assistant thermostatMode (required) hvac mode thermostatHeatingSetpoint (required) target temp , target temp low temperatureMeasurement (required) temperature thermostatCoolingSetpoint target temp , target temp high thermostatOperatingState hvac action thermostatFanMode fan mode relativeHumidityMeasurement humidity (state attribute) Heat pump zones
For a SmartThings heat pump zone to be represented by the climate entity, it must have all of the required capabilities on an INDOOR , INDOOR1 , or INDOOR2 component.
SmartThings capability Related climate features in Home Assistant airConditionerMode (required) hvac mode switch (required) turn on , turn off temperatureMeasurement (required) temperature thermostatCoolingSetpoint (required) target temp custom.thermostatSetpointControl (required) min temp , max temp
The SmartThings Cover platform lets you control devices that have open/close related capabilities. For a device to be represented by the cover entity, it must either have the doorControl or windowShade capability. Otherwise the features will be represented as individual sensors in Home Assistant.
SmartThings capability Related cover features in Home Assistant doorControl open and close windowShade open and close switchLevel position windowShadeLevel position battery battery_level (state attribute)
The SmartThings Event platform will create entities for every button. It will show any button presses and allows you to automate on these events.
The SmartThings Fan lets you control devices that have fan-related capabilities. For a SmartThings device to be represented by the fan entity, it must have one or more of the capabilities below in addition to the switch capability. Devices with fanSpeed or airConditionerFanMode that also have thermostatCoolingSetpoint will be represented as climate entities instead.
SmartThings capability Related fan features in Home Assistant fanSpeed speed (percentage) airConditionerFanMode preset mode samsungce.hoodFanSpeed (creates a separate hood fan entity for range hoods with smart fan speed support) speed (percentage), preset mode
The SmartThings Light lets you control devices that have light-related capabilities. For a SmartThings device to be represented by the light entity, it must have one or more of the capabilities below in addition to the switch capability.
SmartThings capability Related light features in Home Assistant switchLevel brightness and transition colorControl color colorTemperature color_temp
The SmartThings Lock platform lets you control devices that have the lock capability, showing current lock status and supporting lock and unlock commands.
The SmartThings Media player lets you control devices that have media player-related capabilities. For a SmartThings device to be represented by the media player entity, it must have all required capabilities.
SmartThings capability Related media player features in Home Assistant audioMute (required) volume_mute audioVolume (required) volume_up , volume_down , volume_set audioTrackData media_title and media_artist mediaPlayback media_play , media_pause , media_stop , media_next_track , media_previous_track mediaInputSource select_source mediaPlaybackRepeat repeat_set mediaPlaybackShuffle shuffle_set switch turn_on , turn_off
The SmartThings number platform lets you control numeric values for the following capabilities:
SmartThings capability Number entity custom.washerRinseCycles Washer rinse cycles samsungce.hoodFanSpeed (on hood component) Hood fan speed thermostatCoolingSetpoint (on cooler, freezer, or onedoor components) Refrigerator temperature
The SmartThings scene platform lets you activate scenes that you defined in SmartThings. A scene entity is created for each SmartThings scene.
The SmartThings Select platform lets you configure device options. Some capabilities require remote control to be enabled on the device before they can be changed.
The following SmartThings capabilities are supported for Select entities:
SmartThings capability custom.washerSoilLevel custom.washerSpinLevel custom.washerWaterTemperature dishwasherOperatingState dryerOperatingState samsungce.autoDispenseDetergent samsungce.dishwasherWashingOptions samsungce.dustFilterAlarm samsungce.flexibleAutoDispenseDetergent samsungce.lamp washerOperatingState
The SmartThings Sensor platform lets you view devices that have sensor-related capabilities. A Sensor entity is created for each attribute (below) supported by the device.
SmartThings capability Related entities in Home Assistant activityLightingMode Activity lighting mode airConditionerMode Air conditioner mode airQualitySensor Air quality alarm Alarm atmosphericPressureMeasurement Atmospheric pressure audioVolume Volume battery Battery bodyMassIndexMeasurement Body mass index bodyWeightMeasurement Body weight carbonDioxideMeasurement Carbon dioxide carbonMonoxideDetector Carbon monoxide detector carbonMonoxideMeasurement Carbon monoxide custom.cooktopOperatingState Cooktop operating state custom.waterFilter Water filter usage dishwasherOperatingState Machine state
Job state
Completion time dryerMode Dryer mode dryerOperatingState Machine state
Completion time dustHealthConcern PM10 health concern dustSensor PM10
PM2.5 energyMeter Energy equivalentCarbonDioxideMeasurement Equivalent carbon dioxide fineDustHealthConcern PM2.5 health concern fineDustSensor PM2.5 formaldehydeMeasurement Formaldehyde gasMeter Gas meter
Gas meter calorific
Gas meter time
Gas illuminanceMeasurement Illuminance infraredLevel Infrared level mediaInputSource Media input source mediaPlaybackRepeat Media playback repeat mediaPlaybackShuffle Media playback shuffle mediaPlayback Media playback status odorSensor Odor sensor ovenMode Oven mode ovenOperatingState Machine state
Completion time ovenSetpoint Set point powerConsumptionReport Energy difference
Power energy
Energy saved
Power
Energy powerMeter Power powerSource Power source relativeBrightness Brightness intensity refrigerationSetpoint Set point relativeHumidityMeasurement Humidity robotCleanerCleaningMode Cleaning mode robotCleanerMovement Movement robotCleanerTurboMode Turbo mode samsungce.cooktopHeatingPower Manual level
Heating mode samsungce.ehsDiverterValve Diverter valve position samsungce.hoodFilter Hood filter usage samsungce.waterConsumptionReport Water consumption signalStrength Link quality
Signal strength smokeDetector Smoke detector temperatureMeasurement Temperature thermostatCoolingSetpoint Cooling set point thermostatFanMode Fan mode thermostatHeatingSetpoint Heating set point thermostatMode Mode thermostatOperatingState Operating state thermostatSetpoint Set point threeAxis X coordinate
Y coordinate
Z coordinate tvChannel TV channel
TV channel name tvocMeasurement Volatile organic compounds ultravioletIndex UV index veryFineDustHealthConcern PM1.0 health concern veryFineDustSensor PM1.0 voltageMeasurement Voltage washerMode Washer mode washerOperatingState Machine state
Completion time
The SmartThings Switch lets you control devices that have the switch capability that are not already represented by a more specific platform. It will also create switches for the following capabilities:
SmartThings capability custom.dryerWrinklePrevent samsungce.airConditionerBeep samsungce.airConditionerLighting samsungce.dishwasherWashingOptions samsungce.powerCool samsungce.powerFreeze samsungce.sabbathMode samsungce.steamClosetAutoCycleLink samsungce.steamClosetKeepFreshMode samsungce.steamClosetSanitizeMode samsungce.washerBubbleSoak
The SmartThings time platform lets you control the start and end time for the do not disturb mode on supported devices.
The SmartThings update platform lets you update the firmware of devices that have the firmwareUpdate capability.
The SmartThings Vacuum platform lets you control devices that have the samsungce.robotCleanerOperatingState capability, showing the vacuum status and controlling the device.
The SmartThings Valve platform lets you control devices that have the valve capability, showing the valve status and opening and closing.
The SmartThings Water heater platform lets you control heat pumps that provide hot water. For a device to be represented by the water heater entity, it must have all of the following capabilities:
SmartThings capability Related water heater features in Home Assistant switch (required) turn on , turn off airConditionerMode (required) operation mode temperatureMeasurement (required) temperature custom.thermostatSetpointControl (required) min temp , max temp thermostatCoolingSetpoint (required) target temp samsungce.ehsThermostat (required) custom.outingMode (required) away mode
If debug logging is enabled, the integration shows all the received events in the logs. The log captures events for that device for 5 seconds, and returns a JSON file with the state of the device and the events.
Debug logs can be helpful for diagnosing state updates, for example by selecting the button and then turning on the device physically.
To enable debug logs, follow the steps to enable debug logs .
The SmartThings integration provides diagnostics at two levels. To download diagnostics, follow the steps to download diagnostics .
Device diagnostics : Contains all capabilities and their current states for a single device. This is useful when troubleshooting a specific device — it shows exactly what capabilities, attributes, and attribute values the device exposes to the SmartThings API.
Config entry diagnostics : Contains information about all capabilities and devices in your SmartThings location, but without the current state values. This is useful for getting a comprehensive overview of available capabilities across all your connected devices.
The SmartThings integration does not support all SmartThings capabilities. Only the capabilities listed in this documentation are supported. If a feature of your device is not available in Home Assistant, there are a few possible reasons:
To see which capabilities are currently implemented, check the supported functionality section.
The capability you are looking for might not yet be supported by this integration.
To see if the necessary capability is available for your device in the API, check the SmartThings Developer Portal .
Some device features are only available in the SmartThings app and are not exposed through the API.
If the capability is available in the SmartThings API but not yet supported by this integration, you can request support by creating a GitHub Discussion .
Do not create a GitHub Issue for feature requests, as issues are intended for bug reports.
When creating a feature request, attach the device diagnostics for the device that is missing functionality. This helps identify which capabilities your device exposes and speeds up the implementation.
The SmartThings integration is complex due to the breadth of devices and capabilities it supports. If you need community support or want to discuss device integration topics with other SmartThings users, you can join the SmartThings Integration community on Discord .
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Open the SmartThings app and delete the Home Assistant application from SmartThings.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SmartThings hub was introduced in Home Assistant 0.87, and it's used by
9.8% of the active installations.
Its IoT class is Cloud Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Hub
Back to top
