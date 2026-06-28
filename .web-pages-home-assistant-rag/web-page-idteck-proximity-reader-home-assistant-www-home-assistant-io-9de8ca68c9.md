# IDTECK Proximity Reader - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/idteck_prox
- Final URL: https://www.home-assistant.io/integrations/idteck_prox
- Canonical URL: https://www.home-assistant.io/integrations/idteck_prox/
- Fetched at: 2026-06-28T02:51:16Z
- Content type: text/html; charset=UTF-8

## Description

How to use IDTECK proximity card readers.

## Extracted Text

On this page
Configuration
IDTECK makes ID systems used to control access and identify users. This integration works with Proximity Readers (RFID card readers). The device is connected to Home Assistant through a serial to ethernet converter (NPort).
An idteck_prox_keycard event is fired whenever a card or key sequence has been entered. The event contains ‘card’ - the card/key sequence, and the ‘name’ of the card reader. Checking ‘card’ against known card numbers can be used as the basis of an entry control system, or as part of a check-in/check-out system.
# Example configuration.yaml entry idteck_prox : - host : host1.domain.com port : 4001 name : " Lower Door" - host : host2.domain.com port : 4001 name : " Upper Door"
Configuration Variables
Looking for your configuration file?
host string Required
The hostname or IP address of the ethernet to serial adapter that is connected to the proximity reader. It is assumed that the adapter has been preconfigured.
port integer Required
The port of the ethernet to serial adapter
name string Required
The name of the prox card reader
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The IDTECK Proximity Reader integration was introduced in Home Assistant 0.85, and it's used by
1 active installations.
Its IoT class is Local Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Other
Back to top
