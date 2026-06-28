---
source_url: "https://www.home-assistant.io/integrations/cert_expiry"
final_url: "https://www.home-assistant.io/integrations/cert_expiry"
canonical_url: "https://www.home-assistant.io/integrations/cert_expiry/"
source_handle: "web:www-home-assistant-io:eeb1a4d91c2e"
source_section: "integrations-cert-expiry"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "2eb0bd86bfee20e90d4e8cdce354c34d62d09d174c8c40757e1f923687e9b231"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Certificate Expiry - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cert_expiry
- Final URL: https://www.home-assistant.io/integrations/cert_expiry
- Canonical URL: https://www.home-assistant.io/integrations/cert_expiry/
- Fetched at: 2026-06-28T02:33:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up HTTPS (SSL) certificate expiry sensors within Home Assistant.

## Extracted Text

On this page
Configuration
Supported functionality
Sensors
Data updates
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Certificate Expiry integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] monitors the expiration date of an SSL/TLS certificate for a configured host. This is useful for keeping track of when certificates need to be renewed, for example, for your own website or Home Assistant’s remote access certificate.
To add the Certificate Expiry service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Certificate Expiry .
Follow the instructions on screen to complete the setup.
Host
The hostname to check the certificate for, for example, home-assistant.io . Do not include https:// or a path to a file on your computer.
Port
The port to connect to. The default is 443 .
The integration creates a single sensor for each configured host.
Certificate expiry
Description : The expiration date and time of the host’s SSL/TLS certificate.
Device class : Timestamp. The state is a UTC datetime, not a number of days. The Home Assistant UI might display it as “in X days,” but this is only a display format.
The sensor also provides the following attributes:
is_valid : Whether the certificate has been validated ( true or false ).
error : A human-readable error description if the certificate is considered invalid, or None when the certificate is valid.
Tip
To calculate the number of days until the certificate expires in a template or automation, use as_datetime() to convert the state and subtract now() . For example:
value_template : > {{ (as_datetime(states('sensor.cert_expiry_timestamp_example_com')) - now()).days }}
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the certificate every 12 hours. To trigger an immediate check, use the homeassistant.update_entity action .
The integration only provides the certificate expiration date. It does not provide the issue date, certificate lifetime, renewal window, or any ACME-specific information.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Certificate Expiry service was introduced in Home Assistant 0.44, and it's used by
1.2% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jjlawren
Categories
Network
Back to top
