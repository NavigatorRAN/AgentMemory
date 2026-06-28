# IntesisHome - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/intesishome
- Final URL: https://www.home-assistant.io/integrations/intesishome
- Canonical URL: https://www.home-assistant.io/integrations/intesishome/
- Fetched at: 2026-06-28T02:52:45Z
- Content type: text/html; charset=UTF-8

## Description

Instructions how to integrate IntesisHome AC devices with Home Assistant

## Extracted Text

On this page
Configuration
Supported actions
The IntesisHome integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control IntesisHome , Airconwithme and anywAIR devices. IntesisHome provides integrations with air conditioners, including Panasonic, Daikin, Fujitsu, Toshiba, LG and more.
Note: IntesisHome products are a separate product line to IntesisBox. This platform does not support IntesisBox devices (which can be controlled locally using the WMP protocol).
To set it up, add the following information to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
climate : - platform : intesishome username : YOUR_USERNAME password : YOUR_PASSWORD
Configuration Variables
Looking for your configuration file?
username string Required
Your username for IntesisHome.com / Airconwithme
password string Required
Your password for IntesisHome
device string ( Optional , default: IntesisHome )
IntesisHome , airconwithme or anywair .
This integration opens a TCP connection with the IntesisHome API to receive temperature and status updates, and to issue commands.
By default, the integration will be named using the friendly device name from the IntesisHome website or application.
If internet connectivity is lost, the device will be marked as unavailable after 5 minutes.
Available actions:
climate.set_temperature
climate.set_fan_mode
climate.set_operation_mode
climate.set_swing_mode
climate.turn_on
climate.turn_off
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IntesisHome integration was introduced in Home Assistant 0.104, and it's used by
277 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jnimmo
Categories
Climate
Back to top
