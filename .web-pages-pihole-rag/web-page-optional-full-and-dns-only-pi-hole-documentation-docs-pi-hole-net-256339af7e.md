# Optional: Full and DNS-only - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/vpn/openvpn/dual-VPN
- Final URL: https://docs.pi-hole.net/guides/vpn/openvpn/dual-vpn/
- Canonical URL: https://docs.pi-hole.net/guides/vpn/openvpn/dual-VPN/
- Fetched at: 2026-06-23T13:42:54Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Optional: Full and DNS-only
OpenVPN is no longer recommended
We no longer recommend that you use OpenVPN for new deployments. Although OpenVPN has served us well in the past, we believe it's time to move towards more modern and efficient solutions.
We suggest that users now turn their attention to WireGuard , a forward-thinking VPN solution that offers better performance, faster speeds, and easier implementation. WireGuard has been designed with the latest technology in mind, providing simple yet powerful tools for securing your network communications. Pi-hole's step-by-step tutorial is designed to help you understand the ins and outs of WireGuard, regardless of your technical expertise.
Dual VPN Setup - Separate DNS and VPN Traffic ¶
In order to separate VPN traffic from DNS queries, you will need to run two VPN servers. One server routes the normal user traffic and the second routes only DNS requests. This can be done with two OpenVPN configurations.
Prerequisites and Configuration ¶
You should have an existing OpenVPN server configured and running. We are going to use the original configuration file located at /etc/openvpn/server/server.conf .
First, copy the file:
sudo cp /etc/openvpn/server/server.conf /etc/openvpn/server/server2.conf
Next, exit the new copy of the configuration. We use the nano editor in this example, but any editor will work. Remember to edit under the root account via sudo .
sudo nano /etc/openvpn/server/server2.conf
We will need to change the port to one different from the original so that it does not conflict with the first instance of OpenVPN. Assuming you used the default port configuration, you should have 1194 as the port. You need to change this to a different value, making sure the port is available - 1195 should be.
Next, if needed, port forward the newly configured port from your router to your device. You will also need to assign a different class of IP addresses that will serve this connection only.
Your server line should look like this:
server 10.9.0.0 255.255.255.0
Make sure that the DNS requests go through the instance of OpenVPN:
push "dhcp-option DNS 10.9.0.1"
One other setting that we need to change is to comment out the bypass-dhcp instruction so that it looks like:
# push "redirect-gateway def1 bypass-dhcp"`.
Commenting out this line ensures that no traffic is routed via the VPN server.
Save the file and start the second instance of OpenVPN:
systemctl start openvpn@server2.service
If your distribution does not have systemctl you may use the command below to start an OpenVPN daemon with your second configuration:
/usr/sbin/openvpn --daemon --writepid /run/openvpn/server2.pid --cd /etc/openvpn --config server2.conf --script-security 2
Finally, edit the existing .ovpn file used for the client connection. Update the port from the previous value to the port you used for the second instance of OpenVPN.
Testing ¶
Before testing, make sure that:
Port forwarding is configured for the second instance of OpenVPN.
ps ax | grep openvpn shows two instances of OpenVPN running (with different configs).
The modified ovpn file is loaded on the client.
Note: when connected to your DNS only VPN connection you will not get a Pi-hole splash page when accessing a blocked domain directly. The page will not load or it may load with an error. This is because the web server traffic is not routed through the VPN. We did not create an iptables rule for masquerading, and the return packets (since they are not part of the same LAN subset as your VPN Client) are prevented.
March 4, 2025
Back to top
