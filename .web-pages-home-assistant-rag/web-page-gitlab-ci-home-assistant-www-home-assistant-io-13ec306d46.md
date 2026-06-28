# GitLab-CI - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/gitlab_ci
- Final URL: https://www.home-assistant.io/integrations/gitlab_ci
- Canonical URL: https://www.home-assistant.io/integrations/gitlab_ci/
- Fetched at: 2026-06-28T02:46:05Z
- Content type: text/html; charset=UTF-8

## Description

How to integrate GitLab-CI Job status within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
The GitLab-CI integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] integrates results reported by CI/CD Pipeline Jobs in GitLab .
You will need a GitLab repository ID. On the Details page for your GitLab repository, just below the project name is Project ID: .
Alternatively, you can use GitLab_Username/GitLab_RepositoryName , e.g., MyCoolUsername/MyCoolRepository .
A GitLab token with at least the API permission scope is needed, which can be created on the GitLab Personal Access Tokens page of your GitLab User Settings.
To enable this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , please add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : gitlab_ci gitlab_id : YOUR_GITLAB_ID token : YOUR_GITLAB_TOKEN
Configuration Variables
Looking for your configuration file?
gitlab_id string Required
The GitLab repository identifier.
token string Required
The GitLab API token.
name string ( Optional , default: GitLab CI Status )
Sensor name as it appears in Home Assistant.
url string ( Optional )
The GitLab repository URL. Used for self-hosted repositories.
Default:
https://gitlab.com
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GitLab-CI integration was introduced in Home Assistant 0.8, and it's used by
8 active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Sensor
Back to top
