---
source_url: "https://www.home-assistant.io/integrations/recorder"
final_url: "https://www.home-assistant.io/integrations/recorder"
canonical_url: "https://www.home-assistant.io/integrations/recorder/"
source_handle: "web:www-home-assistant-io:c1ca19d4db70"
source_section: "integrations-recorder"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "46869a8181a63bdb5ae78251476c6a1bad4392d06bc4a0f2ef7fd427d04a9f9f"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Recorder - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/recorder
- Final URL: https://www.home-assistant.io/integrations/recorder
- Canonical URL: https://www.home-assistant.io/integrations/recorder/
- Fetched at: 2026-06-28T03:11:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to configure the data recorder for Home Assistant.

## Extracted Text

On this page
Disk space requirements
Advanced configuration
Configure filter
List of actions
Handling disk corruption and hardware failures
Custom database engines
Database startup
Installation notes
MariaDB and MySQL
PostgreSQL
Related topics
The Recorder integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is by default enabled as dependency of the history integration.
Important
This integration constantly saves data. If you use the default configuration, the data will be saved on the media Home Assistant is installed on. In case of Raspberry Pi with an SD card, it might affect your system’s reaction time and life expectancy of the storage medium (the SD card). It is therefore recommended to set the commit_interval to higher value, e.g. 30s, limit the amount of stored data (e.g., by excluding devices) or store the data elsewhere (e.g., another system).
Home Assistant uses SQLAlchemy , which is an Object Relational Mapper (ORM). This makes it possible to use several database solutions.
The supported database solutions are:
MariaDB ≥ 10.3
MySQL ≥ 8.0
PostgreSQL ≥ 12
SQLite ≥ 3.40.1
Although SQLAlchemy supports database solutions in addition to the ones supported by Home Assistant, it will behave differently on different databases, and features relied on by the recorder may work differently, or not at all, in different databases.
The default, and recommended, database engine is SQLite which does not require any configuration. The database is stored in your Home Assistant configuration directory (’/config/’) and is named home-assistant_v2.db .
Caution
Changing database used by the recorder may result in losing your existing history. Migrating data is not supported.
A bare minimum requirement is to have at least as much free temporary space available as the size of your database at all times. A table rebuild, repair, or repack may happen at any time, which can result in a copy of the data on disk during the operation. Meeting the bare minimum requirement is essential during a version upgrade, where the schema may change, as this operation almost always requires making a temporary copy of part of the database.
For example, if your database is 1.5 GiB on disk, you must always have at least 1.5 GiB free.
To change the defaults for the recorder integration in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry recorder :
Configuration Variables
Looking for your configuration file?
recorder map Required
Enables the recorder integration. Only allowed once.
db_url string ( Optional )
The URL that points to your database. Examples of these can be found here .
db_max_retries integer ( Optional , default: 10 )
The max amount of times, the recorder retries to connect to the database.
db_retry_wait integer ( Optional , default: 3 )
The time in seconds, that the recorder sleeps when trying to connect to the database.
auto_purge boolean ( Optional , default: true )
Automatically purge the database every night at 04:12 local time. Purging keeps the database from growing indefinitely, which takes up disk space and can make Home Assistant slow. If you disable auto_purge it is recommended that you create an automation to call the recorder.purge periodically.
auto_repack boolean ( Optional , default: true )
Automatically repack the database every second sunday after the auto purge. Without a repack, the database may not decrease in size even after purging, which takes up disk space and can make Home Assistant slow. If you disable auto_repack it is recommended that you create an automation to call the recorder.purge periodically. This flag has no effect if auto_purge is disabled.
purge_keep_days integer ( Optional , default: 10 )
Specify the number of history days to keep in recorder database after a purge.
commit_interval integer ( Optional , default: 5 )
How often (in seconds) the events and state changes are committed to the database. The default of 5 allows events to be committed almost right away without trashing the disk when an event storm happens. Increasing this will reduce disk I/O and may prolong disk (SD card) lifetime with the trade-off being that the database will lag (the activity and history will not lag, because the changes are streamed to them immediatelly). If this is set to 0 (zero), commit are made as soon as possible after an event is processed.
exclude map ( Optional )
Configure which integrations should be excluded from recordings. ( Configure Filter )
domains list ( Optional )
The list of domains to be excluded from recordings.
entity_globs list ( Optional )
Exclude all entities matching a listed pattern from recordings (e.g., sensor.weather_* ).
entities list ( Optional )
The list of entity ids to be excluded from recordings.
event_types list ( Optional )
The list of event types to be excluded from recordings.
include map ( Optional )
Configure which integrations should be included in recordings. If set, all other entities will not be recorded. ( Configure Filter )
The list of domains to be included in the recordings.
Include all entities matching a listed pattern from recordings (e.g., sensor.weather_* ).
The list of entity ids to be included in the recordings.
By default, no entity will be excluded. To limit which entities are being exposed to recorder , you can use the include and exclude parameters.
# Example filter to include specified domains and exclude specified entities recorder : include : domains : - alarm_control_panel - light entity_globs : - binary_sensor.*_occupancy exclude : entities : - light.kitchen_light
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
If you only want to hide events from your Activity panel, take a look at the Activity integration . But if you have privacy concerns about certain events or want them in neither the history nor activity, you should use the exclude / include options of the recorder integration. That way they aren’t even in your database, you can reduce storage and keep the database small by excluding certain often-logged events (like sensor.last_boot ).
Common filtering examples
Defining domains and entities to exclude (that is, blocklist) is convenient when you are basically happy with the information recorded, but just want to remove some entities or domains.
# Example configuration.yaml entry with exclude recorder : purge_keep_days : 5 db_url : sqlite:////home/user/.homeassistant/test exclude : domains : - automation - update entity_globs : - sensor.sun* - weather.* entities : - sensor.date - sensor.last_boot # Comes from 'systemmonitor' sensor platform - sun.sun # Don't record sun data event_types : - my_custom_event
Defining domains and entities to record by using the include configuration (that is, allowlist) is convenient if you have a lot of entities in your system and your exclude lists possibly get very large, so it might be better just to define the entities or domains to record.
# Example configuration.yaml entry with include recorder : include : domains : - sensor - switch - media_player
You can also use the include list to define the domains/entities to record, and exclude some of those within the exclude list. This makes sense if you, for instance, include the sensor domain, but want to exclude some specific sensors. Instead of adding every sensor entity to the include entities list just include the sensor domain and exclude the sensor entities you are not interested in.
# Example configuration.yaml entry with include and exclude recorder : include : domains : - sensor - switch - media_player exclude : entities : - sensor.last_boot - sensor.date entity_globs : - sensor.weather_*
The Recorder integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Disable Recorder ( recorder.disable )
Stops recording events and state changes to the database.
Enable Recorder ( recorder.enable )
Resumes recording events and state changes to the database.
Get Recorder statistics ( recorder.get_statistics )
Retrieves long-term statistics for one or more entities.
Purge Recorder database ( recorder.purge )
Cleans up old data from the recorder database.
Purge Recorder entities ( recorder.purge_entities )
Removes recorded data for specific entities, domains, or patterns.
For an overview of every action across all integrations, see the actions reference .
When using SQLite, if the system encounters unrecoverable disk corruption, it will move the database aside and create a new database to keep the system online. In this case, having at least 2.5x the database size available in free disk space is essential. Starting a new database is the system’s last resort recovery option and is usually caused by failing flash storage, an inadequate power supply, an unclean shutdown, or another hardware failure.
In this event, it may be possible to recover the old database by following the SQLite recovery guide .
Warning
SQLite is the most tested, and newer version of Home Assistant are highly optimized to perform well when using SQLite.
When choosing another option, you should be comfortable in the role of the database administrator, including making backups of the external database.
Here are examples to use with the db_url configuration option.
SQLite
sqlite:////PATH/TO/DB_NAME
MariaDB (omit pymysql)
mysql://user:password@SERVER_IP/DB_NAME?charset=utf8mb4
MariaDB (omit pymysql, using TLS encryption)
mysql://user:password@SERVER_IP/DB_NAME?charset=utf8mb4&ssl_mode=REQUIRED
MariaDB (omit pymysql, Socket)
mysql://user:password@SERVER_IP/DB_NAME?unix_socket=/var/run/mysqld/mysqld.sock&charset=utf8mb4
MySQL
MySQL (using TLS encryption)
MySQL (Socket)
mysql://user:password@localhost/DB_NAME?unix_socket=/var/run/mysqld/mysqld.sock&charset=utf8mb4
MariaDB
mysql+pymysql://user:password@SERVER_IP/DB_NAME?charset=utf8mb4
MariaDB (Socket)
mysql+pymysql://user:password@localhost/DB_NAME?unix_socket=/var/run/mysqld/mysqld.sock&charset=utf8mb4
postgresql://user:password@SERVER_IP/DB_NAME
PostgreSQL (Socket)
postgresql://@/DB_NAME
PostgreSQL (Custom socket dir)
postgresql://@/DB_NAME?host=/path/to/dir
Note
Some installations of MariaDB/MySQL may require an ALTERNATE_PORT (3rd-party hosting providers or parallel installations) to be added to the SERVER_IP, e.g., mysql://user:password@SERVER_IP:ALTERNATE_PORT/DB_NAME?charset=utf8mb4 .
When using a MariaDB or MySQL server, adding +pymysql to the URL will use the pure Python MySQL library, which is slower but may be required if the C MySQL library is not available.
When using the official Docker image, the C MySQL library will always be available. pymysql is most commonly used with venv where the C MySQL library is not installed.
Tip
Unix Socket connections always bring performance advantages over TCP, if the database is on the same host as the recorder instance (that is, localhost ).
If you want to use Unix Sockets for PostgreSQL you need to modify the pg_hba.conf . See PostgreSQL
If you are running a database server instance on the same server as Home Assistant then you must ensure that this action starts before Home Assistant. For a Linux instance running Systemd (Raspberry Pi, Debian, Ubuntu and others) you should edit the service file.
To help facilitate this, db_max_retry and db_retry_wait variables have been added to ensure the recorder retries the connection to your database enough times, for your database to start up.
sudo nano /etc/systemd/system/ [email protected]
and add the action for the database, for example, PostgreSQL:
[Unit]
Description=Home Assistant
After=network.target postgresql.service
Save the file then reload systemctl :
sudo systemctl daemon-reload
Not all Python bindings for the chosen database engine can be installed directly. This section contains additional details that should help you to get it working.
MariaDB versions before 10.5.17, 10.6.9, 10.7.5, and 10.8.4 suffer from a performance regression which can result in the system becoming overloaded while querying history data or purging the database.
Make sure the default character set of your database server is set to utf8mb4 (see MariaDB documentation ).
If you are in a virtual environment, don’t forget to activate it before installing the mysqlclient Python package described below.
pi@homeassistant:~ $ sudo -u homeassistant -H -s
homeassistant@homeassistant:~ $ source /srv/homeassistant/bin/activate
( homeassistant ) homeassistant@homeassistant:~ $ pip3 install mysqlclient
For MariaDB you may have to install a few dependencies. If you’re using MariaDB 10.3, the package libmariadb-dev-compat must also be installed. Please install the correct packages based on your MariaDB version.
On the Python side we use the mysqlclient :
sudo apt-get install libmariadbclient-dev libssl-dev
pip3 install mysqlclient
For MySQL you may have to install a few dependencies. You can choose between pymysql and mysqlclient :
sudo apt-get install default-libmysqlclient-dev libssl-dev
After installing the dependencies, it is required to create the database manually. During the startup, Home Assistant will look for the database specified in the db_url . If the database doesn’t exist, it will not automatically create it for you.
The database engine must be InnoDB as MyIASM is not supported.
SET GLOBAL default_storage_engine = 'InnoDB' ;
CREATE DATABASE DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
Where DB_NAME is the name of your database
Once Home Assistant finds the database, with the right level of permissions, all the required tables will then be automatically created and the data will be populated accordingly.
Create the PostgreSQL database with utf8 encoding. The PostgreSQL default encoding is SQL_ASCII . From the postgres user account;
createdb -E utf8 DB_NAME
If the Database in use is not utf8 , adding ?client_encoding=utf8 to the db_url may solve any issue.
For PostgreSQL you may have to install a few dependencies:
sudo apt-get install postgresql-server-dev-X.Y
pip3 install psycopg2
For using Unix Sockets, first create your user from the postgres user account;
createuser USER_NAME
Where USER_NAME is the name of the user running the Home Assistant instance (see securing your installation ).
Then add the following line to your pg_hba.conf :
local DB_NAME USER_NAME peer
Where DB_NAME is the name of your database and USER_NAME is the name of the user running the Home Assistant instance (see securing your installation ).
Reload the PostgreSQL configuration after that:
$ sudo -i -u postgres psql -c "SELECT pg_reload_conf();"
pg_reload_conf
----------------
t
( 1 row )
A service restart will work as well.
Sql integration
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Recorder system was introduced in Home Assistant pre 0.7, and it's used by
12.8% of the active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
History
Back to top
