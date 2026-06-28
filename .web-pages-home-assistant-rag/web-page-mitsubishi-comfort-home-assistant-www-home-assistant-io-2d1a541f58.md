---
source_url: "https://www.home-assistant.io/integrations/mitsubishi_comfort"
final_url: "https://www.home-assistant.io/integrations/mitsubishi_comfort"
canonical_url: "https://www.home-assistant.io/integrations/mitsubishi_comfort/"
source_handle: "web:www-home-assistant-io:2d1a541f58d7"
source_section: "integrations-mitsubishi-comfort"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "5c5cf6db90f462e064884560d79ad80c764f6c8a7a712cac3af598e4dd9e1f87"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Mitsubishi Comfort - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mitsubishi_comfort
- Final URL: https://www.home-assistant.io/integrations/mitsubishi_comfort
- Canonical URL: https://www.home-assistant.io/integrations/mitsubishi_comfort/
- Fetched at: 2026-06-28T03:00:23Z
- Content type: text/html; charset=UTF-8

## Description

Integrate Mitsubishi Electric ductless minisplit heat pump and air conditioning systems with Home Assistant.

## Extracted Text

On this page
Supported devices
Prerequisites
Configuration
Supported functionality
Climate
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Mitsubishi Comfort integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects Mitsubishi Electric ductless minisplit heat pump and air conditioning systems to Home Assistant. It communicates directly with each indoor unit over your local network for low-latency control, using the Kumo Cloud account only for initial device discovery and credential retrieval.
This integration supports indoor units (full climate control) and Kumo Station outdoor units (temperature monitoring only).
Indoor unit (ductless, ducted)
Controls: mode, temperature, fan speed, vane direction
Sensors: temperature, humidity, filter status, Wi-Fi signal
Kumo Station (outdoor unit, read-only)
Sensors: outdoor temperature, Wi-Fi signal
A Kumo Cloud account with your Mitsubishi devices registered
Devices must be connected to your local network via their Wi-Fi adapters
During setup you will be asked to enter the username and password for your Kumo Cloud account. The integration uses these credentials to discover your devices and retrieve the local API passwords needed for direct communication.
To add the Mitsubishi Comfort hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Mitsubishi Comfort .
Follow the instructions on screen to complete the setup.
Username
The email address for your Kumo Cloud account.
Password
The password for your Kumo Cloud account.
The Mitsubishi Comfort integration provides the following entities.
Each indoor unit is exposed as a climate entity with the following capabilities:
HVAC modes : Off, Cool, Heat, Dry, Fan only, Heat/Cool (auto)
Availability depends on the specific unit.
Fan modes : Super quiet, Quiet, Low, Powerful, Super powerful, Auto
The number of available speeds depends on the unit.
Swing modes : Horizontal, Mid-Horizontal, Midpoint, Mid-Vertical, Vertical, Auto, Swing
Availability depends on the unit.
Temperature : Single setpoint in Cool and Heat modes, separate high and low setpoints in Heat/Cool (auto) mode.
Temperature ranges vary by unit and mode.
The Mitsubishi Comfort integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] the status of your devices every 60 seconds. When you send a command (such as changing the mode or adjusting the temperature), Home Assistant reflects the change straight away, without waiting for the next poll.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Removing the integration stops all polling and closes connections to the devices. Your Kumo Cloud account and device settings are not affected.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mitsubishi Comfort hub was introduced in Home Assistant 2026.6, and it's used by
47 active installations.
Its IoT class is Cloud Polling.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@nikolairahimi
Categories
Back to top
