# General - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/vpn/openvpn/clients
- Final URL: https://docs.pi-hole.net/guides/vpn/openvpn/clients/
- Canonical URL: https://docs.pi-hole.net/guides/vpn/openvpn/clients/
- Fetched at: 2026-06-23T13:42:50Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
General
OpenVPN is no longer recommended
We no longer recommend that you use OpenVPN for new deployments. Although OpenVPN has served us well in the past, we believe it's time to move towards more modern and efficient solutions.
We suggest that users now turn their attention to WireGuard , a forward-thinking VPN solution that offers better performance, faster speeds, and easier implementation. WireGuard has been designed with the latest technology in mind, providing simple yet powerful tools for securing your network communications. Pi-hole's step-by-step tutorial is designed to help you understand the ins and outs of WireGuard, regardless of your technical expertise.
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
Connect a client using the .ovpn file ¶
The OpenVPN documentation has some decent guides on connecting desktop clients for Mac, Windows, and Linux , so we'll instead explain how to connect a mobile device since that provides the most usefulness in today's world-- connecting to your ad-blocking VPN via a mobile device . We'll go through two examples:
connect an iPhone using the OpenVPN Connect mobile app (see here for Android)
connect a Linux machine
iOS ¶
First, make sure the OpenVPN connect app is installed on your phone or mobile device.
Import the .ovpn file into iOS. There are several ways to do this, but be careful about transferring it over an insecure medium.
Airdrop the file from another device
Store the file in a cloud app and open it ion your device
Message the file to yourself (not recommended)
Email the file to yourself (not recommended)
Warning
Anyone who gets his hands on this configuration/certificate file can obtain full access to your VPN. Make sure that you use only trusted paths for transferring the file (e.g. never send it via an unencrypted channel, e.g. email or FTP). The best strategy is to use a USB thumb drive to avoid any network transport at all (when possible). Make sure to delete the certificate on the USB drive afterward.
Notice
If one of your certificates has been compromised, remove it using option 2 when you run the installer and generate a new certificate. This will effectively lock out anyone who might have gotten access to the certificate.
Once you get it on your device, you can open the file in the OpenVPN app.
Click the green plus to add the profile to your phone.
You can connect from within the app or you can connect from the Settings app once you grant it access to do so.
Linux ¶
We'll demonstrate the procedure here for Ubuntu Linux (which trivially extends to Linux Mint, etc.)
Install the necessary network-manager plugins
sudo apt-get install network-manager-openvpn network-manager-openvpn-gnome
sudo service network-manager restart
Securely copy the necessary certificates from your OpenVPN server to your client (e.g. using sftp ). They are located in /etc/openvpn/server/easy-rsa/pki
You will need:
User Certificate: /etc/openvpn/server/easy-rsa/pki/issued/client.crt
CA Certificate: /etc/openvpn/server/easy-rsa/pki/ca.crt
Private Key: /etc/openvpn/server/easy-rsa/pki/private/client.key
Private Key Password: Depending on your settings (might even be empty)
TA Key: /etc/openvpn/server/ta.key
Further details can be found in the screenshots provided below:
Your whole network traffic will now securely be transferred to your Pi-hole.
Windows ¶
You will have to install additional software. See https://openvpn.net/community-downloads/
November 30, 2023
Back to top
