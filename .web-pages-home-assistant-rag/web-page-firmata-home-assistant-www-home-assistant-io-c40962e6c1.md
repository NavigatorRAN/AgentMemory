# Firmata - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/firmata
- Final URL: https://www.home-assistant.io/integrations/firmata
- Canonical URL: https://www.home-assistant.io/integrations/firmata/
- Fetched at: 2026-06-28T02:42:52Z
- Content type: text/html; charset=UTF-8

## Description

Connect Arduino-compatible boards within Home Assistant

## Extracted Text

On this page
Configuration
Firmata can be used to add analog and digital inputs and outputs to Home Assistant. This allows for buttons, switches, motion detectors, relay control, sensors, potentiometers, and dimmers. The integration can currently connect to a Firmata board via serial or serial over USB.
The Firmata protocol is a standard protocol for microcontrollers. Most of these boards support digital and analog inputs and outputs. Arduino and Arduino-compatible microcontroller development boards are the most popular boards to use with Firmata.
There is currently support for the following device types within Home Assistant:
Binary sensor
Light
Sensor
Switch
You will need to upload a Firmata firmware to your board. Please upload any StandardFirmata sketch to your board; please refer to the Arduino documentation for further information for uploading sketches. Firmata is available in the Arduino Library Manager in the Arduino IDE. You may also use a Firmata Express .
To integrate Arduino boards with Home Assistant, add the following section to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
Warning
Firmata does not store the last state across power cycles. This means that with every powerup the pins are set to off/low and after every initialization, they will be set to the default that you have configured in YAML.
Firmata may cycle pins HIGH/LOW during initialization. If your pins should not be accidentally cycled, you may need to modify your Firmtata sketch or if you are using a relay board use an output pin as VCC. See this issue for details: Make initial pin value configurable .
You may configure multiple Firmata boards. Each board has the following options:
Configuration Variables
Looking for your configuration file?
serial_port string Required
The port where your board is connected to your Home Assistant host. It is recommended to use the by-id reference (instead of numerical like /dev/ttyACM0 or /dev/ttyUSB0 ) since these will never change after a reboot. If you are using Home Assistant Operating System, you can find a list of connected serial devices in the Hardware dialog on the Settings > System > Hardware panel.
serial_baud_rate integer ( Optional )
The baud rate of the Arduino sketch. If you are using Firmata Express, then you do not need to set this option. If you are using the default StandardFirmata, then you should set this to 57600 .
arduino_instance_id integer ( Optional )
If you are using Firmata Express, then this should match the instance number that you set in the sketch.
arduino_wait integer ( Optional )
Time in seconds to wait for the Arduino is initially respond. May need to be used for boards that respond slowly at first connection.
sleep_tune float ( Optional )
Time in seconds to wait for reply from the Arduino after sending a command. Rarely needs to be adjusted.
sampling_interval integer ( Optional )
Sampling interval in milliseconds sent to Firmata. Most Firmata sketches will ignore any interval less than 10 milliseconds.
switches list ( Optional )
Digital high/low outputs to configure
name string Required
The name of the entity to create in Home Assistant
pin integer | string Required
The digital or analog pin number on the board.
pin_mode string Required
The digital or analog pin output mode. For switches, this must be set to OUTPUT . No other output modes are currently implemented.
initial boolean ( Optional , default: false )
The initial output of the pin after initialization. Note that this is inverted if negate is enabled.
negate boolean ( Optional , default: false )
Flips the output of the digital pin
lights list ( Optional )
PWM/Analog outputs to configure
The digital or analog pin number on the board. Note that most boards do not support analog or PWM output on all digital and analog pins.
The digital or analog pin output mode. For lights, this must be set to PWM . No other output modes are currently implemented.
initial integer ( Optional , default: 0 )
The initial output of the pin after initialization. This should be a Home Assistant-like value from 0 to 255; this value is then plugged into the minimum / maximum scaling (if configured).
minimum integer ( Optional , default: 0 )
The minimum PWM/analog value to send (inclusive). This is the lowest allowed value that the pin will output. The Home Assistant brightness value (0 to 255) will be scaled with this value as the lower value of the range.
maximum integer ( Optional , default: 255 )
The maximum PWM/analog value to send (inclusive). This is the highest allowed value that the pin will output. The Home Assistant brightness value (0 to 255) will be scaled with this value as the higher value of the range.
binary_sensors list ( Optional )
Digital or analog high/low input to configure
The digital or analog pin number on the board. For analog pins the corresponding digital number must be used. Please use the pinout that corresponds to your board. For example, on the Arduino Uno, pin A2 corresponds to the digital pin number 16.
The digital or analog pin input mode. Supported modes are INPUT and PULLUP . Check your board specifications to see which pins have optional internal pullups available.
Flips the input of the digital or analog pin
sensors list ( Optional )
Analog input to configure
pin string Required
The analog pin number on the board. This should be in the form A0 or A1 .
The analog pin input mode. For sensors, this must be set to ANALOG . No other input modes are currently implemented.
differential integer ( Optional , default: 40 )
Minimum difference in value to update. The absolute value of the difference between the old and new value must be greater than or equal to this option for the update to register in Home Assistant. This is set to 40 by default to prevent an unconnected pin from clogging the Home Assistant history with updates. Set this to 1 to register all updates in Home Assistant. Updates are registered as fast as the board can send them (very fast). The minimum value that may be set is 1 .
Note
If you double-configure a pin, the integration will fail to configure the second one that it attempts to set up and will log an error.
To invert/negate a light, set the maximum to 0 and the minimum to 255 .
# Example firmata configuration.yaml entry firmata : - serial_port : /dev/serial/by-id/usb-Teensyduino_USB_Serial_358320-if00 serial_baud_rate : 57600 switches : - name : my_light pin_mode : OUTPUT pin : 4 negate : true - name : my_other_output pin_mode : OUTPUT pin : 5 initial : true - name : my_light2 pin_mode : OUTPUT pin : A6 initial : true negate : true lights : - name : my_dimmable_light pin_mode : PWM pin : 6 - name : my_subset_light pin_mode : PWM pin : 10 initial : 0 minimum : 127 maximum : 200 - name : my_inverted_light pin_mode : PWM pin : 11 minimum : 255 maximum : 0 binary_sensors : - name : my_motion pin_mode : INPUT pin : 2 - name : my_door pin_mode : PULLUP pin : 3 negate : true - name : my_other_door pin_mode : INPUT pin : 16 # A2 negate : true sensors : - name : my_sensor pin : A0 pin_mode : ANALOG differential : 40
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Firmata integration was introduced in Home Assistant 0.114, and it's used by
79 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@DaAwesomeP
Categories
DIY
Back to top
