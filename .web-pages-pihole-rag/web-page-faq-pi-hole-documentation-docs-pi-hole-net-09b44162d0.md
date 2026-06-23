# FAQ - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/main/faq
- Final URL: https://docs.pi-hole.net/main/faq/
- Canonical URL: https://docs.pi-hole.net/main/faq/
- Fetched at: 2026-06-23T13:43:28Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
FAQ
Frequently Asked Questions ¶
This is a collection of questions that were asked repeatedly on discourse or github.
Odd random character queries in Pi-hole's query logs ¶
You see three queries containing only random strings, sometimes with the local domain suffix, like
yfjmdpisrvyrnq
attxnwheeeuiad
nskywzjbpj
Solution:
This happens when using Chrome-based browsers. Chrome tries to find out if someone is messing up with the DNS (i.e. wildcard DNS servers to catch all domains). Chrome does this by issuing DNS requests to randomly generated domain names with between 7 and 15 characters
In a normal setup this results in a “No such name” response from your DNS server. If the DNS server you use has a wildcard setup, each of these requests will result in a response (which is normally even the same) so Chrome knows that there is someone messing around with DNS responses.
Link to Chromium's source code explaining the function.
Pi-hole update fails due to repository changed its 'Suite' value ¶
This happens after a manual OS upgrade to the next major version on deb based systems. A typical message is
Repository 'http://archive.raspberrypi.org/debian buster InRelease' changed its 'Suite' value from 'stable' to 'oldstable'
sudo apt-get update --allow-releaseinfo-change
Pi-hole's gravity complains about invalid IDN domains ¶
During a gravity update, Pi-hole complains about some invalid Internationalized Domain Names (IDN) domains
Sample of invalid domains:
- test.中国
- test.рф
- test.भारत
- e-geräteundhaus.com
- rëddït.com
Ask the list maintainer to convert the IDNs to their punycode representation.
Internationalizing Domain Names in Applications (IDNA) was conceived to allow client-side use of language-specific characters in domain names without requiring any existing infrastructure ( DNS servers, mall servers, etc., including associated protocols) to change. Accordingly, the corresponding original RFC 3490 clearly states that IDNA is employed at application level, not on the server side.
Hence, DNS servers never see any IDN domain name, which means DNS records do not store IDN domain names at all, only their Punycode representations.
In which order are locally defined DNS records used? ¶
Answer:
The order of locally defined DNS records is:
The device's host name and pi.hole
Configured in a config file in /etc/dnsmasq.d/
Read from /etc/hosts
Read from the "Local (custom) DNS " list (stored in /etc/pihole/custom.list )
Only the first record will trigger an address-to-name association.
July 17, 2025
Back to top
