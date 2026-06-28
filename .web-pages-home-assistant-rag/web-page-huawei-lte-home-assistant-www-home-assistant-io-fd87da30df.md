---
source_url: "https://www.home-assistant.io/integrations/huawei_lte"
final_url: "https://www.home-assistant.io/integrations/huawei_lte"
canonical_url: "https://www.home-assistant.io/integrations/huawei_lte/"
source_handle: "web:www-home-assistant-io:fd87da30dfce"
source_section: "integrations-huawei-lte"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "edf63f39c95db21956b18b5cd8f4e49edfce1e7799850ed53d7b1b0c03ac5f8c"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Huawei LTE - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/huawei_lte
- Final URL: https://www.home-assistant.io/integrations/huawei_lte
- Canonical URL: https://www.home-assistant.io/integrations/huawei_lte/
- Fetched at: 2026-06-28T02:50:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Huawei LTE router and modem devices with Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Options
List of actions
Tested devices
Removing the integration
To remove an integration instance from Home Assistant
The Huawei LTE router and modem integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] for Home Assistant allows you to observe and control Huawei LTE devices .
There is currently support for the following platforms within Home Assistant:
Presence detection - device tracker for connected devices
Notifications - via SMS
Sensors - device, network, signal, SMS count, traffic, and battery information
Switch - mobile data on/off, Wi-Fi guest network on/off
Binary sensor - mobile and Wi-Fi connection status, SMS storage full/not
Button - clear traffic statistics, restart
Select - preferred network mode
The integration can be enabled using the frontend, see below for details.
Additionally, if the SSDP integration is
enabled in Home Assistant, automatically discovered Huawei LTE devices
which support and have UPnP enabled are made available for further
optional configuration in the frontend.
The integration requires authentication using router credentials at
initial configure time, but after that, it can be run with or without
authentication. Authenticated mode enables all available integration
features and entities, but may interfere with accessing the device web
interface from another source such as a browser while the integration
is active or vice versa. The exact list of features requiring
authentication to work varies by device and firmware version. The
integration will try to use all configured ones and fail gracefully if
it detects one requiring authentication in unauthenticated mode.
Only a subset of the entities provided by the target device are
enabled by default:
WAN IP address sensor
LTE signal sensors RSRQ, RSRP, RSSI, and SINR
mobile data and Wi-Fi guest network switches
mobile connection binary sensor
device tracker entries
The rest are added to the entity registry, but disabled by default.
Support for different categories of information and thus available
entities varies by device model and firmware version.
To add the Huawei LTE device to your Home Assistant instance, use this My button:
Huawei LTE can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Huawei LTE .
Follow the instructions on screen to complete the setup.
URL
Base URL to the API of the router. Typically, something like http://192.168.X.1 where X is, for example, 1 , 8 , or 100 . This is the beginning of the location shown in a browser when accessing the router’s web interface.
Verify SSL certificate
Whether to verify the SSL certificate of the router when accessing it. Applicable only if the router is accessed via HTTPS. In other words, if the configured URL starts with https:// .
Username
Username for accessing the router’s API. Typically, either admin , or left empty (recommended if that works).
Password
Password for accessing the router’s API.
To define options for Huawei LTE, follow these steps:
In Home Assistant, go to Settings > Devices & services .
If multiple instances of Huawei LTE are configured, choose the instance you want to configure.
On the card, select the cogwheel .
If the card does not have a cogwheel, the integration does not support options for this device.
Edit the options, then select Submit to save the changes.
Notification service name
Name of the notification service. Used to distinguish between notification services in case there are multiple Huawei LTE devices configured. The name here will be prefixed with notify. . For example, specifying huawei_lte will yield notify.huawei_lte as the complete service name.
Notification recipients
Comma separated list of default recipient SMS phone numbers for the notification service, used in case the notification sender does not specify any. Accepted formats may vary between device models and subscription types, but international E.164 format including the + prefix and country code, numbers only, is a good first bet.
Track wired network clients
Whether the device tracker entities track also clients attached to the router’s wired Ethernet network, in addition to wireless clients.
Unauthenticated mode
Whether to run in unauthenticated mode. See above for more information between authenticated and unauthenticated modes.
The Huawei LTE integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Resume integration ( huawei_lte.resume_integration )
Resumes a suspended integration.
Suspend integration ( huawei_lte.suspend_integration )
Suspends the integration and logs it out from the router.
For an overview of every action across all integrations, see the actions reference .
It is the intention and highly likely that this integration works with all devices
reported working with the underlying huawei-lte-api library .
It will not work on ones noted as not working in that list.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Huawei LTE device was introduced in Home Assistant 0.79, and it's used by
808 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@scop
@fphammerle
Categories
Binary sensor
Button
Network
Notifications
Presence detection
Select
Sensor
Switch
Back to top
