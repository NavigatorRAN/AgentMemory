# Egardia - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/egardia
- Final URL: https://www.home-assistant.io/integrations/egardia
- Canonical URL: https://www.home-assistant.io/integrations/egardia/
- Fetched at: 2026-06-28T02:39:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Egardia / Woonveilig within Home Assistant.

## Extracted Text

On this page
Basic configuration
Advanced configuration
Binary sensor
Related topics
The Egardia integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables the ability to control an Egardia / Woonveilig control panel. These alarm panels are known under different brand names across the world, including Woonveilig in the Netherlands. This was tested on the WL-1716, GATE-01, GATE-02 and GATE-03 versions of the Egardia/Woonveilig platform. Not only will you integrate your alarm control panel, supported sensors (door contacts at this moment) will be added automatically.
You will need to know the IP of your alarm panel on your local network. Test if you can log in to the panel by browsing to the IP address and log in using your Egardia/Woonveilig account.
To enable the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] with your alarm panel, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry egardia : host : YOUR_HOST username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
host string Required
The local IP address of the Egardia/Woonveilig alarm panel.
username string Required
Username for the Egardia/Woonveilig account.
password string Required
Password for Egardia/Woonveilig account.
version string ( Optional , default: GATE-01 )
The version of the Egardia system. GATE-01 , GATE-02 and GATE-03 are currently supported.
port integer ( Optional , default: 80 )
The port of the alarm panel.
report_server_enabled string ( Optional , default: false )
Enable reporting by server.
report_server_port integer ( Optional , default: 52010 )
Port of the Egardia server.
report_server_codes map ( Optional )
Map of list of codes for the different states.
arm list ( Optional )
List of codes for the ‘arm’ state.
disarm list ( Optional )
List of codes for the ‘disarm’ state.
armhome list ( Optional )
List of codes for the ‘armhome’ state.
triggered list ( Optional )
List of codes for the ‘triggered’ state.
ignore list ( Optional )
List of codes that will be ignored.
Note that this basic configuration will only enable you to read the armed/armed away/disarmed status of your alarm and will not update the status if the alarm is triggered. This is because of how Egardia built their system. The alarm triggers normally go through their servers.
You can change this, however, using the following procedure. This is a more advanced (and more useful) configuration.
Note
There seem to be multiple versions of software running on GATE-02 devices; we have received reports from GATE-02 users who successfully run this package in GATE-02 mode. Others have reported they needed to specify GATE-03 as their version to integrate their GATE-02.
Log in to your alarm system’s control panel. You will need to access http://[IP of your control panel]. You know this already since you need it in the basic configuration from above. Log in to the control panel with your Egardia/Woonveilig username and password.
Once logged in, go to System Settings , Report and change the Server Address for your primary server to the IP or hostname of your Home Assistant machine. You can leave the port number set to 52010 or change it to anything you like. Make sure to change the settings of the primary server otherwise the messages will not come through. Note that this will limit (or fully stop) the number of alarm messages you will get through Egardia’s / Woonveilig services. Maybe, that is just what you want. Make sure to save your settings by selecting ‘OK’. If the system support XMPP, disable XMPP by invalidating the configuration in the XMPP menu (for example by changing the username). This is required for recent firmwares of the GATE-03 system as it does not use the Reporting server at all in the case of a valid XMPP configuration.
The Egardia integration relies on capturing the status codes that your alarm emits when something happens (status change or trigger). These codes will be unique for every situation, that is, the code emitted by the alarm when a sensor is triggered is unique to that sensor. Also, if you have multiple users or remotes, each remote has unique codes that are emitted by the alarm when status is changed using that remote or by that user. For the Egardia integration to work correctly you will need to capture the codes. To do this, on your Home Assistant machine run $ sudo python3 egardiaserver.py . Refer to the python-egardia repository for detailed documentation on parameters. This will receive status codes from your alarm control panel and display them. Record the codes shown as well as the status they relate to (see step 4 below). Make sure to change the status of your alarm to all states (disarm, arm, home) by all means possible (all users, remotes, web login, app) as well as trigger the alarm in all ways possible to get 100% coverage of all the codes the alarm system generates. You will need to run this script once and stop it once you have captured all the possible codes. Also, if you ever add users, remotes or sensors to your alarm system, make sure to re-run the script to capture the extra codes so you can update your configuration (see step 4 below). For comfort, before triggering the alarm it might be good to disable the siren temporarily (can be done in Panel Settings).
Once you have the codes, update your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry egardia : host : YOUR_HOST username : YOUR_USERNAME password : YOUR_PASSWORD report_server_enabled : true report_server_port : PORT_OF_EGARDIASERVER (optional, defaults to 52010) report_server_codes : arm : XXXXXXXXXXXXXXXX, XXXXXXXXXXXXXXXX disarm : XXXXXXXXXXXXXXXX, XXXXXXXXXXXXXXXX armhome : XXXXXXXXXXXXXXXX triggered : XXXXXXXXXXXXXXXX, XXXXXXXXXXXXXXXX, XXXXXXXXXXXXXXXX ignore : XXXXXXXXXXXXXXXX
Note that for all code groups ( arm , disarm , etc) multiple codes can be entered since each sensor triggers with a different code and each user of the system has its own arm and disarm codes. Also note that your system will do regular system checks which will be reported as well. Since Home Assistant provides no way of handling them properly, you can enter those codes as ignore (again, multiple codes can be used here). The egardia integration will ignore these codes and continue returning the old status if it receives any of the codes that are listed as ignore. This is useful for example when you have armed your alarm at night: normally a system check will occur at least once during the night and if that code is not specified anywhere Home Assistant will set the status of the alarm to its default, which is unarmed. This is in fact wrong. Listing the code as ignore changes this behavior and Home Assistant will continue to show the status the alarm is in (disarm, arm, home, triggered) even when system checks occur.
5. Test your setup and enjoy. The integration will update if the alarm status changes, including triggers. You can use this to build your own automations and send notifications as you wish. Note : previous versions required a separate egardiaserver to be set up. This is no longer necessary and corresponding system services can be removed (using systemctl).
The egardia platform allows you to get data from your Egardia / Woonveilig binary sensors from within Home Assistant.
Currently only door contacts are supported. IR sensors are not supported and will probably never be since their status cannot be read outside of the alarm control panel. Smoke sensors and others might be added but currently are not supported.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Egardia integration was introduced in Home Assistant 0.65, and it's used by
20 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jeroenterheerdt
Categories
Alarm
Hub
Back to top
