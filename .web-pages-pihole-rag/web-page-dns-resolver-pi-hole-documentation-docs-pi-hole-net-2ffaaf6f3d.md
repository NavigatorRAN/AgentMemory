# DNS resolver - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/ftldns/dns-resolver
- Final URL: https://docs.pi-hole.net/ftldns/dns-resolver/
- Canonical URL: https://docs.pi-hole.net/ftldns/dns-resolver/
- Fetched at: 2026-06-23T13:41:56Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
DNS resolver
FTL DNS comes with a lightweight but powerful inbuilt DNS / DHCP / TFTP /... server eliminating the need to install dnsmasq separately (we used to do this before Pi-hole v4.0). However, it is important to understand that we are not moving away from dnsmasq , but, in contrast, are coupling even closer to it by incorporating it into FTL . This provides us with a much more reliable monolith DNS solution where we can be sure that the versions of FTL and the DNS internals are always 100% compatible with each other.
As we maintain our own fork of dnsmasq we have been able to apply some minimal changes to the source code which might bring substantial benefits for our users. However, although the potential for changes is endless, we want to include as few modifications as possible. As a purely volunteer-driven project, you will surely understand that it was already a major undertaking to get FTL DNS set up and running. It was much more than just copy-pasting dnsmasq into place.
We have always been very explicit about how we will react to feature requests that target the resolver part (from the initial FTL DNS beta test announcement):
Think of FTL DNS as dnsmasq with Pi-hole’s special sauce. This allows us to easily merge any upstream changes that get added, while still allowing us to continue to develop Pi-hole as we have been.
If we would start to modify the resolver code in too many places, then this would probably make us deviate too much from dnsmasq 's code base and we couldn't apply patches easily preventing us from being able to ship important security updates.
Implemented modifications in dnsmasq 's source code ¶
FTL hooks ¶
We place hooks in a lot of places in the resolver that branch out into FTL code to process queries and responses. By this, we keep the resolver code itself clean.
Remove limit on maximum cache size ¶
Users can configure the size of the resolver's name cache. The default is 150 names. Setting the cache size to zero disables caching. We think users should be allowed to set the cache size to any value they find appropriate. However, dnsmasq 's source code contains a condition that limits the maximum size of the cache to 10,000 names. We removed this hard-coded upper limit in and submitted a patch to remove this hard-coded limit in the upstream version of dnsmasq . It was accepted for dnsmasq v2.81 .
Improve detection algorithm for determining the "best" forward destination ¶
The DNS forward destination determination algorithm in FTL DNS is modified to be much less restrictive than the original algorithm in dnsmasq . We keep using the fastest responding server now for 1000 queries or 10 minutes (whatever happens earlier) instead of 50 queries or 10 seconds (default values in dnsmasq ).
We keep the exceptions, i.e., we try all possible forward destinations if SERVFAIL or REFUSED is received or if a timeout occurs.
Overall, this change has proven to greatly reduce the number of actually performed queries in typical Pi-hole environments. It may even be understood as being preferential in terms of privacy (as we send queries much less often to all servers).
This has been implemented in commit d1c163e .
July 17, 2025
Back to top
