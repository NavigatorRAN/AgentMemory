# Recovery mode - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/recovery_mode
- Final URL: https://www.home-assistant.io/integrations/recovery_mode
- Canonical URL: https://www.home-assistant.io/integrations/recovery_mode/
- Fetched at: 2026-06-28T03:11:34Z
- Content type: text/html; charset=UTF-8

## Description

How Home Assistant starts in recovery mode when the configuration cannot be loaded.

## Extracted Text

On this page
When Home Assistant starts in recovery mode
What to do when you are in recovery mode
Common causes
Known limitations
Related topics
The Recovery mode integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is an internal integration that Home Assistant activates automatically when, in rare cases, something unexpected prevents it from starting normally. It is a safety net. Home Assistant is designed to handle updates, configuration changes, and day-to-day operation without needing recovery mode, and in practice, you are unlikely to ever see it.
When it is needed, recovery mode gives you a minimal but working Home Assistant so you can investigate and fix the problem without having to edit files directly on disk.
You do not install or configure this integration. Home Assistant starts it for you when needed.
Important
Recovery mode does not delete, reset, or modify your configuration, entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] , or history. Your data is safe. Recovery mode only starts with a minimal set of integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] so you can reach the UI and fix whatever went wrong.
Recovery mode is rarely needed. Home Assistant only falls back to it when something unexpected prevents a normal startup, for example:
The configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file cannot be parsed because of a YAML syntax error.
A manually edited configuration file contains options that are no longer valid.
One or more core integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , such as the frontend, fail to load due to an unexpected environmental issue.
The configuration storage was corrupted, for example, after a sudden power loss.
When recovery mode is active, Home Assistant loads only a minimal set of system integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] (such as the frontend, backup, and cloud) and skips all your user-configured integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] . You see a Recovery Mode notification on the dashboard when you sign in.
Open Settings > System > Logs and look for the error that caused the problem. The log entry usually points at the exact line in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] or the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] that failed.
Fix the reported issue. This often means:
Correcting a YAML syntax error in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
Removing or updating a configuration option that was changed. Check the backward-incompatible changes of a recent release if the issue appeared after an update.
Restoring a backup from before the problem started.
Restart Home Assistant from Settings > System by selecting Restart Home Assistant , or by rebooting your host.
If Home Assistant starts normally, the issue is resolved. If recovery mode reactivates, the underlying issue is still there. Check the logs again for the current error.
Tip
If you are unsure how to fix the error, copy the relevant log lines and search the Home Assistant Community Forum . Many recovery mode errors, especially after an update, have been reported and solved by other users.
When recovery mode does happen, these are the most common reasons:
YAML syntax errors : incorrect indentation, missing colons, or unmatched quotes in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] or any included YAML files.
Missing include files : an !include reference in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] points to a file that no longer exists.
Backward-incompatible changes after an update : a manually configured option was changed or removed in a release. Check the backward-incompatible changes section of the release notes for the version you upgraded to.
Corrupted configuration storage : it can happen after a sudden power loss during a write.
In recovery mode, your integrations Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , devices A device is a model representing a physical or logical unit that contains entities. , automations Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] , and scripts Scripts are components that allow you to specify a sequence of actions to be executed by Home Assistant when turned on. [Learn more] are not active. Recovery mode is only meant for fixing the problem, not for continuing to run Home Assistant.
The recovery mode notification disappears as soon as Home Assistant starts normally again.
General troubleshooting
Debug logs and diagnostics
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Recovery mode system was introduced in Home Assistant 0.105, and it's used by
0 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Back to top
