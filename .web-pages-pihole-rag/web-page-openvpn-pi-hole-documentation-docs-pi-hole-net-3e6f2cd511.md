# OpenVPN - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/vpn/openvpn
- Final URL: https://docs.pi-hole.net/guides/vpn/openvpn/
- Canonical URL: https://docs.pi-hole.net/guides/vpn/openvpn/
- Fetched at: 2026-06-23T13:42:46Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
OpenVPN
OpenVPN is no longer recommended
We no longer recommend that you use OpenVPN for new deployments. Although OpenVPN has served us well in the past, we believe it's time to move towards more modern and efficient solutions.
We suggest that users now turn their attention to WireGuard , a forward-thinking VPN solution that offers better performance, faster speeds, and easier implementation. WireGuard has been designed with the latest technology in mind, providing simple yet powerful tools for securing your network communications. Pi-hole's step-by-step tutorial is designed to help you understand the ins and outs of WireGuard, regardless of your technical expertise.
This tutorial is tailored for setting up OpenVPN on a cloud-hosted virtual server. If you wish to have this working on your home network, you will need to tailor Pi-hole to listen on eth0 (or similar), which we explain in this section of the tutorial .
High-level Overview ¶
Using a VPN is a responsible, respectful, and safe way to access your Pi-hole's capabilities remotely. Setting up a DNS server has become a simple task with Pi-hole's automated installer, which has resulted in many people knowingly--or unknowingly--creating an open resolver, which aids in DNS Amplification Attacks.
We do not encourage open resolvers but there are always people wanting access to their ad-blocking capabilities outside of their home network, whether it's on their cellular network or on an unsecured wireless network. This article aims to provide a step-by-step walk-through on setting up a server running Pi-hole and OpenVPN so you can connect to your Pi-hole's DNS from anywhere. This guide should work for a private server installed on your private network, but it will also work for cloud servers, such as those created on Digital Ocean .
This tutorial walks you through the installation of Pi-hole combined with a VPN server for secure access from remote clients .
Via this VPN, you can:
use the DNS server and full filtering capabilities of your Pi-hole from everywhere around the globe
access your admin interface remotely
encrypt your Internet traffic
If you don't want a full-tunnel, we provide a page of how to set up your server to exclusively route DNS traffic, but nothing else via the VPN . On another optional page, we describe how to set up Pi-hole + VPN in such a way that it is usable both locally (no VPN) and from remote (through VPN) while preserving full functionality.
In the end, you will have access to a VPN that uses Pi-hole for DNS and tunnels some or all of your network traffic
This manual is partially based on this HowTo on Discourse .
June 10, 2024
Back to top
