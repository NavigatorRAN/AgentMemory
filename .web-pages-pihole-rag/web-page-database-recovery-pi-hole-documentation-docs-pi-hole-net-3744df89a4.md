# Database Recovery - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/database/domain-database/recovery
- Final URL: https://docs.pi-hole.net/database/domain-database/recovery/
- Canonical URL: https://docs.pi-hole.net/database/domain-database/recovery/
- Fetched at: 2026-06-23T13:41:29Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Database Recovery
If the gravity.db database has been damaged, Pi-hole offers two built-in methods to repair the database.
Recover ¶
Try to recover a damaged gravity database file.
Pi-hole tries to restore as much as possible from a corrupted gravity database.
Run:
pihole -g -r recover
Recreate ¶
Create a new gravity database file from scratch. This will remove your existing gravity database and create a new file from scratch. If you still have the migration backup created when migrating to Pi-hole v5.0, Pi-hole will import these files.
pihole -g -r recreate
Force recover (not recommended) ¶
Warning
This option is meant to be a last resort. Recovery is a fragile task consuming a lot of resources and shouldn't be performed unnecessarily.
Force Pi-hole to run the recovery process even when no damage is detected.
pihole -g -r recover force
December 3, 2022
Back to top
