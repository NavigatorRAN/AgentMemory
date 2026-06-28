---
source_url: "https://www.home-assistant.io/integrations/nextdns"
final_url: "https://www.home-assistant.io/integrations/nextdns"
canonical_url: "https://www.home-assistant.io/integrations/nextdns/"
source_handle: "web:www-home-assistant-io:130affd68ec3"
source_section: "integrations-nextdns"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "07604b5fb11dbcc1491ec969de420195d083a41849554e4dae12c76087384ec8"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# NextDNS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/nextdns
- Final URL: https://www.home-assistant.io/integrations/nextdns
- Canonical URL: https://www.home-assistant.io/integrations/nextdns/
- Fetched at: 2026-06-28T03:03:06Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate NextDNS within Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Removing the integration
To remove an integration instance from Home Assistant
Supported functionality
Binary sensors
Buttons
Sensors
Switches
Data updates
Possible use-cases
Examples
Block social media for kids
Known limitations
NextDNS is a DNS service that protects from all kinds of security threats, blocks ADS and trackers on websites and in apps, and provides a safe and supervised Internet for kids — on all devices and on all networks. The NextDNS integration allows you to monitor NextDNS statistics and control its configuration.
To obtain API key go to the NextDNS site >> Account section .
To add the NextDNS service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select NextDNS .
Follow the instructions on screen to complete the setup.
API Key
The API key for your NextDNS account.
Profile
The NextDNS configuration profile you want to integrate.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
The NextDNS integration provides the following entities.
Device connection status
Description : Indicates whether the Home Assistant server is using NextDNS for DNS queries
Device profile connection status
Description : Indicates whether the Home Assistant server uses the configured NextDNS profile for DNS queries
Clear logs
Description : Triggers clearing DNS query logs on NextDNS servers
DNS queries
Description : Shows the total number of DNS queries
DNS queries blocked
Description : Shows the number of blocked DNS queries
DNS queries blocked ratio
Description : Shows the percentage of blocked DNS queries
DNS-over-HTTP/3 queries
Description : Shows the number of DNS queries via DNS-over-HTTP/3
Remarks : This entity is disabled by default
DNS-over-HTTP/3 queries ratio
Description : Shows the percentage of DNS queries via DNS-over-HTTP/3
DNS-over-HTTPS queries
Description : Shows the number of DNS queries via DNS-over-HTTPS
DNS-over-HTTPS queries ratio
Description : Shows the percentage of DNS queries via DNS-over-HTTPS
DNS-over-QUIC queries
Description : Shows the number of DNS queries via DNS-over-QUIC
DNS-over-QUIC queries ratio
Description : Shows the percentage of DNS queries via DNS-over-QUIC
DNS-over-TLS queries
Description : Shows the number of DNS queries via DNS-over-TLS
DNS-over-TLS queries ratio
Description : Shows the percentage of DNS queries via DNS-over-TLS
TCP queries
Description : Shows the number of DNS queries via TCP
TCP queries ratio
Description : Shows the percentage of DNS queries via TCP
UDP queries
Description : Shows the number of DNS queries via UDP
UDP queries ratio
Description : Shows the percentage of DNS queries via UDP
Encrypted queries
Description : Shows the number of encrypted DNS queries
Encrypted queries ratio
Description : Shows the percentage of encrypted DNS queries
Unencrypted queries
Description : Shows the number of unencrypted DNS queries
IPv4 queries
Description : Shows the number of DNS queries via IPv4
IPv6 queries
Description : Shows the number of DNS queries via IPv6
IPv6 queries ratio
Description : Shows the percentage of DNS queries via IPv6
DNSSEC validated queries
Description : Shows the number of DNS queries validated by DNSSEC
DNSSEC validated queries ratio
Description : Shows the percentage of DNS queries validated by DNSSEC
DNSSEC not validated queries
Description : Shows the number of DNS queries not validated by DNSSEC
DNS queries relayed
Description : Shows the number of relayed DNS queries
AI-Driven threat detection
Description : Controls AI-driven threat detection
Allow affiliate & tracking links
Description : Controls affiliate and tracking links
Anonymized EDNS client subnet
Description : Controls anonymized EDNS client subnet
Bypass age verification
Description : Controls bypass of age verification pages
CNAME flattening
Description : Controls CNAME flattening
Cryptojacking protection
Description : Controls cryptojacking protection
Domain generation algorithms protection
Description : Controls protection against domain generation algorithms
DNS rebinding protection
Description : Controls DNS rebinding protection
Google safe browsing
Description : Controls Google Safe Browsing protection
IDN homograph attacks protection
Description : Controls protection against IDN homograph attacks
Logs
Description : Controls log collection
Force SafeSearch
Description : Controls SafeSearch enforcement
Typosquatting protection
Description : Controls protection against typosquatting domains
Web3
Description : Controls access to Web3 and crypto domains
Force YouTube restricted mode
Description : Controls YouTube Restricted Mode enforcement
Block newly registered domains
Description : Controls blocking of newly registered domains
Block bypass methods
Description : Controls blocking of filter bypass methods
Block child sexual abuse material
Description : Controls blocking of child sexual abuse material
Block dynamic DNS hostnames
Description : Controls blocking of dynamic DNS hostnames
Block disguised third-party trackers
Description : Controls blocking of disguised third-party trackers
Block page
Description : Controls the display of the blocking page
Block online gaming
Description : Controls blocking of online gaming
Block parked domains
Description : Controls blocking of parked domains
Block piracy
Description : Controls blocking of piracy websites
Block porn
Description : Controls blocking of pornographic content
Block social networks
Description : Controls blocking of social networks
Block video streaming
Description : Controls blocking of video streaming websites
Block dating
Description : Controls blocking of dating websites
Block gambling
Description : Controls blocking of gambling websites
Block 9GAG
Description : Controls 9GAG access
Block Amazon
Description : Controls Amazon access
Block BeReal
Description : Controls BeReal access
Block Blizzard
Description : Controls Blizzard access
Block ChatGPT
Description : Controls ChatGPT access
Block Dailymotion
Description : Controls Dailymotion access
Block Discord
Description : Controls Discord access
Block Disney Plus
Description : Controls Disney Plus access
Block eBay
Description : Controls eBay access
Block Facebook
Description : Controls Facebook access
Block Fortnite
Description : Controls Fortnite access
Block Google Chat
Description : Controls Google Chat access
Block HBO Max
Description : Controls HBO Max access
Block Hulu
Description : Controls Hulu access
Block Imgur
Description : Controls Imgur access
Block Instagram
Description : Controls Instagram access
Block League of Legends
Description : Controls League of Legends access
Block Mastodon
Description : Controls Mastodon access
Block Messenger
Description : Controls Facebook Messenger access
Block Minecraft
Description : Controls Minecraft access
Block Netflix
Description : Controls Netflix access
Block Pinterest
Description : Controls Pinterest access
Block PlayStation Network
Description : Controls PlayStation Network access
Block Prime Video
Description : Controls Prime Video access
Block Reddit
Description : Controls Reddit access
Block Roblox
Description : Controls Roblox access
Block Signal
Description : Controls Signal access
Block Skype
Description : Controls Skype access
Block Snapchat
Description : Controls Snapchat access
Block Spotify
Description : Controls Spotify access
Block Steam
Description : Controls Steam access
Block Telegram
Description : Controls Telegram access
Block TikTok
Description : Controls TikTok access
Block Tinder
Description : Controls Tinder access
Block Tumblr
Description : Controls Tumblr access
Block Twitch
Description : Controls Twitch access
Block X (formerly Twitter)
Description : Controls X (formerly Twitter) access
Block Vimeo
Description : Controls Vimeo access
Block VK
Description : Controls VK access
Block WhatsApp
Description : Controls WhatsApp access
Block Xbox Network
Description : Controls Xbox Network access
Block YouTube
Description : Controls YouTube access
Block Zoom
Description : Controls Zoom access
By default, the integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] data from the NextDNS API:
Every 5 minutes for connection status data
Every 10 minutes for analytics data
Every 1 minute for settings
Monitor DNS queries from your local network or individual devices.
Track DNS query protocols to understand connection security.
Manage children’s screen time by scheduling access to social media, games, and streaming services.
These automations block social media access for the kids profile during evening hours and unblock it after school.
automation : - alias : Block social media for kids in the evening triggers : - trigger : time at : " 20:00:00" actions : - action : switch.turn_off target : entity_id : switch.kids_block_social_networks - alias : Unblock social media for kids after school triggers : - trigger : time at : " 16:00:00" actions : - action : switch.turn_on target : entity_id : switch.kids_block_social_networks
There are no known limitations.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The NextDNS service was introduced in Home Assistant 2022.8, and it's used by
880 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bieniu
Categories
Network
Back to top
