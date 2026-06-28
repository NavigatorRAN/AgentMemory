# Start.ca - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/startca
- Final URL: https://www.home-assistant.io/integrations/startca
- Canonical URL: https://www.home-assistant.io/integrations/startca/
- Fetched at: 2026-06-28T03:18:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Start.ca data usage within Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Related topics
Integrate your Start.ca account information into Home Assistant.
You can get your API key from: Start.ca Usage API
To use your Start.ca integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry sensor : - platform : startca api_key : API_KEY total_bandwidth : 400 monitored_variables : - usage - usage_gb - limit - used_download - used_upload - used_total - grace_download - grace_upload - grace_total - total_download - total_upload - used_remaining
Configuration Variables
Looking for your configuration file?
api_key string Required
The Start.ca API key to access the service.
total_bandwidth string Required
Your data limit in gigabytes. Set to 0 for unlimited plans without a cap.
monitored_conditions list Required
Conditions to display in the frontend.
usage
Data usage (percentage). This sensor is not supported for unlimited plans.
usage_gb
Data usage (gigabytes).
limit
Monthly data limit (gigabytes). This sensor is not supported for unlimited plans.
used_download
Data used by download outside the grace period (gigabytes).
used_upload
Data used by upload outside the grace period (gigabytes).
used_total
Total data (download and upload sum calculation) used outside the grace period (gigabytes).
grace_download
Data used by download during the grace period (gigabytes).
grace_upload
Data used by upload during the grace period (gigabytes).
grace_total
Total data (download and upload sum calculation) used during the unlimited period (gigabytes).
total_download
Total data download (Grace + Used) (gigabytes).
total_upload
Total data upload (Grace + Used) (gigabytes).
used_remaining
Remaining bandwidth calculated from used and supplied total bandwidth (gigabytes). This sensor is not supported for unlimited plans.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Start.ca integration was introduced in Home Assistant 0.64, and it's used by
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
Network
Back to top
