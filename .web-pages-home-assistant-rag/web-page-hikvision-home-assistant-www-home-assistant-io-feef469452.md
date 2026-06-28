---
source_url: "https://www.home-assistant.io/integrations/hikvision"
final_url: "https://www.home-assistant.io/integrations/hikvision"
canonical_url: "https://www.home-assistant.io/integrations/hikvision/"
source_handle: "web:www-home-assistant-io:feef469452d3"
source_section: "integrations-hikvision"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d15f454dc7ec64bc487c2dc9820f14666e5162e24d21b5219e051b7ca961b4d8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Hikvision - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/hikvision
- Final URL: https://www.home-assistant.io/integrations/hikvision
- Canonical URL: https://www.home-assistant.io/integrations/hikvision/
- Fetched at: 2026-06-28T02:48:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Hikvision cameras and NVRs within Home Assistant.

## Extracted Text

On this page
Configuration
Camera
NVR video channel discovery
Binary sensor
Event notification methods
Supported event types
Removing the integration
To remove an integration instance from Home Assistant
The Hikvision integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects your Hikvision IP Camera or NVR to Home Assistant, providing:
Binary sensors that parse the event stream and present camera/NVR events as sensors with either an “off” or “on” state
Camera entities with RTSP streaming and HTTP snapshot capabilities
The platform will automatically add all sensors to Home Assistant that are
configured within the camera/nvr interface to “Notify the surveillance center”
as a trigger. If you would like to hide a sensor type you can do so by
unchecking “Notify the surveillance center” in the camera configuration.
Important
In order for the sensors to work the hikvision user must have the ‘Remote: Notify Surveillance Center/Trigger Alarm Output’ permission which can be enabled from the user management section of the web interface. If authentication issues persist after permissions are verified, try accessing using an admin user. Certain devices will only authenticate with an admin account despite permissions being set correctly.
Also, the ‘WEB Authentication’ needs to be set to ‘digest/basic’ in the security/authentication section. Ensure this is applied on each individual camera in case of using an NVR.
For example, if you configure a camera with the name “Front Porch” that has
motion detection and line crossing events enabled to notify the surveillance
center the following binary sensors will be added to Home Assistant:
binary_sensor.front_porch_motion
binary_sensor.front_port_line_crossing
When used with a NVR device the sensors will be appended with the channel number
they represent. For example,
if you configure an NVR with the name “Home” that supports 2 cameras with
binary_sensor.home_motion_1
binary_sensor.home_motion_2
binary_sensor.home_line_crossing_1
binary_sensor.home_line_crossing_2
This platform should work with all Hikvision cameras and nvrs,
and has been confirmed to work with the following models:
DS-2CD2032-I
DS-2CD2042WD-I
DS-2CD2043G0-I
DS-2CD2142FWD-I
DS-2CD2155FWD-IS
DS-2CD2232-I5
DS-2CD2385G1
DS-2CD2387G2-LU
DS-2CD2686G2
DS-2CD3132-I
DS-7616NI-K2 (NVR)
ERI-K104-PR (NVR)
IPC-D140H(-M)
This platform has also been confirmed to work with the following Hikvision-based NVRs:
N46PCK (Annke H800 4K NVR)
N48PAW (Annke 4K NVR)
Luma NVRs
To add the Hikvision device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Hikvision .
Follow the instructions on screen to complete the setup.
The integration creates camera entities for each video channel on your Hikvision device. These camera entities support:
RTSP streaming: Live video streaming using the RTSP protocol
HTTP snapshots: Still image capture via the camera’s HTTP API
When connecting to an NVR (Network Video Recorder) that manages multiple cameras, the integration automatically discovers all video channels. A separate camera entity is created for each channel, allowing you to view and manage each connected camera individually.
For example, if you configure an NVR named “Home” with 4 connected cameras, the following camera entities will be created:
camera.home_channel_1
camera.home_channel_2
camera.home_channel_3
camera.home_channel_4
The integration detects events using the camera’s event stream. For standalone cameras, events configured to “Notify the surveillance center” are automatically detected.
For NVR devices, the integration supports extended event detection with additional notification methods beyond the standard “center” and “HTTP” methods. The following notification triggers are supported:
Center: Notify the surveillance center (standard method)
HTTP: HTTP notification
Record: Recording trigger
Email: Email notification trigger
Beep: Audible beep notification
This extended support allows detection of events that may be configured with non-standard notification methods on your NVR, which some devices use by default.
Supported event types are:
Motion
Line Crossing
Field Detection
Tamper Detection
Shelter Alarm
Disk Full
Disk Error
Net Interface Broken
IP Conflict
Illegal Access
Video Mismatch
Bad Video
PIR Alarm
Face Detection
Scene Change Detection
I/O
Unattended Baggage
Attended Baggage
Recording Failure
Exiting Region
Entering Region
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Hikvision device was introduced in Home Assistant 0.35, and it's used by
3043 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mezz64
@ptarjan
Categories
Back to top
