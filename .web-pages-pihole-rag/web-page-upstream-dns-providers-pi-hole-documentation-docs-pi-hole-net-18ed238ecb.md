# Upstream DNS Providers - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/dns/upstream-dns-providers
- Final URL: https://docs.pi-hole.net/guides/dns/upstream-dns-providers/
- Canonical URL: https://docs.pi-hole.net/guides/dns/upstream-dns-providers/
- Fetched at: 2026-06-23T13:42:21Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Upstream DNS Providers
The Pi-hole setup offers nine options for an upstream DNS provider during the initial setup.
Google
OpenDNS
Level3
Comodo
Quad9
Quad9 (unfiltered)
Quad9 (ECS)
CloudFlare DNS
Custom
During the pi-hole installation, you select 1 of the 7 preset providers or enter one of your own. Below you can find more information on each of the DNS providers, along with some additional providers which have different kinds of extra filtering options (spam, phishing, adult content, etc).
Google ¶
Default upstream DNS provider on the Pi-hole.
8.8.8.8
8.8.4.4
2001:4860:4860::8888 ( IPv6 )
2001:4860:4860::8844 ( IPv6 )
More information on Google Public DNS
OpenDNS Home (owned by Cisco) ¶
Built-in features include a phishing filter, this is the OpenDNS version the Pi-hole would use if you select it during setup.
208.67.222.222
208.67.220.220
208.67.222.220
208.67.220.222
2620:119:35::35 ( IPv6 )
2620:119:53::53 ( IPv6 )
More information on OpenDNS Home + OpenDNS Wikipedia Page
OpenDNS also provides the OpenDNS FamilyShield (free)- option. The service blocks pornographic content, including our “Pornography,” “Tasteless,” and “Sexuality” categories, in addition to proxies and anonymizers (which can render filtering useless). It also blocks phishing and some malware.
208.67.222.123
208.67.220.123
2620:119:35::123 ( IPv6 )
2620:119:53::123 ( IPv6 )
More information on OpenDNS FamilyShield + OpenDNS FamilyShield introduction Blog
Level3 DNS ¶
This DNS service does no filtering of itself, but redirects mistyped URL to Level 3 Web Search.
4.2.2.1
4.2.2.2
Comodo Secure DNS ¶
SecureDNS references a real-time block list (RBL) of harmful websites (i.e. phishing sites, malware sites, spyware sites, and parked domains that may contain excessive advertising including pop-up and/or pop-under advertisements, etc.) and will warn you whenever you attempt to access a site containing potentially threatening content.
8.26.56.26
8.20.247.20
More information on Comodo Secure DNS
Quad9 ¶
Quad9 is a free, recursive, anycast DNS platform that provides end users robust security protections, high-performance, and privacy.
Filtered
9.9.9.9
149.112.112.112
2620:fe::fe ( IPv6 )
2620:fe::9 ( IPv6 )
Unfiltered, no DNSSEC
9.9.9.10
149.112.112.10
2620:fe::10 ( IPv6 )
2620:fe::fe:10 ( IPv6 )
Filtered, ECS enabled
9.9.9.11
149.112.112.11
2620:fe::11 ( IPv6 )
2620:fe::fe:11 ( IPv6 )
More information on Quad9
CloudFlare DNS ¶
CloudFlare will never log your IP address (the way other companies identify you). The independent DNS monitor DNSPerf ranks Cloudflare's DNS the fastest DNS service in the world.
1.1.1.1
1.0.0.1
2606:4700:4700::1111 ( IPv6 )
2606:4700:4700::1001 ( IPv6 )
More information on Cloudflare DNS
Cloudflare also provides 1.1.1.1 for Families, a set of resolvers that can block malware only, or malware and adult content.
Malware Blocking Only
1.1.1.2
1.0.0.2
2606:4700:4700::1112 ( IPv6 )
2606:4700:4700::1002 ( IPv6 )
Malware and Adult Content
1.1.1.3
1.0.0.3
2606:4700:4700::1113 ( IPv6 )
2606:4700:4700::1003 ( IPv6 )
More info on 1.1.1.1 for Families
Custom ¶
With custom, you'll choose your favorite DNS provider. If you care about Internet independence and privacy, we suggest having a look at the OpenNIC DNS Project .
More information ¶
There are even more public DNS server, you can find many (with some extra information) on this Lifewire page. A benchmark of these DNS servers (by Gibson Research Center) is available here .
April 3, 2025
Back to top
