# Minio - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/minio
- Final URL: https://www.home-assistant.io/integrations/minio
- Canonical URL: https://www.home-assistant.io/integrations/minio/
- Fetched at: 2026-06-28T03:00:20Z
- Content type: text/html; charset=UTF-8

## Description

Integration for interacting with Minio object storage.

## Extracted Text

On this page
Configuration
Automations
List of actions
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] adds interaction with Minio .
It also enables listening for bucket notifications: see documentation
To download or upload files, folders must be added to allowlist_external_dirs .
To enable the Minio integration in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
minio : host : localhost port : 9000 access_key : ACCESS_KEY secret_key : SECRET_KEY secure : false
Configuration Variables
Looking for your configuration file?
host string Required
Minio server host
port integer Required
Minio server port
access_key string Required
Minio server access key
secret_key string Required
Minio server secret key
secure boolean Required , default: false
Whether to use HTTP or HTTPS connection
listen list ( Optional , default: [] )
List of configurations to listen for events to
bucket string Required
Bucket to use
prefix string ( Optional )
What prefix to use to filter file events
suffix string ( Optional , default: .* )
What file suffix to use to filter file events
events string ( Optional , default: s3:ObjectCreated:* )
What file
Automations can be triggered on new files created on the Minio server using the data_template .
#Automatically upload new local files automation : - alias : " Upload camera snapshot" triggers : - trigger : event event_type : folder_watcher event_data : event_type : created actions : - delay : " 00:00:01" - action : minio.put data : file_path : " {{ trigger.event.data.path }}" bucket : " camera-image-object-detection" key : " input/{{ now().year }}/{{ (now().month | string).zfill(2) }}/{{ (now().day | string).zfill(2) }}/{{ trigger.event.data.file }}" - delay : " 00:00:01" - action : shell_command.remove_file data : file : " {{ trigger.event.data.path }}" - alias : " Download new Minio file" triggers : - trigger : event event_type : minio conditions : [] actions : - action : minio.get data : bucket : " {{trigger.event.data.bucket}}" key : " {{trigger.event.data.key}}" file_path : " /tmp/{{ trigger.event.data.file_name }}"
The Minio integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get file ( minio.get )
Downloads a file from a MinIO bucket to the local file system.
Put file ( minio.put )
Uploads a file from the local file system to a MinIO bucket.
Remove file ( minio.remove )
Deletes a file from a MinIO bucket.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Minio integration was introduced in Home Assistant 0.98, and it's used by
17 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkislan
Categories
Utility
Back to top
