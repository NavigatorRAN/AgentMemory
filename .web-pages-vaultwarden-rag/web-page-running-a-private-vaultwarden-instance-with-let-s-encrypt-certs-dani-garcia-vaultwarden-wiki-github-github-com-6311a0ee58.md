# Running a private vaultwarden instance with Let's Encrypt certs · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Running-a-private-vaultwarden-instance-with-Let's-Encrypt-certs
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Running-a-private-vaultwarden-instance-with-Let's-Encrypt-certs
- Fetched at: 2026-06-23T13:50:27Z
- Content type: text/html; charset=utf-8

## Description

Unofficial Bitwarden compatible server written in Rust, formerly known as bitwarden_rs - dani-garcia/vaultwarden

## Extracted Text

Skip to content
You signed in with another tab or window. Reload to refresh your session. You signed out in another tab or window. Reload to refresh your session. You switched accounts on another tab or window. Reload to refresh your session. Dismiss alert
{{ message }}
dani-garcia
/ vaultwarden Public
Uh oh!
There was an error while loading. Please reload this page .
Notifications
You must be signed in to change notification settings
Fork
2.9k
Star
62.8k
Running a private vaultwarden instance with Let's Encrypt certs
Jump to bottom Edit New page
docgalaxyblock edited this page Mar 10, 2024
·
13 revisions
Suppose you want to run an instance of vaultwarden that can only be accessed from your local network, but you want your instance to be HTTPS-enabled with certs signed by a widely-accepted CA instead of managing your own private CA (to avoid the hassle of having to load private CA certs into all of your devices).
This article demonstrates how to create such a setup using the Caddy web server, which has built-in ACME support for various DNS providers. We'll configure Caddy to obtain Let's Encrypt certs via the ACME DNS challenge -- using the more common HTTP challenge would be problematic here, since it would rely on Let's Encrypt servers being able to reach your internal web server.
Warning
This article covers the DNS challenge setup in more generic terms, but many users will probably find it easiest to use Docker Compose to integrate Caddy and Vaultwarden. See Using Docker Compose for an example specific to that.
Two DNS providers are covered:
Duck DNS -- This gives you a subdomain under duckdns.org (e.g., my-vw.duckdns.org ). This option is simplest if you don't already own a domain.
Cloudflare -- This lets you put your vaultwarden instance under a domain you own or control. Note that Cloudflare can be used as just a DNS provider (i.e., without the proxying functionality that Cloudflare is best known for). If you don't currently own a domain, you may be able to get a free one at Freenom .
It's certainly possible to create a similar setup using other combinations of web server, ACME client , and DNS provider, but you'll have to work out the differences in details.
Getting a custom Caddy build
DNS challenge support is not built into Caddy by default, as most people don't use this challenge method, and it requires a custom implementation for each DNS provider.
The easiest way to get a version of Caddy with the necessary DNS challenge modules is via https://caddyserver.com/download . Select your platform, check the box for github.com/caddy-dns/cloudflare (for Cloudflare support) and/or github.com/caddy-dns/duckdns (for Duck DNS support), and then click Download .
If you prefer to build from source, you can use xcaddy . For example, to create a build that includes both Cloudflare and Duck DNS support:
xcaddy build --with github.com/caddy-dns/cloudflare --with github.com/caddy-dns/duckdns
Move the caddy binary to /usr/local/bin/caddy or some other appropriate directory in your path. Make the file executable. Optionally, run sudo setcap cap_net_bind_service=+ep /usr/local/bin/caddy to allow caddy to listen on privileged ports (< 1024) without running as root.
Duck DNS setup
If you don't already have an account, create one at https://www.duckdns.org/ . Create a subdomain for your vaultwarden instance (e.g., my-vw.duckdns.org ) and set its IP to your vaultwarden host's private IP (e.g., 192.168.1.100 ). Make note of your account's token (a string in UUID format). Caddy will need this token to solve the DNS challenge.
Create a file named Caddyfile (capital C and no file extention) in the same directory where the caddy executable is located with the following content and replace the localhost: port by the one used by your vaultwarden in its ROCKET_PORT= directive (vaultwarden's default rocket_port is 8001):
{$DOMAIN}:443 {
tls {
dns duckdns {$DUCKDNS_TOKEN}
}
reverse_proxy localhost:8001
Create a file named caddy.env with the following content (replacing each value as appropriate):
DOMAIN=my-vw.duckdns.org
DUCKDNS_TOKEN=00112233-4455-6677-8899-aabbccddeeff
Change to the directory where caddy is located and start caddy for the first time by running
caddy run --envfile caddy.env
The first start of caddy for your Duck DNS domain (e.g. my-vw.duckns.org) takes a few seconds to solve the DNS challenge and obtain the HTTPS certificates. Caddy usually stores them in /root/.local/share/caddy and caddy's configuration is automatically saved to /root/.config/caddy .
Start vaultwarden - if not already the case - by running
export ROCKET_PORT=8001
./vaultwarden
Note
It does not matter if vaultwarden has been running already or not before you set up caddy.
You should now be able to reach your vaultwarden instance at https://my-vw.duckdns.org . If not, check the output of caddy.
You can stop caddy by [STRG]-[C]. In the future start caddy in the background by running
caddy start --envfile caddy.env
Important: If necessary, in some routers (e.g. FritzBox) or DNS resolvers (e.g. unbound) an exception must be set for the domain (e.g., my-vw.duckdns.org ) due to DNS rebind protection.
Cloudflare setup
If you don't already have an account, create one at https://www.cloudflare.com/ ; you'll also have to go to your domain registrar to set your nameservers to the ones assigned to you by Cloudflare. Create a subdomain for your vaultwarden instance (e.g., vw.example.com ), setting its IP to your vaultwarden host's private IP (e.g., 192.168.1.100 ). For example:
Create an API token for the DNS challenge (for more background, see https://github.com/libdns/cloudflare/blob/master/README.md ):
In the upper right, click the person icon and navigate to My Profile , and then select the API Tokens tab.
Click the Create Token button, and then Use template on Edit zone DNS .
Edit the Token name field if you prefer a more descriptive name.
Under Permissions , the Zone / DNS / Edit permission should already be populated. Add another permission: Zone / Zone / Read .
Under Zone Resources , set Include / Specific zone / example.com (replacing example.com with your domain).
Under TTL , set an End Date for when your token will become inactive. You might want to choose one far in the future.
Create the token and copy the token value.
Your token list should look like:
Create a file named Caddyfile with the following content:
dns cloudflare {$CLOUDFLARE_API_TOKEN}
reverse_proxy localhost:8080
DOMAIN=vw.example.com
CLOUDFLARE_API_TOKEN=<your-api-token>
Start caddy by running
Start vaultwarden by running
export ROCKET_PORT=8080
You should now be able to reach your vaultwarden instance at https://vw.example.com .
Important: If necessary, in some routers (e.g. FritzBox) an exception must be set for the domain (e.g., vw.example.com ) due to DNS rebind protection.
Getting certs using the lego CLI
In the DuckDNS example above, Caddy used the lego library to get certs via DNS challenge.
lego also has a CLI that you can use to get certs directly, e.g. if you want to use a reverse proxy other than Caddy.
(Note: This example uses lego , but there are other standalone ACME clients that support the DNS challenge method (see the DNS Challenge section.)
Here's an example of how to do this:
Download a pre-built lego binary for your system from https://github.com/go-acme/lego/releases . Extract the contents to some directory, say, /usr/local/lego .
From that directory, run DUCKDNS_TOKEN=<token> ./lego -a --dns duckdns -d my-vw.duckdns.org -m me@example.com run ,
substituting appropriate values for the token, domain, and email address. This registers you with Let's Encrypt and
fetches a certificate for your domain.
Set up a weekly cron job to run DUCKDNS_TOKEN=<token> ./lego --dns duckdns -d my-vw.duckdns.org -m me@example.com renew .
This renews your certificate as it nears expiration.
lego requests ECC/ECDSA certs by default. If you are using the Rocket HTTPS server built into vaultwarden, you will need to request RSA certs instead. In the lego commands above, add the option --key-type rsa2048 .
In this example, the generated outputs you need to configure your reverse proxy with are:
/usr/local/lego/.lego/certificates/my-vw.duckdns.org.crt (certificate)
/usr/local/lego/.lego/certificates/my-vw.duckdns.org.key (private key)
Troubleshooting
DNS issues
If you get a DNS resolution error for your subdomain (e.g., DNS_PROBE_FINISHED_NXDOMAIN or ERR_NAME_NOT_RESOLVED ), your DNS resolver is probably blocking resolution because:
It blocks dynamic DNS services for security reasons.
It blocks domains that resolve to private (RFC 1918) IP addresses to prevent DNS rebinding attacks, or for some other reason.
In either case, you might try using another DNS resolver, such as Google's 8.8.8.8 or Cloudflare's 1.1.1.1 . In the second case, if you're running behind a local DNS server like dnsmasq or Unbound, you may be able to configure it to either disable DNS rebind protection entirely, or allow certain domains to return private addresses. Regarding Unbound you can do so by adding the following directive to its configuration file (replacing the domain by your own Duck DNS domain):
private-domain: "my-vw.duckdns.org"
Afterwards restart unbound by unbound-control reload or systemctl restart unbound to make it load its new configuration.
Additionally, make sure to turn off a previous HTTPS setup you might had set up for vaultwarden, in particular a private CA with your own (self-signed) certificates via Rocket TLS because this interferes with your new Let's Encrypt-protected domain. Simply do so by commenting out (# sign) the ROCKET_TLS directive in your vaultwarden's environment file:
# ROCKET_TLS={certs="./cert.pem",key="./privkey.pem"}
Vaultwarden login issues
Do not miss to update vaultwardens's environment file to reflect the domain change:
DOMAIN=https://my-vw.duckdns.org
References
DNS Challenge
https://community.letsencrypt.org/t/dns-providers-who-easily-integrate-with-lets-encrypt-dns-validation/86438
https://caddy.community/t/how-to-use-dns-provider-modules-in-caddy-2/8148
Caddy Cloudflare module
https://github.com/caddy-dns/cloudflare
https://go-acme.github.io/lego/dns/cloudflare/
Caddy Duck DNS module
https://github.com/caddy-dns/duckdns
https://go-acme.github.io/lego/dns/duckdns/
🛡️ Vaultwarden — A Bitwarden server, reimagined in Rust
🏠 Wiki Home ·
📖 FAQs ·
⚙️ Configuration ·
🔒 Hardening Guide ·
🐳 Docker
💬 Get in touch
❤️ Love Vaultwarden? Consider supporting upstream Bitwarden — without their work, this project wouldn't exist.
Vaultwarden is an unofficial , community-driven Bitwarden-compatible server. It is not associated with, endorsed by, or affiliated with Bitwarden, Inc. — "Bitwarden" is a trademark of Bitwarden, Inc.
Maintained with care by @dani-garcia and contributors · Wiki content licensed under the project's terms
FAQs
Audits
Supporting upstream development
Logging
Bitwarden Android troubleshooting
Bitwarden clients troubleshooting
Container Image Usage
Which container image to use
Starting a container
Using Docker Compose
Using Podman
Updating the vaultwarden image
Reverse Proxy
Proxy examples
Using an alternate base dir (subdir/subpath)
HTTPS
Enabling HTTPS
Configuration
Overview
Enabling admin page
SMTP configuration
Disable registration of new users
Disable invitations
Enabling WebSocket notifications
Enabling Mobile Client push notification
Enabling SSO support using OpenId Connect
Allow icon fetching from internal services
Other configuration
Database
Using the MariaDB (MySQL) Backend
Using the PostgreSQL Backend
Running without WAL enabled
Migrating from MariaDB (MySQL) to SQLite
Security
Hardening Guide
Password hint display
Enabling U2F and FIDO2 WebAuthn authentication
Enabling YubiKey OTP authentication
Fail2Ban Setup
Fail2Ban + ModSecurity + Traefik + Docker
Performance
Changing the API request size limit
Changing the number of workers
Customization
Translating the email templates
Translating admin page
Customize Vaultwarden CSS
Using custom website icons
Disabling or overriding the Vault interface hosting
Backup
General (not docker)
Backing up your vault
Development
Building binary
Building your own docker image
Git hooks
Differences from the upstream API implementation
Alternative deployments
Pre-built binaries
Creating a systemd service
Third-party packages
Deployment examples
Disable the admin token
Other Information
Importing data from Keepass or KeepassX
Changing persistent data location
Syncing users from LDAP
Caddy 2.x with Cloudflare DNS
Logrotate example
Clone this wiki locally
You can’t perform that action at this time.
