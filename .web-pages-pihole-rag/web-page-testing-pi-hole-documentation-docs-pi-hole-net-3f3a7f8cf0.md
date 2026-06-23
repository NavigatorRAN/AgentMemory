# Testing - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/regex/testmode
- Final URL: https://docs.pi-hole.net/regex/testmode/
- Canonical URL: https://docs.pi-hole.net/regex/testmode/
- Fetched at: 2026-06-23T13:43:47Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Regex Test mode ¶
In order to ease regex development, we added a regex test mode to pihole-FTL which can be invoked like
pihole-FTL regex-test doubleclick.net
(test doubleclick.net against all regexes in the gravity database), or
pihole-FTL regex-test doubleclick.net "(^|\.)double"
(test doubleclick.net against the CLI -provided regex (^|\.)double .
You do NOT need to be sudo for this, any arbitrary user should be able to run this command. The test returns 0 on match, 1 on errors and 2 on no match, hence, it may be used for scripting.
October 26, 2025
Back to top
