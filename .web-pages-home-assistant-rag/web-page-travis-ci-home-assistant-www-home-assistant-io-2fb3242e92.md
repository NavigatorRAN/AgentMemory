# Travis-CI - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/travisci
- Final URL: https://www.home-assistant.io/integrations/travisci
- Canonical URL: https://www.home-assistant.io/integrations/travisci/
- Fetched at: 2026-06-28T03:23:55Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the test build results reported by Travis-CI within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
With this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you will be able to integrate the test build results reported by Travis-CI working within Home Assistant.
Create a GitHub access token with the following scopes:
read:org
user:email
repo_deployment
repo:status
write:repo_hook
To enable this platform, please add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry sensor : - platform : travisci api_key : YOUR_ACCESS_TOKEN
Configuration Variables
Looking for your configuration file?
api_key string Required
The access token for GitHub.
branch string ( Optional , default: master )
Determine which default branch should be used by the state condition.
monitored_conditions list ( Optional )
Conditions to display in the frontend. If not specified, all conditions below will be enabled by default. The following conditions can be monitored.
last_build_id
Turn the last build job ID.
last_build_duration
Return the time elapsed in seconds to run the last test job.
last_build_finished_at
Return the timestamp of when the last test job finished.
last_build_started_at
Return the timestamp of when the last test job started.
last_build_state
Return the state from the latest test job/PR. The conditions can be: ‘passed’, ‘failed’ or ‘started’.
state
Return the build test from the branch specified at by branch parameter.
repository list ( Optional )
Name from the GitHub repositories to be monitored. If not specified, all GitHub repositories linked to Travis-CI will be enabled by default.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Travis-CI integration was introduced in Home Assistant 0.56, and it's used by
0 active installations.
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
