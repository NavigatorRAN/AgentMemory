---
source_url: "https://www.home-assistant.io/integrations/alexa"
final_url: "https://www.home-assistant.io/integrations/alexa"
canonical_url: "https://www.home-assistant.io/integrations/alexa/"
source_handle: "web:www-home-assistant-io:d43cfefa60a9"
source_section: "integrations-alexa"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "78614dc9b42eb28307b1c2fcee6edbb20103e7da0b9d4aee874f29a98c29b449"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Amazon Alexa - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/alexa
- Final URL: https://www.home-assistant.io/integrations/alexa
- Canonical URL: https://www.home-assistant.io/integrations/alexa/
- Fetched at: 2026-06-28T02:27:21Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to connect Alexa/Amazon Echo to Home Assistant.

## Extracted Text

On this page
Automatic setup via Home Assistant Cloud
Manual setup
Requirements
With Home Assistant Cloud , you can connect your Home Assistant instance in a few simple clicks to Amazon Alexa. With Home Assistant Cloud, you don’t have to deal with dynamic DNS, SSL certificates, or opening ports on your router. Just log in via the user interface and a secure connection with the cloud will be established. Home Assistant Cloud requires a paid subscription after a 30-day free trial.
For Home Assistant Cloud Users, documentation can be found here .
There are a few ways that you can use Amazon Alexa and Home Assistant together.
Create an Alexa Smart Home Skill to control lights and more
Supports utterances without requiring the skill name, such as “Alexa, turn off the light.”
Support for controlling devices through Alexa routines.
Support for viewing and controlling devices with the Alexa mobile app.
Create a Custom Alexa Skill to build custom commands
Create a new Flash Briefing source
Alternative: use the Emulated Hue integration to trick Alexa into thinking Home Assistant is a Philips Hue hub.
Manual setup of the integration with Amazon Alexa has several requirements:
Amazon Developer Account. You can sign up here .
Building custom commands and Flash Briefing require your Home Assistant instance to be accessible from the Internet with HTTPS on port 443.
An AWS account is needed if you want to use the Smart Home Skill API. A part of your Smart Home Skill will be hosted on AWS Lambda . However, you don’t need to worry about costs; AWS Lambda is free for up to 1 million requests and 1GB of outbound data transfer per month.
Smart Home API also needs your Home Assistant instance to be accessible from the Internet.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Amazon Alexa system was introduced in Home Assistant 0.10, and it's used by
2% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Voice
Back to top
