# RDW - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rdw
- Final URL: https://www.home-assistant.io/integrations/rdw
- Canonical URL: https://www.home-assistant.io/integrations/rdw/
- Fetched at: 2026-06-28T03:11:26Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate RDW vehicle information with Home Assistant.

## Extracted Text

On this page
Use case
Prerequisites
Configuration
Supported functionality
Entities
Examples
Creating a vehicle recall alert automation
Data updates
Known limitations
Troubleshooting
Vehicle information not found
Removing the integration
To remove an integration instance from Home Assistant
The RDW integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects with the RDW (Netherlands Vehicle Authority) open data service to retrieve and monitor information about your Dutch registered vehicles in Home Assistant. RDW is the government organization responsible for vehicle registration, licensing, supervision, and enforcement in the Netherlands.
With this integration, you can keep track of important vehicle information like periodic inspection ( APK ) expiration dates, insurance status, and recall notifications directly in your Home Assistant dashboard. This saves you from having to manually check the RDW website or wait for paper notifications in the mail. You can set up automations to receive timely reminders when your vehicle needs attention.
To use this integration, you need:
A vehicle with Dutch registration (license plate)
The license plate number of the vehicle you want to monitor
To add the RDW service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select RDW .
Follow the instructions on screen to complete the setup.
License plate
The Dutch license plate number of your vehicle. Enter without spaces or dashes (for example, AB123C instead of AB-123-C).
The RDW integration provides the following entities for your vehicle:
Binary sensors
Liability insured : Shows whether your vehicle has current liability insurance.
Pending recall : Indicates if your vehicle has an open recall notice that requires attention.
Sensors
APK expiration : The date when your vehicle’s periodic technical inspection (APK) expires.
Ascription date : The date when your vehicle was registered to its current owner.
This automation sends you an important notification when the RDW reports a safety recall for your vehicle:
automation : - alias : " Vehicle recall alert" triggers : - trigger : state entity_id : binary_sensor.rdw_ab123c_pending_recall to : " on" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Vehicle recall alert" message : " Your vehicle has a pending safety recall. Please contact your dealer."
The RDW integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the RDW open database once an hour. This update frequency is appropriate for vehicle-related information since this data typically doesn’t change frequently.
This integration only works with Dutch vehicle license plates.
Symptom: “Unknown license plate”
When trying to set up the integration, the form shows the message “Unknown license plate.”
Description
This happens when the license plate is valid but RDW doesn’t have information about this vehicle in its database.
Resolution
Double-check that you’ve entered the correct license plate number.
Make sure the vehicle is registered in the Netherlands.
Very new registrations might take some time to appear in the open data.
Check the RDW website to see if it shows up there.
This integration follows standard integration removal. No additional steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RDW service was introduced in Home Assistant 2021.12, and it's used by
1121 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
@joostlek
Categories
Binary sensor
Car
Sensor
Back to top
