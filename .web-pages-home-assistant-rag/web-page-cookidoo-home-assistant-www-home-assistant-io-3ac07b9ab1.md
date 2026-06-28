---
source_url: "https://www.home-assistant.io/integrations/cookidoo"
final_url: "https://www.home-assistant.io/integrations/cookidoo"
canonical_url: "https://www.home-assistant.io/integrations/cookidoo/"
source_handle: "web:www-home-assistant-io:3ac07b9ab1be"
source_section: "integrations-cookidoo"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "25cd84456f1940ab439ca3ca274d24aaa28e147d9650278ae930fb389abba498"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Cookidoo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/cookidoo
- Final URL: https://www.home-assistant.io/integrations/cookidoo
- Canonical URL: https://www.home-assistant.io/integrations/cookidoo/
- Fetched at: 2026-06-28T02:35:08Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the Cookidoo todo list with Home Assistant.

## Extracted Text

On this page
Configuration
To-do lists
Button entities
Calendar
Sensor entities
Diagnostics
Known Limitations
Data updates
Removing the integration
To remove an integration instance from Home Assistant
Related topics
Related links
The Cookidoo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to interact with your shopping lists of Cookidoo the official Thermomix recipe platform within Home Assistant.
Email
Enter the email address associated with your Cookidoo.
Password
Enter the password for your Cookidoo account.
Localization
Select the language and country for your Cookidoo account, for example, English - United States.
To add the Cookidoo service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Cookidoo .
Follow the instructions on screen to complete the setup.
This integration provides two non-sortable to-do lists:
Shopping list
Contains ingredients from recipes
Items can only be checked
Items cannot be created , deleted , or renamed
Additional purchases
Contains user-added items to purchase
Items can be created , deleted , and updated
Items do not have a description field
For example, if you add a pasta recipe, ingredients like “500g pasta” and “2 tomatoes” will appear in your “Shopping list”. You can check these items off as you shop, but you cannot modify the label.
In contrast, in your “Additional purchases” list, you can freely add items like “Kitchen towels” or “Dish soap”, and modify or remove them as needed.
The clear shopping list button entity allows you to clear both the shopping list and additional purchases list, mirroring the functionality available in the Cookidoo app. When triggered, this button will remove all items from both lists.
This button entity will appear automatically in your Home Assistant instance after adding the integration. You can use it in automations or add it to your dashboard using the Button card.
This integration provides meal plan calendar entity. Each event is full-day event, with summary corresponding to the meal planned for that day.
Subscription
State: premium , trial , or free
Description: Indicates the current subscription type
premium : Yearly subscription with full recipe access
trial : Time-limited premium access (available during account creation or new device linking)
free : Limited recipe access with full shopping list features
Subscription expiration date
State: ISO 8601 timestamp or unknown
Description: Shows when the current subscription expires
For premium and trial subscriptions: Timestamp of expiration date
For free subscriptions: Returns unknown state
These sensor entities will appear automatically in your Home Assistant instance after adding the integration.
Example state attributes
subscription : state : premium icon : mdi:account-star subscription_expiration_date : state : " 2025-01-15T23:59:59+00:00" icon : mdi:clock-reactivate
Important
As Cookidoo cannot share shopping lists between accounts and everybody interacting with it uses the same credentials, make sure you protect your credentials accordingly. All users of your Home Assistant instance will have access to the same Cookidoo account.
The Home Assistant to-do list interface allows both renaming items and changing their state. However, for the “Shopping list”, only state changes (checking/unchecking items) are supported. Any attempts to rename items will not be saved.
The Cookidoo integration fetches data from the device every 90 seconds by default.
This integration follows standard integration removal, no extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
List of to do list integrations
To do list card
Cookidoo the official Thermomix recipe platform
Vorwerk GmbH
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Cookidoo service was introduced in Home Assistant 2025.1, and it's used by
1317 active installations.
Its IoT class is Cloud Polling.
🥈 Silver quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@miaucl
Categories
To-do list
Back to top
