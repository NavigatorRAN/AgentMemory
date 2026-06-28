# Configuration packages - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/packages
- Final URL: https://www.home-assistant.io/docs/configuration/packages
- Canonical URL: https://www.home-assistant.io/docs/configuration/packages/
- Fetched at: 2026-06-28T02:21:28Z
- Content type: text/html; charset=UTF-8

## Description

Configuration packages let you bundle related YAML configuration from multiple integrations into a single file, so you can keep large setups organized.

## Extracted Text

On this page
Create a packages folder
Customizing entities with packages
Packages in Home Assistant provide a way to bundle configurations from multiple integrations. You can use packages to include multiple integrations, or parts of integrations, using any of the !include directives introduced in splitting the configuration .
Packages are configured under the core homeassistant/packages in the configuration and take the format of a package name (no spaces, all lowercase) followed by a dictionary with the package configuration. For example, package pack_1 would be created as:
homeassistant : ... packages : pack_1 : ...package configuration here...
The package configuration can include: switch , light , automation , groups , or most other Home Assistant integrations including hardware platforms.
It can be specified inline or in a separate YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] file using !include .
Inline example, main configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
homeassistant : ... packages : pack_1 : switch : - platform : rest ... light : - platform : rpi ...
Include example, main configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
homeassistant : ... packages : pack_1 : !include my_package.yaml
The file my_package.yaml contains the “top-level” configuration:
switch : - platform : rest ... light : - platform : rpi ...
There are some rules for packages that will be merged:
Platform based integrations ( light , switch , etc) can always be merged.
Integrations where entities are identified by a key that will represent the entity_id ( {key: config} ) need to have unique ‘keys’ between packages and the main configuration file.
For example, if we have the following in the main configuration. You are not allowed to re-use “my_input” again for input_boolean in a package:
input_boolean : my_input :
Any integration that is not a platform [1], or dictionaries with Entity ID keys [2] can only be merged if its keys, except those for lists, are solely defined once.
Tip
Integrations inside packages can only specify platform entries using configuration style 1, where all the platforms are grouped under the integration name.
One way to organize packages is to create a folder named “packages” in your Home Assistant configuration directory. In this packages folder, you can store any number of packages in YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] files, and organize those packages into YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] files and subfolders as you see fit. With !include_dir_named , the filename is used as the package name. This means that file names must be globally unique, even across subfolders. This entry in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] will load all YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] -files in this packages folder and its sub folders:
homeassistant : packages : !include_dir_named packages
The benefit of this approach is to pull all configurations required to integrate a system into one file, rather than keeping them spread across several files.
You can also use !include_dir_merge_named for packages. The two directives differ in how they handle the file contents. With !include_dir_named , each file’s content is placed directly under the package name (which is the filename), so the content uses the same indentation as it would inside the packages: key in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] . This means you can copy and paste elements from the main config file. With !include_dir_merge_named , the package name has to be the top-level key inside the file, so the content needs an additional level of indentation and you cannot directly copy and paste from the configuration file.
homeassistant : packages : !include_dir_merge_named packages
and in packages/subsystem1/functionality1.yaml :
subsystem1_functionality1 : input_boolean : ... binary_sensor : ... automation :
It is possible to customize entities within packages. Just create your customization entries under:
homeassistant : customize :
Important
If you are moving configuration to packages, auth_providers must stay within your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. See the general documentation for Authentication Providers .
This is because Home Assistant processes the auth_providers configuration early during startup, before packages are processed.
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
