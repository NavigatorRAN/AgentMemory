# Using DNSSEC - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/misc/tor/dnssec
- Final URL: https://docs.pi-hole.net/guides/misc/tor/dnssec/
- Canonical URL: https://docs.pi-hole.net/guides/misc/tor/dnssec/
- Fetched at: 2026-06-23T13:42:39Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Using DNSSEC
This is an unsupported configuration created by the community
A lot of the Exit Nodes configure their DNS Server to support DNSSEC. You can test here whether DNSSEC is enabled for your current DNS Servers.
If you want to test again by refreshing the site, please be aware of the notes on the site:
To re-run the above test, you also need to:
Wait for 60s or flush the DNS cache of your OS manually (Windows: ipconfig /flushdns )
Restart browser or clear browser cache
Note
Flushing Browser/ DNS Cache here means restarting Pi-hole ( DNS Server), restarting the browser and ideally opening the site in private/incognito mode.
Alternatives ¶
An alternative would be using DNSCrypt , but this leaves you in a position where you have to trust the DNSCrypt resolver since your IP is not anonymized - unless you configure DNSCrypt to route over Tor .
March 26, 2023
Back to top
