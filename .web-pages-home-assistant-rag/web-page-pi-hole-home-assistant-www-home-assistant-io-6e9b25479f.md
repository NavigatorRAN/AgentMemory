# Pi-hole - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/pi_hole
- Final URL: https://www.home-assistant.io/integrations/pi_hole
- Canonical URL: https://www.home-assistant.io/integrations/pi_hole/
- Fetched at: 2026-06-28T03:08:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Pi-hole with Home Assistant.

## Extracted Text

On this page
Configuration
Pi-hole v6 and later
Pi-hole v5 and earlier
List of actions
Switches
Sensors
The Pi-hole integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to retrieve statistics and interact with a
Pi-hole system.
To add the Pi-hole device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Pi-hole .
Follow the instructions on screen to complete the setup.
During the setup, it will ask for the following:
Item Description Example Host The IP or domain name of your Pi-hole. 192.168.1.1 Port Port used to get to the admin page, typically 80 for http connections and 443 for https connections. 80 Name Name for this Pi-hole. Pi-hole Location The path to the admin page. This is ignored for the Pi-hole version 6 API. /admin App password or API key The credential used to authenticate with Pi-hole. See below for details on where to find it for Pi-hole v6 and for older versions. 585a2fe... Uses an SSL certificate Whether your Pi-hole uses a certificate, typically true for https connections and false for http . Verify SSL certificate Whether to verify your Pi-hole’s certificate. Ignored in Pi-hole API version 5.
The combined host, port, and location should take you to the login page of Pi-hole. Using the example above, it would be http://192.168.1.1:80/admin .
For Pi-hole v6 and later, the integration uses an app password. To find it, log into your Pi-hole and go to Settings > Web Interface/API . Switch from Basic to Expert mode, then select Configure app password . Your admin login password may be used instead, but this is not recommended.
For Pi-hole v5 and earlier, see below.
For Pi-hole versions before v6, the integration uses an API token if the Pi-hole was password-protected. To find it, go to Settings > API and select Show API token .
The Pi-hole integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Disable Pi-hole ( pi_hole.disable )
Temporarily disables ad-blocking on your Pi-hole for a set amount of time.
For an overview of every action across all integrations, see the actions reference .
The integration creates a switch for the Pi-hole allowing you to toggle ad-blocking on and off.
The integration creates several sensors that report various ad-blocking metrics as well as diagnostic information about the Pi-hole itself.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Pi-hole device was introduced in Home Assistant 0.28, and it's used by
1.3% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@shenxn
Categories
Sensor
Switch
System monitor
Update
Back to top
