---
source_url: "https://www.home-assistant.io/integrations/logger"
final_url: "https://www.home-assistant.io/integrations/logger"
canonical_url: "https://www.home-assistant.io/integrations/logger/"
source_handle: "web:www-home-assistant-io:6424c8d61321"
source_section: "integrations-logger"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0a9eee670861813eccd1856963cf35b7c91fc2d232ff0d4141e716a33430831f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Logger - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/logger
- Final URL: https://www.home-assistant.io/integrations/logger
- Canonical URL: https://www.home-assistant.io/integrations/logger/
- Fetched at: 2026-06-28T02:57:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to enable the logger integration for Home Assistant.

## Extracted Text

On this page
YAML configuration
Configuration reference
Log levels
Logs
Log filters
List of actions
Viewing logs
Viewing logs on Home Assistant OS
Viewing logs on Container installations
The Logger integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you define logging levels and filters in Home Assistant.
Each logging entry is in this form:
[timestamp] [level] [thread] [namespace] [message]
To enable the logger integration in your installation,
add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry logger :
Configuration Variables
Looking for your configuration file?
default string ( Optional )
Default log level. See log_level .
logs map ( Optional )
List of integrations and their log level. See logs .
<component_namespace> string
Logger namespace of the integration. See log_level .
filters map ( Optional )
Regular Expression logging filters.
<component_namespace> list
Logger namespace of the integration and a list of Regular Expressions. See Log Filters .
Possible log severity levels, listed in order from most severe to least severe, are:
critical
fatal
error
warning
warn
info
debug
notset
The standard log severity level is warning if the logger integration is not enabled in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
All messages lower than the specified level will be ignored in the logs.
You can change logging severity for a specific component or integration.
Example configuration.yaml entry:
logger : default : critical logs : # Log level for Home Assistant Core homeassistant.core : fatal # Log level for MQTT integration homeassistant.components.mqtt : warning # Log level for all python scripts homeassistant.components.python_script : warning # Individual log level for this python script homeassistant.components.python_script.my_new_script.py : debug # Log level for SmartThings lights homeassistant.components.smartthings.light : info # Log level for a custom integration custom_components.my_integration : debug # Log level for the `aiohttp` Python package aiohttp : error # Log level for both 'glances_api' and 'glances' integration homeassistant.components.glances : fatal glances_api : fatal
In the example, do note the difference between ‘glances_api’ and ‘homeassistant.components.glances’ namespaces,
both of which are at root. They are logged by different APIs.
If you want to know the namespaces in your own environment then check your log files on startup.
You will see INFO log messages from homeassistant.loader stating loaded <component> from <namespace> .
Those are the namespaces available for you to set a log level against.
Service-specific Regular Expression filters for logs. A message is omitted if it matches the Regular Expression.
An example configuration might look like this:
# Example configuration.yaml entry logger : default : info filters : # Filters out all entries containing "unable to connect" system wide " " : - " unable to connect" # Filters out all "HTTP 429" errors for my_integration custom_components.my_integration : - " HTTP 429"
Note
To learn more about Regular Expression, see the Python documentation
The Logger integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set logger default level ( logger.set_default_level )
Sets the default log level for loggers without an explicit level.
Set logger level ( logger.set_level )
Sets the log level for one or more integrations.
For an overview of every action across all integrations, see the actions reference .
The primary way to view logs is through the Home Assistant UI. Go to Settings > System > Logs and select Home Assistant Core . To see the full unformatted log output, enable Show raw logs at the top of the page. You can also download the log file from this page.
On Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. installations, logs are not written to a file in the configuration directory. Use the UI as described above, or run the following command from the SSH app for Home Assistant :
ha core logs --follow
For Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] installations, the log information is also written to a file called home-assistant.log in the configuration directory . You can follow it dynamically with the following command:
# Follow the log dynamically
docker logs --follow MY_CONTAINER_ID
Or read the file directly:
tail -f /config/home-assistant.log
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Logger system was introduced in Home Assistant 0.8, and it's used by
9% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Utility
Back to top
