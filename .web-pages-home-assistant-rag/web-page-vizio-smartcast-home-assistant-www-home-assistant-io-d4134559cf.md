# VIZIO SmartCast - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/vizio
- Final URL: https://www.home-assistant.io/integrations/vizio
- Canonical URL: https://www.home-assistant.io/integrations/vizio/
- Fetched at: 2026-06-28T03:26:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate VIZIO SmartCast TVs and sound bars into Home Assistant.

## Extracted Text

On this page
Find your device
Install pyvizio locally
Discover devices
Pairing
Pair using the Home Assistant frontend
Pair manually using the CLI
Pair manually using pyvizio
Configuration
Obtaining an app configuration
Obtaining a list of valid apps to include or exclude
List of actions
Remote
Available commands
Examples
Notes and limitations
Turning device on
Changing tracks
The VIZIO SmartCast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control SmartCast -compatible TVs and sound bars (2016+ models).
If zeroconf discovery is enabled, your device will get discovered automatically. To discover your device manually, read the subsections below.
Note
If the pip3 command is not found, try pip instead
To install, run pip3 install pyvizio in your terminal.
If pyvizio is already installed locally, make sure you are using the latest version by running pip3 install --upgrade pyvizio in your terminal.
Find your device using the following command:
pyvizio --ip = 0 discover
Write down its IP address and port number. If you have trouble finding a device you were expecting to, you can try increasing the discovery timeout period by adding the --timeout option (e.g., pyvizio --ip=0 discover --timeout=10 ).
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] requires an access token to communicate with TVs (speakers do not need an access token). An access token can be obtained by going through a pairing process, either manually, or through the Home Assistant frontend.
Using configuration.yaml : If you have a vizio entry in configuration.yaml but don’t provide an access token value in your configuration, after you initialize Home Assistant, you will see a VIZIO SmartCast device ready to be configured. When you open the configuration window, you will be guided through the pairing process. While Home Assistant will store the access token for the life of your vizio entity An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , it is a good idea to note the access token value displayed in the window and add it to your configuration.yaml . This will ensure that you will not have to go through the pairing process again in the future if you decide to rebuild your Home Assistant instance.
Using discovery or manual setup through the Integrations menu: To initiate the pairing process, submit your initial configuration with an empty Access Token value.
The following script, written by JeffLIrion can be run to obtain an auth token. You will need to replace <IP> with your IP and <PORT> (which is typically 7345 or 9000).
#!/bin/bash VIZIO_IP = "<IP>" VIZIO_PORT = "<PORT>"
curl -k -H "Content-Type: application/json" -X PUT -d '{"DEVICE_ID":"pyvizio","DEVICE_NAME":"Python Vizio"}' https:// ${ VIZIO_IP } : ${ VIZIO_PORT } /pairing/start
read -p "PIN: " VIZIO_PIN
read -p "PAIRING_REQ_TOKEN: " VIZIO_PAIRING_REQ_TOKEN
curl -k -H "Content-Type: application/json" -X PUT -d '{"DEVICE_ID": "pyvizio","CHALLENGE_TYPE": 1,"RESPONSE_VALUE": "' " ${ VIZIO_PIN } " '","PAIRING_REQ_TOKEN": ' " ${ VIZIO_PAIRING_REQ_TOKEN } " '}' https:// ${ VIZIO_IP } : ${ VIZIO_PORT } /pairing/pair
To obtain an auth token manually, follow these steps:
Make sure that your device is on before continuing.
Parameter Description ip IP Address:Port (obtained from the previous section) device_type The type of device you are connecting to. Options are tv or speaker
Enter the following command to initiate pairing:
pyvizio --ip ={ ip:port } --device_type ={ device_type } pair
Initiation will show you two different values:
Value Description Challenge type Usually, it should be "1" . Challenge token Token required to finalize pairing in the next step
At this point, a PIN code should be displayed at the top of your TV. With all these values, you can now finish pairing:
pyvizio --ip ={ ip:port } --device_type ={ device_type } pair-finish --token ={ challenge_token } --pin ={ pin } --ch_type ={ challenge_type }
You will need the authentication token returned by this command to configure Home Assistant.
To add your VIZIO TV to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry vizio : - host : " DEVICE_IP:DEVICE_PORT" access_token : AUTH_TOKEN
Configuration Variables
Looking for your configuration file?
host string Required
IP Address:Port for your device (port is optional but recommended).
name string ( Optional , default: VIZIO SmartCast )
Nickname for your device that will be used to generate the device’s entity ID. If multiple VIZIO devices are configured, the value must be unique for each entry.
access_token string ( Optional )
Authentication token you received in the last step of the pairing process. This token is only needed if your device is a TV, and you can opt not to provide it in your configuration and instead go through the pairing process via the Home Assistant frontend.
device_class string ( Optional , default: tv )
The class of your device. Valid options are tv or speaker .
volume_step integer ( Optional , default: 1 )
The number of steps that the volume will be increased or decreased by at a time.
apps map ( Optional )
Use this section to define app specific settings (only applicable for VIZIO Smart TVs).
include list ( Exclusive )
List of apps to include in the source list. Cannot be used in combination with exclude .
exclude list ( Exclusive )
List of apps to exclude from the source list. Cannot be used in combination with include .
additional_configs map ( Optional )
List of manually configured apps that aren’t available in the default app list provided by the integration.
name string Required
The name of the app that will be used in the source list and used to launch the app.
config map Required
The app configuration that will be used to detect and launch the app.
APP_ID string Required
See Obtaining an app configuration section below.
NAME_SPACE integer Required
MESSAGE string ( Optional )
# Complete configuration.yaml entry vizio : - host : " DEVICE_IP:DEVICE_PORT" access_token : AUTH_TOKEN name : MY_VIZIO_DEVICE device_class : tv volume_step : 1 apps : include : - APP_1 - APP_2 exclude : - APP_1 - APP_2 additional_configs : - name : MY_CUSTOM_APP config : APP_ID : 9 NAME_SPACE : 9 MESSAGE : MY_MESSAGE
If there is an app you want to be able to launch from Home Assistant that isn’t detected by default, you will need to specify the app configuration in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] . This configuration can be obtained from the app_id state attribute when an unknown app is running on your device.
The list of apps that are provided by default is statically defined here . If you’d prefer a more concise list, you can either view the source list of a VIZIO Smart TV in the Home Assistant frontend, or run the following command (requires pyvizio to be installed locally):
pyvizio --ip = 0 get-apps-list
The VIZIO SmartCast integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Update setting ( vizio.update_setting )
Updates the value of a setting on a VIZIO SmartCast device.
For an overview of every action across all integrations, see the actions reference .
The VIZIO SmartCast integration automatically creates a remote entity for each configured device (TVs and speakers). You can use it to send remote control commands via the remote.send_command action. Commands are case-insensitive.
TV commands Command back cc_toggle ch_down ch_prev ch_up down exit home info input_next left left2 menu mute_off mute_on mute_toggle ok pause pic_mode pic_size play pow_off pow_on pow_toggle right seek_back seek_fwd smartcast up vol_down vol_up Speaker commands
Speakers support a subset of the commands above:
mute_off , mute_on , mute_toggle , pause , play , pow_off , pow_on , pow_toggle , vol_down , vol_up
Send a single command:
action : remote.send_command target : entity_id : remote.vizio_smartcast data : command : - enter
Send multiple commands:
action : remote.send_command target : entity_id : remote.vizio_smartcast data : command : - down - down - enter
Repeat a command with a delay between each repeat:
action : remote.send_command target : entity_id : remote.vizio_smartcast data : command : - vol_up num_repeats : 5 delay_secs : 0.4
If the Power Mode of your device is set to Eco Mode , turning the device on won’t work.
Changing tracks works like switching channels. If the current input is anything other than regular TV, this command might not do anything.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The VIZIO SmartCast device was introduced in Home Assistant 0.49, and it's used by
3905 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@raman325
Categories
Media player
Back to top
