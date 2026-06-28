# Matrix - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/matrix
- Final URL: https://www.home-assistant.io/integrations/matrix
- Canonical URL: https://www.home-assistant.io/integrations/matrix/
- Fetched at: 2026-06-28T02:58:45Z
- Content type: text/html; charset=UTF-8

## Description

Matrix chatbot support

## Extracted Text

On this page
Configuration
Event data
Comprehensive Configuration Example
Notifications
Message formats
Images in notification
Replying in threads
List of actions
Related topics
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to send messages to matrix rooms, as well as to react to messages in matrix rooms. Reacting to commands is accomplished by firing an event when one of the configured commands is triggered.
There is currently support for the following device types within Home Assistant:
To enable the Matrix integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add it to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry matrix : homeserver : https://matrix.org username : " @my_matrix_user:matrix.org" password : supersecurepassword rooms : - " #hasstest:matrix.org" commands : - word : my_command name : my_command
Configuration Variables
Looking for your configuration file?
username string Required
The matrix username that Home Assistant should use to log in. Note : You must specify a full matrix ID here, including the homeserver domain, e.g., ‘@my_matrix_bot:matrix.org’. Please note also that the ‘@’ character has a special meaning in YAML, so this must always be given in quotes.
password string Required
The password for your Matrix account.
homeserver string Required
The full URL for your homeserver. If you use the default matrix.org homeserver, this is ‘ https://matrix.org ’.
verify_ssl string ( Optional , default: true )
Verify the homeservers certificate.
rooms string ( Optional , default: empty )
The list of rooms that the bot should join and listen for commands (see below) in. While you can limit the list of rooms that a certain command applies to on a per-command basis (see below), you must still list all rooms here that commands should be received in. Rooms can be given either by their internal ID (e.g., ‘!cURbafjkfsMDVwdRDQ:matrix.org’) or any of their aliases (e.g., ‘#matrix:matrix.org’).
commands map ( Optional , default: empty )
A list of commands that the bot should listen for. If a command is triggered (via its word or expression , see below), an event is fired that you can handle using automations. Every command consists of these possible configuration options:
word string ( Optional )
Specifies a word that the bot should listen for. If you specify ‘my_command’ here, the bot will handle any message starting with ‘!my_command’.
expression string ( Optional )
Specifies a regular expression (in Python regexp syntax) that the bot should listen to. The bot will handle any message that matches the regular expression.
reaction string ( Optional )
Specifies an emoji reaction that the bot should listen to. The bot will handle any message that is reacted to with this emoji.
name string Required
The name of the command. This will be an attribute of the event that is fired when this command triggers.
A list of rooms that the bot should listen for this command in. If this is not given, the rooms list from the main configuration is used. Please note that every room in this list must also be in the main room configuration.
Warning
To prevent infinite loops when reacting to commands, you have to use a separate account for the Matrix integration.
If a command is triggered, a matrix_command event is fired. The event contains the name of the command in the name field.
If the command is a word command, the data field contains a list of the command’s arguments, that is, everything that stood behind the word, split at spaces. If the command is an expression command, the data field contains the group dictionary of the regular expression that matched the message.
This example also uses the matrix notify platform .
# The Matrix integration matrix : homeserver : https://matrix.org username : " @my_matrix_user:matrix.org" password : supersecurepassword rooms : - " #hasstest:matrix.org" - " #someothertest:matrix.org" commands : - word : testword name : testword rooms : - " #someothertest:matrix.org" - expression : " My name is (?P<name>.*)" name : introduction - reaction : 👍 name : thumbsup notify : - name : matrix_notify platform : matrix default_room : " #hasstest:matrix.org" automation : - alias : " Respond to !testword" triggers : - trigger : event event_type : matrix_command event_data : command : testword actions : - action : notify.matrix_notify data : message : " It looks like you wrote !testword" - alias : " Respond to an introduction" triggers : - trigger : event event_type : matrix_command event_data : command : introduction actions : - action : notify.matrix_notify data : message : " Hello {{trigger.event.data.args['name']}}" - alias : " Respond to a reaction in a thread" triggers : - trigger : event event_type : matrix_command event_data : command : thumbsup actions : - action : notify.matrix_notify data : message : " I saw that {{trigger.event.data.args['reaction']}} -- glad you appreciated this!" data : thread_id : " {{trigger.event.data.thread_parent}}" - alias : " React to a command" triggers : - trigger : event event_type : matrix_command event_data : command : testword actions : - action : matrix.react data : reaction : " ✅" room : " {{trigger.event.data.room}}" message_id : " {{trigger.event.data.event_id}}"
This configuration will:
Listen for “!testword” in the room “#someothertest:matrix.org” (and only ) there. If such a message is encountered, it will answer with “It looks like you wrote !testword” into the “#hasstest:matrix.org” channel and also place a ✅ reaction on the original message.
Listen in both rooms for any message matching “My name is ” and answer with “Hello ” into “#hasstest:matrix.org”.
Listen in both rooms for messages reacted to with 👍 and answer in a thread with “I saw that 👍 – glad you appreciated this!”
The matrix platform allows you to deliver notifications from Home Assistant to a Matrix room. Rooms can be both direct as well as group chats.
To enable Matrix notifications in your installation, you first need to configure the Matrix integration . Then, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : matrix default_room : ROOM_ID_OR_ALIAS
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
default_room string Required
The room all messages will be sent to, when no other target is given.
The target room has to be precreated, the room id can be obtained from the rooms settings dialog. Rooms by default have a canonical id of the form "!<randomid>:homeserver.tld" , but can also be allocated aliases like "#roomname:homeserver.tld" . Make sure to use quotes around the room id or alias to escape special characters ( ! , and # ) in YAML. The notifying account may need to be invited to the room, depending on the individual rooms policies.
To use notifications, please see the getting started with automation page .
Matrix supports sending messages using a limited HTML subset . To specify the message format, add it in the notification data .
Supported formats are: text (default), and html .
# Example of notification as HTML actions : - action : notify.matrix_notify data : message : >- <h1>Hello, world!</h1> data : format : " html"
It is possible to send images with notifications. To do so, add a list of paths in the notification data .
# Example of notification with images actions : - action : notify.matrix_notify data : message : " Test with images" data : images : - /path/to/picture.jpg
Important
If you need to include a file from an external folder in your notifications, you will have to list the source folder as allowed .
configuration.yaml ... homeassistant : allowlist_external_dirs : - /tmp
The matrix_command event will contain an event_id field that represents the message identifier for the received message.
It will also contain a thread_parent field that contains the message identifier for the parent message of the thread.
If the message was inside of a thread, thread_parent will be the identifier of the root message of the thread. If it
is not inside of a thread, thread_parent will be the same as event_id .
To reply inside of a thread, pass the correct message identifier of the root message into data.thread_id when sending
a reply message. For example:
action : notify.matrix_notify data : message : " Reply message goes here" data : thread_id : " {{ trigger.event.data.thread_parent }}"
The Matrix integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
React ( matrix.react )
Sends a reaction to a message in a Matrix room.
Send message ( matrix.send_message )
Sends a message to one or more Matrix rooms.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Matrix integration was introduced in Home Assistant 0.69, and it's used by
448 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@PaarthShah
Categories
Hub
Back to top
