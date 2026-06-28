# Arcam FMJ Receivers - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/arcam_fmj
- Final URL: https://www.home-assistant.io/integrations/arcam_fmj
- Canonical URL: https://www.home-assistant.io/integrations/arcam_fmj/
- Fetched at: 2026-06-28T02:29:05Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Arcam FMJ Receivers into Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Binary sensors
Sensors
Power state
IR command
Serial port to network gateway
The Arcam FMJ Receivers integration allows you to control Arcam Receivers and Processors from Home Assistant.
Supported devices:
AV 40
AV 41
AV 860
AVR 5
AVR 10
AVR 11
AVR 20
AVR 21
AVR 30
AVR 31
AVR 380
AVR 390
AVR 450
AVR 550
AVR 750
AVR 850
AVR 860
SA 10
SA 20
SA 30
SR 250
ST 60
This integration may also work with JBL and AudioControl receivers and processors as they share the same firmware as Arcam.
SDP-55/58
To add the Arcam FMJ Receivers device to your Home Assistant instance, use this My button:
Arcam FMJ Receivers can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Arcam FMJ Receivers .
Follow the instructions on screen to complete the setup.
The integration provides the following diagnostic binary sensors, one for each zone. They are disabled by default.
Zone incoming video interlaced
Description : Indicates whether the incoming video signal is using interlaced scanning. It is on when the signal is interlaced, off when it is progressive, and unknown when video parameters are not available.
The integration provides diagnostic sensors for monitoring the incoming audio and video stream properties of each zone. All sensors are disabled by default and can be enabled from the device page.
Video sensors
Incoming video horizontal resolution
Description : The horizontal resolution of the incoming video signal, in pixels.
Incoming video vertical resolution
Description : The vertical resolution of the incoming video signal, in pixels.
Incoming video refresh rate
Description : The refresh rate of the incoming video signal, in Hz.
Incoming video aspect ratio
Description : The aspect ratio of the incoming video signal.
Options : 16:9, 4:3, Undefined
Incoming video color space
Description : The color space of the incoming video signal.
Options : Normal, HDR10, HDR10+, HLG, Dolby Vision
Audio sensors
Incoming audio format
Description : The format of the incoming audio signal.
Options : Analogue direct, Auro-3D, Dolby Atmos, Dolby Digital, Dolby Digital EX, Dolby Digital Plus, Dolby Digital Surround, Dolby TrueHD, DTS, DTS 96/24, DTS Core, DTS-ES Discrete, DTS-ES Discrete 96/24, DTS-ES Matrix, DTS-ES Matrix 96/24, DTS-HD High Resolution Audio, DTS-HD Master Audio, DTS Low Bit Rate, DTS:X, IMAX Enhanced, PCM, PCM zero, Undetected, Unsupported
Incoming audio configuration
Description : The spatial channel configuration of the incoming audio signal.
Options : Mono, Mono + LFE, Dual mono, Dual mono + LFE, Stereo only, Stereo only Lo/Ro, Stereo only Lo/Ro + LFE, Stereo + LFE, Stereo downmix, Stereo downmix + LFE, Stereo center, Stereo center + LFE, Stereo surround mono, Stereo surround mono + LFE, Stereo surround L/R, Stereo surround L/R + LFE, Stereo surround L/R back mono, Stereo surround L/R back mono + LFE, Stereo surround L/R back matrix, Stereo surround L/R back matrix + LFE, Stereo surround L/R back L/R, Stereo surround L/R back L/R + LFE, Stereo center surround mono, Stereo center surround mono + LFE, Stereo center surround L/R, Stereo center surround L/R + LFE, Stereo center surround L/R back mono, Stereo center surround L/R back mono + LFE, Stereo center surround L/R back matrix, Stereo center surround L/R back matrix + LFE, Stereo center surround L/R back L/R, Stereo center surround L/R back L/R + LFE, Auro quad, Auro 2.2.2, Auro 5.0, Auro 5.1, Auro 8.0, Auro 9.1, Auro 10.1, Auro 11.1, Auro 13.1, Undetected, Unknown
Incoming audio sample rate
Description : The sample rate of the incoming audio signal, in Hz.
Arcam receivers turn off their network port when in standby, the integration will try to reconnect to the receiver every 5 seconds. This means powering on the first zone is not possible over the built-in network connection.
Note: Some newer models offer the ability to configure the device to keep the network port active when in standby mode. This can be found under HDMI Settings > HDMI Bypass & IP . Enabling HDMI & IP On will allow full power control from Home Assistant.
Two other options for complete power control exists: IR or Serial gateway.
Use an IR blaster to send a command to turn the device on using these discrete codes:
Zone 1: Protocol: RC5 Device: 16 Function: 123
Zone 2: Protocol: RC5 Device: 23 Function: 123
Turn on sometime requires two IR codes to be sent. You can generate the raw, broadlink or other IR format string using irgen tool like:
irgen -i rc5 -d 16 0 123 -o broadlink_base64 -r 2
To trigger this IR command add an automation on the event arcam.turn_on filtering on
the entity_id of the media_player zone entity. This can be added using device automations
or manually using normal automations.
Use a network to a serial port gateway to connect to the serial port of the
receiver. The serial port is always available and can power on the device.
This is the most reliable communication method as well.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Arcam FMJ Receivers device was introduced in Home Assistant 0.96, and it's used by
131 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@elupus
Categories
Media player
Back to top
