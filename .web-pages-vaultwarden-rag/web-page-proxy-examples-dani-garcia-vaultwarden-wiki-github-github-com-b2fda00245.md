# Proxy examples · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Proxy-examples
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Proxy-examples
- Fetched at: 2026-06-23T13:49:17Z
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
Proxy examples
Jump to bottom Edit New page
ristein edited this page Mar 19, 2026
·
150 revisions
Below is a user-curated list of example configurations for different reverse proxies . We recommend using a reverse proxy to terminate TLS/SSL connections (preferably on port 443, the standard port for HTTPS) instead of using the HTTPS functionality built into Vaultwarden. See Enabling HTTPS for more information about that.
In this document we assume that you run Vaultwarden on the same host as the reverse proxy. If you run Vaultwarden as a container the assumption would be that you have published -p 127.0.0.1:8000:80 to the host, because Vaultwarden inside the container has been configured to listen on all IPv4 interfaces ( ROCKET_ADDRESS=0.0.0.0 ) on port 80 (via ROCKET_PORT ).
The examples also assume that you have not encrypted the connection between the reverse proxy and Vaultwarden, i.e. that you have not configured ROCKET_TLS and thus the reverse proxy can just connect via http://127.0.0.1:8000 to Vaultwarden.
If you use Docker Compose to link containerized services together (e.g., Vaultwarden and a reverse proxy) you have to adapt the examples to take that into account (i.e. change 127.0.0.1:8000 to service_name:80 where service_name typically would be vaultwarden ). See Using Docker Compose for an example of this.
Tip
Secure TLS protocol and cipher configurations for webservers can be generated using Mozilla's SSL Configuration Generator . All supported browsers and the Mobile apps are known to work with the "Modern" configuration.
Caddy 2.x
Caddy 2 will automatically enable HTTPS in most circumstances, check the docs .
In the Caddyfile syntax, {$VAR} denotes the value of the environment variable VAR .
If you prefer, you can also directly specify a value instead of substituting an env var value.
# Uncomment this in addition with the import admin_redir statement allow access to the admin interface only from local networks # { # servers { # trusted_proxies static private_ranges # client_ip_headers X-Forwarded-For X-Real-IP # # client_ip_headers CF-Connecting-IP X-Forwarded-For X-Real-IP # # If using Cloudflare proxy, insert CF-Connecting-IP as first priority # # since Cloudflare doesn't prevent X-Forwarded-For spoofing. # } # } # (admin_redir) { # @admin { # path /admin* # not remote_ip private_ranges # } # redir @admin / # } {$DOMAIN} {
log {
level INFO
output file {$LOG_FILE} {
roll_size 10MB
roll_keep 10
}
# Uncomment this if you want to get a cert via ACME (Let's Encrypt or ZeroSSL). # tls {$EMAIL} # Or uncomment this if you're providing your own cert. You would also use this option # if you're running behind Cloudflare. # tls {$SSL_CERT_PATH} {$SSL_KEY_PATH} # This setting may have compatibility issues with some browsers # (e.g., attachment downloading on Firefox). Try disabling this # if you encounter issues. encode zstd gzip
# Uncomment to improve security (WARNING: only use if you understand the implications!) # If you want to use FIDO2 WebAuthn, set X-Frame-Options to "SAMEORIGIN" or the Browser will block those requests # header / { # # Enable HTTP Strict Transport Security (HSTS) # Strict-Transport-Security "max-age=31536000;" # # Disable cross-site filter (XSS) # X-XSS-Protection "0" # # Disallow the site to be rendered within a frame (clickjacking protection) # X-Frame-Options "DENY" # # Prevent search engines from indexing (optional) # X-Robots-Tag "noindex, nofollow" # # Disallow sniffing of X-Content-Type-Options # X-Content-Type-Options "nosniff" # # Server name removing # -Server # # Remove X-Powered-By though this shouldn't be an issue, better opsec to remove # -X-Powered-By # # Remove Last-Modified because etag is the same and is as effective # -Last-Modified # } # Uncomment to allow access to the admin interface only from local networks # import admin_redir # Uncomment to allow access to the admin interface only from the specified forwarded IPs (proxied Cloudflare for example) # @not_allowed_admin { # path /admin* # Trusted IPs one and two # not client_ip xx.xx.xx.xx/32 xx.xx.xx.xx/32 # # remote_ip's forwarded mode is deprecated; client_ip matcher with global options client_ip_headers and trusted_proxies # } # respond @not_allowed_admin "401 - {http.request.header.Cf-Connecting-Ip} is not an allowed IP." 401 # Proxy everything to Rocket # if located at a sub-path the reverse_proxy line will look like: # reverse_proxy /vault/* 127.0.0.1:8000 reverse_proxy 127.0.0.1:8000 {
# Send the true remote IP to Rocket, so that Vaultwarden can put this in the # log, so that fail2ban can ban the correct IP. header_up X-Real-IP {remote_host} # If you use Cloudflare proxying, replace remote_host with http.request.header.Cf-Connecting-Ip # Not necessary if using global options 'client_ip_headers CF-Connecting-IP' # See https://developers.cloudflare.com/support/troubleshooting/restoring-visitor-ips/restoring-original-visitor-ips/ # and https://caddy.community/t/forward-auth-copy-headers-value-not-replaced/16998/4
lighttpd with sub-path (by FlakyPi)
In this example Vaultwarden will be available via https://shared.example.tld/vault/
If you want to use any other sub-path, like vaultwarden or secret-vault you should change vault in the example below to match.
You will also need to include the sub-path in the DOMAIN env var value for proxying to work successfully (e.g. DOMAIN: "https://shared.example.tld/vault" )
server.modules += (
"mod_openssl",
"mod_redirect"
)
$SERVER["socket"] == ":443" {
ssl.engine = "enable"
ssl.pemfile = "/etc/letsencrypt/live/shared.example.tld/fullchain.pem"
ssl.privkey = "/etc/letsencrypt/live/shared.example.tld/privkey.pem"
# Redirect HTTP requests (port 80) to HTTPS (port 443)
$SERVER["socket"] == ":80" {
$HTTP["host"] =~ "vaultwarden.example.tld" {
url.redirect = ( "^/(.*)" => "https://shared.example.tld/$1" )
server.name = "shared.example.tld"
server.modules += ( "mod_proxy" )
$HTTP["host"] == "shared.example.tld" {
$HTTP["url"] =~ "/vault" {
proxy.server = ( "" => ("vaultwarden" => ( "host" => "127.0.0.1", "port" => 8000 )))
proxy.forwarded = ( "for" => 1 )
proxy.header = (
"https-remap" => "enable",
"upgrade" => "enable",
"connect" => "enable"
You'll have to set IP_HEADER to X-Forwarded-For instead of X-Real-IP in the Vaultwarden environment.
Nginx (by @BlackDex )
# The `upstream` directives ensure that you have a http/1.1 connection # This enables the keepalive option and better performance # # Define the server IP and ports here. upstream vaultwarden-default { zone vaultwarden-default 64k ; server 127.0.0.1:8000 ; keepalive 2 ; } # Needed to support websocket connections # See: https://nginx.org/en/docs/http/websocket.html # Instead of "close" as stated in the above link we send an empty value. # Else all keepalive connections will not work. map $http_upgrade $connection_upgrade {
default upgrade ; '' "" ; } # Redirect HTTP to HTTPS server { listen 80 ; listen [::]: 80 ; server_name vaultwarden.example.tld ; return 301 https:// $host$request_uri ; } server { # For older versions of nginx appended http2 to the listen line after ssl and remove `http2 on` listen 443 ssl ; listen [::]: 443 ssl ;
http2 on ; server_name vaultwarden.example.tld ; # Specify SSL Config when needed #ssl_certificate /path/to/certificate/letsencrypt/live/vaultwarden.example.tld/fullchain.pem; #ssl_certificate_key /path/to/certificate/letsencrypt/live/vaultwarden.example.tld/privkey.pem; #ssl_trusted_certificate /path/to/certificate/letsencrypt/live/vaultwarden.example.tld/fullchain.pem; #add_header Strict-Transport-Security "max-age=31536000;"; client_max_body_size 525M ; proxy_http_version 1.1 ; proxy_set_header Upgrade $http_upgrade ; proxy_set_header Connection $connection_upgrade ; proxy_set_header Host $host ; proxy_set_header X-Real-IP $remote_addr ; # If you use Cloudflare proxying, replace $remote_addr with $http_cf_connecting_ip # See https://developers.cloudflare.com/support/troubleshooting/restoring-visitor-ips/restoring-original-visitor-ips/#nginx-1 # alternatively use ngx_http_realip_module proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for ; proxy_set_header X-Forwarded-Proto $scheme ; location / { proxy_pass http ://vaultwarden-default ; } # Optionally add extra authentication besides the ADMIN_TOKEN # Remove the comments below `#` and create the htpasswd_file to have it active # #location /admin { # # See: https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/ # auth_basic "Private"; # auth_basic_user_file /path/to/htpasswd_file; # # proxy_pass http://vaultwarden-default; #} }
If you run into 504 Gateway Timeout problems, tell nginx to wait longer for Vaultwarden by adding longer timeouts to the server { section, for example:
proxy_connect_timeout 777 ; proxy_send_timeout 777 ; proxy_read_timeout 777 ; send_timeout 777 ;
Nginx with sub-path (by @BlackDex )
If you want to use any other sub-path, like vaultwarden or secret-vault you should change /vault/ in the example below to match.
For this to work you need to configure your DOMAIN variable to match so it should look like:
; Add the sub-path! Else this will not work! DOMAIN =https://shared.example.tld/vault/
default upgrade ; '' "" ; } # Redirect HTTP to HTTPS server { listen 80 ; listen [::]: 80 ; server_name shared.example.tld ; location /vault/ { # <-- replace with desired sub-path
return 301 https:// $host$request_uri ; } # If you want to enforce HTTPS for the entire domain anyway, # rather than just for Vaultwarden, then you can just use # the following instead of the `location` block above: return 301 https:// $host$request_uri ; } server { # For older versions of nginx appened `http2` to the listen line after ssl and remove `http2 on;` listen 443 ssl ; listen [::]: 443 ssl ;
http2 on ; server_name shared.example.tld ; # Specify SSL Config when needed #ssl_certificate /path/to/certificate/letsencrypt/live/shared.example.tld/fullchain.pem; #ssl_certificate_key /path/to/certificate/letsencrypt/live/shared.example.tld/privkey.pem; #ssl_trusted_certificate /path/to/certificate/letsencrypt/live/shared.example.tld/fullchain.pem; #add_header Strict-Transport-Security "max-age=31536000;"; client_max_body_size 525M ; ## Using a Sub Path Config # Path to the root of your installation # Be sure to DO ADD a trailing /, else you will experience issues # But only for this location, all other locations should NOT add this. location /vault/ { proxy_http_version 1.1 ; proxy_set_header Upgrade $http_upgrade ; proxy_set_header Connection $connection_upgrade ; proxy_set_header Host $host ; proxy_set_header X-Real-IP $remote_addr ; proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for ; proxy_set_header X-Forwarded-Proto $scheme ; proxy_pass http ://vaultwarden-default ; } # Optionally add extra authentication besides the ADMIN_TOKEN # Remove the comments below `#` and create the htpasswd_file to have it active # # DO NOT add a trailing /, else you will experience issues #location /vault/admin { # # See: https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/ # auth_basic "Private"; # auth_basic_user_file /path/to/htpasswd_file; # # proxy_http_version 1.1; # proxy_set_header Upgrade $http_upgrade; # proxy_set_header Connection $connection_upgrade; # # proxy_set_header Host $host; # proxy_set_header X-Real-IP $remote_addr; # proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for; # proxy_set_header X-Forwarded-Proto $scheme; # # proxy_pass http://vaultwarden-default; #} }
Nginx (NixOS) (by tklitschi, samdoshi)
Example NixOS nginx config. For more Information about NixOS Deployment see Deployment Wiki page .
{ config , ... } :
{ security . acme = { defaults = { acceptTerms = true ; email = "me@example.com" ; } ; certs . "vaultwarden.example.tld" . group = "vaultwarden" ; } ; services . nginx = { enable = true ; recommendedGzipSettings = true ; recommendedOptimisation = true ; recommendedProxySettings = true ; recommendedTlsSettings = true ; virtualHosts = { "vaultwarden.example.tld" = { enableACME = true ; forceSSL = true ; locations . "/" = { proxyPass = "http://127.0.0.1:8000" ; proxyWebsockets = true ; } ; } ; } ; } ; }
Nginx with proxy_protocol in front (by dionysius)
In this example there is a downstream proxy communicating in proxy_protocol in front of this nginx (E.g. a LXD proxy device with proxy_protocol enabled ). Nginx needs to correctly consume the protocol and headers to forward need to be set from the those. Lines marked with # <--- have different contents than BlackDex's example.
For reference this LXD downstream proxy device configuration:
devices :
http :
connect : tcp:[::1]:80 listen : tcp:[::]:80 proxy_protocol : " true " type : proxy https :
connect : tcp:[::1]:443 listen : tcp:[::]:443 proxy_protocol : " true " type : proxy
# proxy_protocol related: set_real_ip_from ::1 ; # which downstream proxy to trust, enter address of your proxy in front
real_ip_header proxy_protocol ; # optional, if you want nginx to override remote_addr with info from proxy_protocol . depends on which variables you use regarding remote addr in log template and in server or stream blocks.
# below based on BlackDex's example: # The `upstream` directives ensure that you have a http/1.1 connection # This enables the keepalive option and better performance # # Define the server IP and ports here. upstream vaultwarden-default { zone vaultwarden-default 64k ; server 127.0.0.1:8000 ; keepalive 2 ; } # Needed to support websocket connections # See: https://nginx.org/en/docs/http/websocket.html # Instead of "close" as stated in the above link we send an empty value. # Else all keepalive connections will not work. map $http_upgrade $connection_upgrade {
default upgrade ; '' "" ; } # Redirect HTTP to HTTPS server { listen 80 proxy_protocol ; # <---
listen [::]: 80 proxy_protocol ; # <---
server_name shared.example.tld ; return 301 https:// $host$request_uri ; } server { listen 443 ssl proxy_protocol ; # <---
listen [::]: 443 ssl proxy_protocol ; # <---
http2 on ; server_name shared.example.tld ; # Specify SSL Config when needed #ssl_certificate /path/to/certificate/letsencrypt/live/shared.example.tld/fullchain.pem; #ssl_certificate_key /path/to/certificate/letsencrypt/live/shared.example.tld/privkey.pem; #ssl_trusted_certificate /path/to/certificate/letsencrypt/live/shared.example.tld/fullchain.pem; client_max_body_size 525M ; ## Using a Sub Path Config # Path to the root of your installation # Be sure to DO ADD a trailing /, else you will experience issues # But only for this location, all other locations should NOT add this. location /vault/ { proxy_http_version 1.1 ; proxy_set_header Upgrade $http_upgrade ; proxy_set_header Connection $connection_upgrade ; proxy_set_header Host $host ; proxy_set_header X-Real-IP $remote_addr ; proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for ; proxy_set_header X-Forwarded-Proto $scheme ; proxy_pass http ://vaultwarden-default ; } }
Apache (by fbartels)
Remember to enable mod_proxy_http , for example with: a2enmod proxy_http .
This requires Apache >= 2.4.47
If you access your vault via a public https address (which then gets redirected internally on your server to http and port 80 for example), you must enable RequestHeader set X-Forwarded-Proto "https" , otherwise your vault will load but not your data.
< VirtualHost *:443 >
SSLEngine on ServerName vaultwarden.example.tld
SSLCertificateFile ${SSLCERTIFICATE}
SSLCertificateKeyFile ${SSLKEY}
SSLCACertificateFile ${SSLCA}
${SSLCHAIN}
ErrorLog ${APACHE_LOG_DIR}/vaultwarden-error.log
CustomLog ${APACHE_LOG_DIR}/vaultwarden-access.log combined
ProxyPass / http:// 127 . 0 . 0 . 1 : 8000 / upgrade=websocket
ProxyPreserveHost On ProxyRequests Off RequestHeader set X-Real-IP %{ REMOTE_ADDR }s
# Add this line if your url attributes are reported back as http://... : # RequestHeader add X-Forwarded-Proto https
</ VirtualHost >
Apache in a sub-location (by @agentdr8 and @NoseyNick )
Modify your docker start-up to include the sub-location.
; Add the sub-location! Else this will not work!
DOMAIN=https://shared.example.tld/vault/
Remember to enable mod_proxy_http , for example with: a2enmod proxy_http . This requires Apache >= 2.4.47
SSLEngine on ServerName shared.example.tld
ErrorLog \${APACHE_LOG_DIR}/error.log
CustomLog \${APACHE_LOG_DIR}/access.log combined
< Location /vault/ > #adjust here if necessary
ProxyPass http:// 127 . 0 . 0 . 1 : 8000 /vault/ upgrade=websocket
ProxyPreserveHost On RequestHeader set X-Real-IP %{ REMOTE_ADDR }s
</ Location >
Traefik v2 (docker-compose example by hwwilliams, gzfrozen)
Traefik v1 labels migrated to Traefik v2
labels :
- traefik.enable=true
- traefik.docker.network=traefik
- traefik.http.routers.vaultwarden.rule=Host(`vaultwarden.domain.tld`)
- traefik.http.routers.vaultwarden.service=vaultwarden
- traefik.http.services.vaultwarden.loadbalancer.server.port=80
Migrated labels plus HTTP to HTTPS redirect
These labels assume that the entrypoints defined in Traefik for port 80 and 443 are 'web' and 'websecure' respectively.
These labels also assume you already have a default certificates resolver defined in Traefik.
- traefik.http.middlewares.redirect-https.redirectScheme.scheme=https
- traefik.http.middlewares.redirect-https.redirectScheme.permanent=true
- traefik.http.routers.vaultwarden-https.rule=Host(`vaultwarden.domain.tld`)
- traefik.http.routers.vaultwarden-https.entrypoints=websecure
- traefik.http.routers.vaultwarden-https.tls=true
- traefik.http.routers.vaultwarden-https.service=vaultwarden
- traefik.http.routers.vaultwarden-http.rule=Host(`vaultwarden.domain.tld`)
- traefik.http.routers.vaultwarden-http.entrypoints=web
- traefik.http.routers.vaultwarden-http.middlewares=redirect-https
- traefik.http.routers.vaultwarden-http.service=vaultwarden
HAproxy (by @BlackDex )
Add these lines to your haproxy configuration.
frontend vaultwarden bind 0.0.0.0:80 default_backend vaultwarden_http
backend vaultwarden_http # Enable compression if you want # compression algo gzip # compression type text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript # Vaultwarden does not support the forwarded header, but you can enable it # option forward # Add the x-forwarded-for header option forwardfor # Set the Source IP in the `X-Real-IP` header http-request set-header X-Real-IP %[src] # Send the traffic to the local instance server vwhttp 127.0.0.1:8000 alpn http/ 1.1
HAproxy Kubernetes Ingress (by @devinslick )
Controller installation details can be found here: https://www.haproxy.com/documentation/kubernetes-ingress/community/installation/on-prem/
Note that the CF-Connecting-IP header is only required if you use cloudflare
Add the following resource definition:
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
name: vaultwarden
namespace: default
annotations:
haproxy.org/forwarded-for: "true"
haproxy.org/compression-algo: "gzip"
haproxy.org/compression-type: "text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript"
haproxy.org/http2-enabled: "true"
spec:
ingressClassName: haproxy
tls:
- hosts:
- vaultwarden.example.tld
rules:
- host: vaultwarden.example.tld
http:
paths:
- path: /
pathType: Prefix
backend:
service:
name: vaultwarden-http
port:
number: 80
Istio k8s (by @asenyaev )
apiVersion: networking.istio.io/v1beta1
kind: Gateway
name: vaultwarden-gateway
namespace: vaultwarden
selector:
istio: ingressgateway-internal # use Istio default gateway implementation
servers:
- vw.k8s.prod
name: http
protocol: HTTP
httpsRedirect: true
name: https-443
number: 443
protocol: HTTPS
mode: SIMPLE
credentialName: vw-k8s-prod-tls
---
kind: VirtualService
name: vaultwarden-vs
hosts:
gateways:
- vaultwarden-gateway
- match:
- uri:
prefix: /
route:
- destination:
host: vaultwarden
CloudFlare Tunnel (by @calvin-li-developer )
docker-compose.yml :
version : ' 3 ' services :
vaultwarden :
container_name : vaultwarden image : vaultwarden/server:latest restart : unless-stopped environment :
DOMAIN : " https://vaultwarden.example.tld " # Your domain; vaultwarden needs to know it's https to work properly with attachments volumes :
- ./vw-data:/data networks :
- vaultwarden-network cloudflared :
image : cloudflare/cloudflared:2024.1.2 container_name : vaultwarden-cloudflared restart : unless-stopped read_only : true volumes :
- ./cloudflared-config:/root/.cloudflared/ command : [ "tunnel", "run", "${TUNNEL_ID}" ] user : root depends_on :
- vaultwarden networks :
- vaultwarden-network networks :
vaultwarden-network :
name : vaultwarden-network external : false
Contents in cloudflared-config folder:
config.yml aaaaa-bbbb-cccc-dddd-eeeeeeeee.json
Please use this guide to figure out the contents/values below for your cloudflare account.
Note: aaaaa-bbbb-cccc-dddd-eeeeeeeee is just a random tunnelID please use a real ID.
config.yml :
tunnel: aaaaa-bbbb-cccc-dddd-eeeeeeeee
credentials-file: /root/.cloudflared/aaaaa-bbbb-cccc-dddd-eeeeeeeee.json
originRequest:
noHappyEyeballs: true
disableChunkedEncoding: true
noTLSVerify: true
ingress:
- hostname: vaultwarden.example.tld # change to your domain
service: http_status:404
path: admin
service: http://vaultwarden
- service: http_status:404
aaaaa-bbbb-cccc-dddd-eeeeeeeee.json :
{"AccountTag":"changeme","TunnelSecret":"changeme","TunnelID":"aaaaa-bbbb-cccc-dddd-eeeeeeeee"}
Pound
Alive 15
ListenHTTP
Port 80
xHTTP 3
HeadRemove "X-Forwarded-For"
Service
Host "vaultwarden.example.tld"
Redirect 301 "https://vaultwarden.example.tld"
End
ListenHTTPS
Port 443
Cert "/path/to/certificate/letsencrypt/live/vaultwarden.example.tld/fullchain.pem"
AddHeader "Front-End-Https: on"
RewriteLocation 0
HeadRemove "X-Forwarded-Proto"
AddHeader "X-Forwarded-Proto: https"
BackEnd
Address 127.0.0.1
Port 8000
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
Troubleshooting
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
Using an alternate base dir (subdir/subpath)
HTTPS
Enabling HTTPS
Running a private vaultwarden instance with Let's Encrypt certs
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
