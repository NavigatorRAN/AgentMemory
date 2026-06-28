---
source_url: "https://www.home-assistant.io/integrations/pioneer"
final_url: "https://www.home-assistant.io/integrations/pioneer"
canonical_url: "https://www.home-assistant.io/integrations/pioneer/"
source_handle: "web:www-home-assistant-io:82e2ea2af093"
source_section: "integrations-pioneer"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cc98482e9d29a1ee75770a7da54acdc12bc4cced39386cd2e8964a9d63a8740d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Pioneer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pioneer
- Final URL: https://www.home-assistant.io/integrations/pioneer
- Canonical URL: https://www.home-assistant.io/integrations/pioneer/
- Fetched at: 2026-06-28T03:08:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Pioneer Network Receivers into Home Assistant.

## Extracted Text

On this page
Source codes
Related topics
The Pioneer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control Pioneer Network Receivers. However, the more recent Pioneer models work with Onkyo platform instead.
To add a Pioneer receiver to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : pioneer host : 192.168.0.10
Configuration Variables
Looking for your configuration file?
host string Required
The IP of the Pioneer device, e.g., 192.168.0.10 .
name string ( Optional , default: Pioneer AVR )
The name you would like to give to the receiver.
port integer ( Optional , default: 23 )
The port on which the Pioneer device listens, e.g., 23 or 8102 .
timeout float ( Optional )
Number of seconds (float) to wait for blocking operations like connect, write and read.
sources list ( Optional )
A list of mappings from source friendly name to the source code (e.g., TV:'05' ). Valid source codes depend on the receiver (some known codes can be found below). Codes must be defined as strings (between single or double quotation marks) so that 05 is not implicitly transformed to 5 , which wouldn’t be valid source code.
Default:
Empty list (that is, no source selection will be possible)
Notes:
Some Pioneer AVRs use the port 23 default and some are reported to use 8102. Depending on the model you may be able to configure the port setting through the receiver’s HTTP interface, e.g. http://192.168.0.10/1000/port_number.asp . On models that can listen to multiple ports you could consider leaving the default port for use by hardcoded tools, and open another port for configurable tools such as Home Assistant.
timeout is a socket level option and should only be configured if you know what you are doing.
Under these lines, you can find some sample sources lists per receiver model. Here we use the source names as shown on the remote as key for each code. However these are for display purposes only, so you could rename inputs to better match your set-up (e.g., HDMI: '19' to Kodi: '19' .
Codes must be defined as strings (between single or double quotation marks) so that 05 is not implicitly transformed to 5 , which wouldn’t be valid source code.
VSX-930
sources : ' BD' : ' 25' ' DVD' : ' 04' ' SAT' : ' 06' ' HDMI3' : ' 21' ' HDMI4' : ' 22' ' HDMI5' : ' 23' ' HDMI6 - MHL' : ' 24' ' Ipod/USB' : ' 17' ' BT' : ' 33' ' Tuner' : ' 02' ' TV' : ' 05' ' CD' : ' 01' ' Internet Radio' : ' 38' ' Media Server' : ' 44' ' Favourites' : ' 45' ' Spotify' : ' 53'
Note that some other functionalities are available, but may not be relevant to use from this integration. A non exhaustive list of them are:
sources : # Correspond to the HDMI button on the remote, which loops over `HDMI3`, `HDMI4`, `HDMI5` and `HDMI6 - MHL` ' HDMI' : ' 31' # Correspond to the NET button the remote, which loops over `Internet Radio`, `Media Server`, `Favourites` and `Spotify` ' NET' : ' 26'
VSX-921
sources : ' PHONO' : ' 00' ' CD' : ' 01' ' CD-R/TAPE' : ' 03' ' DVD' : ' 04' ' TV/SAT' : ' 05' ' VIDEO 1(VIDEO)' : ' 10' ' VIDEO 2' : ' 14' ' DVR/BDR' : ' 15' ' iPod/USB' : ' 17' ' HDMI1' : ' 19' ' HDMI2' : ' 20' ' HDMI3' : ' 21' ' HDMI4' : ' 22' ' HDMI5' : ' 23' ' HDMI6' : ' 24' ' BD' : ' 25' ' HOME MEDIA GALLERY(Internet Radio)' : ' 26'
VSX-822-K
sources : ' CD' : ' 01' ' Tuner' : ' 02' ' DVD' : ' 04' ' TV' : ' 05' ' Sat/Cbl' : ' 06' ' Video' : ' 10' ' DVR/BDR' : ' 15' ' iPod/USB' : ' 17' ' BD' : ' 25' ' Adapter' : ' 33' ' Netradio' : ' 38' ' Pandora' : ' 41' ' Media Server' : ' 44' ' Favorites' : ' 45' ' Game' : ' 49'
VSX-824
port : 8102 sources : ' CD' : ' 01' ' Tuner' : ' 02' ' DVD' : ' 04' ' TV' : ' 05' ' Sat/Cbl' : ' 06' ' Video' : ' 10' ' DVR/BDR' : ' 15' ' iPod/USB' : ' 17' ' HDMI' : ' 19' ' BD' : ' 25' ' Adapter' : ' 33' ' Netradio' : ' 38' ' Media Server' : ' 44' ' Favorites' : ' 45' ' MHL' : ' 48' ' Game' : ' 49'
VSX-528
port : 8102 sources : ' CD' : ' 01' ' Tuner' : ' 02' ' DVD' : ' 04' ' TV' : ' 05' ' Sat/Cbl' : ' 06' ' DVR/BDR' : ' 15' ' iPod/USB' : ' 17' ' HDMI/MHL' : ' 48' ' BD' : ' 25' ' Adapter' : ' 33' ' Netradio' : ' 38' ' Media Server' : ' 44' ' Favorites' : ' 45' ' Game' : ' 49'
VSX-1021
port : 8102 sources : ' Phono' : ' 00' ' CD' : ' 01' ' Tuner' : ' 02' ' CD-R/Tape' : ' 03' ' DVD' : ' 04' ' TV/Sat' : ' 05' ' Video 1' : ' 10' ' Multi Channel In' : ' 12' ' Video 2' : ' 14' ' DVR/BDR' : ' 15' ' iPod/USB' : ' 17' ' XM Radio' : ' 18' ' HDMI 1' : ' 19' ' HDMI 2' : ' 20' ' HDMI 3' : ' 21' ' HDMI 4' : ' 22' ' HDMI 5' : ' 23' ' Blu-Ray' : ' 25' ' Home Media Gallery (Internet Radio)' : ' 26' ' Sirius' : ' 27' ' Adapter Port' : ' 33'
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pioneer integration was introduced in Home Assistant 0.19, and it's used by
329 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Media player
Back to top
