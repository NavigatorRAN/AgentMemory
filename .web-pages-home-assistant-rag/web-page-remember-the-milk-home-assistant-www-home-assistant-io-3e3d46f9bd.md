---
source_url: "https://www.home-assistant.io/integrations/remember_the_milk"
final_url: "https://www.home-assistant.io/integrations/remember_the_milk"
canonical_url: "https://www.home-assistant.io/integrations/remember_the_milk/"
source_handle: "web:www-home-assistant-io:3e3d46f9bdab"
source_section: "integrations-remember-the-milk"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "c31e62ba1f5f57dde4422cda4ffe34c3c5f9ac61517d33a306db58bacf689119"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Remember The Milk - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/remember_the_milk
- Final URL: https://www.home-assistant.io/integrations/remember_the_milk
- Canonical URL: https://www.home-assistant.io/integrations/remember_the_milk/
- Fetched at: 2026-06-28T03:11:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Remember The Milk with Home Assistant.

## Extracted Text

On this page
Setup
Step 1: API key
Step 2: Registering your account
Creating/updating tasks with service create_task
Completing tasks with service complete_task
Automation example
Disclaimer
Related topics
The Remember The Milk integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to create tasks in Remember The Milk (RTM) from Home Assistant. You can use this if you want Home Assistant to send you a task that you should not forget, e.g., water the plants. The integration allows you to have several RTM accounts in parallel.
The setup consists of two steps: getting an API key and registering your account
To be able to use this integration, you need a Remember The Milk account and you need to apply for your own API key . With the API key you will also receive your personal shared secret. Both of them need to be stored in your Home Assistant configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry remember_the_milk : - name : your_rtm_account api_key : YOUR_API_KEY shared_secret : YOUR_SHARED_SECRET
Configuration Variables
Looking for your configuration file?
name string Required
Name of the RTM account, as you can have several accounts in RTM. The name must be unique.
api_key string Required
Put the API key you’ve received in here.
shared_secret string Required
Put the shared secret you’ve received in here.
After saving the configuration, you need to (re-)start Home Assistant. On the first start you will notice a new “Configuration” panel appearing on the Home Assistant page. After opening the configuration page, follow the link “Remember The Milk login”. This will take you to a login page where you have to log in with your normal Remember The Milk credentials. This will authorize Home Assistant to access your Remember The Milk account.
After that click on the “login completed” button. This will tell Home Assistant that you have completed the login process on the Remember The Milk page and Home Assistant should try to register with this account.
If the registration was successful, the Configuration panel will disappear from your Home Assistant screen and a Remember The Milk panel should appear. This completes the setup process.
In the background Home Assistant downloaded a “token” from the Remember The Milk server which is stored in the remember_the_milk.conf file locally. So you only need to register once. After that the token is used to authenticate with the server.
This integration offers a new service domain remember_the_milk with the services <account>_create_task . You can call this service with the argument name and the optional parameter id to create a new task in your Remember The Milk account. You can call this service from your usual automations.
If you set an id and a task with that id exists already, the existing task is updated, rather than creating a new task. This way you can change the name of the task. If you do not set an id , a new task is created with every call. If you’re using this from an automation, you could use the name of your automation as id or the entity that triggered the task to be created. This way you can later on update or complete this task.
The task creation supports the “smart syntax”, so to create a task with the tag “from_hass” which is due today you can create a task with the name test task created in Home Assistant ^today #from_hass . More info about the smart syntax is available on the Remember The Milk documentation .
Note:
At the moment, smart syntax is not supported when updating tasks. All smart syntax commands are ignored during the update and will end up as normal text in the name of the task.
Data attribute Optional Description Example name no Name of the new task, you can use the smart syntax here. “do this ^today #from_hass” id yes Identifier for the task you’re creating, can be used to update or complete the task later on “myid”
Complete a tasks that was privously created from Home Assistant. You cannot complete tasks that were created outside of Home Assistant.
If you have created your task with an id , calling <account>_complete_task with the parameter id will then complete your task.
Data attribute Optional Description Example id no Identifier that was defined when creating the task “myid”
Here’s an example for an automation that creates a new task whenever sensor.mysensor is on and completes it when the sensor reports off . This way it reminds you to switch it off. By using the entity_id as ID for the task, you can use the same rule also for multiple sensors.
- triggers : - trigger : state entity_id : sensor.mysensor to : " on" actions : - action : remember_the_milk.myaccount_create_task data : name : " Please switch off {{trigger.entity_id}}" id : " {{trigger.entity_id}}" - triggers : - trigger : state entity_id : sensor.mysensor to : " off" actions : - action : remember_the_milk.myaccount_complete_task data : id : " {{trigger.entity_id}}"
This integration uses the Remember The Milk API but is not endorsed or certified by Remember The Milk.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Remember The Milk integration was introduced in Home Assistant 0.57, and it's used by
17 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Calendar
Back to top
