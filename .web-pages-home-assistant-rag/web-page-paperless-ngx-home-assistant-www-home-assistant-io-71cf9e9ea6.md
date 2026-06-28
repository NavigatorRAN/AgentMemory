# Paperless-ngx - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/paperless_ngx
- Final URL: https://www.home-assistant.io/integrations/paperless_ngx
- Canonical URL: https://www.home-assistant.io/integrations/paperless_ngx/
- Fetched at: 2026-06-28T03:07:27Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Paperless-ngx into Home Assistant

## Extracted Text

On this page
Prerequisites
Configuration
Use cases
Supported functionality
Sensors
Example automations
Data updates
Known limitations
Troubleshooting
Related links
The Paperless-ngx integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Paperless-ngx instance to Home Assistant and monitor its status and activity.
Important
This integration is only fully supported with Paperless-ngx version 2.15 or later . Earlier versions are not supported.
To ensure full functionality of this integration, you must have read permissions for all document-related resources, including documents, tags, document types, and correspondents.
To enable monitoring of diagnostic sensors, you must have administrator permissions . Without administrator rights, specific API endpoints cannot be accessed, and the sensor states will not be available.
Create an access token
Log in to your Paperless-ngx instance.
In the upper-right corner, select your profile icon.
Select My Profile .
Under API Auth Token , select the right Refresh button next to the textbox to generate a new token. Confirm with yes .
Copy the token and use it during the integration setup in Home Assistant.
To add the Paperless-ngx service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Paperless-ngx .
Follow the instructions on screen to complete the setup.
URL
URL to connect to the Paperless-ngx instance.
API key
API key to connect to the Paperless-ngx API.
Verify SSL certificate
Verify the SSL certificate of the Paperless-ngx instance. Disable this option if you’re using a self-signed certificate.
The integration can be used to build automations to help and notify you of new documents in your paperless instance.
The update sensor could notify you if a new paperless-ngx version is available.
The Paperless-ngx integration provides statistic and diagnostic entities to Home Assistant.
Below is an overview of these entities and their function.
This integration provides sensors Sensors return information about a thing, for instance the level of water in a tank. [Learn more] for the following information from Paperless-ngx:
Sensor Description Correspondents Indicates the total number of defined correspondents. Document types Indicates the total number of defined document types. Documents in inbox Indicates the number of documents currently in the inbox. Tags Indicates the total number of defined tags Total characters Indicates the total number of characters extracted from all documents. Total documents Indicates the total number of documents stored. Total storage Indicates the total disk space used by Paperless-ngx. Available storage Indicates the remaining available disk space for Paperless-ngx. Status database Indicates whether the database is reachable and functioning correctly. Status index Indicates whether the document indexing service is operational. Status classifier Indicates whether the document classifier service is running properly. Status Celery Indicates whether the Celery task queue is active and processing tasks. Status Redis Indicates whether the Redis service used for task queuing is available. Status sanity Indicates the sanity of the Paperless-ngx documents. Software Indicates whether a new Paperless-ngx update ist available.
Send a push notification if a new document is available
```yaml
alias: New document push notification
description: Sends a push notification if a new document is available
triggers:
- entity_id: sensor.paperless_documents_inbox
to: null
trigger: state
conditions:
- condition: template
value_template: |
{% if trigger.from_state is not none and trigger.to_state is not none %}
{{ trigger.to_state.state > trigger.from_state.state }}
{% else %}
false
{% endif %}
actions:
- action: notify.send_message
target:
entity_id: notify.my_device
metadata: {}
data:
message: A new document is available.
```
This integration retrieves data using a pull-based mechanism.
Statistic sensors are pulled every 120 seconds
Diagnostic sensors are pulled every 300 seconds
Update checks to detect new Paperless-ngx versions are performed every 24 hours
There are a few known limitations for using the integration:
Message: ‘Invalid hostname or IP address’
If you get the message Invalid hostname or IP address , try the following steps:
Make sure you enter a complete URL, such as https://paperless.example.com or https://192.168.178.11:8011 .
SSL is enabled by default. If you’re using an unencrypted connection, you must explicitly use http:// instead of https:// in the URL.
If you’re using a self-signed certificate, disable the Verify SSL certificate option.
Message: ‘The token does not have permission to access the API’
If you get the message The token does not have permission to access the API , try the following steps:
Verify whether the token is still valid and correctly assigned to the user.
Test the token using the Swagger interface available at
https://paperless.example.com/api/schema/view/
Click on “Authorize” in the Swagger UI to enter your token at tokenAuth (apiKey) .
Then, try accessing the relevant endpoints like /api/statistics/ to ensure they respond as expected.
If everything works correctly in Swagger but the integration still fails, check whether a reverse proxy (e.g., NGINX) is returning an HTTP 403 error . If so, the integration may also report this as a permission issue.
Paperless-ngx
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Paperless-ngx service was introduced in Home Assistant 2025.6, and it's used by
1682 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fvgarrel
Categories
Sensor
Update
Back to top
