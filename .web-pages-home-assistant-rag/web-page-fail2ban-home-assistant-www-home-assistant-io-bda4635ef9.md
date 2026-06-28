---
source_url: "https://www.home-assistant.io/integrations/fail2ban"
final_url: "https://www.home-assistant.io/integrations/fail2ban"
canonical_url: "https://www.home-assistant.io/integrations/fail2ban/"
source_handle: "web:www-home-assistant-io:bda4635ef9fc"
source_section: "integrations-fail2ban"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "826087f51076d052bc35482529e9ff8e9c7594949850bf171bbaae53e368ca4d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Fail2Ban - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/fail2ban
- Final URL: https://www.home-assistant.io/integrations/fail2ban
- Canonical URL: https://www.home-assistant.io/integrations/fail2ban/
- Fetched at: 2026-06-28T02:41:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a fail2ban sensor into Home Assistant.

## Extracted Text

On this page
Configuration
Fail2Ban with Docker
Other debug tips
Related topics
The Fail2Ban integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows for IPs banned by fail2ban to be displayed in the Home Assistant frontend.
Important
This integration is only available on Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] . Unfortunately, it cannot be used with Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. .
Your system must have fail2ban installed and correctly configured for this sensor to work. In addition, the fail2ban log file must be mounted to the Home Assistant container to be able to read it.
To enable this sensor, add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : fail2ban jails : - ssh - hass-iptables
Configuration Variables
Looking for your configuration file?
jails list Required
List of configured jails you want to display.
name string ( Optional , default: fail2ban )
Name of the sensor.
file_path string ( Optional , default: /var/log/fail2ban.log )
Path to the fail2ban log.
These steps assume you already have the Home Assistant Docker running behind NGINX and that it is externally accessible. It also assumes the Docker is running with the --net='host' flag.
For those of us using Docker, the above tutorial may not be sufficient. The following steps specifically outline how to set up fail2ban and Home Assistant when running Home Assistant within a Docker behind NGINX. The setup this was tested on was an unRAID server using the SWAG from linuxserver.io.
Set HTTP logger
In your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, add the following to the logger integration to ensure that Home Assistant prints failed login attempts to the log.
logger : logs : homeassistant.components.http.ban : warning
Edit the jail.local file
Next, we need to edit the jail.local file that is included with the Let’s Encrypt Docker linked above. Note, for this tutorial, we’ll only be implementing the [hass-iptables] jail.
Edit /mnt/user/appdata/letsencrypt/fail2ban/jail.local and append the following to the end of the file:
[hass-iptables]
enabled = true
filter = hass
action = iptables-allports[name=HASS]
logpath = /hass/home-assistant.log
maxretry = 5
Create a filter for the Home Assistant jail
Now we need to create a filter for fail2ban so that it can properly parse the log. This is done with a failregex . Create a file called hass.local within the filter.d directory in /mnt/user/appdata/letsencrypt/fail2ban and add the following:
[INCLUDES]
before = common.conf
[Definition]
failregex = ^%(__prefix_line)s.*Login attempt or request with invalid authentication from <HOST>.*$
ignoreregex =
[Init]
datepattern = ^%%Y-%%m-%%d %%H:%%M:%%S
Map log file directories
First, we need to make sure that fail2ban log can be passed to Home Assistant and that the Home Assistant log can be passed to fail2ban. When starting the Let’s Encrypt Docker, you need to add the following argument (adjust paths based on your setup):
/mnt/user/appdata/home-assistant:/hass
This will map the Home Assistant configuration directory to the Let’s Encrypt Docker, allowing fail2ban to parse the log for failed login attempts.
Now do the same for the Home Assistant Docker, but this time we’ll be mapping the fail2ban log directory to Home Assistant so that the fail2ban sensor can read that log:
/mnt/user/appdata/letsencrypt/log/fail2ban:/fail2ban
Send client IP to Home Assistant
By default, the IP address that Home Assistant sees will be that of the container (something like 172.17.0.16 ). What this means is that for any failed login attempt, assuming you have correctly configured fail2ban , the Docker IP will be logged as banned, but the originating IP is still allowed to make attempts. We need fail2ban to recognize the originating IP to properly ban it.
First, we have to add the following to the NGINX configuration file located in /mnt/user/appdata/letsencrypt/nginx/site-confs/default .
proxy_set_header X-Real-IP $remote_addr ;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for ;
This snippet should be added within your Home Assistant configuration, so you have something like the following:
server {
...
location / {
proxy_pass http://192.168.0.100:8123 ;
proxy_set_header Host $host ;
proxy_http_version 1.1 ;
proxy_set_header Upgrade $http_upgrade ;
proxy_set_header Connection "upgrade" ;
proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for ; }
location /api/websocket {
proxy_pass http://192.168.0.100:8123/api/websocket ;
}
Once that’s added to the NGINX configuration, we need to modify the Home Assistant configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] such that the X-Forwarded-For header can be parsed. This is done by adding the following to the http integration:
http : use_x_forwarded_for : true
At this point, once the Let’s Encrypt and Home Assistant dockers are restarted, Home Assistant should be correctly logging the originating IP of any failed login attempt. Once that’s done and verified, we can move onto the final step.
Add the fail2ban sensor
Now that we’ve correctly set everything up for Docker, we can add our sensors to configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] with the following:
sensor : - platform : fail2ban jails : - hass-iptables file_path : /fail2ban/fail2ban.log
Assuming you’ve followed all of the steps, you should have one fail2ban sensor, sensor.fail2ban_hassiptables , within your front-end.
If, after following these steps, you’re unable to get the fail2ban sensor working, here are some other steps you can take that may help:
Add logencoding = utf-8 to the [hass-iptables] entry
Ensure the failregex you added to filter.d/hass.local matches the output within home-assistant.log
Try changing the datepattern in filter.d/hass/local by adding the following entry (change the datepattern to fit your needs). source
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Fail2Ban integration was introduced in Home Assistant 0.57, and it's used by
132 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Network
Back to top
