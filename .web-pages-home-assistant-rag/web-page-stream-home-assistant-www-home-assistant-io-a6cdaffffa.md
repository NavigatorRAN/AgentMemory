# Stream - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/stream
- Final URL: https://www.home-assistant.io/integrations/stream
- Canonical URL: https://www.home-assistant.io/integrations/stream/
- Fetched at: 2026-06-28T03:19:09Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate live streams within Home Assistant.

## Extracted Text

On this page
Configuration
LL-HLS - Low Latency HLS
Technical details
The Stream integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a way to proxy live streams through Home Assistant. Most users should not need to configure anything or interface with the integration directly since it is an internal integration used by the camera integration .
The stream integration is automatically loaded by default_config and enabled by camera platforms that support it. If default_config is used, no separate configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] entry is necessary. If default_config is not used, add the stream integration to configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] to enable it.
Example configuration:
# Enables the stream integration when not using the default configuration stream :
Some extra options can be configured. If specified, these options will be used whenever the stream integration is loaded.
Configuration Variables
Looking for your configuration file?
ll_hls boolean ( Optional , default: true )
Allows disabling Low Latency HLS (LL-HLS)
segment_duration float ( Optional , default: 6 )
The duration of each HLS segment, in seconds (between 2 and 10)
part_duration float ( Optional , default: 1 )
The duration of each part within a segment, in seconds (between 0.2 and 1.5)
LL-HLS reduces the start time and delay for a stream, but it has strict timing and network requirements and opens additional browser connections. To avoid running into browser limits it is strongly recommended to use an HTTP/2 proxy (e.g., NGINX or haproxy) to take advantage of request pipelining. LL-HLS is enabled by default, but when not using HTTP/2, the Home Assistant frontend will revert back to regular HLS if too many streams are open.
You can further adjust LL-HLS settings in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] as it may perform better or worse with different values depending on your network setup, cameras, or whether they are local or cloud.
# Example LL-HLS configuration.yaml entry. stream : ll_hls : true part_duration : 0.75 segment_duration : 6
The integration currently supports proxying H.264 and H.265 source streams to the HLS (and LL-HLS) protocol.
Note that while H.265 works on Android and iOS, it does not work in many browsers. This is a browser limitation and not a Home Assistant issue. Safari has native H.265 support, and H.265 also works in Edge on Windows when “HEVC Video Extensions” is installed. Chrome versions >= 104 may also work when started with the --enable-features=PlatformHEVCDecoderSupport option.
For testing HEVC browser support, use the “Unprefixed tests” from caniuse.com or the hls.js demo app with an HEVC HLS stream . The videos there should play if your browser supports H.265. Do not rely on the https://www.caniuse.com charts or the https://html5test.com site. They are inaccurate.
The stream integration supports AAC and MP3 audio. PCM codecs (e.g. G.711/G.723/G.726/G.729) are not supported.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Stream system was introduced in Home Assistant 0.90, and it's used by
2.8% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@hunterjm
@uvjustin
@allenporter
Categories
Other
Back to top
