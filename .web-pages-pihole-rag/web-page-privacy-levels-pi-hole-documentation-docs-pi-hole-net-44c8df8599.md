# Privacy levels - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/ftldns/privacylevels
- Final URL: https://docs.pi-hole.net/ftldns/privacylevels/
- Canonical URL: https://docs.pi-hole.net/ftldns/privacylevels/
- Fetched at: 2026-06-23T13:42:04Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Privacy levels
Using privacy levels you can specify which level of detail you want to see in your Pi-hole statistics. The privacy level may be changed at any time without having to restart the DNS resolver. Note that queries with (partially) hidden details cannot be disclosed with a subsequent reduction of the privacy level. They can be changed either from the Settings page on the dashboard or in FTL 's config file .
The available options are
Level 0 - show everything ¶
Doesn't hide anything, all statistics are available
Level 1 - hide domains ¶
Show and store all domains as hidden
This setting disables
Top Domains
Top Ads
Level 2 - hide domains and clients ¶
Show and store all domains as hidden and clients as 0.0.0.0
Top Clients
Clients over time
Level 3 - anonymous mode (anonymize everything) ¶
Disable all details except the most anonymous statistics
Query Log
Long-term database logging
December 3, 2022
Back to top
