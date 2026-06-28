---
source_url: "https://www.home-assistant.io/integrations/tedee"
final_url: "https://www.home-assistant.io/integrations/tedee"
canonical_url: "https://www.home-assistant.io/integrations/tedee/"
source_handle: "web:www-home-assistant-io:df6b9b342789"
source_section: "integrations-tedee"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "170325fe9254ec7e39cf996d11a35c2f0fe0cf9bb654491fc94fb710492fa21a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Tedee - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/tedee
- Final URL: https://www.home-assistant.io/integrations/tedee
- Canonical URL: https://www.home-assistant.io/integrations/tedee/
- Fetched at: 2026-06-28T03:21:10Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate your Tedee lock with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported devices
Binary sensors
Sensors
Possible use-cases
Automations
Automatically lock the door when the last person leaves home
Known Limitations
Removing the integration
To remove an integration instance from Home Assistant
Troubleshooting
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] interacts with your Tedee locks by communicating with the Tedee bridge through HTTP. The integration will communicate with your lock locally.
You will need the bridge to add your locks using this integration.
You need to have the local API and encrypted token enabled.
The bridge firmware needs to be at least version 2.2.18086 for push updates to work without errors.
Tip
If you do not own the bridge, you can still add your locks to Home Assistant through other ways, depending on your lock model, with a limited feature set:
Lock PRO: HomeKit device integration . Communication will happen over Bluetooth in that case
Lock GO and GO 2: Matter integration . In which case communication will happen over Thread
Note
The integration will try to configure webhooks to receive near-real-time push updates from your bridge about your lock state changes. For this to work properly, the bridge must be able to reach your Home Assistant instance. It will prefer the configured internal_url , so ensure this address is reachable from your bridge on your network. If communication through the webhooks is not possible, the integration will query for an update every 30 seconds.
To add the Tedee hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Tedee .
Follow the instructions on screen to complete the setup.
Host
The IP address of your bridge. You can find it in your router or in the Tedee app under Bridge Settings > Local API .
Local Access Token
The local access token for your bridge. You can find it in the Tedee app under Bridge Settings > Local API .
This integration supports
Tedee PRO
Tedee GO
Charging : indicates whether the battery is currently charging.
Pullspring enabled : indicates whether the pull spring setting is enabled.
Semi locked : indicates whether the lock is in a “semi-locked” position. “Semi-locked” means the lock has been turned manually and is between its normal end positions. The lock itself will be unavailable in this position.
Lock uncalibrated (disabled by default): Shows when the lock is in an “uncalibrated state”.
The lock.open service will only pull the spring if the lock is configured with “ auto pull-spring enabled ” in the tedee app. That is due to a limitation in tedee’s API.
The integration currently offers two sensors: A battery sensor, indicating the charge of your lock, and a “pull spring duration” sensor, indicating how long (in seconds) your latch will stay pulled after a pull operation (if supported).
Auto lock/unlock the door based on presence
Control your lock from smart home panels
Get alerts when battery is low
Get started quickly with these automation examples.
Example YAML configuration
alias : Lock door when last person leaves description : Lock the door when last person leaves the home mode : single triggers : - trigger : state entity_id : - zone.home to : " 0" conditions : [] actions : - action : lock.lock metadata : {} data : {} target : entity_id : lock.lock_a1b2
This integration only supports functionality that is available locally. This means that the following elements are not supported:
Activity logs
Updates
Key pads
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Lock state is not updated in real-time
Make sure your bridge can reach your Home Assistant instance. This means that if you use separate VLANs, you need to configure your Firewall appropriately. Additionally, if you have configured an SSL-enabled endpoint for your Internal URL ( Settings > System > Network > Home Assistant URL), try setting it back to the IP address of your instance (or a non-HTTPS URL), as HTTPS sometimes leads to problems with the push updates.
Authentication failures when trying to use the integration
This integration works with local tokens only, tokens from the cloud won’t work
In the bridge settings encrypted token must be enabled
The token that is used to talk to your lock is time-limited. Sometimes there were issues when the clock of the Home Assistant host was slightly out of sync, so try to sync your host’s clock.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Tedee hub was introduced in Home Assistant 2024.2, and it's used by
947 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@patrickhilker
@zweckj
Categories
Binary sensor
Lock
Sensor
Back to top
