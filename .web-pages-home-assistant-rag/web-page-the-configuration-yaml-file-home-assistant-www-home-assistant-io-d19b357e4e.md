---
source_url: "https://www.home-assistant.io/docs/configuration"
final_url: "https://www.home-assistant.io/docs/configuration"
canonical_url: "https://www.home-assistant.io/docs/configuration/"
source_handle: "web:www-home-assistant-io:d19b357e4e7a"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "259dcb1b8860045cca0418a9fffe246d35ad164d2a8c7d2b730376e523a52f06"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# The configuration.yaml file - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration
- Final URL: https://www.home-assistant.io/docs/configuration
- Canonical URL: https://www.home-assistant.io/docs/configuration/
- Fetched at: 2026-06-28T02:21:18Z
- Content type: text/html; charset=UTF-8

## Description

How the configuration.yaml file works in Home Assistant: when you need it, where to find it, and how to edit it safely.

## Extracted Text

On this page
Editing configuration.yaml
To set up file access and prepare an editor
To find the configuration directory
To edit the configuration file
Validating the configuration
Reloading the configuration to apply changes
Troubleshooting the configuration
Related topics
While you can configure most of Home Assistant from the user interface, a small number of integrations and power-user features still need a few lines in the configuration.yaml file. This page explains how that file works, so you can use it when you need to.
Example of a configuration.yaml file, accessed using the File editor app on a Home Assistant Operating System installation.
How you edit your configuration.yaml file depends on your editor preferences and the installation type you used to set up Home Assistant. Follow these steps:
Set up file access and prepare an editor .
Find the configuration directory .
Edit the configuration.yaml file .
Save your changes and reload the configuration to apply the changes.
Before you can edit a file, you need to know how to access files in Home Assistant and setup an editor.
File access depends on your installation type . If you use Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. , you can use editor apps, for example. If you use Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] , apps are not available.
To set up file access on the Home Assistant Operating System, follow these steps:
If you are unsure which option to choose, install the file editor app .
Alternatively, use the Studio Code Server app . This editor offers live syntax checking and auto-fill of various Home Assistant entities. But it looks more complex than the file editor.
If you prefer to use a file editor on your computer, use the Samba app .
To look up the path to your configuration directory, go to Settings > System > Repairs .
Select the three dots menu and select System information .
Find out the location of the Configuration directory .
Unless you changed the file structure, the default is as follows: -
Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. : the configuration.yaml is in the /config folder of the installation.
Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] : the configuration.yaml is in the config folder that you mounted in your container.
Once you have located the config folder, you can edit your configuration.yaml file. How you edit the file depends on the editor you set up in step 1:
If you are using the File editor app : Open the app, navigate to the /config folder in the file browser on the left, and select the configuration.yaml file to open it in the editor.
If you are using the Studio Code Server app : Open the app, use the file explorer on the left to navigate to the configuration.yaml file, and select it to open in the editor.
If you are using Samba to access files : Navigate to the shared folder on your computer, locate the configuration.yaml file, and open it with your favorite text editor like Notepad++ or Visual Studio Code .
Note
If you have watched any videos about setting up Home Assistant using configuration.yaml (particularly ones that are old), you might notice your default configuration file is much smaller than what the videos show. Don’t be concerned, you haven’t done anything wrong. Many items in the default configuration files shown in those old videos are now included in the default_config: line that you see in your configuration file. Refer to the default config integration for more information on what’s included in that line.
After changing configuration or automation files, you can check if the configuration is valid. A configuration check is also applied automatically when you reload the configuration or when you restart Home Assistant.
The method for running a configuration check depends on your installation type . Check the common tasks for your installation type:
Configuration check on Operating System
Configuration check on Container
For configuration changes to become effective, the configuration must be reloaded. Most integrations in Home Assistant (that do not interact with devices A device is a model representing a physical or logical unit that contains entities. or services The term “service” in Home Assistant is used in the sense of an information
service . For example, the municipal waste management service that provides
entities for organic, paper, and packaging waste. In terms of functionality,
the information service is like a device. It is called service to avoid
confusion, as it does not come with a piece of hardware. ) can reload changes made to their configuration in configuration.yaml without needing to restart Home Assistant.
Under Settings , select the three dots menu (top right) , select Restart Home Assistant > Quick reload .
If you find that your changes were not applied, you need to restart.
Select Restart Home Assistant .
Note: This interrupts automations and scripts.
If you run into trouble while configuring Home Assistant, refer to the configuration troubleshooting page .
Yaml syntax
Creating and restoring backups
Reloading the yaml configuration from developer tools
Configuring file access on the operating system
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Home information
People and user configuration
Customizing entities
Remote access to Home Assistant
Securing your Home Assistant
Storing secrets in YAML
YAML syntax
The configuration.yaml file
Troubleshooting configuration
Splitting up the configuration
Packages
Events
State and state object
Entities and domains
Entity component platform options
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
