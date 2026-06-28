# Telegram - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/telegram
- Final URL: https://www.home-assistant.io/integrations/telegram
- Canonical URL: https://www.home-assistant.io/integrations/telegram/
- Fetched at: 2026-06-28T03:21:14Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add Telegram notifications to Home Assistant.

## Extracted Text

On this page
Setup example
Methods to retrieve a chat_id
Configuration
Text message
Photo support
Video support
Document support
Location support
Extra data attributes support
Related topics
Warning
The Telegram integration has been marked for deprecation and will be removed in the future.
Please use the Telegram bot integration instead.
The Telegram integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses Telegram to deliver notifications from Home Assistant to your Telegram application(s).
To create your first Telegram bot , follow these steps:
Bots are not allowed to contact users. You need to make the first contact from the user for which you want to set up the bot.
Tell Telegram to create a bot for you:
In Telegram, open a chat with @BotFather and enter /newbot .
Follow the instructions on screen and give your bot a name.
BotFather will give you a link to your new bot and an HTTP API token.
Store the token somewhere safe.
To get a chat ID, send any message to the GetIDs bot .
Then, enter /start .
The bot will return your chat ID and the username.
Create a Telegram bot in Home Assistant .
Create a notifier:
Paste this into your configuration file:
Replace the name and the chat_id with your data.
# Notifier notify : - platform : telegram name : " sarah" chat_id : 44441111
Restart Home Assistant.
From the conversation with BotFather, select the link to open a chat with your new bot.
In the chat with the new bot, enter /start .
Test the action:
Go to Settings > Developer tools > Actions > YAML mode .
Paste this into the YAML file:
Replace the service and the message with your data.
action : notify.sarah data : message : " Yay! A message from Home Assistant."
Select Perform action . You should now get a message.
You can do more with this. Check out the configuration descriptions and examples below.
Method 1: You can get your chat_id by sending any message to the GetIDs bot .
Method 2: To retrieve your chat_id you can visit https://api.telegram.org/bot<YOUR_API_TOKEN>/getUpdates or to use $ curl -X GET https://api.telegram.org/bot<YOUR_API_TOKEN>/getUpdates after you have sent the bot a message. Replace <YOUR_API_TOKEN> with your actual token.
The result set will include your chat ID as id in the chat section:
{ "ok" : true , "result" : [{ "update_id" : 254199982 , "message" : { "message_id" : 27 , "from" : { "id" : 123456789 , "first_name" : "YOUR_FIRST_NAME YOUR_NICK_NAME" , "last_name" : "YOUR_LAST_NAME" , "username" : "YOUR_NICK_NAME" }, "chat" : { "id" : 123456789 , "first_name" : "YOUR_FIRST_NAME YOUR_NICK_NAME" , "last_name" : "YOUR_LAST_NAME" , "username" : "YOUR_NICK_NAME" , "type" : "private" }, "date" : 1678292650 , "text" : "test" } }] }
Method 3: Another way to get your chat ID directly is described below. Start your Python interpreter from the command-line:
$ python3
>>> import telegram
>>> bot = telegram.Bot ( token = 'YOUR_API_TOKEN' ) >>> chat_id = bot.getUpdates ()[ -1 ] .message.chat_id
>>> print ( chat_id )
123456789
Tip
If you want to add new chat IDs then you will need to disable the active configuration to actually see the result with the IDs, otherwise you may only get empty results array.
Method 4: You can also get the chat ID from the Home Assistant logs. If you have set up the bot already, you can send a message to your bot from an unauthorized ID and you will see an error entry in the log containing the ID.
To enable Telegram notifications in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry for the Telegram Bot telegram_bot : - platform : polling api_key : YOUR_API_KEY allowed_chat_ids : - CHAT_ID_1 # example: 123456789 for the chat_id of a user - CHAT_ID_2 # example: -987654321 for the chat_id of a group - CHAT_ID_3 # Example configuration.yaml entry for the notifier notify : - platform : telegram name : NOTIFIER_NAME chat_id : CHAT_ID_1 # It is possible to add multiple notifiers by using another chat_id # the example belows shows an additional notifier which sends messages to the bot which is added to a group - platform : telegram name : NOTIFIER_NAME_OF_GROUP chat_id : CHAT_ID_2
Refer to the platforms mentioned in the
Telegram chatbot page for
telegram_bot configuration.
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
chat_id integer Required
The chat ID of the users or group
To use notifications, please see the getting started with automation page .
... actions : - action : notify.NOTIFIER_NAME data : title : " *Send a message*" message : " That's an example that _sends_ a *formatted* message with a custom inline keyboard." data : inline_keyboard : - ' Task 1:/command1, Task 2:/command2' - ' Task 3:/command3, Task 4:/command4'
title string ( Optional )
Will be composed as ‘%title\n%message’.
message string Required
Message text.
keyboard list ( Optional )
List of rows of commands, comma-separated, to make a custom keyboard.
inline_keyboard list ( Optional )
List of rows of commands, comma-separated, to make a custom inline keyboard with buttons with associated callback data.
... actions : - action : notify.NOTIFIER_NAME data : title : " Send an images" message : " That's an example that sends an image." data : photo : - url : http://192.168.1.28/camera.jpg username : " admin" password : " secret" - file : /tmp/picture.jpg caption : " Picture Title xy" - url : http://somebla.ie/video.png caption : " For example, a title"
url string Required
A remote path to an image. Either this or the file configuration option is required.
file string Required
A local path to an image. Either this or the url configuration option is required.
caption string ( Optional )
The title of the image.
username string ( Optional )
Username for a URL which require HTTP authentication.
password string ( Optional )
Password for a URL which require HTTP authentication.
authentication string ( Optional , default: basic )
Set to ‘digest’ to use HTTP digest authentication.
verify_ssl boolean ( Optional , default: true )
Set to false to skip the validation of the server’s SSL certificate.
Important
Since Home Assistant version 0.48 you have to whitelist the source folder of the file you want to include in the notification.
configuration.yaml ... homeassistant : allowlist_external_dirs : - /tmp - /home/kenji/data
... actions : - action : notify.NOTIFIER_NAME data : title : " Send a video" message : " That's an example that sends a video." data : video : - url : http://192.168.1.28/camera.mp4 username : " admin" password : " secret" - file : /tmp/video.mp4 caption : " Video Title xy" - url : http://somebla.ie/video.mp4 caption : " For example, a title"
A remote path to a video. Either this or the file configuration option is required.
A local path to a video. Either this or the url configuration option is required.
The title of the video.
... actions : - action : notify.NOTIFIER_NAME data : title : " Send a document" message : " That's an example that sends a document and a custom keyboard." data : document : file : /tmp/whatever.odf caption : " Document Title xy" keyboard : - ' /command1, /command2' - ' /command3, /command4'
A remote path to a document. Either this or the file configuration option is required.
A local path to a document. Either this or the url configuration option is required.
The title of the document.
... actions : - action : notify.NOTIFIER_NAME data : title : " Send location" message : " Location updated." data : location : latitude : 32.87336 longitude : 117.22743
latitude float Required
The latitude to send.
longitude float Required
The longitude to send.
... actions : - action : notify.NOTIFIER_NAME data : title : " *Send a message*" message : |- That's an example that sends a message with message_tag, disable_notification and disable_web_page_preview. <a href="https://www.home-assistant.io/">HA site</a> data : parse_mode : html message_tag : " example_tag" disable_notification : true disable_web_page_preview : true message_thread_id : 123
parse_mode string ( Optional )
Parser for the message text: markdownv2 , html or markdown .
disable_notification boolean ( Optional , default: false )
True/false to send the message silently. iOS users and web users will not receive a notification. Android users will receive a notification with no sound.
disable_web_page_preview boolean ( Optional , default: false )
True/false to display a webpage preview.
message_tag string ( Optional )
Tag for sent message.
message_thread_id integer ( Optional )
Send the message to a specific topic or thread.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Telegram integration was introduced in Home Assistant 0.7.5, and it's used by
1.8% of the active installations.
Its IoT class is Cloud Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Back to top
