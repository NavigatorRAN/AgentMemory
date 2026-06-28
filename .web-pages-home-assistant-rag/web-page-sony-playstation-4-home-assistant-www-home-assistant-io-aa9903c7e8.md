# Sony PlayStation 4 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ps4
- Final URL: https://www.home-assistant.io/integrations/ps4
- Canonical URL: https://www.home-assistant.io/integrations/ps4/
- Fetched at: 2026-06-28T03:09:38Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate a Sony PlayStation 4 into Home Assistant.

## Extracted Text

On this page
Requirements
Set up
Granting Port Access
Docker
Configuration
Regions
Media Data
Formatting
Editing with Text Editor
List of actions
Switching games and apps
Troubleshooting
Cover Art Issues
Advanced Use
Ports
The Sony PlayStation 4 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to control a
Sony PlayStation 4 console .
Android or iOS device
PS4 Second Screen App for Android or iOS installed on device.
Download the Second Screen App and make sure that you can find and control your PlayStation 4 normally.
Important
Read the section “Granting Port Access” below before continuing.
Navigate to Settings -> Integrations and press the plus button in the bottom right corner. Select PlayStation 4 from the list of integrations.
Follow instructions displayed to generate user credentials. You will know this step is completed when a form with fields appears.
On the PS4, go to Settings / Mobile App Connection Settings / Add Device, a PIN will be displayed.
Pair Home Assistant to your PlayStation 4 by filling in the fields using the PIN from the above step.
Note: To find your correct region refer to the section Regions
The PlayStation 4 integration requires the use of privileged ports during configuration to work correctly, specifically UDP port 987 and TCP port 997. Depending on your OS of your Home Assistant instance, you may need to allow usage of privileged ports manually.
Warning
Do not run your Home Assistant Core instance itself as root or with root/sudo privileges to accomplish this. This would create a security risk for your host system.
There are varying methods to perform this, dependent on your OS that is running Home Assistant. Specifically, your Python Interpreter , which runs your Home Assistant instance, needs access to the mentioned ports.
When running Home Assistant using Docker, make sure that the Home Assistant container is discoverable by the PS4. This can be achieved by ensuring that the Home Assistant container uses the host network driver (by passing --net=host to the container when creating, or adding network_mode: "host" to your compose file when using docker-compose ).
Note
The PlayStation 4 integration does not use entries from configuration.yaml . You must configure this integration by using Integrations
Some titles will have different SKUs in the PlayStation Store database, depending on your region . You must select your specific region in the setup to retrieve the cover art for such titles correctly. The integration will attempt to search other databases for the correct title if it cannot be found.
The following regions have no database and cannot be used by the integration:
China, Philippines, Serbia, Vietnam.
The PlayStation 4 integration will fetch information about the game or app that is currently running from your region’s PlayStation Store database.
Occasionally, the integration may fail to get the data at all, or may get incorrect data. To correct this issue, the integration allows for manual editing via any text editor.
When the integration retrieves data from the PlayStation Store, it stores it in a JSON file named .ps4-games.json in the same directory as where your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file is located. The first line in the file will be { and the last line will be } . Between these lines, there will be indented entries for each game or app the integration finds. See the following example and table:
{ "CUSA00129" : { "locked" : true , "media_content_type" : "app" , "media_image_url" : "http://localhost:8123/local/image.jpg" , "media_title" : "Some App" }, "CUSA00123" : { "locked" : false , "media_content_type" : "game" , "media_image_url" : "https://somerandomurl.com/image.jpg" , "media_title" : "Some Game" } }
Field Value Description locked boolean Must be true or false media_content_type string Must be game or app media_image_url string Any valid URL for an image media_title string The title of the game or app
The data in the example shows 2 entries.
Each entry will begin with the SKU ID of the title, e.g., CUSA00000 and will have a field named locked with a value of true or false associated with it. The default value will be false for each entry. If locked is true , the integration will not overwrite the data pertaining to that game or app.
The media_image_url value can be any valid URL. This includes the local directory of your Home Assistant instance. The first entry in the example directs to a file named image.jpg located in the config/www/ directory.
Backup a copy of your .ps4-games.json file before continuing. If there are errors in the formatting, your file may be deleted.
To edit, simply open the file in a text editor, find the game or app you would like to edit, and edit the value(s) you wish to change and then save the file. The changes will appear the next time you play the game or app on your console.
The Sony PlayStation 4 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Send command ( ps4.send_command )
Emulates a button press on a PlayStation 4.
For an overview of every action across all integrations, see the actions reference .
To open a different game or app and close the one currently running, use the media_player.select_source action. The game or app must be in the entity’s source list. Games are added automatically when you open them normally on the console.
You can select a source by its title or by its SKU ID, such as CUSA00123 . Using the SKU ID is the most reliable.
If you are running a game/title on your PS4 that does not display a cover or displays the incorrect cover, post an issue here .
Be sure to include the following information:
Your Country
As well as the exact values for the following attributes found in the state of your PS4 entity.
media_title
media_content_id
This integration uses UDP port 1987 as the source port during runtime. During configuration, the source port will be UDP port 1988. These port assignments can be used to configure firewall rules.
In the event that these ports cannot be used, the ports will fallback to a random port.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sony PlayStation 4 hub was introduced in Home Assistant 0.89, and it's used by
1624 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@ktnrg45
Categories
Media player
Back to top
