# Sentry - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sentry
- Final URL: https://www.home-assistant.io/integrations/sentry
- Canonical URL: https://www.home-assistant.io/integrations/sentry/
- Fetched at: 2026-06-28T03:15:04Z
- Content type: text/html; charset=UTF-8

## Description

Record errors to Sentry.

## Extracted Text

On this page
Prerequisites
Configuration
Configuration options
Supported functionality
Data updates
Removing the integration
To remove an integration instance from Home Assistant
The Sentry integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects Home Assistant to Sentry , an error tracking service that can be cloud-hosted or self-hosted. It captures logged errors and unhandled exceptions and sends them to your Sentry instance, where you can browse, search, and get alerted on them.
This is mainly useful if you develop custom integrations or want deeper insight into errors happening inside your Home Assistant instance. Sentry groups repeated errors, shows stack traces, and can notify you when new issues appear, so you do not have to watch the logs manually.
Important
A free Sentry account includes 5000 events per month. Depending on how many events Home Assistant sends, you may need to upgrade your Sentry account or accept periods without data flowing from Home Assistant to Sentry.
You need a Sentry account and a DSN . The DSN tells Home Assistant where to send error events.
To get your DSN:
Go to Projects .
Select Create project .
Fill out the Give your project a name field, assign a team, and then select Create project .
Select the Get your DSN link at the top of the page. Your DSN looks like https:// [email protected] /0 .
To add the Sentry service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sentry .
Follow the instructions on screen to complete the setup.
Sentry DSN
The Data Source Name (DSN) of your Sentry project. It tells Home Assistant where to send error events.
After setup, you can fine-tune what Home Assistant sends to Sentry. Go to Settings > Devices & services , select the Sentry integration, and then select the cogwheel ( Configure ).
The log level Sentry will register an event for : The minimum log level that creates a Sentry event. Defaults to error .
The log level Sentry will record events as breadcrumbs for : The minimum log level recorded as breadcrumbs, which add context leading up to an event. Defaults to warning .
Optional name of the environment : A label, such as production or development , to separate events in Sentry.
Send handled events : Also send errors that Home Assistant already caught and handled. Off by default.
Send events from custom components : Include errors that originate from custom integrations. Off by default.
Send events from third-party packages : Include errors that originate from third-party Python packages. Off by default.
Enable performance tracing : Send performance tracing data to Sentry. Off by default.
Tracing sample rate : The fraction of traces to send when tracing is enabled, between 0.0 and 1.0 (1.0 sends all of them). Defaults to 1.0.
Note
After changing these options, restart Home Assistant to apply them.
The Sentry integration does not add any entities An entity represents a sensor, actor, or function in Home Assistant. Entities are used to monitor physical properties or to control other entities. An entity is usually part of a device or a service. [Learn more] . Once set up, it runs in the background and forwards errors and unhandled exceptions to your Sentry instance as they happen. Each event is enriched with context about your installation, such as the integrations in use, to help with debugging.
Sentry does not poll for data. Home Assistant sends events to your Sentry instance as errors occur.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sentry service was introduced in Home Assistant 0.104, and it's used by
83 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@dcramer
@frenck
Categories
System monitor
Back to top
