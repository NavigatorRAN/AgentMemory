# Remote access to Home Assistant - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/remote
- Final URL: https://www.home-assistant.io/docs/configuration/remote
- Canonical URL: https://www.home-assistant.io/docs/configuration/remote/
- Fetched at: 2026-06-28T02:21:33Z
- Content type: text/html; charset=UTF-8

## Description

There are different ways to reach your Home Assistant from outside your home network. The recommended option is Home Assistant Cloud, which works without exposing anything to the internet.

## Extracted Text

On this page
Home Assistant Cloud
VPN
Port forwarding
Adding a remote URL to Home Assistant
Related topics
Related links
By default, your Home Assistant only listens on your local network, which keeps things private and secure. If you want to reach it from outside your home, for example to control your devices while you are at work or on holiday, you have a few options.
The easiest and safest option for most people is Home Assistant Cloud . Other options are listed further down for those who prefer to set things up themselves.
Tip
Before exposing Home Assistant to the internet, follow the securing checklist .
Home Assistant Cloud gives you remote access to your Home Assistant from anywhere, without opening any ports on your router and without exposing your home network to the internet. Setup takes a single toggle in the user interface.
A unique remote URL is generated for you, and all traffic between your device and your home is encrypted automatically. Your Home Assistant Cloud subscription also helps fund the development of Home Assistant itself.
A secure way to remotely access your Home Assistant is to use a Virtual Private Network (VPN) service such as Tailscale or ZeroTier One .
A VPN connection needs to be established before you can connect to your Home Assistant from outside your local network. The VPN makes this connection secure. When using the Home Assistant Companion app (such as on a mobile device), without this connection, your sensors will not update in Home Assistant.
Set up port forwarding (for any port) from your router to port 8123 on the computer that is hosting Home Assistant. General instructions on how to do this can be found by searching <router model> port forwarding instructions . You can use any free port on your router and forward that to port 8123.
A problem with making a port accessible is that some Internet Service Providers only offer dynamic IPs. This can cause you to lose access to Home Assistant while away. You can solve this by using a free Dynamic DNS service like DuckDNS .
If you cannot access your Home Assistant installation remotely, remember to check if your ISP provides you with a dedicated IP, instead of one shared with other users via a CG-NAT . This is becoming fairly common nowadays due to the shortage of IPv4 addresses. Some, if not most ISPs will require you to pay an extra fee to be assigned a dedicated IPv4 address.
Caution
Just putting a port up is not secure. You should definitely consider encrypting your traffic if you are accessing your Home Assistant installation remotely. For details, please check the set up encryption using Let’s Encrypt blog post or this detailed guide to using Let’s Encrypt with Home Assistant.
To set the URL under which your Home Assistant can be accessed from outside your local network, follow these steps:
Go to Settings > System > Network .
Under Home Assistant URL , in the Internet field, enter the external URL that you previously set up for your instance.
If you use Home Assistant Cloud, you can turn on Use Home Assistant Cloud instead, and your Nabu Casa URL is used automatically.
Select Save .
Securing your instance
Home Assistant Cloud - remote access
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
Home information
People and user configuration
Customizing entities
Remote access to Home Assistant
Securing your Home Assistant
Storing secrets in YAML
YAML syntax
The configuration.yaml file
Troubleshooting configuration
Splitting up the configuration
Packages
Events
State and state object
Entities and domains
Entity component platform options
Authentication
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
