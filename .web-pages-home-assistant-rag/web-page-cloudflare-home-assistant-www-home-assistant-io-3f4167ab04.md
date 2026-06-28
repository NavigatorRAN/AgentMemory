---
source_url: "https://www.home-assistant.io/integrations/cloudflare"
final_url: "https://www.home-assistant.io/integrations/cloudflare"
canonical_url: "https://www.home-assistant.io/integrations/cloudflare/"
source_handle: "web:www-home-assistant-io:3f4167ab0442"
source_section: "integrations-cloudflare"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "0fcdb31f8d4b0f0fc9742958ab96932b260e1b2d8d210153750ffda97f5b515a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Cloudflare - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cloudflare
- Final URL: https://www.home-assistant.io/integrations/cloudflare
- Canonical URL: https://www.home-assistant.io/integrations/cloudflare/
- Fetched at: 2026-06-28T02:34:13Z
- Content type: text/html; charset=UTF-8

## Description

Automatically update your Cloudflare DNS records.

## Extracted Text

On this page
Requirements
Configuration
Additional information
Usage of external service
Limitations
With the Cloudflare integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , you can keep your Cloudflare DNS records up to date.
The integration runs every hour, but can also be triggered by running the cloudflare.update_records action .
The setup requires an API Token created with Zone:Zone:Read and Zone:DNS:Edit permissions for all zones in your account.
An easy way to create this is to start with the “Edit zone DNS” template then add Zone:Zone:Read to the permissions.
Cloudflare API Tokens Guide
To add the Cloudflare service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Cloudflare .
Follow the instructions on screen to complete the setup.
This integration uses the whoami service from home-assistant/services.home-assistant.io to set the public IP address.
Unusable TLDs
Due to a limitation in the Cloudflare API, you cannot use this integration with any of the following TLD’s:
.cf
.ga
.gq
.ml
.tk
Record types
This integration can only update A records.
Zones
This integration can only have 1 instance and manage 1 Zone/TLD.
Reconfiguration
This integration must be deleted and re-added to change the Zone and A record selection.
You cannot view which records were selected or view the API Token once the integration is configured.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cloudflare service was introduced in Home Assistant 0.74, and it's used by
3543 active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ludeeus
@ctalkington
Categories
Network
Back to top
