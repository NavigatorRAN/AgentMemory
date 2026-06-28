---
source_url: "https://www.home-assistant.io/docs/configuration/user-configuration"
final_url: "https://www.home-assistant.io/docs/configuration/user-configuration"
canonical_url: "https://www.home-assistant.io/docs/configuration/user-configuration/"
source_handle: "web:www-home-assistant-io:63ee9b050101"
source_section: "docs-configuration"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "daf4953a2b5a37010f8ce9d8b598dda08eeeb0777167e859b90a8606637f7ebe"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# People and user configuration - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/configuration/user-configuration
- Final URL: https://www.home-assistant.io/docs/configuration/user-configuration
- Canonical URL: https://www.home-assistant.io/docs/configuration/user-configuration/
- Fetched at: 2026-06-28T02:21:47Z
- Content type: text/html; charset=UTF-8

## Description

Manage the people who use your Home Assistant, such as changing display names, usernames, and authentication settings.

## Extracted Text

On this page
About persons and users
About user accounts
About your account profile
Adding a person
Changing a person’s display name
Prerequisites
To change a person’s display name
Changing a username
To change a username
Changing authentication settings
Deleting a user or person
To delete a person and its user account
To delete only the user account and keep the person
To delete a user via the Users tab
Related topics
Each person who uses Home Assistant can have their own display name and login credentials. This page explains how to change a person’s display name, change a username, and where to find authentication settings.
A person and a user are two different concepts in Home Assistant:
A person is used for presence detection. A person can be tracked, shown on the map, and used in automations that react when someone arrives or leaves.
A user is a login account. It is what someone uses to sign in to Home Assistant, see their own dashboards, and, with the right permissions, manage the system.
The two are linked only when the same individual needs both. You attach a user to a person by turning on Allow login for that person. This means you can have each one on its own:
A person without a user cannot sign in, but can still be tracked for presence, shown on the map, and used in automations. This is useful for household members, such as children, whose phone you track but who do not need their own login.
A user without a person can sign in, but is not tracked for presence and does not appear on the map or in presence-based automations. This is useful for logins that do not belong to a tracked person, such as:
A service or integration account that authenticates with the API, for example for a script or another app.
A local-only account for a wall-mounted tablet or kiosk.
An administrative or guest login where presence tracking is not needed.
To create a user that is not linked to a person, add it from the Users tab instead of from People .
When you start Home Assistant for the first time, the owner user account is created. The owner has the highest level of access and can manage every part of the system, including creating and managing other user accounts.
User accounts come in two levels of access:
Administrators can configure integrations, devices, and system settings, and manage other users. The owner is always an administrator.
Non-administrator users have restricted access. They can use Home Assistant and see their own dashboards, but cannot reach the configuration and system settings.
You set whether a user is an administrator with the Administrator toggle when you create or edit their account.
Once you’re signed in, you can manage your personal settings on the User profile page. To open it, select your name at the very bottom of the sidebar.
The profile page has two tabs: General and Security . The General tab holds your personal preferences. They only affect your own account and the device you are using.
The Security tab is where you manage how you sign in, such as your password, multi-factor authentication, and access tokens. For more information, refer to Authentication .
You can also sign out of Home Assistant from the profile page.
Changing the theme and organizing your sidebar
User preferences are tied to your account and follow you across the devices you sign in to.
Go to User profile and open the General tab.
Under User preferences , adjust any of the following:
Theme : How Home Assistant looks.
Default dashboard : The dashboard that opens when you start Home Assistant.
To change which items appear in the sidebar and in what order, select Edit next to Change the order and hide items from the sidebar .
Changing your localization settings
Localization settings control how dates, times, and numbers are shown. They are tied to your account.
Under User preferences > Language , select the language of the interface.
Under Localization , adjust any of the following:
Time zone .
Number format .
Time format .
Date format .
First day of the week .
Changing your browser settings
Browser settings apply only to the device you are currently using and may reset when you sign out or clear local data. In the companion app, this section is called Mobile app settings .
Under Browser settings (or Mobile app settings ), adjust any of the available options, such as:
Always hide the sidebar.
Prevent automatic logout.
Enable keyboard shortcuts.
Vibration and push notifications, depending on your device.
To add a new person and optionally create a user account for them, refer to adding a person to Home Assistant .
The display name is the name that is shown in Home Assistant. It can differ from the username, which is the name used to log in.
You need administrator rights to change a display name.
To edit the display name of a person using Home Assistant, go to Settings > People .
Select the person for whom you want to change the display name.
Change the Name , and then select Save .
The username is the name that is used to log in. It can differ from the display name.
You need owner rights to change a username.
To edit the username of a person using Home Assistant, go to Settings > People .
Select the person whose username you want to change.
Next to the username, select Edit .
In the Change username dialog, enter the New username and select Change .
The username must be lowercase and must not contain spaces.
Signing in is case-sensitive.
To learn how to edit authentication settings such as password or multi-factor authentication, refer to the following topics:
Authentication
multi-factor authentication
Help, I’m locked out
Because a person and a user are two different concepts , you can delete one without the other:
If you delete the person, the linked user account is deleted as well.
If you delete only the user, the person stays. The person can no longer sign in, but it can still be used for presence detection, shown on the map, and used in automations.
You need owner or administrator rights to delete a user or person.
You cannot delete the owner account or the account you are currently signed in with.
Go to Settings > People and select the person you want to delete.
At the bottom of the dialog, select Delete .
To confirm, select OK .
Delete only the user when you want to revoke someone’s access to Home Assistant while still tracking them for presence. For example, when a household member should no longer be able to sign in, but you still want their presence to drive automations and show on the map.
Go to Settings > People and select the person whose login you want to delete.
Turn off Allow login .
The user account and its login credentials are deleted, but the person remains.
You can also delete a user account without going through the person. This is useful for user-only accounts.
Go to Settings > People and select the Users tab.
Select the user you want to delete.
At the bottom of the dialog, select Delete user .
Multi factor authentication
Person
Help, i'm locked out
Home information
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
