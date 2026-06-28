# Mediaroom - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mediaroom
- Final URL: https://www.home-assistant.io/integrations/mediaroom
- Canonical URL: https://www.home-assistant.io/integrations/mediaroom/
- Fetched at: 2026-06-28T02:59:15Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Mediaroom Set-Top Boxes into Home Assistant.

## Extracted Text

On this page
Examples
Example scripts
Example configuration with 2 STB
Related topics
The Mediaroom integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a Mediaroom Set-Top Box (STB) from Home Assistant.
To add a Mediaroom STB to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry media_player : - platform : mediaroom
Configuration Variables
Looking for your configuration file?
host string ( Optional )
The hostname or IP address of the device.
Default:
Tries to discovery your device.
name string ( Optional , default: Mediaroom STB )
The name of the device used in the frontend.
optimistic boolean ( Optional , default: false )
In case the integration cannot determine the status of the box, consider the box always ON.
Notice that all parameters are optional, and discovery should configure everything for you.
Using the Mediaroom integration
The integration has been developed for Portuguese TV operators currently using the Mediaroom platform, but should also work in other deployments in which the STB can be controlled remotely through a socket on port 8082.
In most cases (single STB) you just need to set up the platform and discovery will do the rest.
If the STB is on the same network segment as Home Assistant, it can determine whether the device is turned on or off. Without this, the integration will fail to determine the Set-top box status, and you are required to add the optimistic configuration variable.
The play_media function can be used in scripts to change channels:
# Example play_media script to change channel # change_channel : sequence : - action : media_player.play_media target : entity_id : media_player.mediaroom_stb data : media_content_id : " {{ channel_number }}" media_content_type : " channel"
The play_media function can also be used to trigger actions on the set-up-box such opening the videoclub:
# Example play_media script to trigger an action # press_button : sequence : - action : media_player.play_media target : entity_id : media_player.mediaroom_stb data : media_content_id : " {{ action }}" media_content_type : " mediaroom"
Check here for the list of possible media_content_id’s
# Example configuration.yaml entry for 2 STB media_player : - platform : mediaroom host : 192.168.1.64 name : Living Room STB - platform : mediaroom host : 192.168.1.65 name : Bedroom STB
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mediaroom integration was introduced in Home Assistant 0.63, and it's used by
68 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dgomes
Categories
Media player
Back to top
