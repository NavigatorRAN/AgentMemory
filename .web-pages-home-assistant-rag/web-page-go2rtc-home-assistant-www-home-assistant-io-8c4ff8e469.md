# go2rtc - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/go2rtc
- Final URL: https://www.home-assistant.io/integrations/go2rtc
- Canonical URL: https://www.home-assistant.io/integrations/go2rtc/
- Fetched at: 2026-06-28T02:46:13Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up go2rtc in Home Assistant.

## Extracted Text

On this page
Configuration
Examples
Related topics
go2rtc is an open source project providing a camera streaming application that supports formats such as RTSP, WebRTC, HomeKit, FFmpeg, RTMP. The go2rtc integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects to a go2rtc instance and provides a WebRTC proxy for all your cameras. To learn more about go2rtc, refer to the project’s GitHub page .
If you are using the default_config and run Home Assistant using one of the following installation types, the go2rtc integration will be set up automatically and you don’t need to do anything:
Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users.
Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more]
This integration is part of the default_config .
The following YAML options are available:
Configuration Variables
Looking for your configuration file?
debug_ui boolean ( Optional , default: false )
Enables the UI of the go2rtc, which helps debugging WebRTC issues. The debug_ui should only be enabled during debugging as it will expose port 11984.
username string ( Optional )
The username for authentication when accessing the debug UI. Required when debug_ui is enabled.
password string ( Optional )
The password for authentication when accessing the debug UI. Required when debug_ui is enabled.
url string ( Optional )
The URL to the self-hosted go2rtc server
If you using the go2rtc server managed by Home Assistant, please be aware that all ports are prefixed by 1 compared to the default port settings to avoid port conflicts:
Api port 1984 becomes 11984
WebRTC port 8555 becomes 18555
Warning
The debug_ui should only be enabled during debugging as it will expose port 11984.
Please disable the debug_ui immediately after debugging.
Use a self-hosted instance:
go2rtc : url : http://my-go2rtc-instance:1984
Enable debug UI with authentication:
go2rtc : debug_ui : true username : your_username password : your_password
Installation
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The go2rtc system was introduced in Home Assistant 2024.11, and it's used by
1408 active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Camera
Back to top
