# Mythic Beasts DNS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mythicbeastsdns
- Final URL: https://www.home-assistant.io/integrations/mythicbeastsdns
- Canonical URL: https://www.home-assistant.io/integrations/mythicbeastsdns/
- Fetched at: 2026-06-28T03:02:04Z
- Content type: text/html; charset=UTF-8

## Description

Keep your mythic beasts DNS updated

## Extracted Text

On this page
Configuration
Related topics
With the Mythic Beasts DNS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] you can automatically update your dynamic DNS entry at Mythic Beasts .
To use the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry mythicbeastsdns : host : YOUR_HOST domain : YOUR_DOMAIN password : YOUR_API_KEY
Configuration Variables
Looking for your configuration file?
host string Required
The first part, or subdomain that you want to be dynamic.
domain string Required
Your domain, e.g., example.com .
password string Required
The password for your domain. You can set this by clicking “DNS API” on the domain page.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mythic Beasts DNS integration was introduced in Home Assistant 0.85, and it's used by
2 active installations.
Its IoT class is Cloud Push.
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
