---
source_url: "https://www.home-assistant.io/integrations/nextcloud"
final_url: "https://www.home-assistant.io/integrations/nextcloud"
canonical_url: "https://www.home-assistant.io/integrations/nextcloud/"
source_handle: "web:www-home-assistant-io:e70df770276e"
source_section: "integrations-nextcloud"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "d5160d10c7de9bd9f2d7f4c264d04624570132445848018f473c872e2c2c7eac"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Nextcloud - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nextcloud
- Final URL: https://www.home-assistant.io/integrations/nextcloud
- Canonical URL: https://www.home-assistant.io/integrations/nextcloud/
- Fetched at: 2026-06-28T03:03:04Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Nextcloud monitor api data into Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Update entity
The Nextcloud integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] pulls summary Nextcloud information into Home Assistant.
The integration provides sensors and binary sensors for most of the data points that the built-in Nextcloud serverinfo app provides.
To see which datapoints your nextcloud instance exposes, browse to this url: https://<your_nextcloud_url>/ocs/v2.php/apps/serverinfo/api/v1/info?format=json&skipUpdate=false .
This integration has the following Nextcloud Server prerequisites:
The user must be in the Nextcloud admin group ( Nextcloud > Users )
The Nextcloud ‘Monitoring’ app must be installed ( Nextcloud > Apps > 🔍(Search Icon) > Monitoring > Enable )
(Recommended) A Nextcloud App password should be generated for use in Home Assistant ( Nextcloud > Settings > Personal > Security > Devices & sessions > Create new app password )
To add the Nextcloud service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Nextcloud .
Follow the instructions on screen to complete the setup.
For each entry, the integration will create the following sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] :
Sensor Enabled by default Amount of active users last 5 minutes ✅ Amount of active users last day ✅ Amount of active users last hour ✅ Amount of files ✅ Amount of group shares ✅ Amount of link shares ✅ Amount of local storages ✅ Amount of mail shares ✅ Amount of other storages ✅ Amount of passwordless link shares ✅ Amount of room shares ✅ Amount of shares ✅ Amount of shares received ✅ Amount of shares sent ✅ Amount of storages ✅ Amount of storages at home ✅ Amount of user ✅ Amount of user shares ✅ Apps installed ✅ Avatars enabled ✅ CPU load last 1 minute ✅ CPU load last 15 minutes ✅ CPU load last 5 minutes ✅ Cache TTL ❌ Cache expunges ❌ Cache memory ❌ Cache memory size ✅ Cache number of entries ❌ Cache number of hits ❌ Cache number of inserts ❌ Cache number of misses ❌ Cache number of slots ❌ Cache start time ❌ Database size ✅ Database type ✅ Database version ✅ Debug enabled ✅ Filelocking enabled ✅ Free memory ✅ Free space ✅ Free swap memory ✅ Interned buffer size ❌ Interned free memory ❌ Interned number of strings ❌ Interned used memory ❌ JIT active ❌ JIT buffer free ❌ JIT buffer size ❌ JIT enabled ❌ JIT kind ❌ JIT opt flags ❌ JIT opt level ❌ Opcache blacklist miss ratio ❌ Opcache blacklist misses ❌ Opcache cached keys ❌ Opcache cached scripts ❌ Opcache current wasted percentage ❌ Opcache free memory ❌ Opcache hash restarts ❌ Opcache hit rate ❌ Opcache hits ❌ Opcache last restart time ❌ Opcache manual restarts ❌ Opcache max cached keys ❌ Opcache misses ❌ Opcache out of memory restarts ❌ Opcache start time ❌ Opcache used memory ❌ Opcache wasted memory ❌ PHP max execution time ✅ PHP memory limit ✅ PHP upload maximum filesize ✅ PHP version ✅ Previews enabled ✅ SMA available memory ❌ SMA number of segments ❌ SMA segment size ❌ System memcache distributed ❌ System memcache local ❌ System memcache locking ❌ System theme ✅ System version ✅ Total memory ✅ Total swap memory ✅ Updates available ✅ Webserver ✅
An update An update entity is an entity that indicates if an update is available for a device or service. [Learn more] entity will be created for each entry.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Nextcloud service was introduced in Home Assistant 0.108, and it's used by
2471 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@mib1185
Categories
Binary sensor
Sensor
Update
Back to top
