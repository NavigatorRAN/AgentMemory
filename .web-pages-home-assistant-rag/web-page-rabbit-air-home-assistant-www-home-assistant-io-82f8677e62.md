# Rabbit Air - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rabbitair
- Final URL: https://www.home-assistant.io/integrations/rabbitair
- Canonical URL: https://www.home-assistant.io/integrations/rabbitair/
- Fetched at: 2026-06-28T03:10:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Rabbit Air air purifier within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
The Rabbit Air integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you control your air purifier over the local network. The following device models are currently supported:
MinusA2 (2-nd generation)
A3
The fan platform of this integration allows you to turn the unit on/off, select the preset mode, or set the speed manually.
To set up the integration, you need the Thing ID and User key from the Rabbit Air 2 app. In Home Assistant, use the Thing ID as part of the host and the User key for access_token .
Open the Rabbit Air 2 app. You will see a list of devices connected to your account.
Tap your Rabbit Air device to open the device control page.
In the top right corner, tap the three-dot menu and select Rename .
On the Rename device screen, tap your device name (for example, MinusA2 ) to expand the section and reveal the Thing ID and User key .
The Thing ID is the device’s mDNS hostname. You can use the Thing ID for host by adding the suffix .local at the end. Use the User key for access_token .
For example, the app shows:
Then use the Thing ID for host and the User key for access_token .
If the app says “your device is not supported”, it probably means that you are trying to connect to a first-generation MinusA2 model (an older hardware revision). It is not yet supported by this integration.
To add the Rabbit Air device to your Home Assistant instance, use this My button:
Rabbit Air can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Rabbit Air .
Follow the instructions on screen to complete the setup.
host
Hostname or IP address of the device.
access_token
Access Token that can be obtained in the Rabbit Air app.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Rabbit Air device was introduced in Home Assistant 2024.2, and it's used by
67 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rabbit-air
Categories
Fan
Back to top
