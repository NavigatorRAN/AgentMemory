# Smappee - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/smappee
- Final URL: https://www.home-assistant.io/integrations/smappee
- Canonical URL: https://www.home-assistant.io/integrations/smappee/
- Fetched at: 2026-06-28T03:16:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Smappee within Home Assistant.

## Extracted Text

On this page
Smappee monitors
Local discovery
Sensor
Switch
Cloud API configuration
Binary sensor
Related topics
The Smappee integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will allow users to integrate their Smappee monitors, Smappee Comfort Plugs and Smappee Switches into Home Assistant using the official cloud API or the limited local option.
The table below summarizes the available options to initiate the Smappee integration in Home Assistant per Smappee monitor type.
Monitor type Local discovery Cloud API Smappee Energy Yes Yes Smappee Solar Yes Yes Smappee Plus Yes Yes Smappee Pro Yes Yes Smappee Genius Yes Yes Smappee Connect No Yes Smappee Wi-Fi Connect No Yes Smappee P1/S1 module No Yes
In most cases, the Smappee Energy, Solar, Plus, Pro and Genius monitors will be automatically discovered by Home Assistant through network scanning.
Those automatically discovered Smappee devices are listed on the integrations page and can be configured without any additional details.
This will provide you a limited number of entities only.
If your home network doesn’t support mDNS you can still manually initiate the Smappee integration by choosing the LOCAL option and entering the IP address of the Smappee monitor through the configuration flow.
Technical note: Auto-discovery of Smappee device requires that its mDNS name and password are set to factory default values. These values are typically accessed on the device expert web portal (locally at http://[IP-Address]/smappee.html). If you have changed the mDNS name, this typically is “Smappee[serialnumber]”.
A sensor entity is being added for the current active power usage. In case of solar production, an entity for active power production is added as well.
Smappee Genius devices will also provide entities for the current reactive, voltages for each phase and current active powers for each configured load (submeter).
Switch entities are created for each Smappee Switch and Smappee Comfort Plug.
To use the Smappee cloud integration you need a personal client_id and client_secret and add these to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. For personal use, access to the API is free and credentials can be obtained by contacting [email protected] . For commercial usage, it is based on a recurring fee and credentials can be obtained by contacting [email protected] .
For any information about the use of the API please refer to the Smappee API space .
# Example configuration.yaml entry smappee : client_id : YOUR_CLIENT_ID client_secret : YOUR_CLIENT_SECRET
Once Home Assistant restarted, go to Settings > Devices & services and select the Smappee integration. You will be redirected to a login page and be able to select the locations you would like to use within Home Assistant.
Using the Smappee cloud integration allows you to access your Smappee monitor and other shared devices from outside your local network. Additionally, several (binary) sensor entities become available as well.
Sensor entities are being added for the current active power usage,
the always-on active power, today’s total consumption,
total consumption during the current hour, total consumption during the last 5 minutes
and the always-on (slumber) consumption from today. In case of solar production, entities for the active power production, today’s total solar production
and the solar production during the current hour are added as well.
Smappee Pro, Plus, Genius and Connect devices will create current active powers for each configured load (submeter).
In case a Smappee Gas and/or Water meter is installed as well, an entity showing today’s consumption is provided.
Additionally, Smappee, Genius and Connect devices will also provide entities for the line voltages and phase voltages (for each phase).
Switch entities are created for each Smappee Switch, Smappee Comfort Plug and Smappee Output module.
For each discovered NILM appliance a binary sensor is being added showing the current state of the appliance.
Configuration Variables
Looking for your configuration file?
client_id string Required
Your Smappee API client ID.
client_secret string Required
Your Smappee API client secret.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Smappee hub was introduced in Home Assistant 0.64, and it's used by
502 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bsmappee
Categories
Energy
Hub
Back to top
