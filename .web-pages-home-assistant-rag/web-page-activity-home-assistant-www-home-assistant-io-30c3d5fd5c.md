# Activity - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/logbook
- Final URL: https://www.home-assistant.io/integrations/logbook
- Canonical URL: https://www.home-assistant.io/integrations/logbook/
- Fetched at: 2026-06-28T02:57:33Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to enable the activity integration for Home Assistant.

## Extracted Text

On this page
Configure filter
Common filtering examples
Exclude events
Custom entries
Related topics
The Activity integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a different perspective on the history of your
house by showing all the changes that happened to your house in reverse
chronological order. It depends on
the recorder integration for storing the data. This means that if the
recorder integration is set up to use e.g., MySQL or
PostgreSQL as data store, the activity integration does not use the default
SQLite database to store data.
This integration is by default enabled, unless you’ve disabled or removed the default_config: line from your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file. If that is the case, the following example shows you how to enable this integration manually, by adding it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry logbook :
Configuration Variables
Looking for your configuration file?
exclude map ( Optional )
Configure which integrations should not should not track activity. ( Configure Filter )
entities list ( Optional )
The list of entity ids to be excluded from tracking activity.
entity_globs list ( Optional )
Exclude all entities matching a listed pattern from tracking activity (e.g., sensor.weather_* ).
domains list ( Optional )
The list of domains to be excluded from tracking activity.
include map ( Optional )
Configure which integrations should tracking activity. ( Configure Filter )
The list of entity ids to be included when tracking activity.
Include all entities matching a listed pattern when tracking activity (e.g., sensor.weather_* ).
The list of domains to be included when tracking activity.
By default, the activity will use the same filter as the recorder. To limit which entities are being exposed to Logbook , you can use the include and exclude parameters.
# Example filter to include specified domains and exclude specified entities logbook : include : domains : - alarm_control_panel - light entity_globs : - binary_sensor.*_occupancy exclude : entities : - light.kitchen_light
Filters are applied as follows:
No filter
All entities included
Only includes
Entity listed in entities include: include
Otherwise, entity matches domain include: include
Otherwise, entity matches glob include: include
Otherwise: exclude
Only excludes
Entity listed in exclude: exclude
Otherwise, entity matches domain exclude: exclude
Otherwise, entity matches glob exclude: exclude
Otherwise: include
Domain and/or glob includes (may also have excludes)
Otherwise, entity listed in entities exclude: exclude
Domain and/or glob excludes (no domain and/or glob includes)
Otherwise, entity listed in exclude: exclude
No Domain and/or glob includes or excludes
The following characters can be used in entity globs:
* - The asterisk represents zero, one, or multiple characters
? - The question mark represents zero or one character
If you want to exclude messages of some entities or domains from activity tracking,
just add the exclude parameter like:
# Example of excluding domains and entities from activity tracking (formerly called logbook) logbook : exclude : entities : - sensor.last_boot - sensor.date entity_globs : - sensor.weather_* domains : - sun
In case you just want to see messages from some specific entities or domains, use
the include configuration:
# Example to show how to only track the activity of the listed domains and entities logbook : include : domains : - sensor - switch - media_player
You can also use the include list and filter out some entities or domains with
an exclude list. Usually, this makes sense if you define domains on the include
side and filter out some specific entities.
# Example of combining include and exclude configurations for activity tracking logbook : include : domains : - sensor - switch - media_player exclude : entities : - sensor.last_boot - sensor.date entity_globs : - sensor.weather_*
If you have sensor.date to show the current date in the UI,
but you do not want activity tracking for that sensor every day, it can be excluded.
To exclude these entities, just add them to the exclude > entities list in
the configuration of the activity tracking.
To exclude all events from a whole domain, add it to the exclude > domain
list. For instance, if you use the sun domain only to trigger automations on the
azimuth attribute, then you are possibly not interested in activity tracking
for sun rise and sun set.
Excluded entities still take up space in the database. It may be advisable to
exclude them in recorder instead.
It is possible to add custom entries to activity tracking by using the script
integration to fire an event.
# Example configuration.yaml entry script : add_logbook_entry : alias : " Add activity" sequence : - action : logbook.log data : name : Kitchen message : is being used # Optional entity_id : light.kitchen domain : light
Important
When calling the logbook.log action without a domain or entity_id , entries will be added with the logbook domain. Ensure that the logbook domain is not filtered away if you want these entries to appear in your Activity panel.
Note
Sensor entities that have been assigned units (for example, have a unit_of_measurement attribute) are assumed to change frequently and those sensors are automatically excluded from activity tracking.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Activity system was introduced in Home Assistant 0.7, and it's used by
3.2% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
History
Back to top
