# Troubleshooting - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/guides/vpn/openvpn/troubleshooting
- Final URL: https://docs.pi-hole.net/guides/vpn/openvpn/troubleshooting/
- Canonical URL: https://docs.pi-hole.net/guides/vpn/openvpn/troubleshooting/
- Fetched at: 2026-06-23T13:43:07Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
Troubleshooting
OpenVPN is no longer recommended
We no longer recommend that you use OpenVPN for new deployments. Although OpenVPN has served us well in the past, we believe it's time to move towards more modern and efficient solutions.
We suggest that users now turn their attention to WireGuard , a forward-thinking VPN solution that offers better performance, faster speeds, and easier implementation. WireGuard has been designed with the latest technology in mind, providing simple yet powerful tools for securing your network communications. Pi-hole's step-by-step tutorial is designed to help you understand the ins and outs of WireGuard, regardless of your technical expertise.
CRL expired ¶
OpenVPN 2.4 and newer check the validity of the Certificate Revocation List (CRL). This can result in a sudden malfunction of openvpn after an update even though no configuration files have changed. This error manifests in the following, not very helpful, error on the client's side:
Wed Apr 24 11:19:07 2019 VERIFY OK: depth=0, CN=server
Wed Apr 24 11:19:07 2019 Connection reset, restarting [0]
Wed Apr 24 11:19:07 2019 SIGUSR1[soft,connection-reset] received, process restarting
Wed Apr 24 11:19:07 2019 Restart pause, 5 second(s)
Android clients simply report: "Transport error, trying to reconnect..."
On the OpenVPN server, the following messages are logged:
Wed Apr 24 11:19:07 2019 aaa.bbb.ccc.ddd:pppp TLS: Initial packet from [AF_INET]aaa.bbb.ccc.ddd:pppp, sid=57719cb8 77945ae9
Wed Apr 24 11:19:07 2019 aaa.bbb.ccc.ddd:pppp VERIFY ERROR: depth=0, error=CRL has expired: CN=client1
Wed Apr 24 11:19:07 2019 aaa.bbb.ccc.ddd:pppp OpenSSL: error:11089086:SSL routines:ssl3_get_client_certificate:certificate verify failed
Wed Apr 24 11:19:07 2019 aaa.bbb.ccc.ddd:pppp TLS_ERROR: BIO read tls_read_plaintext error
Wed Apr 24 11:19:07 2019 aaa.bbb.ccc.ddd:pppp TLS Error: TLS object -> incoming plaintext read error
Wed Apr 24 11:19:07 2019 aaa.bbb.ccc.ddd:pppp TLS Error: TLS handshake failed
Wed Apr 24 11:19:07 2019 aaa.bbb.ccc.ddd:pppp Fatal TLS error (check_tls_errors_co), restarting
Wed Apr 24 11:19:07 2019 aaa.bbb.ccc.ddd:pppp SIGUSR1[soft,tls-error] received, client-instance restarting
The error is CRL has expired and can be solved using the following commands:
sudo -s
cd /etc/openvpn
mv crl.pem crl.pem_old
cd easy-rsa
./easyrsa gen-crl
cp pki/crl.pem ../
service openvpn restart
exit
March 4, 2025
Back to top
