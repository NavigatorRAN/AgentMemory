# Databases - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/database
- Final URL: https://docs.pi-hole.net/database/
- Canonical URL: https://docs.pi-hole.net/database/
- Fetched at: 2026-06-23T13:41:24Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Databases
Pi-hole uses the well-known relational database management system SQLite3 both for its long-term storage of query data and for its domain management. In contrast to many other database management solutions, Pi-hole does not need a server database engine as the database engine is directly embedded in FTL DNS . It seems an obvious choice as it is probably the most widely deployed database engine - it is used today by several widespread web browsers, operating systems, and embedded systems (such as mobile phones), among others. Hence, it is rich in supported platforms and offered features. SQLite implements most of the SQL-92 standard for SQL and can be used for high-level queries.
Details concerning the databases, their contained tables and exemplary SQL commands allowing even complex requests to Pi-hole's databases are described on the subpages of this category.
Query database /etc/pihole/pihole-FTL.db
Domain database /etc/pihole/gravity.db
September 25, 2024
Back to top
