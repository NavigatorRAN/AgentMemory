# Android - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/vpn/openvpn/android-client
- Final URL: https://docs.pi-hole.net/guides/vpn/openvpn/android-client/
- Canonical URL: https://docs.pi-hole.net/guides/vpn/openvpn/android-client/
- Fetched at: 2026-06-23T13:42:48Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Android
OpenVPN is no longer recommended
We no longer recommend that you use OpenVPN for new deployments. Although OpenVPN has served us well in the past, we believe it's time to move towards more modern and efficient solutions.
We suggest that users now turn their attention to WireGuard , a forward-thinking VPN solution that offers better performance, faster speeds, and easier implementation. WireGuard has been designed with the latest technology in mind, providing simple yet powerful tools for securing your network communications. Pi-hole's step-by-step tutorial is designed to help you understand the ins and outs of WireGuard, regardless of your technical expertise.
Install the official OpenVPN App from the App Store
Log into your OpenVPN server and use the road warrior installer to create a new certificate for your device:
root@ubuntu-512mb-fra1-01:~# bash openvpn-install.sh
Looks like OpenVPN is already installed
What do you want to do?
1) Add a cert for a new user
2) Revoke existing user cert
3) Remove OpenVPN
4) Exit
Select an option [1-4]: 1
Tell me a name for the client cert
Please, use one word only, no special characters
Client name: android
Generating a 2048 bit RSA private key
.....+++
..................................+++
writing new private key to '...'
-----
Using configuration from /etc/openvpn/server/easy-rsa/openssl-1.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
commonName :ASN.1 12:'android'
Certificate is to be certified until Jan 25 15:07:37 2027 GMT (3650 days)
Write out database with 1 new entries
Data Base Updated
Client android added, configuration is available at /root/android.ovpn
Copy the mentioned file ( /root/android.ovpn ) to your Android device (e.g. SD card) and import it in the app:
Connect to your OpenVPN server
You are ready to go!
November 30, 2023
Back to top
