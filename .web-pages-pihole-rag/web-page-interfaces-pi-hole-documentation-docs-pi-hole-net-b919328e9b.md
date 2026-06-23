# Interfaces - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/ftldns/interfaces
- Final URL: https://docs.pi-hole.net/ftldns/interfaces/
- Canonical URL: https://docs.pi-hole.net/ftldns/interfaces/
- Fetched at: 2026-06-23T13:42:01Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Interface binding behavior ¶
Pi-hole offers three choices for interface on its dashboard:
By default, FTL binds the wildcard address. It does this for all options except Bind only on interface enp2s0 . Your Pi-hole then discards requests that it shouldn't reply to. This has the big advantage of working even when interfaces come and go and change address (this happens way more often than one would think).
Recommended setting ¶
Allow only local requests ¶
This setting accepts DNS queries only from hosts whose address is on a local subnet, i.e., a subnet for which an interface exists on the server. It is intended to be set as a default on installation, to allow unconfigured installations to be useful but also safe from being used for DNS amplification attacks if (accidentally) running public.
The dnsmasq option
local-service
is used.
Potentially dangerous options ¶
Respond only on interface enp2s0 ¶
Respond only to queries arriving on the specified interface.
The loopback ( lo ) interface is automatically added to the list of interfaces to use when this option is used.
interface=enp2s0
is used (the interface may be different).
Bind only on interface enp2s0 ¶
As said above, the default is to bind to the wildcard address, discarding requests that we shouldn't reply to.
If this is not what you want, you can use this option as it forces FTL to really bind only the interfaces it is listening on. Note that this may result in issues when the interface may go down (cable unplugged, etc.).
About the only time when this is useful is when running another nameserver on the same port on the same machine. This may also happen if you run a virtualization API such as libvirt .
When this option is used, IP alias interface labels (e.g. enp2s0:0 ) are checked rather than interface names.
The dnsmasq options
bind-interfaces
are used (the interface may be different).
Permit all origins ¶
This truly allows any traffic to be replied to and is a dangerous thing to do as your Pi-hole could become an open resolver . You should always ask yourself if the first option doesn't work for you as well.
except-interface=nonexisting
is used. We add this option to disable any possible local-service settings in other config files.
March 4, 2025
Back to top
