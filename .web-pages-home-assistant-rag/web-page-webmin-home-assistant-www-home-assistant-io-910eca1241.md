---
source_url: "https://www.home-assistant.io/integrations/webmin"
final_url: "https://www.home-assistant.io/integrations/webmin"
canonical_url: "https://www.home-assistant.io/integrations/webmin/"
source_handle: "web:www-home-assistant-io:910eca1241e5"
source_section: "integrations-webmin"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "03ae11a9d7f948420e699bfc172424eeef277491aadfa13704bf38f02e33d8cb"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Webmin - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/webmin
- Final URL: https://www.home-assistant.io/integrations/webmin
- Canonical URL: https://www.home-assistant.io/integrations/webmin/
- Fetched at: 2026-06-28T03:28:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Webmin with Home Assistant.

## Extracted Text

On this page
Prerequisites
Authentication setup
Required Webmin Perl Module
Configuration
Sensors
Webmin is a web-based interface for the system administration of Unix-like servers.
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides sensors for monitoring the CPU and memory usage of your server.
Warning
Always consider your own setup and security needs before exposing services with system-level access.
As a good security practice, create a Webmin User specific to Home Assistant. A dedicated account allows for this integration to operate uninterrupted should you change your primary login for Webmin, and it can allow for more granular access so that only the necessary data and access is made available to Home Assistant.
Suggested User Setup
Create the account with a strong password,
Only enable the “Can accept RPC calls” permission (under “Permissions for all modules”),
Consider disabling the “Can accept RPC calls” permission for other users (unless specifically required),
Consider limiting this account to only have access via the IP address of your Home Assistant instance (if appropriate).
Note
The Webmin API ignores any 2FA set up via the frontend. Even with 2FA enabled, it is still possible to use the API with only a username and password.
Ensure the XML::Parser Perl module is installed via Webmin Perl Modules before configuring the integration.
Installing XML::Parser Perl Module
In the Webmin UI, go to Tools > Perl Modules .
Under the Install module tab, enter XML::Parser into the From CPAN text field.
Select Install at the bottom of the dialog.
Confirm that the installation is successful.
If the installation succeeds:
Continue with any remaining steps for Home Assistant.
If the installation fails:
Refer to Webmin documentation for Perl Modules to resolve any Webmin issues.
Retry the module installation and confirm that XML::Parser is listed on the Perl Modules page under Existing Modules .
To add the Webmin device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Webmin .
Follow the instructions on screen to complete the setup.
All entities are disabled by default. You must enable any entities that you wish to use.
The following sensors are provided:
Load (1m)
Load (5m)
Load (15m)
Memory total
Memory free
Swap total
Swap free
Total space for all disks
Free space for all disks
Used space for all disks
For each filesystem mountpoint:
Used space
Free space
Total space
Used inodes
Free inodes
Total inodes
Disk usage in percent
Inode usage in percent
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Webmin device was introduced in Home Assistant 2024.3, and it's used by
197 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@autinerd
Categories
System monitor
Back to top
