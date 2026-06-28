---
source_url: "https://www.home-assistant.io/integrations/namecheapdns"
final_url: "https://www.home-assistant.io/integrations/namecheapdns"
canonical_url: "https://www.home-assistant.io/integrations/namecheapdns/"
source_handle: "web:www-home-assistant-io:4f8ab16bfb68"
source_section: "integrations-namecheapdns"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "a4be1c30e626b2fdd10159bc38dbe70c9b9d50ad611bb624c7accf607fa55873"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Namecheap DynamicDNS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/namecheapdns
- Final URL: https://www.home-assistant.io/integrations/namecheapdns
- Canonical URL: https://www.home-assistant.io/integrations/namecheapdns/
- Fetched at: 2026-06-28T03:02:14Z
- Content type: text/html; charset=UTF-8

## Description

Keep your namecheap dynamic DNS up to date

## Extracted Text

On this page
Prerequisites
About Namecheap
Configuration
Configuration parameters
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related topics
With the Namecheap DynamicDNS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] you can automatically update your dynamic DNS entry hosted by Namecheap’s FreeDNS or PremiumDNS services.
Before setting up the integration, you need the following elements:
Have a Namecheap account .
The host ( @ to update the root domain) and the domain you want to update, as well as the Dynamic DNS password for the domain. You can find the Dynamic DNS password in your Namecheap account under Domain List > Manage > Advanced DNS > Dynamic DNS .
Namecheap is a domain registrar and web hosting provider that offers free and paid DNS services, including a dynamic DNS update service, for domains registered both with Namecheap and with other registrars.
To add the Namecheap DynamicDNS service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Namecheap DynamicDNS .
Follow the instructions on screen to complete the setup.
host
The host to update (‘home’ for home.example.com). Use ‘@’ to update the root domain
domain
The domain to update (‘example.com’)
password
Dynamic DNS password for the domain
See Namecheap’s How do I set up a Host for Dynamic DNS? guide for further instructions.
This integration syncs your public IP with your (sub)domain’s DNS record every 5 minutes.
Namecheap only supports updating IPv4 addresses.
The integration updates your (sub)domain’s DNS record periodically rather than continuously monitoring your public IP.
The Namecheap DynamicDNS integration relies on an active internet connection to update the DNS record of your (sub)domain. If you encounter issues, verify that your network connection is stable and the Namecheap DynamicDNS service is reachable. Additionally, the Namecheap DynamicDNS service itself may experience downtime, whether unexpected or due to scheduled maintenance.
In any case, before reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ).
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Namecheap DynamicDNS service was introduced in Home Assistant 0.56, and it's used by
124 active installations.
Its IoT class is Cloud Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tr4nt0r
Categories
Network
Back to top
