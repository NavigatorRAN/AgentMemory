---
source_url: "https://www.home-assistant.io/integrations/application_credentials"
final_url: "https://www.home-assistant.io/integrations/application_credentials"
canonical_url: "https://www.home-assistant.io/integrations/application_credentials/"
source_handle: "web:www-home-assistant-io:058f056b15d1"
source_section: "integrations-application-credentials"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "b89b500f46c995f288c8719d447caee9f1dc1dae25784be35fb114bc6f83b2d9"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Application credentials - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/application_credentials
- Final URL: https://www.home-assistant.io/integrations/application_credentials
- Canonical URL: https://www.home-assistant.io/integrations/application_credentials/
- Fetched at: 2026-06-28T02:28:42Z
- Content type: text/html; charset=UTF-8

## Description

Allows users to link accounts with integrations that support OAuth2

## Extracted Text

On this page
Automatic setup
To view stored application credentials
Manual setup
Deleting application credentials
The Application credentials integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used by integrations that use OAuth2 to link your account to Home Assistant. The most common and preferred approach is using account linking with Home Assistant Cloud, however, not all cloud providers support that and integrations can use Application Credentials instead. Additionally, users may use Application Credentials if preferred instead of Home Assistant Cloud Account Linking.
Some integrations like Google Calendar will automatically create application credentials as part of adding an integration.
Go to Settings > Devices & services .
In the top right corner, select the three dots menu and select Application credentials .
Some integrations do not support cloud linking. They will prompt you to set up Application Credentials
when setting up for the first time. You may also manually enter credentials with the following steps:
Obtain an OAuth Client ID and Client Secret from the cloud provider. The integration should have specific instructions for this.
In Home Assistant, go to Settings > Devices & services .
Select the integration, enter a Name and your OAuth Client ID and Client Secret .
Save the credentials.
You may then visit Integrations and set up the integration.
To delete an application credential, for example because you created a new one, follow these steps:
Select the credential from the list, select the three dots menu and select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Application credentials system was introduced in Home Assistant 2022.6, and it's used by
3590 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Back to top
