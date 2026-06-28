# Islamic Prayer Times - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/islamic_prayer_times
- Final URL: https://www.home-assistant.io/integrations/islamic_prayer_times
- Canonical URL: https://www.home-assistant.io/integrations/islamic_prayer_times/
- Fetched at: 2026-06-28T02:53:20Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Islamic Prayer Times integration within Home Assistant.

## Extracted Text

On this page
Configuration
Integration Sensors
Prayer calculation method
Latitude Adjustment Method
Midnight mode
School
The Islamic Prayer Times integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] displays the various prayer times for Muslims as sensors.
This platform calculates prayer times using the following calculation methods:
Shia Ithna-Ansari
Islamic Society of North America
University of Islamic Sciences, Karachi
Muslim World League
Umm Al-Qura University, Makkah
Egyptian General Authority of Survey
Institute of Geophysics, University of Tehran
Gulf Region
Kuwait
Qatar
Majlis Ugama Islam Singapura, Singapore
Union Organization islamic de France
Diyanet İşleri Başkanlığı, Turkiye
Spiritual Administration of Muslims of Russia
Moonsighting Committee Worldwide
To add the Islamic Prayer Times service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Islamic Prayer Times .
Follow the instructions on screen to complete the setup.
The following sensors are added by the integration:
sensors:
fajr: Show the fajr prayer time for today.
sunrise: Show the sunrise for today which is the end of fajr prayer. This is a calculated field and may not necessarily be the same as the astronomical sunrise.
dhuhr: Show the dhuhr prayer time for today.
asr: Show the asr prayer time for today.
maghrib: Show the maghrib prayer time for today.
isha: Show the isha prayer time for today.
midnight: Show the midnight for today which is the end of isha prayer. This is a calculated field and is not the same as 12AM.
Default: Islamic Society of North America
A prayer times calculation method. Methods identify various schools of thought about how to compute the timings. If not specified, it defaults to Islamic Society of North America.
Default: Middle of the night
Method for adjusting times higher latitudes - for instance, if you are checking timings in the UK or Sweden.
Default: Standard (mid sunset to sunrise)
Default: Shafi
Method for adjusting Asr time calculation, if not specified, it defaults to Shafi.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Islamic Prayer Times service was introduced in Home Assistant 0.85, and it's used by
1140 active installations.
Its IoT class is Calculated.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@engrbm87
@cpfair
Categories
Sensor
Back to top
