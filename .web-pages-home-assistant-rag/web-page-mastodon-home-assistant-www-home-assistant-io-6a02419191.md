---
source_url: "https://www.home-assistant.io/integrations/mastodon"
final_url: "https://www.home-assistant.io/integrations/mastodon"
canonical_url: "https://www.home-assistant.io/integrations/mastodon/"
source_handle: "web:www-home-assistant-io:6a0241919111"
source_section: "integrations-mastodon"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "ce80b2b32d86b1ed5b150905d21e945ffc91112d47f83b76b1287da29afc8667"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Mastodon - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mastodon
- Final URL: https://www.home-assistant.io/integrations/mastodon
- Canonical URL: https://www.home-assistant.io/integrations/mastodon/
- Fetched at: 2026-06-28T02:58:42Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Mastodon posts and account statistics to Home Assistant.

## Extracted Text

On this page
Use cases
Setup
Configuration
Sensors
Binary sensors
List of actions
Examples
Known limitations
Troubleshooting
Unable to use actions
Removing the integration
To remove an integration instance from Home Assistant
The Mastodon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Mastodon to post status updates, get account statistics, and mute accounts.
Posting your local weather station details to your Mastodon account.
Displaying a count of your followers on your Home Assistant dashboard.
Receiving a notification when an account you follow publishes a new status.
Muting accounts when you are busy or away to reduce your timeline.
Go to Preferences in the Mastodon web interface, then to Development and create a new application.
Select at a minimum the following scopes: read:accounts , write:accounts , write:statuses , write:media , and write:mutes .
Select Submit to create the application and generate the key, secret, and token required for the integration.
To add the Mastodon service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Mastodon .
Follow the instructions on screen to complete the setup.
URL
The URL of your Mastodon instance, for example https://mastodon.social .
Client key
The client key for the application created within your Mastodon account web interface.
Client secret
The client secret for the application created within your Mastodon account web interface.
Access token
The access token for the application created within your Mastodon account web interface.
The integration will create the following sensors for the Mastodon account:
Followers : The total number of accounts that follow this account.
Following : The total number of accounts this account follows.
Posts : The total number of posts published by the account.
Last post : When the last post was published
Username : Displays the account username and avatar, plus attributes like display name, bio, and creation date.
Sensors are updated once an hour.
Bot : Indicates whether the account performs automated actions, is not actively monitored, or identifies as a bot.
Discoverable : Indicates whether the account is discoverable. Public posts and the profile may be featured or recommended across Mastodon.
Indexable : Indicates whether public posts may appear in search results on Mastodon.
Limited : Indicates whether the account has been limited by moderators. Limited accounts are hidden from users on the instance, and their content is not publicly visible.
Moved : Indicates that the account is inactive because the user has moved to a new account.
Suspended : Indicates whether the account has been suspended.
Memorial : Indicates whether the account is marked as a memorial.
The Mastodon integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get account ( mastodon.get_account )
Gets information about a Mastodon account.
Mute account ( mastodon.mute_account )
Mutes a Mastodon account.
Post ( mastodon.post )
Posts a status on your Mastodon account.
Unmute account ( mastodon.unmute_account )
Unmutes a Mastodon account.
Update profile ( mastodon.update_profile )
Updates your Mastodon profile information and pictures.
For an overview of every action across all integrations, see the actions reference .
Example status post action
Example post action that will post a status using your account’s default visibility:
- action : mastodon.post data : config_entry_id : YOUR_MASTODON_CONFIG_ENTITY_ID status : " A toot from Home Assistant"
Example private post action
This will post a status to Mastodon, but visibility is marked as private so only followers will see it.
- action : mastodon.post data : config_entry_id : YOUR_MASTODON_CONFIG_ENTITY_ID status : " A private toot from Home Assistant" visibility : private
Example status post action avoiding recent duplication
Example post action that will post a status, but ensure that the same status is not posted more than once within one hour. This check is performed by your Mastodon instance.
actions : - variables : toot : A toot from Home Assistant - action : mastodon.post data : config_entry_id : YOUR_MASTODON_CONFIG_ENTITY_ID status : " {{ toot }}" idempotency_key : {{ toot | md5 }}
Example media post action
This will post a status to Mastodon that includes an image.
- action : mastodon.post data : config_entry_id : YOUR_MASTODON_CONFIG_ENTITY_ID status : " A media toot from Home Assistant" media : /config/www/funny_meme.png
Example post with media and a content warning that will not be visible in the public timeline
This will post a status to Mastodon that includes an image, with a description, a content warning, and a visibility of unlisted , so it doesn’t show in the public timeline.
- action : mastodon.post data : config_entry_id : YOUR_MASTODON_CONFIG_ENTITY_ID status : " A media toot from Home Assistant" visibility : unlisted media : /config/www/funny_meme.png media_description : " A funny meme" content_warning : " This might not be funny enough"
Example of muting an account you follow while you are on holiday
This automation will look for an event in your calendar and mute the specified account while the event is active, and unmute at the end of the event.
alias : Mastodon mute example description : " Mute a Mastodon account while a calendar event is active" triggers : - trigger : calendar.event_started target : entity_id : calendar.YOUR_CALENDAR id : start - trigger : calendar.event_ended target : entity_id : calendar.YOUR_CALENDAR id : end actions : - choose : - conditions : - condition : trigger id : - start sequence : - action : mastodon.mute_account data : config_entry_id : YOUR_MASTODON_CONFIG_ENTITY_ID account_name : " @ [email protected] " - conditions : - condition : trigger id : - end sequence : - action : mastodon.unmute_account data : config_entry_id : YOUR_MASTODON_CONFIG_ENTITY_ID account_name : " @ [email protected] "
For more on how to use notifications in your automations, please see the getting started with automation page .
The integration does not provide functionality to get the stream, favorite, bookmark, or boost posts of that account.
Mastodon account details only show the date of the last status you posted, not the time. If you use the mastodon.get_account action to monitor new posts, you should instead watch the statuses_count field in the action response for changes.
Symptom: “Errors appear in the log when using an action”
When using actions errors relating to permissions are shown in the logs.
Description
Actions require specific permissions within your Mastodon account to read or write data.
Resolution
Ensure that you have set these appropriately within your Mastodon account, please see the setup instructions .
This integration follows standard integration removal, once the integration is removed you can remove the application registration (assuming it was only used by this integration) from your Mastodon account by going to Preferences in the Mastodon web interface, then to Development and deleting the application you created for Home Assistant.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mastodon service was introduced in Home Assistant 0.67, and it's used by
148 active installations.
Its IoT class is Cloud Polling.
🥇 Gold quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@fabaff
@andrew-codechimp
Categories
Notifications
Sensor
Back to top
