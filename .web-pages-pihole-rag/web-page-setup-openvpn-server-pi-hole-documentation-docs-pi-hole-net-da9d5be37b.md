# Setup OpenVPN Server - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/vpn/openvpn/setup-openvpn-server
- Final URL: https://docs.pi-hole.net/guides/vpn/openvpn/setup-openvpn-server/
- Canonical URL: https://docs.pi-hole.net/guides/vpn/openvpn/setup-openvpn-server/
- Fetched at: 2026-06-23T13:43:05Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Setup OpenVPN Server
OpenVPN is no longer recommended
We no longer recommend that you use OpenVPN for new deployments. Although OpenVPN has served us well in the past, we believe it's time to move towards more modern and efficient solutions.
We suggest that users now turn their attention to WireGuard , a forward-thinking VPN solution that offers better performance, faster speeds, and easier implementation. WireGuard has been designed with the latest technology in mind, providing simple yet powerful tools for securing your network communications. Pi-hole's step-by-step tutorial is designed to help you understand the ins and outs of WireGuard, regardless of your technical expertise.
Change OpenVPN's resolvers ¶
First, find the IP of your tun0 interface:
On Jessie
ifconfig tun0 | grep 'inet addr'
On Stretch
ip a
Edit the OpenVPN config file:
vim /etc/openvpn/server/server.conf
Set this line to use your Pi-hole's IP address, which you determined from the ifconfig command and comment out or remove the other line (if it exists):
push "dhcp-option DNS 10.8.0.1"
#push "dhcp-option DNS 8.8.8.8"
This push directive is setting a DHCP option , which tells clients connecting to the VPN that they should use Pi-hole as their primary DNS server.
It's suggested to have Pi-hole be the only resolver as it defines the upstream servers. Setting a non-Pi-hole resolver here may have adverse effects on ad blocking but it can provide failover connectivity in the case of Pi-hole not working if that is something you are concerned about.
Furthermore, you might want to enable logging for your OpenVPN server. In this case, add the following lines to your server's config file:
log /var/log/openvpn.log
verb 3
Restart OpenVPN to apply the changes ¶
Depending on your operating system, one of these commands should work to restart the service.
systemctl restart openvpn-server@server
service openvpn-server@server restart
Create a client config file ( .ovpn ) ¶
Now that the server is configured, you'll want to connect some clients so you can make use of your Pi-hole wherever you are. Doing so requires the use of a certificate. You generate these and the resulting .ovpn file by running the installer and choosing 1) Add a new user for each client that will connect to the VPN.
You can repeat this process for as many clients as you need. In this example, we'll "Add a new user" by naming the .ovpn file the same as the client's hostname but you may want to adopt your own naming strategy.
Run the OpenVPN installer again
./openvpn-install.sh
Choose 1) Add a new user and enter a client name
Looks like OpenVPN is already installed
What do you want to do?
1) Add a new user
2) Revoke an existing user
3) Remove OpenVPN
4) Exit
Select an option [1-4]: 1
Tell me a name for the client certificate
Please, use one word only, no special characters
Client name: iphone7
This will generate a .ovpn file, which needs to be copied to your client machine (oftentimes using the OpenVPN app). This process also generates a few other files found in /etc/openvpn/server/easy-rsa/pki/ , which make public key authentication possible; you only need to worry about the .ovpn file, though.
March 4, 2025
Back to top
