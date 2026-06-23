# Enabling SSO support using OpenId Connect · dani-garcia/vaultwarden Wiki · GitHub

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://github.com/dani-garcia/vaultwarden/wiki/Enabling-SSO-support-using-OpenId-Connect
- Final URL: https://github.com/dani-garcia/vaultwarden/wiki/Enabling-SSO-support-using-OpenId-Connect
- Fetched at: 2026-06-23T13:49:51Z
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
Enabling SSO support using OpenId Connect
Jump to bottom Edit New page
Jascha edited this page Apr 28, 2026
·
25 revisions
To use an external source of authentication your SSO will need to support OpenID Connect :
An OpenID Connect Discovery endpoint should be available
Client authentication will be done using Id and Secret.
A master password will still be required and not controlled by the SSO (depending on your point of view this might be a feature ;).
This introduces another way to control who can use the vault without having to use invitation or using an LDAP.
Configuration
The following configurations are available
SSO_ENABLED : Activate the SSO
SSO_ONLY : disable email+Master password authentication
SSO_SIGNUPS_MATCH_EMAIL : On SSO Signup if a user with a matching email already exists make the association (default true )
SSO_ALLOW_UNKNOWN_EMAIL_VERIFICATION : Allow unknown email verification status (default false ). Allowing this with SSO_SIGNUPS_MATCH_EMAIL open potential account takeover.
SSO_AUTHORITY : the OpenID Connect Discovery endpoint of your SSO
The URL must not include the /.well-known/openid-configuration
${SSO_AUTHORITY}/.well-known/openid-configuration must return a JSON document: https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfigurationResponse (with an HTTP status code 200 OK !)
SSO_AUTHORITY has to match the exact value of the issuer field that is returned by that JSON (so take the issuer value of the file if you are unsure whether to include a trailing slash or not).
SSO_SCOPES : Optional, allow to override scopes if needed (default profile email , openid is implicit)
SSO_AUTHORIZE_EXTRA_PARAMS : Optional, allow to add extra parameter to the authorize redirection (default "" )
SSO_PKCE : Activate PKCE for the Auth Code flow (default true ).
SSO_AUDIENCE_TRUSTED : Optional, Regex to trust additional audience for the IdToken ( client_id is always trusted). Use single quote when writing the regex: '^$' .
SSO_CLIENT_ID : Client Id
SSO_CLIENT_SECRET : Client Secret
SSO_MASTER_PASSWORD_POLICY : Optional Master password policy ( enforceOnLogin is not supported, format: {"minComplexity:3,"minLength":12,"requireLower":false,"requireNumbers":false,"requireSpecial":false,"requireUpper":false} ).
SSO_AUTH_ONLY_NOT_SESSION : Enable to use SSO only for authentication not session lifecycle
SSO_CLIENT_CACHE_EXPIRATION : Cache calls to the discovery endpoint, duration in seconds, 0 to disable (default 0 );
SSO_DEBUG_TOKENS : Log all tokens for easier debugging (default false , LOG_LEVEL=debug or LOG_LEVEL=info,vaultwarden::sso=debug need to be set)
The callback URL is automatically generated from the DOMAIN . If you set DOMAIN=https://vaultwarden.example.tld your callback URL will be https://vaultwarden.example.tld/identity/connect/oidc-signin .
To properly populate the account name you need to configure your IdP to provide the Display Name as claim preferred_username
If you are using a private certificate authority or self signed certificates on your SSO authority, you need to add your root certificate to /etc/ssl/certs or point the SSL_CERT_DIR or SSL_CERT_FILE environment variables to it.
Account and Email handling
When logging in with SSO an identifier ( {iss}/{sub} claims from the IdToken) is saved in a separate table ( sso_users ).
This is used to link to the SSO provider identifier without changing the default user uuid . This is needed because:
Storing the SSO identifier is important to prevent account takeover due to email change.
We can't use the identifier as the User uuid since it's way longer (Max 255 chars for the sub part, cf spec ).
We want to be able to associate existing accounts based on their email but only when a user logs in for the first time (controlled by SSO_SIGNUPS_MATCH_EMAIL ).
We need to be able to associate with existing stub accounts, such as the one created when inviting a user to an org (association is possible only if a user does not have a private key).
Additionally:
Signup will be blocked if the Provider reports the email as unverified .
Changing the email needs to be done by the user since it requires updating the key .
On login if the email returned by the provider is not the one saved an email will be sent to the user to ask him to update it.
If set, SIGNUPS_DOMAINS_WHITELIST is applied on SSO signup and when attempting to change the email.
This means that if you ever need to change the provider URL or the provider itself; you'll have to first delete the association
then ensure that SSO_SIGNUPS_MATCH_EMAIL is activated to allow a new association.
To delete the association (this has no impact on the Vaultwarden user):
TRUNCATE TABLE sso_users;
On SSO_ALLOW_UNKNOWN_EMAIL_VERIFICATION
If your provider does not send the verification status of emails ( email_verified claim ) you need to activate this setting.
If set with SSO_SIGNUPS_MATCH_EMAIL=true (the default), then a user can associate with an existing, non-SSO account, even if they do not control the email address.
This allow a user to gain access to sensitive information but the master password is still required to read the passwords.
As such when using SSO_ALLOW_UNKNOWN_EMAIL_VERIFICATION it is recommended to disable SSO_SIGNUPS_MATCH_EMAIL .
If you need to associate non SSO users try to keep both settings activated for the shortest time possible.
Client Cache
By default the client cache is disabled since it can cause issues with the signing keys.
This means that the discovery endpoint will be called again each time we need to interact with the provider (generating authorize_url, exchange the authorize code, refresh tokens).
This is suboptimal so the SSO_CLIENT_CACHE_EXPIRATION allows you to configure an expiration that should work for your provider.
As a protection against a misconfigured expiration if the validation of the IdToken fails then the client cache is invalidated (but you'll periodically have an unlucky user ^^).
Google example (Rolling keys)
If we take Google as an example checking the discovery endpoint response headers we can see that the max-age of the cache control is set to 3600 seconds. And the jwk_uri response headers usually contain a max-age with an even bigger value.
Combined with user feedback we can conclude that Google will roll the signing keys each week.
Setting the cache expiration too high has diminishing return but using something like 600 (10 min) should provide plenty benefits.
Rolling keys manually
If you want to roll the used key, first add a new one but do not immediately start signing with it.
Wait for the delay you configured in SSO_CLIENT_CACHE_EXPIRATION then you can start signing with it.
As mentioned in the Google example setting too high of a value has diminishing return even if you do not plan to roll the keys.
Keycloak
Default access token lifetime might be only 5min , set a longer value otherwise it will collide with Bitwarden front-end expiration detection which is also set at 5min .
At the realm level
Realm settings / Tokens / Access Token Lifespan to at least 10min ( accessTokenLifespan setting when using kcadm.sh ).
Realm settings / Sessions / SSO Session Idle/Max for the Refresh token lifetime
Or for a specific client in Clients / Client details / Advanced / Advanced settings you can find Access Token Lifespan and Client Session Idle/Max .
Server configuration:
SSO_AUTHORITY=https://${keycloak_domain}/realms/${realm_name}
SSO_SCOPES=openid profile email offline_access
SSO_CLIENT_ID
SSO_CLIENT_SECRET
NOTE: offline_access scope can be assigned by default at the client level in Clients / Client details / Client scopes or at the realm level in Realm settings / Client scopes , otherwise it must be requested explicitly via SSO_SCOPES in order for refresh tokens to work.
Testing
If you want to run a testing instance of Keycloak the Playwright docker-compose can be used.
More details on how to use it in README.md .
Auth0
Not working due to the following issue https://github.com/ramosbugs/openidconnect-rs/issues/23 (they appear not to follow the spec).
A feature flag is available ( oidc-accept-rfc3339-timestamps ) to bypass the issue but you will need to compile the server with it.
There is no plan at the moment to either always activate the feature nor make a specific distribution for Auth0.
Authelia
To obtain a refresh_token to be able to extend session you'll need to add the offline_access scope.
Config will look like:
Authentik
To change the tokens expiration go to Applications / Providers / Edit / Advanced protocol settings .
Starting with 2024.2 version you will need to add the offline_access scope and ensure it's selected in Applications / Providers / Edit / Advanced protocol settings / Scopes ( Doc ).
Server configuration should look like:
SSO_AUTHORITY=https://${authentik_domain}/application/o/${application_name}/ : trailing / is important
Troubleshooting
Failed to discover OpenID provider: Failed to parse server response :
First ensure that the Authority endpoint with /.well-known/openid-configuration appended is reachable from your Vaultwarden container.
Next check that the response contains `id_token_signing_alg_values_supported: ["RS256"]
If it returns HS256 instead then selecting the default signing key again should fix the issue.
Steps:
Open Authentik admin panel > Providers > Open your Vaultwarden provider
Click Edit > Change the Signing key to any of your keys
If unsure choose the built-in one from Authentik
Click Update
Retry
Failed to contact token endpoint: Parse(Error ... Invalid JSON web token: found 5 parts :
This error is probably due to an encrypted token (JWE), ensure that no encryption key is used.
Click Edit > Make sure Encryption Key is empty.
If Encryption Key is not empty : Select -------- in the dropdown.
Make sure not to touch the Signing Key , a valid certificate has to be selected
Casdoor
When creating the application you will need to select the Token format -> JWT-Standard . This should work since version v1.639.0 . (Tested with version v1.686.0 ).
Then configure your server with:
SSO_AUTHORITY=https://${provider_host}
GitLab
Create an application in your Gitlab Settings with
redirectURI : https://vaultwarden.example.tld/identity/connect/oidc-signin
Confidential : true
scopes : openid , profile , email
Then configure your server with
SSO_AUTHORITY=https://gitlab.com
Google Auth
Google Documentation .
By default without extra configuration you won´t have a refresh_token and session will be limited to 1h.
Configure your server with :
SSO_AUTHORITY=https://accounts.google.com
SSO_AUTHORIZE_EXTRA_PARAMS="access_type=offline&prompt=consent"
Kanidm
No special configuration required.
SSO_AUTHORITY=https://{AUTHORITY_DOMAIN}/oauth2/openid/${SSO_CLIENT_ID}
Microsoft Entra ID
Create an "App registration" in Entra ID following Identity | Applications | App registrations .
From the "Overview" of your "App registration", you'll need the "Directory (tenant) ID" for the SSO_AUTHORITY variable and the "Application (client) ID" as the SSO_CLIENT_ID value.
In "Certificates & Secrets" create an "App secret" , you'll need the "Secret Value" for the SSO_CLIENT_SECRET variable.
In "Authentication" add https://vaultwarden.example.tld/identity/connect/oidc-signin as "Web Redirect URI".
In "API Permissions" make sure you have profile , email and offline_access listed under "API / Permission name" ( offline_access is required, otherwise no refresh_token is returned, see https://github.com/MicrosoftDocs/azure-docs/issues/17134 ).
Only the v2 endpoint is compliant with the OpenID spec, see https://github.com/MicrosoftDocs/azure-docs/issues/38427 and https://github.com/ramosbugs/openidconnect-rs/issues/122 .
Your configuration should look like this:
SSO_AUTHORITY=https://login.microsoftonline.com/${Directory_ID}/v2.0 #tenant
SSO_SCOPES=openid profile offline_access User.Read
SSO_CLIENT_ID=${Application_ID} #client
SSO_CLIENT_SECRET=${Secret_Value}
Rauthy
To use a provider controlled session you will need to run Rauthy with DISABLE_REFRESH_TOKEN_NBF=true otherwise the server will fail when trying to read a not yet valid refresh_token ( Bitwarden clients will trigger a refresh even if the access_token is still valid. Details on rauthy side ). Alternative is to use the default session handling with SSO_AUTH_ONLY_NOT_SESSION=true .
No specific config needed when creating the Client.
SSO_AUTHORITY=http://${provider_host}/auth/v1
SSO_CLIENT_ID=${Client ID}
SSO_CLIENT_SECRET=${Client Secret}
SSO_AUTH_ONLY_NOT_SESSION=true Only needed if not running Rauthy with DISABLE_REFRESH_TOKEN_NBF=true
Slack
You will need to create an app in https://api.slack.com/apps/ .
It appears that the access_token returned is not in JWT format and an expiration date is not sent with it. As such you will need to use the default session lifecycle.
SSO_AUTHORITY=https://slack.com
SSO_CLIENT_ID=${Application Client ID}
SSO_CLIENT_SECRET=${Application Client Secret}
SSO_AUTH_ONLY_NOT_SESSION=true
Zitadel
Additionally Zitadel includes the Project id and the Client Id in the audience of the Id Token.
For the validation to work you will need to add the Resource Id as a trusted audience ( Client Id is trusted by default).
You can control the trusted audience with the config SSO_AUDIENCE_TRUSTED .
According to Zitadel#9200 , id_token passes a list of trusted audiences including the Project Id . If you end up having many trusted aud strings, SSO_AUDIENCE_TRUSTED , may become unmanageable. In such cases, SSO_AUDIENCE_TRUSTED: '^\d{18}$' (18 is the size of each string in aud list, it may differ depending on your Zitadel implementation) would help you but it's safe to individually add all the aud strings like SSO_AUDIENCE_TRUSTED: '^abcd|def|xyz$' .
Since zitadel#721 PKCE should work with client secret.
But older versions might have to disable it ( SSO_PKCE=false ).
SSO_AUDIENCE_TRUSTED='^${Project Id}$'
Session lifetime
Session lifetime is dependent on refresh token and access token returned after calling your SSO token endpoint (grant type authorization_code ).
If no refresh token is returned then the session will be limited to the access token lifetime.
Tokens are not persisted in the server but wrapped in JWT tokens and returned to the application (The refresh_token and access_token values returned by Vaultwardens /identity/connect/token endpoint).
Note that the server will always return a refresh_token for compatibility reasons with the web front and it presence does not indicate that a refresh token was returned by your SSO (But you can decode its value with https://jwt.io and then check if the token field contain anything).
With a refresh token present, activity in the application will trigger a refresh of the access token when it's close to expiration ( 5min in web client).
Additionally for certain action a token check is performed, if we have a refresh token we will perform a refresh otherwise we'll call the user information endpoint to check the access token validity.
Disabling SSO session handling
If you are unable to obtain a refresh_token or for any other reason you can disable SSO session handling and revert to the default handling.
You'll need to enable SSO_AUTH_ONLY_NOT_SESSION=true then access token will be valid for 2h and refresh token will allow for an idle time of 7 days (which can be indefinitely extended).
Debug information
Running with LOG_LEVEL=debug you'll be able to see information on token expiration.
Desktop Client
There is some issue to handle redirection from your browser (used for SSO login) to the application.
Chrome
Some user report having ( issues ).
Firefox
On Windows you'll be presented with a prompt the first time you log to confirm which application should be launched (But there is a bug at the moment you might end-up with an empty vault after login at the moment).
On Linux it's a bit more tricky.
First you'll need to add some config in about:config :
network.protocol-handler.expose.bitwarden =false
network.protocol-handler.external.bitwarden =true
If you have any doubt you can check mailto to see how it's configured.
The redirection will still not work since it appears that the association to an application can only be done on a link/click. You can trigger it with a dummy page such as:
data:text/html, < a href =" bitwarden:///dummy " > Click me to register Bitwarden </ a >
From now on the redirection should now work.
If you need to change the application launched you can now find it in Settings by using the search function and entering application .
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
Running a private vaultwarden instance with Let's Encrypt certs
Overview
Enabling admin page
SMTP configuration
Disable registration of new users
Disable invitations
Enabling WebSocket notifications
Enabling Mobile Client push notification
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
