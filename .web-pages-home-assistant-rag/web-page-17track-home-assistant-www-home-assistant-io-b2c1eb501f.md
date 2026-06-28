# 17TRACK - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/seventeentrack
- Final URL: https://www.home-assistant.io/integrations/seventeentrack
- Canonical URL: https://www.home-assistant.io/integrations/seventeentrack/
- Fetched at: 2026-06-28T03:15:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use 17track.net data within Home Assistant

## Extracted Text

On this page
Configuration
Package statuses
Examples
Dashboard summary card
List of actions
The 17TRACK integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows users to get package data tied to their 17track.net account. The integration creates both summary sensors, which show the number of packages in a current state (e.g., “In Transit”), as well as individual sensors for each package within the account.
Important
Although the 17track.net website states that account passwords cannot be longer than 16 characters, users can technically set longer-than-16-character passwords. These passwords will not work with the used API. Therefore, please ensure that your 17track.net password does not exceed 16 characters.
To add the 17TRACK service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select 17TRACK .
Follow the instructions on screen to complete the setup.
17track’s API provides the following tracking statuses. The integration creates a sensor for each status, which contains the packages in that status. The sensor’s displayed value is the number of packages in that status.
Not found
In transit
Expired
Ready to be picked up
Undelivered
Delivered
Returned
To display package information on your dashboard, first create a trigger-based template sensor that calls the seventeentrack.get_packages action:
template : - trigger : - trigger : time_pattern hours : /1 - trigger : homeassistant event : start action : - action : seventeentrack.get_packages data : config_entry_id : YOUR_CONFIG_ENTRY_ID package_state : - in_transit response_variable : result sensor : - name : " Packages in transit" unique_id : packages_in_transit state : " {{ result.packages | count }}" attributes : packages : " {{ result.packages }}"
Then use a templated Markdown card to list all packages in transit along with their status:
type : markdown title : Packages in transit content : > {% for package in state_attr('sensor.packages_in_transit', 'packages') %} - **{{ package.friendly_name }} ({{ package.tracking_number }}):** {{ package.info_text }} {% endfor %}
Tip
To find your config_entry_id , go to Settings > Devices & services , select the 17Track integration, click the three-dot menu, and select Copy entry ID .
The 17TRACK integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add a package ( seventeentrack.add_package )
Adds a package to 17Track by tracking number.
Archive package ( seventeentrack.archive_package )
Archives a package in 17Track by tracking number.
Get packages ( seventeentrack.get_packages )
Queries the 17Track API for the latest package data.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The 17TRACK service was introduced in Home Assistant 0.83, and it's used by
1514 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@shaiu
Categories
Postal Service
Back to top
