# uHoo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/uhoo
- Final URL: https://www.home-assistant.io/integrations/uhoo
- Canonical URL: https://www.home-assistant.io/integrations/uhoo/
- Fetched at: 2026-06-28T03:24:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate uHoo with Home Assistant

## Extracted Text

On this page
About uHoo
Supported devices
Prerequisites
Configuration
Supported functionality
Sensors
Indices
Data frequency
Troubleshooting
I can’t login the uHoo Premium web dashboard
I can’t see my devices
I can’t see my data
Removing the integration
To remove an integration instance from Home Assistant
The uHoo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you integrate uHoo devices into Home Assistant.
uHoo delivers advanced, real-time indoor air quality monitoring designed to help you understand, manage, and improve the air in your home. By measuring 9 key environmental factors, uHoo provides accurate and science-backed insights that support healthier living and smarter home automation.
What sets uHoo apart is its suite of proprietary health and safety indices that go beyond raw data to show you exactly how your environment affects your well-being, helping you act before problems even start.
Virus index
Mold index
Influenza index
Connecting uHoo with Home Assistant unlocks even more possibilities: create air-quality-based routines, receive instant alerts, track long-term trends, and maintain a safer, more energy-efficient home environment.
With uHoo, you can confidently make better decisions about your indoor air and stay on top of your game every day.
uHoo Smart Air Monitor
uHoo Caeli Air Monitor
Download the uHoo app from the App Store or Google Play .
Sign up for a uHoo account.
Register at least one device to your account.
Upgrade your account to uHoo Premium.
Login the uHoo web dashboard and tap the Account icon in the bottom left corner.
Navigate to the API Key section and enter your account password to create an API key.
To add the uHoo hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select uHoo .
Follow the instructions on screen to complete the setup.
Temperature
Relative humidity
PM2.5 (Particulate Matter)
Total volatile organic compounds (TVOC)
Carbon dioxide (CO2)
Carbon monoxide (CO)
Air pressure
Ozone
Nitrogen dioxide (NO2)
This integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the devices every 5 minutes.
Login your uHoo app and confirm your account is in uHoo Premium, or reach out to [email protected] for further assistance.
Make sure that your devices are visible in the uHoo app, and that you have used the same account to create the API key in the web dashboard.
Check your API key and make sure it is up to date.
This integration follows standard integration removal. We suggest that you update your API key afterwards for security reasons.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The uHoo hub was introduced in Home Assistant 2026.2, and it's used by
5 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@getuhoo
@joshsmonta
Back to top
