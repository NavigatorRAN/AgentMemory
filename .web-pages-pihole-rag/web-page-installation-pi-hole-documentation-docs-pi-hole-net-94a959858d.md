# Installation - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/vpn/openvpn/installation
- Final URL: https://docs.pi-hole.net/guides/vpn/openvpn/installation/
- Canonical URL: https://docs.pi-hole.net/guides/vpn/openvpn/installation/
- Fetched at: 2026-06-23T13:43:01Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Installation
OpenVPN is no longer recommended
We no longer recommend that you use OpenVPN for new deployments. Although OpenVPN has served us well in the past, we believe it's time to move towards more modern and efficient solutions.
We suggest that users now turn their attention to WireGuard , a forward-thinking VPN solution that offers better performance, faster speeds, and easier implementation. WireGuard has been designed with the latest technology in mind, providing simple yet powerful tools for securing your network communications. Pi-hole's step-by-step tutorial is designed to help you understand the ins and outs of WireGuard, regardless of your technical expertise.
Install an operating system ¶
Once you have your preferred OS up and running. You may already have a server set up on your network, or you may prefer to make a Digital Ocean droplet. In either case, you'll use the quick OpenVPN "road warrior" installer. The cloud-hosted server option is convenient if you don't want to host the hardware at home, but you'll need to take additional steps to secure the server as it's available on the public Internet. Failure to do so is not only irresponsible, but you also put yourself and others at risk .
Install OpenVPN + Pi-hole ¶
A note about security ¶
For security purposes, it is recommended that the CA machine should be separate from the machine running OpenVPN. If you lose control of your CA private key, you can no longer trust any certificates from this CA. Anyone with access to this CA private key can sign new certificates without your knowledge, which then can connect to your OpenVPN server without needing to modify anything on the VPN server. Place your CA files on storage that can be offline as much as possible, only to be activated when you need to get a new certificate for a client or server.
This is less convenient, so many users will simply decide to install Pi-hole and OpenVPN on a single machine, which is what this guide will walkthrough.
Install the OpenVPN server ¶
First, download the OpenVPN installer; make it executable, and then run it:
wget https://github.com/Nyr/openvpn-install/raw/master/openvpn-install.sh
chmod 755 openvpn-install.sh
./openvpn-install.sh
Enter your server's IP address and accept all the defaults, unless you require special needs:
Welcome to this quick OpenVPN "road warrior" installer
I need to ask you a few questions before starting the setup
You can leave the default options and just press enter if you are ok with them
First I need to know the IPv4 address of the network interface you want OpenVPN
listening to.
IP address: 10.8.0.1
Which protocol do you want for OpenVPN connections?
1) UDP (recommended)
2) TCP
Protocol [1-2]: 1
What port do you want OpenVPN listening to?
Port: 1194
Which DNS do you want to use with the VPN?
1) Current system resolvers
2) Google
3) OpenDNS
4) NTT
5) Hurricane Electric
6) Verisign
DNS [1-6]: 1
Finally, tell me your name for the client certificate
Please, use one word only, no special characters
Client name: pihole
Okay, that was all I needed. We are ready to setup your OpenVPN server now
Press any key to continue...
Let the installer run...
Finished!
Your client configuration is available at /root/pihole.ovpn
If you want to add more clients, you simply need to run this script again!
You can set your port to whatever you would like, however you will have to portforward this port in your routers settings from your public ip to your device (if self hosting).
Install Pi-hole ¶
Next, install Pi-hole and choose tun0 as the interface and 10.8.0.1/24 as the IP address. You can accept the rest of the defaults, or configure Pi-hole to your liking. The interface selection is the most important step; if you don't choose tun0 (at least to begin with), it will not work properly.
curl -sSL https://install.pi-hole.net | bash
November 30, 2023
Back to top
