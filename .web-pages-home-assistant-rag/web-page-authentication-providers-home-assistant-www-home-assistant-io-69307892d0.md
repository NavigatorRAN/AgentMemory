---
source_url: "https://www.home-assistant.io/docs/authentication/providers"
final_url: "https://www.home-assistant.io/docs/authentication/providers"
canonical_url: "https://www.home-assistant.io/docs/authentication/providers/"
source_handle: "web:www-home-assistant-io:69307892d03e"
source_section: "docs-authentication"
collection: "home-assistant-docs"
doc_type: "code-documentation"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "27840d0f1aab5d3a23ebadf33292f5c56a2e4483bd853d707593aab5e455ebcd"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "code-docs"
---

# Authentication providers - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/authentication/providers
- Final URL: https://www.home-assistant.io/docs/authentication/providers
- Canonical URL: https://www.home-assistant.io/docs/authentication/providers/
- Fetched at: 2026-06-28T02:20:39Z
- Content type: text/html; charset=UTF-8

## Description

Guide on configuring different authentication providers.

## Extracted Text

On this page
Configuring authentication providers
To configure authentication providers
List of available authentication providers
Home Assistant authentication provider
Trusted networks
Command line
Related topics
An authentication provider is the method Home Assistant uses to verify your identity when you log in. It determines how you prove who you are: by entering a username and password, by connecting from a trusted network, or by using an external command.
Home Assistant comes with a built-in authentication provider enabled by default. Most people never need to change this. You only need to configure auth_providers manually if you want to use an additional method, such as skipping the login prompt on your home network.
If you want to use more than one authentication provider, or want to use specific ones, you can change the configuration.
Important
Risk of being locked out due to missing authentication provider
Adding auth_providers to configuration.yaml disables every provider not listed. A typo or missing entry can block all access to Home Assistant. There is no way to recover through the UI. You need direct file system access to the configuration.yaml to fix it.
To avoid being locked out due to missing authentication provider:
Always include type: homeassistant as a fallback in your auth_providers list.
Risk of unauthenticated access on your local network due to missing authentication provider
Using only trusted_networks without type: homeassistant as a fallback means anyone on your trusted network can log in by selecting a username. No password is required.
To avoid unauthenticated access on your local network due to missing authentication provider:
Always include type: homeassistant as a fallback authentication provider.
Open your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
For information on how to access and edit the configuration file, see Editing configuration.yaml .
Under homeassistant: , add an auth_providers block and list every authentication provider you want to use.
Any provider not listed will be disabled.
See List of available authentication providers .
Important: to avoid unauthenticated access on your local network and to keep password-based login available, always include type: homeassistant .
Example:
homeassistant : auth_providers : - type : homeassistant - type : trusted_networks trusted_networks : - 192.168.0.0/24
If you are moving configuration to packages, keep the auth_providers configuration in configuration.yaml . It cannot be moved to a package file.
Restart Home Assistant to apply the changes.
Home Assistant has three built-in authentication providers:
Home Assistant : the default provider, using a username and password stored locally.
Trusted networks : skips the login prompt for connections from specified IP addresses.
Command line : delegates authentication to an external shell command.
This is the default authentication provider. The first user created is designated as the owner and can create other users.
User details are stored in the [your config]/.storage directory. All passwords are stored hashed and with a salt, making it almost impossible for an attacker to figure out the password even if they have access to the file.
Users can be managed in Home Assistant by the owner. Select Settings > People and open the Users tab.
This is the entry in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] for the Home Assistant authentication provider:
homeassistant : auth_providers : - type : homeassistant
If you don’t specify any auth_providers section in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file then this provider will be set up automatically.
The trusted networks authentication provider defines a range of IP addresses for which no authentication will be required (also known as “allowlisting”). For example, you can allowlist your local network so you won’t be prompted for a password if you access Home Assistant from inside your home.
When you log in from one of these networks, you will be asked which user account to use and won’t need to enter a password.
Note
The multi-factor authentication module will not participate in the login process if you are using this authentication provider.
You cannot trust a network that you are using in any trusted_proxies . The trusted_networks authentication will fail with the message: Your computer is not allowed
Here is an example in configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] to set up Trusted Networks:
homeassistant : auth_providers : - type : trusted_networks trusted_networks : - 192.168.0.0/24 - fd00::/8
Configuration Variables
Looking for your configuration file?
trusted_networks list Required
A list of IP addresses or an IP network you want allowlisted. It accepts both IPv4 and IPv6 IP address or network
trusted_users map ( Optional )
You can also assign which users are available to select when user access login page from certain IP address or network.
USER_ID list | string ( Optional )
List of user ids available to select on this IP address or network.
allow_bypass_login boolean ( Optional , default: false )
You can bypass login page if you have only one user available for selection.
Trusted users examples
homeassistant : auth_providers : - type : trusted_networks trusted_networks : - 192.168.0.0/24 - 192.168.10.0/24 - fd00::/8 trusted_users : 192.168.0.1 : user1_id 192.168.0.0/24 : - user1_id - user2_id " fd00::/8" : - user1_id - group : system-users
First note, for trusted_users configuration you need to use user id .
To find the user ID, in your browser, make sure the URL of your Home Assistant ends in config/users/ .
For example: homeassistant:8123/config/users .
Select the user from the list, and copy the ID.
For example: acbbff56461748718f3650fb914b88c9 .
The trusted_users configuration will not validate the existence of the user, so please make sure you have put in the correct user id.
A trusted user with an IPv6 address must put the IPv6 address in quotes as shown.
In the above example, if user try to access Home Assistant from 192.168.0.1, they will have only one user available to choose. They will have two users available if access from 192.168.0.38 (from 192.168.0.0/24 network). If they access from 192.168.10.0/24 network, they can choose from all available users (non-system and active users).
Specially, you can use group: GROUP_ID to assign all users in certain user group to be available to choose. Group and users can be mix and match.
Skip login page examples
This is a feature to allow you to bring back some of the experience before the user system was implemented. You can directly jump to the main page if you are accessing from trusted networks, the allow_bypass_login is on, and you have ONLY ONE available user to choose from in the login form.
If you allow bypass login then your cookie will not be stored and every time you refresh the page in Home Assistant a new login will be created. This is because bypassing the login does not give you the option to save the login.
# assuming you have only one non-system user homeassistant : auth_providers : - type : trusted_networks trusted_networks : - 192.168.0.0/24 - 127.0.0.1 - ::1 allow_bypass_login : true - type : homeassistant
Assuming you only created the owner during the onboarding process and have not created any other users, this configuration lets you directly access the Home Assistant main page from your internal network (192.168.0.0/24) or from localhost (127.0.0.1). If you get a login abort error, you can use the Home Assistant authentication provider to log in when accessing your Home Assistant instance from outside your network.
The order of auth_providers is critical as authentication providers are evaluated top to bottom.
To enable skip login as intended, the trusted_networks provider must be listed before the homeassistant provider. If type: homeassistant is configured first, Home Assistant will immediately present the login page and the skip login logic will never be reached, even if the client is on a trusted network.
The command line authentication provider executes a configurable shell command to perform user authentication. Two environment variables, username and password , are passed to the command. Access is granted when the command exits successfully (with exit code 0).
This provider can be used to integrate Home Assistant with arbitrary external authentication services, from plaintext databases over LDAP to RADIUS.
Here is a configuration example:
homeassistant : auth_providers : - type : command_line command : /absolute/path/to/command # Optionally, define a list of arguments to pass to the command. #args: ["--first", "--second"] # Uncomment to enable parsing of meta variables (see below). #meta: true
When meta: true is set in the authentication provider’s configuration, your command can write some variables to standard output to populate the user account created in Home Assistant with additional data. These variables have to be printed in the form:
name = John Doe
group = system-users
local_only = true
Leading and trailing whitespace, as well as lines starting with # are ignored. The following variables are supported. More may be added in the future.
name : The real name of the user to be displayed in their profile.
group : The user group uses the value system-admin for administrator (this is the default) or system-users for regular users.
local_only : The user can only log in from the local network if you set the value to true . If you do not define this variable, the user can log in from anywhere.
Stderr is not read at all and just passed through to that of the Home Assistant process, hence you can use it for status messages or suchlike.
Any leading and trailing whitespace is stripped from usernames before they’re passed to the configured command. For instance, “ hello “ will be rewritten to just “hello”.
For now, meta variables are only respected the first time a particular user is authenticated. Upon subsequent authentications of the same user, the previously created user object with the old values is reused.
Configuration.yaml file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Authentication
Auth providers
Multi-factor authentication
I'm locked out
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
