# Allowlist and Denylist editing - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/misc/allowlist-denylist
- Final URL: https://docs.pi-hole.net/guides/misc/allowlist-denylist/
- Canonical URL: https://docs.pi-hole.net/guides/misc/allowlist-denylist/
- Fetched at: 2026-06-23T13:42:31Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Allowlist and Denylist editing
What Domains To Allow or Deny ¶
This extension for Google Chrome can help you in finding out which domains you need to allow.
How to Allow or Deny Domains ¶
There are scripts to aid users in adding or removing domains to the allowlist or denylist from the CLI
Each script accepts the following parameters:
Parameter Description [domain] Fully qualified domain name you wish to add or remove. You can pass any number of domains. remove Removal mode. Domains will be removed from the list, rather than added -q Quiet mode. Console output is minimal. Useful for calling from another script (see gravity.sh )
Domains passed are parsed by the script to ensure they are valid domains. If a domain is invalid it will be ignored.
By default, allowed or denied domains are associated with the Default Group only. If the domain should be associated with other groups, these will need to be selected in Group Management > Domains within the Pi-Hole web frontend.
Example pihole allow usages ¶
Attempt to add one or more domains to the allowlist and reload pihole- FTL :
pihole allow domain1 [ domain2... ]
To remove domains from the allowlist add remove as an additional argument, e.g:
pihole allow remove domain1 [ domain2... ]
Example pihole deny usages ¶
Attempt to add one or more domains to the denylist and reload pihole- FTL :
pihole deny domain1 [ domain2... ]
To remove domains from the denylist add remove as an additional argument, e.g:
pihole deny remove domain1 [ domain2... ]
November 17, 2025
Back to top
