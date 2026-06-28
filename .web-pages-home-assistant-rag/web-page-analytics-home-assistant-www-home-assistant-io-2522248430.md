# Analytics - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/analytics
- Final URL: https://www.home-assistant.io/integrations/analytics
- Canonical URL: https://www.home-assistant.io/integrations/analytics/
- Fetched at: 2026-06-28T02:27:56Z
- Content type: text/html; charset=UTF-8

## Description

Share system analytics and diagnostics

## Extracted Text

On this page
Why share?
Enabling analytics
What can be shared
Basic analytics
Usage analytics
Statistics
Diagnostics
Data storage and processing
Changing or disabling analytics
The Analytics integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] lets you voluntarily share usage information from your Home Assistant installation with the Home Assistant project. The aggregated results are published at analytics.home-assistant.io . This data helps the project decide where to focus development effort and gives manufacturers concrete numbers when advocating for local control and privacy-focused features in their products.
Important
Sharing analytics is completely optional. Nothing is sent from your installation unless you explicitly opt in, and you can change what is shared or turn it off at any time. Only aggregated, anonymized totals are published publicly. Your individual installation is never identifiable from the public data.
Shape the roadmap: integration usage numbers help the Home Assistant team prioritize which integrations to improve, rewrite, or expand.
Advocate for the open home: when the team talks to manufacturers, concrete numbers such as “X thousand Home Assistant users have device Y” are far more convincing than anecdotes. This has directly contributed to manufacturers adding local APIs, local control, and privacy-respecting features.
Help other users discover integrations: the public dashboard at analytics.home-assistant.io lets anyone see which integrations and devices are popular, which can help new users decide what to try.
You can opt in during onboarding or at any time afterward by going to Settings > System > Analytics .
When enabled, data is sent 15 minutes after Home Assistant starts, and then every 24 hours while it runs. The exact data that is sent is also printed to your log so you can always see what was shared.
Analytics is split into several independent options so you can choose exactly what you are comfortable sharing. Each option is described below.
Basic analytics includes:
A unique identifier for your installation, so each installation is only counted once.
The Home Assistant version you are running.
The Home Assistant installation type.
Your country code, derived server-side from your IP address. For example, "NO" for Norway.
If you are in the United States, this also includes the region (state) code, for example, "CO" for Colorado.
If your system includes the Supervisor, this will also contain:
If your installation is supported
If your installation is healthy
The architecture of your installation
If you are running Home Assistant Operating System, this will also contain:
The board type you are using
The version of the Operating System
Example payload
{ "uuid" : "12a3456bc78d90123ef4567g789012h3" , "version" : "{{current_version}}" , "installation_type" : "Home Assistant OS" , "supervisor" : { "healthy" : true , "supported" : true , "arch" : "amd64" }, "operating_system" : { "board" : "odroid-n2" , "version" : "{{site.data.version_data.hassos['odroid-n2']}}" } }
Requires basic analytics to be enabled.
Usage analytics includes:
The names of all your core integrations.
The names and versions of all your custom integrations, if you have any.
The name and version of the database engine used by the recorder integration .
Whether the energy integration is configured.
Whether an HTTP certificate is configured.
For each app in Home Assistant (formerly known as add-ons)
Name
Version
If protection mode is enabled
If auto update is enabled
{ "uuid" : "12a3456bc78d90123ef4567g789012h3" , "version" : "{{current_version}}" , "installation_type" : "Home Assistant OS" , "supervisor" : { "healthy" : true , "supported" : true , "arch" : "amd64" }, "operating_system" : { "board" : "odroid-n2" , "version" : "{{site.data.version_data.hassos['odroid-n2']}}" }, "integrations" : [ "awesome_integration" ], "addons" : [ { "slug" : "awesome_addon" , "protected" : true , "version" : "1.0.0" , "auto_update" : false } ], "energy" : { "configured" : true }, "recorder" : { "engine" : "sqlite" , "version" : "123" }, "certificate" : false }
Statistics includes counts only, not names. Specifically:
The number of integrations.
The number of users.
The number of entities.
The number of automations.
If your system includes the Supervisor, this also contains:
The number of apps installed in Home Assistant.
{ "uuid" : "12a3456bc78d90123ef4567g789012h3" , "version" : "{{current_version}}" , "installation_type" : "Home Assistant OS" , "supervisor" : { "healthy" : true , "supported" : true , "arch" : "amd64" }, "operating_system" : { "board" : "odroid-n2" , "version" : "{{site.data.version_data.hassos['odroid-n2']}}" }, "state_count" : 1 , "automation_count" : 2 , "integration_count" : 3 , "addon_count" : 4 , "user_count" : 5 }
If enabled, a crash report is collected when an unexpected error occurs and uploaded to Sentry . These reports help the developers fix bugs and improve performance and stability.
Crash reports are only visible to the Home Assistant Core developers. This option is currently limited to the Home Assistant Supervisor The Home Assistant Supervisor is a program that manages a Home Assistant installation, taking care of installing and updating Home Assistant, apps, itself, and, if used, updating the Home Assistant Operating System. and OS-Agent .
All data is received and processed by the Home Assistant Analytics Receiver. The source code is available at analytics.home-assistant.io on GitHub .
When your installation sends a payload, that payload includes a unique identifier. This identifier is used only to make sure that your installation is counted once and that repeat submissions do not inflate the totals.
Your data is stored in Cloudflare’s Key-Value store for a maximum of 60 days since the last update. If your installation stops sending data, the entry is automatically removed after this period.
Only aggregated and anonymized totals are made publicly available at analytics.home-assistant.io . The raw per-installation payloads are never published.
This is an example of how the information is stored on the server:
uuid:12a3456bc78d90123ef4567g789012h3
{‘version’: ‘2026.6.4’, ‘installation_type’: ‘Home Assistant OS’, ‘country’: ‘NO’}
You can change which options you share at any time by going to Settings > System > Analytics . Disabling an option takes effect immediately. Any data related to your installation is removed from the receiver after 60 days without an update.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Analytics system was introduced in Home Assistant 2021.4, and it's used by
52% of the active installations.
Its IoT class is Cloud Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Other
Back to top
