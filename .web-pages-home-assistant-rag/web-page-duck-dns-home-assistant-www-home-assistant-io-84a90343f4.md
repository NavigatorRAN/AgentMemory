---
source_url: "https://www.home-assistant.io/integrations/duckdns"
final_url: "https://www.home-assistant.io/integrations/duckdns"
canonical_url: "https://www.home-assistant.io/integrations/duckdns/"
source_handle: "web:www-home-assistant-io:84a90343f4ea"
source_section: "integrations-duckdns"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0c4ed269fc98694c8b5327b0e7fa2e021f58fc9005e4fc6c4dba898fef4818e8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Duck DNS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/duckdns
- Final URL: https://www.home-assistant.io/integrations/duckdns
- Canonical URL: https://www.home-assistant.io/integrations/duckdns/
- Fetched at: 2026-06-28T02:38:23Z
- Content type: text/html; charset=UTF-8

## Description

Keep your public IP address in sync with your Duck DNS subdomain.

## Extracted Text

On this page
About Duck DNS
How You Can Use This Integration
Prerequisites
Configuration
Configuration parameters
List of actions
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Duck DNS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] keeps your Duck DNS subdomain in sync with your current public IP address.
Duck DNS is a free dynamic DNS service that lets you assign a custom subdomain under duckdns.org to the public IP address used by your router. This is especially useful when your internet service provider assigns IP addresses dynamically, causing them to change over time. Duck DNS ensures your chosen subdomain always points to the correct IP.
Note
If you are running the Duck DNS app for Home Assistant (formerly known as Duck DNS add-on), this integration is not required. The app will keep your IP updated with Duck DNS.
Keep your Duck DNS subdomain automatically in sync with your public IP.
Update ACME DNS-01 challenges for automated SSL certificate validation.
To set up the integration, you need your Duck DNS subdomain and token. You can find these on the Duck DNS homepage after signing in. If you don’t have an account, sign up using your preferred method (for example, GitHub or Google), then create a new subdomain.
To add the Duck DNS service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Duck DNS .
Follow the instructions on screen to complete the setup.
domain
Your Duck DNS subdomain (without the .duckdns.org suffix).
access_token
Your Duck DNS access token. Log in to the site to get one.
The Duck DNS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Set TXT ( duckdns.set_txt )
Sets the TXT record of your Duck DNS subdomain.
For an overview of every action across all integrations, see the actions reference .
This integration syncs your public IP with your Duck DNS subdomain every 5 minutes.
Duck DNS errors do not clearly indicate authentication failures. If you have recreated your token, make sure to update your Duck DNS configuration entry with the new token.
The integration updates your Duck DNS subdomain periodically rather than continuously monitoring your public IP. After a long outage, the update interval is increased to reduce unnecessary requests. Once your internet connection is restored, it may take up to 30 minutes for your subdomain to reflect your current IP.
The Duck DNS integration relies on an active internet connection to update the DNS record of your subdomain. If you encounter issues, verify that your network connection is stable and the Duck DNS service is reachable. Additionally, the Duck DNS service itself may experience downtime, whether unexpected or due to scheduled maintenance.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ).
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Duck DNS service was introduced in Home Assistant 0.55, and it's used by
3173 active installations.
Its IoT class is Cloud Polling.
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
