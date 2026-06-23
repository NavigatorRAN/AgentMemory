# Post-Install - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/main/post-install
- Final URL: https://docs.pi-hole.net/main/post-install/
- Canonical URL: https://docs.pi-hole.net/main/post-install/
- Fetched at: 2026-06-23T13:43:34Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Post-Install
Making your network take advantage of Pi-hole ¶
Once the installer has been run, you will need to configure your router to have DHCP clients use Pi-hole as their DNS server which ensures all devices connected to your network will have content blocked without any further intervention.
If your router does not support setting the DNS server, you can use Pi-hole's built-in DHCP server ; just be sure to disable DHCP on your router first (if it has that feature available).
As a last resort, you can manually set each device to use Pi-hole as its DNS server.
Making your Pi-hole host use Pi-hole ¶
Pi-hole will not be used by the host automatically after installation. To have the host resolve through Pi-hole and your configured blocking lists, you can make the host use Pi-hole as upstream DNS server:
Warning
If your Pi-hole host is using Pi-hole as upstream DNS server and Pi-hole fails, your host loses DNS resolution. This can prevent successful repair attempts, e.g. by pihole -r as it needs a working internet connection.
If your OS uses dhcpcd for network configuration, you can add to your /etc/dhcpcd.conf
static domain_name_servers=127.0.0.1
Adding your local user to the 'pihole' group ¶
Pi-hole v6 uses a new API for authentication. All CLI commands use this API instead of e.g. direct database manipulation. If a password is set for API access, the CLI commands also need to authenticate. To avoid entering the password everytime on CLI , Pi-hole allows users which are members of the 'pihole' group to authenticate without manually entering the password (this can be disabled by setting webserver.api.cli_pw to false .)
To add your local user to the 'pihole' group use the following command
For Debian/Ubuntu/Raspberry Pi OS /Armbian/Fedora/CentOS
sudo usermod -aG pihole $USER
For Alpine
doas addgroup $USER pihole
May 7, 2026
Back to top
