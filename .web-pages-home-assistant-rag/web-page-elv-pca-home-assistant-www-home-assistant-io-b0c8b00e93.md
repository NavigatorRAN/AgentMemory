# ELV PCA - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/elv
- Final URL: https://www.home-assistant.io/integrations/elv
- Canonical URL: https://www.home-assistant.io/integrations/elv/
- Fetched at: 2026-06-28T02:39:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ELV PCA 301 switches into Home Assistant.

## Extracted Text

On this page
Configuration
Related topics
The ELV PCA integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control the state of your ELV PCA 301 smart switch . You need an 868 MHz interface like the JeeLink flashed with the pca-hex firmware .
To use your PCA 301 switch or socket in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry elv : device : SERIAL_PORT
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will add all PCA 301 switches which are in range. You can read the total used energy in kWh and the current power in Watt.
Configuration Variables
Looking for your configuration file?
device string Required
The path to you serial console. Get it via: ls /dev/tty* .
name string ( Optional )
Default name for the plugs.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ELV PCA integration was introduced in Home Assistant 0.95, and it's used by
1 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@majuss
Categories
Switch
Back to top
