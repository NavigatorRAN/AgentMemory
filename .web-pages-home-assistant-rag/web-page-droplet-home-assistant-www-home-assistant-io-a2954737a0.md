# Droplet - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/droplet
- Final URL: https://www.home-assistant.io/integrations/droplet
- Canonical URL: https://www.home-assistant.io/integrations/droplet/
- Fetched at: 2026-06-28T02:38:12Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Droplet in Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Sensors
Data updates
Use cases
Adding Droplet to your Energy Dashboard
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
FAQ
Q: Why does Droplet’s volume sensor sometimes show negative values?
Q: Why is Droplet’s volume sensor value so small?
The Droplet integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] seamlessly connects your Home Assistant setup to Droplet – an advanced all-in-one smart home water sensor.
Leveraging cutting-edge ultrasonic sensing technology, Droplet accurately monitors your home’s water usage in real time. It safeguards your property from potential water damage and empowers you to make informed decisions about water conservation and identify anomalies early.
Stay in control of your home’s water system efficiently and intelligently with Droplet and Home Assistant.
Before connecting to Home Assistant, it is necessary to enable the integration on your Droplet.
In the Droplet app, navigate to Settings > Smart Home Integrations > Home Assistant . Enable the integration and copy the token that appears on the screen. You will need to enter this in the configuration step.
To add the Droplet device to your Home Assistant instance, use this My button:
Droplet can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Droplet .
Follow the instructions on screen to complete the setup.
IP address
If your Droplet has a fixed IP address, you can use it for manual configuration. This field is not required for auto discovery.
Pairing code
Pairing code to authenticate with Droplet device. You can find it on the Droplet app under Settings > Smart Home Integrations > Home Assistant .
The following sensors values are available:
Flow rate
Volume
Server connectivity
Signal quality
Once the integration connects, Droplet will push data points as soon as they are available. During periods of increased activity, this may be as often as every 5 seconds. During periods of inactivity, it may be as seldom as every 30 seconds.
Open the edit menu of your energy dashboard.
Select the water consumption tile.
Select one of Droplet’s volume sensors. Optionally, track your costs.
Water usage recorded by Droplet will now be incorporated into your energy dashboard.
This integration follows standard integration removal process.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
To prevent Droplet from showing up as a discovered device after its removal, disable the local API in the Droplet app under Settings > Smart Home Integrations > Home Assistant .
Here are some steps you can take if you’re having trouble connecting your Droplet to Home Assistant.
Make sure you’ve entered the code from the Droplet app without any spaces and in all caps.
Try waiting 1-2 minutes after enabling Home Assistant or regenerating the code in the app. It may take a moment for Droplet to be ready to accept connections.
A : Even when you’re not using appliances in your home, there can still be activity in your pipes. Droplet tries to be very accurate and is sensitive to small flows, which can include water sloshing back and forth, or slight movement as a result of pressure differences. Small negative values are to be expected, and are reported so that cumulative statistics reported in Home Assistant (or other consumers of the API) can be fully accurate.
A : The volume reported by Droplet over local API is point-to-point, meaning that each new value represents the difference in volume recorded since this data was last sent. This data can be aggregated to generate cumulative volumes over periods such as days, weeks, or months.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Droplet device was introduced in Home Assistant 2025.10, and it's used by
654 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@sarahseidman
Categories
Sensor
Back to top
