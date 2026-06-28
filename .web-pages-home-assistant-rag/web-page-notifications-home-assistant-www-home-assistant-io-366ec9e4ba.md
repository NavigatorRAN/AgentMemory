# Notifications - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/notify
- Final URL: https://www.home-assistant.io/integrations/notify
- Canonical URL: https://www.home-assistant.io/integrations/notify/
- Fetched at: 2026-06-28T03:03:51Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add user notifications to Home Assistant.

## Extracted Text

On this page
The state of a notify entity
Action
Usage
Notify action
Companion app notifications
Test if it works
Example with the entity platform notify action
Examples with the legacy notify action
The Notify integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] makes it possible to send notifications to a wide variety of platforms. To use it, you have to set up at least one notification target (notifier). Check the integrations list for one that fits your use case.
If you want to send notifications to the Home Assistant web interface, you may use the Persistent Notification integration . It is available as an automatically configured notifier. See its documentation for more details.
Note
Building block integration
This notifications is a building block integration that cannot be added to your Home Assistant directly but is used and provided by other integrations.
A building block integration differs from the typical integration that connects to a device or service. Instead, other integrations that do integrate a device or service into Home Assistant use this notifications building block to provide entities, services, and other functionality that you can use in your automations or dashboards.
If one of your integrations features this building block, this page documents the functionality the notifications building block offers.
The state of a notify entity is the date and time when a message was last sent.
Screenshot showing the state of a notify entity in the developer tools.
In addition, the entity can have the following states:
Unavailable : The entity is currently unavailable.
Unknown : The state is not yet known.
The legacy notify platform will expose a generic notify action that can be called to send notifications.
Data attribute Optional Description message no Body of the notification. title yes Title of the notification. target yes Some platforms allow specifying a recipient that will receive the notification. See your platform page if it is supported. data yes On platforms who have extended functionality. See your platform page if it is supported.
The different Notify integrations you have set up will each show up as a different automation action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] that you can use.
One notification integration is automatically included, the Persistent Notifications which creates a notification in the sidebar of the web interface of Home Assistant. This can be chosen with the action named “Notifications: Send a persistent notification” which uses the notify.persistent_notification action.
Integrations can also implement the notify entity platform. Entity platform implementations will replace the legacy notify action in time. There is an entity platform action notify.send_message which allows you to send notification messages to one or multiple notify entities, mobile phones or other devices. You just need to add them in the target block.
Data attribute Optional Description message no Body of the notification. title yes Title of the notification.
A common notification integration is via the Home Assistant Companion app for Android or iOS. This can be chosen with the action “Send a notification via mobile_app_your_phone_name”, which uses the notify.mobile_app_your_phone_name action. Refer to the Companion app documentation for lots of customization options.
With any of these integrations, the message data input in the automation editor is the main text that will be sent. Other fields are optional, and some integrations support additional data or target information to customize the action. For more details, refer to their integration documentation.
Be aware that the notify.notify action is shorthand for the first notify action the system can find. It might not work as intended. Choose a specific action to make sure your message goes to the right place.
Notifications can also be sent using Notify groups . These allow you to send notifications to multiple devices with a single call, or to update which device is notified by only changing it in a single place.
After you set up a notifier , a simple way to test if you have set up your notify platform correctly is to open Settings > Developer tools > Actions tab from the sidebar. Choose your action from the Action dropdown menu depending on the integration you want to test, such as Send a persistent notification or Send a notification via mobile_app_your_phone_name . Enter your message into the Message field, and select the Perform action button.
To test the entity platform action, select the notify.send_message action, and select one or more of entity , device , area , or label . Then, supply a message .
Under Settings > Developer tools > Actions , select the Send a notification message action. Select some target entities using the entity selectors, enter a message and test sending it.
If you switch to view the YAML data under Developer tools , it will appear as below. The same action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] can be chosen in automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] . The YAML will appear the same:
action : notify.send_message data : entity_id : notify.my_direct_message_notifier message : " You have an update!" title : " Status changed"
The notify integration supports specifying templates . This will allow you to use the current state of entities in Home Assistant in your notifications, or use more complex logic to decide the message that is sent.
actions : action : notify.send_message data : entity_id : notify.my_direct_message_notifier message : " You have {{ states('todo.shopping_list') }} items on your shopping list."
In the Developer tools , on the Action tab, select the Send a persistent notification action. Enter a message and test sending it.
If you switch to view the YAML data under Developer tools , it will appear as below. The same action Actions are used in several places in Home Assistant. As part of a script or automation, actions define what is going to happen once a trigger is activated. In scripts, an action is called sequence . [Learn more] can be chosen in automation Automations in Home Assistant allow you to automatically respond to things that happen in and around your home. [Learn more] actions, whose YAML will appear the same:
action : notify.persistent_notification data : message : " Can you hear me now?"
actions : - action : notify.persistent_notification data : message : " You have {{ states('todo.shopping_list') }} items on your shopping list."
actions : - action : notify.persistent_notification data : message : " The sun is {% if is_state('sun.sun', 'above_horizon') %}up{% else %}down{% endif %}!"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Notifications entity was introduced in Home Assistant 0.7.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Notifications
Back to top
