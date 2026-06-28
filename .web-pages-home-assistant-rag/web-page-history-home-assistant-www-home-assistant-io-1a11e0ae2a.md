# History - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/history
- Final URL: https://www.home-assistant.io/integrations/history
- Canonical URL: https://www.home-assistant.io/integrations/history/
- Fetched at: 2026-06-28T02:48:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to enable history support for Home Assistant.

## Extracted Text

On this page
Exporting data from the History panel
About the data sources
API
Related topics
Related links
The History integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] tracks everything that is going on within Home
Assistant and allows you to browse through it. It depends on the recorder
integration for storing the data and uses the same database setting.
If any entities are excluded from being recorded,
no history will be available for these entities.
This integration is by default enabled, unless you’ve disabled or removed the default_config: line from your configuration. If that is the case, the following example shows you how to enable this integration manually:
# Basic configuration.yaml entry history :
You can access the History panel from the side bar. To export the data, follow these steps:
Select the areas, devices, or entities of interest.
Set the time frame.
In the top right corner, select the Download data button.
Result : Your data is exported in CSV format.
By default, the recorder stores the sensor data for 10 days. Older data is purged automatically. The data for the last 10 days is taken from the recorder.
If you select a time frame that exceeds 10 days, the data is taken from the long term statistics table. Long term statistics are saved for sensors with a state_class of measurement, total or total_increasing. The long term statistics data is sampled and averaged once per hour, to save storage. Therefore, the values might look different from what you see from the recorder data, which shows the measured values at the sample rate defined for that sensor. The detailed data will be shown with a darker line on graphs.
If you want to see the data in full resolution for a longer period of time, you could change the retention period for that sensor in the recorder. If you do this, you may need to increase the storage capacity of your device.
The history information is also available through the
RESTful API .
Recorder integration
Home Assistant Data Science Portal
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The History system was introduced in Home Assistant pre 0.7, and it's used by
2.8% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
History
Back to top
