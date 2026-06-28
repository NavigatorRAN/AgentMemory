---
source_url: "https://www.home-assistant.io/faq/ha-vs-hassio"
final_url: "https://www.home-assistant.io/faq/ha-vs-hassio"
canonical_url: "https://www.home-assistant.io/faq/ha-vs-hassio/"
source_handle: "web:www-home-assistant-io:aa4265952df7"
source_section: "faq-ha-vs-hassio"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "3a712b5919477173699ad51d78c09abeca508445e4dda3860e16e6e83017120e"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# What is the difference between Home Assistant Operating System and Home Assistant Container? - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/faq/ha-vs-hassio
- Final URL: https://www.home-assistant.io/faq/ha-vs-hassio
- Canonical URL: https://www.home-assistant.io/faq/ha-vs-hassio/
- Fetched at: 2026-06-28T02:24:09Z
- Content type: text/html; charset=UTF-8

## Description

Home Assistant Operating System is the recommended, all-in-one installation method. Home Assistant Container is for people who already run Docker on their own Linux system and want to manage it the...

## Extracted Text

Home Assistant offers two installation methods: Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. and Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] . Both run the same Home Assistant software, so the choice is mostly about how much of the underlying system you want to manage yourself.
Home Assistant Operating System is the recommended installation method for almost everyone. It is an all-in-one solution that includes the operating system, Home Assistant itself, and a management user interface. It supports apps Apps are additional standalone third-party software packages that can be installed on Home Assistant OS. [Learn more] , takes care of upgrading everything for you, and powers official hardware like Home Assistant Green and Home Assistant Yellow .
Home Assistant Container runs Home Assistant as a Docker container on a Linux system you provide and maintain yourself. It is intended for people who already run Docker and want to integrate Home Assistant with their existing setup. Home Assistant Container does not support apps, and you are responsible for updates and the host operating system.
You may still see references to “Home Assistant Core” or “Home Assistant Supervised” in older articles. These were earlier installation methods that are no longer offered or supported. Today’s recommended path is Home Assistant Operating System.
Learn more:
About installation types
Home Assistant Green
Home Assistant Yellow
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Entries
About Home Assistant
Can the rest of my household use Home Assistant?
Do Home Assistant updates break things?
Do I need to know how to code to use Home Assistant?
Do I need to learn YAML to use Home Assistant?
Does Home Assistant work with Apple Home, Google Home, and Alexa?
Does Home Assistant work without an internet connection?
How long does it take to set up Home Assistant?
Is Home Assistant free?
Is Home Assistant reliable?
Is my smart home data private with Home Assistant?
What hardware do I need to run Home Assistant?
Who is Home Assistant for?
Common
When is the next Home Assistant release?
Configuration
My integration does not show up
Why does Home Assistant use YAML for power-user configuration?
Why doesn't this entity have a unique ID?
Documentation
The documentation is missing or out of date
What tools do you use to build the documentation?
Home Assistant
404 Client Error: Not Found ('no such image: homeassistant/...)
Can I run Home Assistant from a USB drive on a Raspberry Pi 4?
Do I need to leave the USB stick connected for Wi-Fi?
I'm trying to find my files on the host or SD card. Where are they?
Why does the start button for an app flash red when I select it?
Installation
What is the difference between Home Assistant Operating System and Home Assistant Container?
Usage
After updating, my browser login gets stuck
Connection error
found character ' ' that cannot start any token
Problems with dependencies
The Home Assistant user interface is acting weird
