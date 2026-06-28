---
source_url: "https://www.home-assistant.io/integrations/nasweb"
final_url: "https://www.home-assistant.io/integrations/nasweb"
canonical_url: "https://www.home-assistant.io/integrations/nasweb/"
source_handle: "web:www-home-assistant-io:dca6487141bc"
source_section: "integrations-nasweb"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "60287c0355dbd10c5fc9e6b266a435f1e9d729436cadb9cb50cc53a6a9e46563"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# NASweb - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nasweb
- Final URL: https://www.home-assistant.io/integrations/nasweb
- Canonical URL: https://www.home-assistant.io/integrations/nasweb/
- Fetched at: 2026-06-28T03:02:20Z
- Content type: text/html; charset=UTF-8

## Description

Integrate NASweb devices

## Extracted Text

On this page
Prerequisites
Configuration
The NASweb integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] brings the device’s smart home features into Home Assistant , converting them into entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] that users can monitor, control, and incorporate into scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] and automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] .
NASweb combines the functions of a control panel and the ability to manage building automation. The device monitors the flow of information from sensors and programmable switches and stores settings, definitions, and configured actions. More information.
Before you can add the NASweb integration to Home Assistant, you need to create a user that has access to the NASweb API.
To create a NASweb user with access to the NASweb API, follow these steps:
To log into device NASweb page, enter the device IP in your local network:
https://<Device IP address>/nasweb (for example: https://192.168.117.230/nasweb )
In the top-right corner, select your user and in the pop-up, select Administrators .
Find the user you want to have access to the NASweb API from Home Assistant. Select Edit .
The admin user cannot be used for this. Select another user.
In the left Modules column, find the API module.
Click the API module to move it into the right-hand column ( 1 ), which lists modules enabled for this user.
To save changes, select Apply ( 2 ).
To add the NASweb hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select NASweb .
Follow the instructions on screen to complete the setup.
Host
NASweb device address
User
Login of user with enabled API module
Password
Password of user with enabled API module
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NASweb hub was introduced in Home Assistant 2024.12, and it's used by
0 active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@nasWebio
Categories
Alarm
Climate
Sensor
Switch
Back to top
