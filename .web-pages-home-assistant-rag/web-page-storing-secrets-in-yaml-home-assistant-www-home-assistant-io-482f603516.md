---
source_url: "https://www.home-assistant.io/docs/configuration/secrets"
final_url: "https://www.home-assistant.io/docs/configuration/secrets"
canonical_url: "https://www.home-assistant.io/docs/configuration/secrets/"
source_handle: "web:www-home-assistant-io:482f6035160b"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "49f24575b8d584a793e39e19864eea973164d555b0a99d5d19b439eb894152f0"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Storing secrets in YAML - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/secrets
- Final URL: https://www.home-assistant.io/docs/configuration/secrets
- Canonical URL: https://www.home-assistant.io/docs/configuration/secrets/
- Fetched at: 2026-06-28T02:21:35Z
- Content type: text/html; charset=UTF-8

## Description

Keep passwords, API keys, and other sensitive values out of your configuration.yaml by storing them in a separate secrets.yaml file.

## Extracted Text

On this page
Using secrets.yaml
Debugging secrets
Secrets in automations and scripts
Related topics
The configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file is a plain-text file, thus it is readable by anyone who has access to the file. The file contains passwords and API tokens which need to be redacted if you want to share your configuration.
By using !secret you can remove any private information from your configuration files. This separation can also help you to keep easier track of your passwords and API keys, as they are all stored at one place and no longer spread across the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file or even multiple YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] files if you split up your configuration .
The workflow for moving private information to secrets.yaml is very similar to the splitting of the configuration . Create a secrets.yaml file in your Home Assistant configuration directory .
The entries for password and API keys in the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file usually looks like the example below.
rest : - authentication : basic username : " admin" password : " YOUR_PASSWORD" ...
Those entries need to be replaced with !secret and an identifier.
rest : - authentication : basic username : " admin" password : !secret rest_password ...
The secrets.yaml file contains the corresponding password assigned to the identifier.
rest_password : " YOUR_PASSWORD"
When you start splitting your configuration into multiple files, you might end up with configuration in sub folders. Secrets will be resolved in this order:
A secrets.yaml located in the same folder as the YAML YAML is a human-readable data serialization language. It is used to store and transmit data in a structured format. In Home Assistant, YAML is used for configuration, for example in the configuration.yaml or automations.yaml files. [Learn more] file referencing the secret,
next, parent folders will be searched for a secrets.yaml file with the secret, stopping at the folder with the main configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] .
To see where secrets are being loaded from, you can add an option to your secrets.yaml file.
Print where secrets are retrieved from to the Home Assistant log by adding the following to secrets.yaml :
logger : debug
This will not print the actual secret’s value to the log.
Using secrets is not supported in the Home Assistant UI YAML editor for automations and scripts. If !secret is used in automations.yaml or scripts.yaml , you will not be able to edit or view any YAML automations or scripts in the UI.
You can however split automations or scripts using secrets into a separate yaml file, as described in splitting configuration . These will be read-only in the frontend, and allow the rest of your automations to still be editable normally.
Example configuration.yaml :
# The main automations editable in the UI automation ui : !include automations.yaml # These automations may contain secrets, and will be read-only in the UI automation secret : !include automations-secret.yaml
Caution
Secrets used in automations will expose their secret value to administrators when viewed in the UI, such as in the YAML source viewer and the trace viewer.
Configuration.yaml file
Splitting the configuration
Securing your instance
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Home information
People and user configuration
Customizing entities
Remote access to Home Assistant
Securing your Home Assistant
Storing secrets in YAML
YAML syntax
The configuration.yaml file
Troubleshooting configuration
Splitting up the configuration
Packages
Events
State and state object
Entities and domains
Entity component platform options
Authentication
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
