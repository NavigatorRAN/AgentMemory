---
source_url: "https://www.home-assistant.io/integrations/rss_feed_template"
final_url: "https://www.home-assistant.io/integrations/rss_feed_template"
canonical_url: "https://www.home-assistant.io/integrations/rss_feed_template/"
source_handle: "web:www-home-assistant-io:bff3bc20edc9"
source_section: "integrations-rss-feed-template"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "cc28282549e6c62018c861f51ff99d1c47b7ee40d460f2190b714fb7e4d74ef0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# RSS feed template - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rss_feed_template
- Final URL: https://www.home-assistant.io/integrations/rss_feed_template
- Canonical URL: https://www.home-assistant.io/integrations/rss_feed_template/
- Fetched at: 2026-06-28T03:13:06Z
- Content type: text/html; charset=UTF-8

## Description

Use this integration to generate RSS feeds showing your latest data.

## Extracted Text

On this page
The RSS feed template integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can export any information from Home Assistant as a static RSS feed. This can be used to display that information on many types of devices using an RSS reader. While native apps for Home Assistant are not widely available, native RSS readers exist for almost any platform.
For example, on Android, the app “Simple RSS Widget” can be used to display temperatures on the home screen.
# Example configuration.yaml entry rss_feed_template : # Accessible on <Home Assistant url>/api/rss_template/garden # Example: https://localhost:8123/api/rss_template/garden garden : requires_api_password : false title : " Garden {{ as_timestamp(now())|timestamp_custom('%H:%M', True) }}" items : - title : " Outside temperature" description : " {% if is_state('sensor.temp_outside','unknown') %}---{% else %}{{states('sensor.temp_outside')}} °C{% endif %}"
Configuration Variables
Looking for your configuration file?
requires_api_password boolean ( Optional , default: true )
If true and an API password is set, the password must be passed via ‘?api_password=…’ parameter.
feed_id string Required
The key is used as the ID of the feed. The feed can be accessed at /api/rss_template/feed_id (example: ‘garden’).
title template ( Optional )
The title of the feed, which is parsed as template .
items list Required
A list of feed items.
The title of the item, which is parsed as template .
description template ( Optional )
The description of the item, which is parsed as template .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RSS feed template integration was introduced in Home Assistant 0.44, and it's used by
36 active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Front end
Back to top
