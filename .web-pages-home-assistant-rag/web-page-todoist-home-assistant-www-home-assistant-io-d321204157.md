# Todoist - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/todoist
- Final URL: https://www.home-assistant.io/integrations/todoist
- Canonical URL: https://www.home-assistant.io/integrations/todoist/
- Fetched at: 2026-06-28T03:22:54Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Todoist into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Custom projects
To-do list entity
Calendar entity attributes
List of actions
Related topics
Related links
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect to your Todoist projects as todo or calendar entities. All tasks get updated roughly every minute.
A calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] entity will be on if you have a task due in that project. It will be off if all the tasks in the project are completed or if the project doesn’t have any tasks at all.
You need to determine your Todoist API token. Go to the Integrations > Developer section on your Todoist settings page and find the section labeled API token at the bottom of the page. Copy that token and use it in your configuration file.
To add the Todoist service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Todoist .
Follow the instructions on screen to complete the setup.
You can manually configure the Todoist calendar (only) integration using configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] which can specify “custom” projects which match against criteria you set. You should
prefer the above instructions for configuring Todoist from the UI.
Manual custom projects configuration
Configuration Variables
Looking for your configuration file?
token string Required
The API token used to authorize Home Assistant to access your projects. Above you have more info about it.
custom_projects list ( Optional )
Details on any “custom” binary sensor projects you want to create.
name string Required
The name of your custom project. Only required if you specify that you want to create a custom project.
due_date_days integer ( Optional )
Only include tasks due within this many days. If you don’t have any tasks with a due date set, this returns nothing.
include_projects list ( Optional )
Only include tasks in these projects. Tasks in all other projects will be ignored.
labels list ( Optional )
Only include tasks with at least one of these labels (that is, this works as an or statement).
Here’s an example of a more advanced configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] :
# Example configuration.yaml entry calendar : - platform : todoist token : YOUR_API_TOKEN custom_projects : - name : ' All Projects' - name : ' Due Today' due_date_days : 0 - name : ' Due This Week' due_date_days : 7 - name : ' Math Homework' labels : - Homework include_projects : - Mathematical Structures II - Calculus II
As you can see, there are 4 custom projects here:
A project containing all of the tasks on this account.
A project containing all the tasks on this account that are due today.
A project containing all the tasks on this account due within the next week.
A project containing everything with the label “Homework”, taking only 2 projects into account.
You can mix-and-match these attributes to create all sorts of custom projects. You can even use IFTTT to create a task with a certain label, then have Home Assistant do some kind of automation when a task with that label comes due.
Home Assistant does its best to determine what task in each project is “most” important , and it’s that task which has its state reported. You can access the other tasks you have due soon via the all_tasks array (see below).
See the todo integration for details on how to manage
items on the Todoist to-do list, including actions for creating and
deleting to-do items.
Todoist completed to-do items are not visible in Home Assistant because they
are not returned by the Todoist REST API. Marking a To-do item as completed is
effectively deleting it from Home Assistant, though completed tasks are visible in
the Todoist UI.
offset_reached : Not used.
all_day : True if the reported task doesn’t have a due date. False if there is a due date set.
message : The title of the “most important” task coming up in this project.
description : A URL pointing to the task on the Todoist website.
location : Not used.
start_time : The last time the Todoist integration got updated. Usually within the last minute.
end_time : When the task is due.
all_tasks : A list of all tasks in this project, sorted from most important to least important.
priority : The priority Todoist reports this task as having. 1 means lowest priority, 4 means highest. Note that this is the opposite of how things are displayed in the Todoist app!
task_comments : Any comments added to this task.
task_labels : All labels associated with this task.
overdue : Whether the reported task is past its due date.
due_today : Whether the reported task is due today.
The Todoist integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
New task ( todoist.new_task )
Creates a new Todoist task and adds it to a project.
For an overview of every action across all integrations, see the actions reference .
List of to do list integrations
To do list card
Dashboards
Calendar
Todoist projects
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Todoist service was introduced in Home Assistant 0.54, and it's used by
2538 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@boralyl
Categories
To-do list
Back to top
