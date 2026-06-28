# Emulated Hue - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/emulated_hue
- Final URL: https://www.home-assistant.io/integrations/emulated_hue
- Canonical URL: https://www.home-assistant.io/integrations/emulated_hue/
- Fetched at: 2026-06-28T02:40:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to emulate a Hue Bridge within Home Assistant.

## Extracted Text

On this page
Configuration
Troubleshooting
Platform specific instructions
License
Related topics
Warning
Be aware that emulated_hue doesn’t work for new users of Google Home with emulated_hue . If you’ve not previously set this up and had it working, use the Google Assistant integration or Nabu Casa cloud integration.
The Emulated Hue integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a virtual Philips Hue bridge, written entirely in software that allows services that work with the Hue API to interact with Home Assistant
entities. The driving use case behind this functionality is to allow Home Assistant to work with an Amazon Echo or Google Home with no setup cost outside of configuration changes.
The virtual bridge can turn entities on/off or change the brightness of dimmable lights. The volume level of media players can be controlled as brightness.
Important
A physical Hue Bridge is required for Philips Hue lights to function - this virtual bridge will not replace a physical bridge. Instead, it allows Home Assistant to represent non-Philips Hue devices to Amazon Echo as Philips Hue devices, which Amazon Echo can control with built-in support.
Tip
It is recommended to assign a static IP address to the computer running Home Assistant. This is because the Amazon Echo discovers devices by IP addresses, and if the IP changes, the Echo won’t be able to control it. This is easiest done from your router, see your router’s manual for details.
Note
Both Google Home and Alexa use the device they were initially set up with for communication with emulated_hue . In other words: if you remove/replace this device you will also break emulated_hue . To recover your emulated_hue functionality, backup your config/.storage/emulated_hue.ids file, delete the original one and reboot your Home Assistant instance.
If you added or upgraded to a newer Alexa device and devices are not found, you must change to listen_port: 80. If Alexa responds with “value is out of range for device…” it means switches were automatically added as lights in discovery. Remove each device in the Alexa app. Turn on all the switches in Home Assistant. In the Alexa app go to “Add New Device” select “Switch” and then “other” to add them correctly.
Sleep Cycle and Sleep as Android : smart alarm clock app can use emulated_hue to turn on and off entities. Sleep Cycle only has it implemented in the iOS app, see Sleep Cycle support . The app requires the same configuration as Google Home and does not work if the type is defined as Alexa in the configuration.
Logitech Harmony remotes cannot connect to this emulator via Android and iOS mobile applications because they require the physical button on the hub to be pressed. The MyHarmony desktop software must be used with the original cable to connect it, then “Scan for Devices”.
To enable the emulated Hue bridge, add one of the following configs to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Google Home example configuration.yaml entry emulated_hue : listen_port : 80 # Google Home does not work on different ports.
# Amazon Echo example configuration.yaml entry emulated_hue : listen_port : 80 # Amazon Echo/Alexa stopped working on different ports. Search for "Philips Hue Bridge V1 (round)" in the Alexa App to discover devices.
Configuration Variables
Looking for your configuration file?
type string ( Optional , default: google_home )
The type of assistant which we are emulating. Either alexa or google_home . This configuration option is deprecated and will be removed in a future release. It is no longer necessary to define type.
host_ip string ( Optional )
The IP address that your Home Assistant installation is running on. If you do not specify this option, the integration will attempt to determine the IP address on its own.
listen_port integer ( Optional , default: 8300 )
The port the Hue bridge API web server will run on. This can be any free port on your system. However, all new Alexa devices require listen_port: 80. See setcap note below if this is set below 1024 when Home Assistant is ran as a non-root user.
advertise_ip string ( Optional )
If you need to override the IP address used for UPnP discovery. (For example, using network isolation in Docker)
advertise_port integer ( Optional )
If you need to specifically override the advertised UPnP port.
upnp_bind_multicast boolean ( Optional , default: true )
Whether or not to bind the UPnP (SSDP) listener to the multicast address (239.255.255.250) or instead to the (unicast) host_ip address specified above (or automatically determined). In special circumstances, like running in a FreeBSD or FreeNAS jail, you may need to disable this.
off_maps_to_on_domains list ( Optional , default: [“script”, “scene”] )
The domains that maps an “off” command to an “on” command. For example, if script is included in the list, and you ask Alexa to “turn off the water plants script,” the command will be handled as if you asked her to turn on the script.
expose_by_default boolean ( Optional , default: true )
Whether or not entities should be exposed via the bridge by default instead of explicitly (see the ‘emulated_hue’ customization below). Warning: If you have a lot of devices (more than 49 total across all exposed domains), you should be careful with this option. Exposing more devices than Alexa supports can result in it not seeing any of them. If you are having trouble getting any devices to show up, try disabling this, and explicitly exposing just a few devices at a time to see if that fixes it.
exposed_domains list ( Optional )
The domains that are exposed by default if expose_by_default is set to true.
Default:
[“switch”, “light”, “group”, “input_boolean”, “media_player”, “fan”, “humidifier”]
entities list ( Optional )
Customization for entities.
A full configuration sample looks like the one below. Configuration entries are added to the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
# Example configuration.yaml entry emulated_hue : host_ip : 192.168.1.186 listen_port : 8300 advertise_ip : 10.0.0.10 advertise_port : 8080 off_maps_to_on_domains : - script - scene expose_by_default : true exposed_domains : - light entities : light.bedroom_light : name : " Bedside Lamp" light.ceiling_lights : hidden : true
The following are attributes that can be applied in the entities section:
name ( Optional ): The name that the emulated Hue will use. The default for this is the entity’s friendly name.
hidden ( Optional ): Whether or not the emulated Hue bridge should expose the entity. Adding hidden: false will expose the entity to Alexa. The default value for this attribute is controlled by the expose_by_default option.
These attributes used to be found under the customize section of homeassistant , however, they have now been moved to entities . Emulated Hue configuration under homeassistant.customize will be deprecated in the near future.
You can verify that the emulated_hue integration has been loaded and is responding by pointing a local browser to the following URL:
http://<HA IP Address>:80/description.xml - This URL should return a descriptor file in the form of an XML file.
http://<HA IP Address>:80/api/v2/lights - This will return a list of devices, lights, scenes, groups, and so on, that emulated_hue is exposing to Alexa.
You can use the “curl” command to switch a light on or off:
curl -X PUT -d '{"on":true}' http://<HA IP Address>/api/v2/lights/219/state - This command switches light 219 on.
Verify that the URLs above are using port 80, rather than port 8300 (for example, http://<HA IP Address>:80/description.xml ). Both Google Home and Amazon Alexa/Echo (as of the 2019-08 firmware) require port 80.
Home Assistant Core
An additional step is required to run Home Assistant as a non-root user and use port 80.
Linux
On Linux systems (Ubuntu, Debian, etc) execute the following command to allow emulated_hue to use port 80 as a non-root user:
sudo setcap 'cap_net_bind_service=+ep' /srv/homeassistant/homeassistant_venv/bin/python3
Your path may be different depending on your installation method. For example, if you followed the Virtualenv instructions , your path will be /srv/homeassistant/bin/python3 .
Much of this code is based on work done by Bruce Locke on his ha-local-echo project, originally released under the MIT License. The license is located here .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Emulated Hue integration was introduced in Home Assistant 0.27, and it's used by
1% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
@Tho85
Categories
Hub
Back to top
