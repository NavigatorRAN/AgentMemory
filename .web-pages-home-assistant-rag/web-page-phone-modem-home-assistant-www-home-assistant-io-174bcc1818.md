# Phone Modem - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/modem_callerid
- Final URL: https://www.home-assistant.io/integrations/modem_callerid
- Canonical URL: https://www.home-assistant.io/integrations/modem_callerid/
- Fetched at: 2026-06-28T03:00:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Caller ID sensor into Home Assistant.

## Extracted Text

On this page
Configuration
Compatibility
Examples
The Phone Modem integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses an available modem for collecting caller ID information. It requires a Hayes AT compatible modem that supports caller ID detection (via AT+VCID=1). Usually any modem that uses a CX93001 will support this.
When the sensor detects a new call, its state changes to ‘ring’ for each ring and ‘callerid’ when caller id information is received. It returns to ‘idle’ once ringing stops. The state event includes an attribute payload that includes the time of the call, name, and number.
This integration also offers a button to pick up and then hang up the call to properly reject it (via ATA and ATH).
To add the Phone Modem device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Phone Modem .
Follow the instructions on screen to complete the setup.
Reported models with this integration include that work:
StarTech.com USB56KEMH2
Zoom USB Modem Model 3095
Devices that did not work:
StarTech.com USB56KEM3
An example automation:
automation : - alias : " Notify CallerID" triggers : - trigger : state entity_id : sensor.phone_modem to : " callerid" actions : - action : notify.notify data : message : " Call from {{ state_attr('sensor.phone_modem', 'cid_name') }} at {{ state_attr('sensor.phone_modem', 'cid_number') }} " - alias : " Notify CallerID webui" triggers : - trigger : state entity_id : sensor.phone_modem to : " callerid" actions : - action : persistent_notification.create data : title : " Call from" message : " {{ state_attr('sensor.phone_modem', 'cid_time').strftime(" % I:%M %p") }} {{ state_attr('sensor.phone_modem', 'cid_name') }} {{ state_attr('sensor.phone_modem', 'cid_number') }} " - alias : " Say CallerID" triggers : - trigger : state entity_id : sensor.phone_modem to : " callerid" actions : - action : tts.google_say data : message : " Call from {{ state_attr('sensor.phone_modem', 'cid_name') }}"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Phone Modem device was introduced in Home Assistant 0.40, and it's used by
49 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Sensor
Back to top
