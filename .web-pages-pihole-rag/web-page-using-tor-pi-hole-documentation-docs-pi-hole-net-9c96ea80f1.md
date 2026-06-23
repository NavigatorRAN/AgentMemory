# Using Tor - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/misc/tor/using-tor
- Final URL: https://docs.pi-hole.net/guides/misc/tor/using-tor/
- Canonical URL: https://docs.pi-hole.net/guides/misc/tor/using-tor/
- Fetched at: 2026-06-23T13:42:44Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Using Tor
This is an unsupported configuration created by the community
To enhance your privacy you might want to route all or part of your Browser Traffic over Tor.
Tor Browser ¶
The easiest and most reliable solution would be to use the Tor Browser . Though that won't use your Pi-hole DNS Server out of the box. You can, however, disable Proxy DNS when using SOCKS v5 in Tor Browsers Preferences -> Advanced -> Network -> Settings and make sure to point your system to use Pi-hole with DNS over Tor activated.
Your Browser ¶
Edit /etc/tor/torrc on your Pi-hole as root, include the following line at the end and save the changes
SocksPort 0.0.0.0:9050
Note
You should make sure that only your LAN devices are able to access your Pi-hole on port 9050.
Restart Tor
sudo service tor restart
Point your browser to use your Pi-hole IP or Hostname (e.g. pi.hole ) and Port 9050 as Socks5 Proxy. Do not enable Proxy DNS when using SOCKS v5 and make sure to point your system to use Pi-hole with DNS over Tor activated.
For Chrome you can either use e.g. the Proxy SwitchyOmega Extension or start Chrome with command-line parameters .
For Firefox you can either use e.g. the FoxyProxy Add-on or configure the Socks5 Proxy directly in the Firefox Preferences.
If you use a Proxy Add-on/Extension you can also e.g. route everything per default over Tor and only whitelist some sites that you need to perform really good.
Accessing .onion addresses ¶
If you want to access .onion addresses with this kind of setup you have to activate Transparent Access to Tor Hidden Services on the Pi-hole host.
Notes ¶
Don't define other regular Upstream DNS Servers than the Tor one if you want to avoid that your Pi-hole makes plaintext DNS requests.
From the Tor Manual regarding DNSPort :
This port only handles A, AAAA, and PTR requests
March 4, 2025
Back to top
