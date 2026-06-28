# Withings - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/withings
- Final URL: https://www.home-assistant.io/integrations/withings
- Canonical URL: https://www.home-assistant.io/integrations/withings/
- Fetched at: 2026-06-28T03:28:50Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Withings health products within Home Assistant.

## Extracted Text

On this page
Prerequisites
Creating a Withings developer account
Configuration
Data updates
Webhook requirements
Available data
Removing the integration
To remove an integration instance from Home Assistant
The Withings integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] consumes data from various health products produced by Withings .
Withings account
Withings app installed
Withings device setup in the app
Withings developer account to get a ClientID and Secret to connect to be able to get the data from the Withings cloud API
You must have a developer account to distribute the data.
Note
You only need one developer account. The same account and credentials are used for each Withings configuration.
Create a free developer account .
Make sure to select Withings public cloud (and not Withings US medical cloud or similar).
Select Create an application .
Under Application creation , select Public API integration .
Read and accept the terms and select Next .
Under Information :
Target environment : Development
Application name : [any name]
Application description : [any description]
Registered URLs : https://my.home-assistant.io/redirect/oauth
Do not test this URL. It won’t work at this stage. It will be set up once you install the integration in Home Assistant.
Change logo : Optional
Save your changes.
Once saved, the ClientID and Secret fields will be populated.
Copy and store them in a save place. You will need these in the next step.
I have manually disabled My Home Assistant
If you don’t have My Home Assistant on your installation,
you can use <HOME_ASSISTANT_URL>/auth/external/callback as the redirect URI
instead.
The <HOME_ASSISTANT_URL> must be the same as used during the configuration/
authentication process.
Withings will validate (with HTTP HEAD) these requirements each time you save your Withings developer account. When these checks fail, the Withings UI is not always clear about why.
Home Assistant (For create/update of Withings developer account):
Publicly accessible.
Running on a fully qualified domain name.
Running over HTTPS signed by a globally recognized Certificate Authority. Let’s Encrypt will work.
To add the Withings hub to your Home Assistant instance, use this My button:
Withings can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Withings .
Follow the instructions on screen to complete the setup.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] automatically detects if you can use webhooks. This enables the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] only to update when there is new data.
The binary sensor for sleep will only work if the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can establish webhooks with Withings.
For webhooks to work, your Home Assistant instance must be reachable by the Withings cloud service. The following requirements must be met:
Publicly accessible : Your Home Assistant instance must be reachable from the internet.
HTTPS on port 443 : Withings requires HTTPS specifically on port 443. Using HTTPS on a non-standard port (such as 8443) will not work.
Valid SSL certificate : The certificate must be signed by a globally recognized Certificate Authority, for example, Let’s Encrypt. Self-signed certificates will not work.
Important
If webhooks cannot be established, some sensors will not be available. In particular, the sleep binary sensor has no polling fallback and requires working webhooks to function.
How the webhook URL is determined
You do not enter the webhook URL anywhere in the integration. Home Assistant builds it automatically from the URLs configured under Settings > System > Network , followed by an internal webhook path.
Home Assistant prefers the Internet URL and falls back to the Local Network URL. For Withings webhooks to register successfully, the URL that Home Assistant selects must be a public HTTPS URL on port 443 with a valid certificate.
If you use Home Assistant Cloud from Nabu Casa , a cloudhook is registered instead. Cloudhooks meet all requirements above automatically and do not need any network configuration.
Changing the webhook URL
If you see a warning like Webhook not registered - HTTPS is required or Webhook not registered - port 443 is required in your logs, the URL that Home Assistant selected is not a valid public HTTPS URL. This often happens when the Internet URL is empty and the Local Network URL points to a local HTTP address.
To resolve this:
Go to Settings > System > Network .
Under Internet , enter the public HTTPS URL that Withings should use to reach your instance, for example, https://home.example.com .
Select Save .
You can keep the Local Network URL set to your internal HTTP address. Home Assistant uses the Internet URL for webhooks, while integrations that prefer local communication continue to use the Local Network URL.
The integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides several entities, some of which are dynamically enabled if data is available.
For example, measurement sensors like weight only work when data has been registered in the last 14 days. So if you start using a new device, for example, to measure your temperature or you manually update a value in the app, the sensor automatically appears.
Sleep sensors are only created if the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can find sleep data for you within the last day.
Workout calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] and the workout and activity sensors show if the latest available data point is no older than 14 days.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Withings hub was introduced in Home Assistant 0.99, and it's used by
1.4% of the active installations.
Its IoT class is Cloud Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
Categories
Health
Sensor
Back to top
