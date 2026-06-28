---
source_url: "https://www.home-assistant.io/integrations/dnsip"
final_url: "https://www.home-assistant.io/integrations/dnsip"
canonical_url: "https://www.home-assistant.io/integrations/dnsip/"
source_handle: "web:www-home-assistant-io:17cc737107b7"
source_section: "integrations-dnsip"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "418e7df295d348f3d13aabad24be2fa15ed4e338cbd3706cfee47185b0540e42"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# DNS IP - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/dnsip
- Final URL: https://www.home-assistant.io/integrations/dnsip
- Canonical URL: https://www.home-assistant.io/integrations/dnsip/
- Fetched at: 2026-06-28T02:37:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a DNS IP sensor into Home Assistant.

## Extracted Text

On this page
Configuration
Options
The DNS IP integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will expose an IP address, fetched via DNS resolution (every 2 minutes), as its value. It provides both IPv4 and IPv6 lookup as separate sensors depending on accessibility to resolvers.
When you enable the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] with the default value, it will query the OpenDNS nameservers with the hostname myip.opendns.com , which will resolve to your external/public IP address.
If you specify a hostname , a regular DNS lookup will be performed, providing you the IP the hostname resolves to. If your hostname resolves to multiple IP addresses, the lowest IP will be returned as the state. The first 10 IPs will be returned in ascending order in the ip_addresses attribute.
To add the DNS IP service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select DNS IP .
Follow the instructions on screen to complete the setup.
To define options for DNS IP, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of DNS IP are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Resolver
You may override the default IPV4 and IPV6 nameservers that are being used by setting any nameserver IP address you like, for example 1.1.1.1 (IPV4) or 2606:4700:4700::1111 (IPV6).
Port
You may override the default DNS port of 53 . This may be useful to bypass DNS filtering or redirection.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The DNS IP service was introduced in Home Assistant 0.40, and it's used by
1.2% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
Network
Back to top
