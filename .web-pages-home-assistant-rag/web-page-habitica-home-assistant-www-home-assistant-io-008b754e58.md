# Habitica - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/habitica
- Final URL: https://www.home-assistant.io/integrations/habitica
- Canonical URL: https://www.home-assistant.io/integrations/habitica/
- Fetched at: 2026-06-28T02:47:48Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on enabling Habitica support for your Home Assistant

## Extracted Text

On this page
About Habitica
How you can use this integration
Prerequisites for Habitica integration
Configuration
Log in to Habitica
Advanced configuration
Sensors
Binary sensors
Image
To-do lists
Calendars
Button controls
Button controls for class skills
Mage
Warrior
Rogue
Healer
Switch controls
Notifier
Party
Keep an eye on your team mates
List of actions
Automations
Auto-accept quest invitation
Create “Empty the dishwasher” to-do
Complete toothbrushing tasks on your Habitica Dailies list
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Related topics
Related links
The Habitica integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] enables you to monitor your adventurer’s progress and stats from Habitica in Home Assistant and seamlessly integrates your to-do’s, daily tasks, and many more things.
Habitica is a gamified task manager and habit tracker that turns your daily goals and to-dos into a role-playing game, helping you stay motivated and productive while earning rewards and leveling up your avatar.
The Habitica integration lets you automate task management, such as creating to-dos when appliances finish or marking dailies complete using smart sensors. You can visualize tasks and stats in Home Assistant dashboards or create notifications for due tasks, keeping you organized and on track with your goals.
To set up the Habitica integration, you must first have an active Habitica account. You can register for an account at Habitica.com .
During the setup process in Home Assistant, you can choose between two login options:
“Login to Habitica”, which allows you to log in with your username or email and password .
“Login to other instances”, which requires your User ID and API Token . The User ID and API Token can be retrieved by logging into your Habitica account, navigating to the Settings menu, and selecting Site Data .
Additionally, you will need to provide the URL for the Habitica instance you wish to connect to; the default URL is https://habitica.com , but you can specify a different URL if you are using an alternative Habitica instance or a self-hosted instance.
To add the Habitica service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Habitica .
Follow the instructions on screen to complete the setup.
Email or username
Email or username (case-sensitive) to connect Home Assistant to your Habitica account
Password
Password for the account to connect Home Assistant to Habitica
If you choose “ Login to other instances ” you will be presented the following configuration options:
User ID
User ID of your Habitica account ( see prerequisites )
API Token
API Token of the Habitica account ( see prerequisites )
URL
URL of the Habitica installation to connect to. Defaults to https://habitica.com ( see prerequisites )
Verify SSL certificate
Enable SSL certificate verification for secure connections. Disable only if connecting to a Habitica instance using a self-signed certificate
Class : Indicates the class of your character (Warrior, Rogue, Healer, or Mage).
Display name : Shows the character’s display name.
Experience : Displays the current experience points of the character (for example, “144 XP”).
Gold : Shows the amount of gold owned by your character (for example, “22.29 GP”).
Health : Shows the current health points of the character (for example, “42 HP”).
Level : Displays the current level of the character.
Mana : Displays the current mana points of your character (for example, “61 MP”).
Max. mana : Indicates the maximum mana points your character can have at the current level (for example, “70 MP”).
Next level : Indicates the remaining experience points needed to reach the next level (for example, “440 XP”).
Gems : Shows the total number of gems currently owned by your Habitica character, used for purchasing items and customizations.
Mystic hourglasses : Displays the number of mystic hourglasses earned as a subscriber, which can be redeemed for exclusive items from past events.
Strength, intelligence, constitution, perception : Display your character’s attribute points (stats). The sensors’ attributes provide a breakdown of contributions from level, battle gear, class equip bonus, allocation, and buffs.
Eggs : Shows the total number of eggs in your inventory. The sensor’s attributes provide a detailed list of each egg type and quantity.
Pet food : Displays the total amount of food available. The sensor’s attributes list each food type and its quantity. Feed it to your pets and they may grow into a sturdy steed.
Saddles : Indicates the number of saddles owned, used for instantly raising pets to mounts.
Hatching potions : Shows the total count of available hatching potions. The sensor’s attributes detail each potion type and quantity. Pour them on an egg to hatch a pet.
Quest scrolls : Displays the total number of quest scrolls in your inventory. A list of each quest scroll and its quantity is provided in the sensor’s attributes.
Pending damage : Total damage accumulated during the day by completing your tasks. The quest boss is then attacked for this amount at the end of the day.
Pending quest items : Quest items found during the day when completing tasks. The total is counted towards the quest objective at the end of the day.
Last check-in : Last time a user checked in.
Pending quest invitation : Indicates if you have an invitation to a quest awaiting your response.
Avatar : Displays your character’s current avatar (note: animated avatars are currently not supported and will be displayed as static images).
The following Habitica tasks are available as to-do lists in Home Assistant. You can add, delete, edit and check-off completed tasks
To-Do’s : Displays a comprehensive list of active and completed to-dos. Each to-do includes its due date if applicable, allowing you to check them off, edit them, delete them, and create new to-dos seamlessly.
Dailies : Shows the daily tasks that need to be completed today or in the future. Tasks completed yesterday can still be marked off as “yesterdailies” until a new day starts.
The following calendars A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] will be created:
To-Do calendar : Lists the due dates for all active to-do tasks. Each event on this calendar represents a to-do item that has a set due date, making it easy to track upcoming deadlines and plan accordingly.
Dailies calendar : Displays all daily tasks that are scheduled for today and are still active. It also shows all tasks scheduled for future dates, helping you stay organized and track upcoming routines. The calendar sensor will be active if there are unfinished tasks for today and display the next due daily (based on sort order if there are multiple tasks due for that day).
To-Do reminders calendar : Lists events for reminders associated with your to-dos in Habitica, helping you track when notifications for specific to-dos are expected.
Dailies reminders calendar : Shows events for reminders linked to your Habitica dailies, ensuring you know when notifications for your dailies will occur.
Start my day : Initiates daily routine actions in Habitica, including resetting your dailies, deal damage from unfinished dailies and quest bosses, habits adjustment, buff expiration, and mana regeneration based on completed dailies.
Revive from death : Allows your character to revive from death in Habitica. Upon revival, HP is fully restored, but your character will lose all gold, 1 level, all experience points, one stat point, and one piece of equipment.
Buy a health potion : Allows your character to purchase a health potion in Habitica. Instantly applies the potion upon purchase, healing 15 HP at a cost of 25 GP.
Allocate all stat points : Assigns all unallocated stat points based on the previously set automatic allocation method. If no method is set, all points are assigned to strength (STR).
If you’ve unlocked the class system, button controls for casting player and party skills will become available, depending on the class you’ve selected. For task skills see action habitica.cast_skill
Ethereal surge : You sacrifice Mana so the rest of your party, except for other mages, gains MP. (based on: INT)
Earthquake : Your mental power shakes the earth and buffs your party’s intelligence. (based on: unbuffed INT)
Chilling frost : With one cast, ice freezes all your streaks so they won’t reset to zero tomorrow.
Defensive stance : You crouch low and gain a buff to constitution. (based on: unbuffed CON)
Valorous presence : Your boldness buffs your whole party’s strength. (based on: unbuffed STR)
Intimidating gaze : Your fierce stare buffs your whole Party’s constitution. (based on: unbuffed CON)
Tools of the trade : Your tricky talents buff your whole party’s perception. (based on: unbuffed PER)
Stealth : With each cast, a few of your undone dailies won’t cause damage tonight. Their streaks and colors won’t change. (based on: PER)
Healing light : Shining light restores your health. (based on: CON and INT)
Searing brightness : A burst of light makes your tasks more blue/less red. (based on: INT)
Protective aura : You shield your party by buffing their constitution. (based on: unbuffed CON)
Blessing : Your soothing spell restores your whole party’s health. (based on: CON and INT)
Rest in the Inn : When enabled, allows your character to rest in the inn in Habitica, pausing damage dealt from dailies and quest bosses.
Party chat : Sends a message to your party’s group chat.
Private message : Sends a private message to an individual party member. A separate notify entity is created for each member of your party.
If you’re part of a party, the integration creates a device with these entities.
Boss health : The total health of the quest boss.
Boss health remaining : The remaining health of the quest boss.
Collected quest items : Displays the total number of items collected. Attributes include a breakdown of each required item type, showing both collected and required amounts.
Group leader : The username of your party’s leader.
Member count : The current number of members in your party.
Quest : Shows the name of the current quest your party is engaged in.
Quest boss : The name and image of the foe your party is currently battling.
Boss rage : Rage accumulated when quest participants miss their daily tasks.
Boss rage limit break : The maximum rage a quest boss can hold. Once this limit is reached, the boss unleashes its rage skill.
Note
Certain entities are only available depending on whether you are in a boss quest or a collect quest.
You can add members of your party to Home Assistant, so you can keep an eye on your mates health and other key stats. To add a party member, go to Settings > Devices & services > Habitica and select Add party member .
When you add someone, Home Assistant creates a new entry with the following entities:
Sensors : Class, display name, health, mana, max. mana, experience, next level, strength, intelligence, constitution, and perception.
Image : Avatar
For details about each of these entities, see the descriptions above under Sensors and Image .
The Habitica integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Abort an active quest ( habitica.abort_quest )
Terminates your Habitica party’s ongoing quest and resets all progress.
Accept a quest invitation ( habitica.accept_quest )
Accepts a pending quest invitation for your Habitica party.
Cancel a pending quest ( habitica.cancel_quest )
Cancels a Habitica quest that has not started yet and resets invitations.
Cast a skill ( habitica.cast_skill )
Uses a skill or spell from your Habitica character on a task.
Create a daily ( habitica.create_daily )
Creates a daily for your Habitica character.
Create habit ( habitica.create_habit )
Creates a habit for your Habitica character.
Create reward ( habitica.create_reward )
Creates a custom reward for your Habitica character.
Create to-do ( habitica.create_todo )
Creates a to-do for your Habitica character.
Get tasks ( habitica.get_tasks )
Retrieves tasks from your Habitica account, with optional filters.
Leave a quest ( habitica.leave_quest )
Leaves the quest your Habitica character is participating in.
Reject a quest invitation ( habitica.reject_quest )
Rejects a pending quest invitation for your Habitica character.
Track a habit ( habitica.score_habit )
Increases the positive or negative streak of a Habitica habit to track its progress.
Buy a reward ( habitica.score_reward )
Buys a custom Habitica reward with gold.
Force-start a pending quest ( habitica.start_quest )
Force-starts your Habitica party’s quest, bypassing pending invitations.
Use a transformation item ( habitica.transformation )
Uses a transformation item on a Habitica party member or yourself.
Update a daily ( habitica.update_daily )
Updates an existing daily for your Habitica character.
Update a habit ( habitica.update_habit )
Updates an existing habit for your Habitica character.
Update a reward ( habitica.update_reward )
Updates an existing custom reward for your Habitica character.
Update a to-do ( habitica.update_todo )
Updates an existing to-do for your Habitica character.
For an overview of every action across all integrations, see the actions reference .
Get started with these automation examples for Habitica, each featuring ready-to-use blueprints!
Automatically accepts quest invitations from your Habitica party and creates a persistent notification to inform you when a quest has been successfully accepted.
Example YAML configuration
triggers : - trigger : state entity_id : binary_sensor.habitica_pending_quest_invitation from : " off" to : " on" actions : - action : habitica.accept_quest data : config_entry : config_entry_id response_variable : action_response - action : notify.persistent_notification data : title : You have been invited to a quest! message : >- ![{{action_response["key"]}}](https://habitica-assets.s3.amazonaws.com/mobileApp/images/inventory_quest_scroll_{{action_response["key"]}}.png) The invitation has been accepted, and the quest {% if action_response["active"] %}has already started{% else %}is waiting for other party members to join{% endif %}.
When creating automations, be mindful of the rate limits . Frequent triggers or multiple concurrent automations can quickly exceed the allowed number of requests.
Automatically create a Habitica to-do when the dishwasher finishes its cycle.
triggers : - trigger : state entity_id : sensor.dishwasher from : " on" to : " off" actions : - action : todo.add_item data : item : " Empty the dishwasher 🥣🍽️" due_date : " {{now().date()}}" description : " Empty the clean dishes from the dishwasher and load any dirty dishes that are waiting." target : entity_id : todo.habitica_to_dos
Automatically mark your morning and evening toothbrushing dailies as complete when your toothbrush usage is detected.
triggers : - trigger : state entity_id : sensor.oralb_toothbrush_state to : " running" for : hours : 0 minutes : 0 seconds : 10 # Time delay for debouncing to avoid false triggers actions : - choose : - conditions : - condition : time after : " 05:00:00" before : " 12:00:00" sequence : - action : todo.update_item data : item : " Brush your teeth in the morning 🪥" status : completed target : entity_id : todo.habitica_dailies - conditions : - condition : time after : " 18:00:00" before : " 23:59:00" sequence : - action : todo.update_item data : item : " Brush your teeth before bed 🪥" status : completed target : entity_id : todo.habitica_dailies
This integration syncs with Habitica every 60 seconds to keep your own data up to date.
Party data, including any party members you’ve added as sub-entries, is refreshed every 15 minutes.
Habitica imposes a rate limit of 30 requests per minute for third-party applications, which applies collectively to all tools and integrations you use.
This integration performs the following requests:
3 requests per data update (every 60 seconds).
1 request per action, such as executing skills or interacting with to-dos and dailies.
1 additional request 5 seconds after an action to sync the data with Habitica.
Please keep these limits in mind to avoid exceeding Habitica’s request allowance. Efforts are ongoing to optimize the integration and reduce the number of requests it makes.
The Habitica integration relies on an active internet connection to communicate with Habitica . If you encounter issues, verify that your network connection is stable. Additionally, the Habitica service itself may experience downtime, whether unexpected or due to scheduled maintenance. In these trying times of uncertainty and challenge, when fate tests your resolve, seek guidance from the Habitica Outage Instructions on the community-maintained Habitica wiki — wisdom shared by adventurers who have faced such trials before.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
List of to do list integrations
To do list card
Habitica
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Habitica service was introduced in Home Assistant 0.78, and it's used by
203 active installations.
Its IoT class is Cloud Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tr4nt0r
Categories
Calendar
Sensor
To-do list
Back to top
