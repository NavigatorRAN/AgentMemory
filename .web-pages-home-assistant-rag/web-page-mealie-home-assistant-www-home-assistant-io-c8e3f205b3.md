---
source_url: "https://www.home-assistant.io/integrations/mealie"
final_url: "https://www.home-assistant.io/integrations/mealie"
canonical_url: "https://www.home-assistant.io/integrations/mealie/"
source_handle: "web:www-home-assistant-io:c8e3f205b370"
source_section: "integrations-mealie"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4a93bba660b29355f75bea5a4998b87578249f21d9406f9cd38209589efb9d31"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Mealie - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/mealie
- Final URL: https://www.home-assistant.io/integrations/mealie
- Canonical URL: https://www.home-assistant.io/integrations/mealie/
- Fetched at: 2026-06-28T02:59:00Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to set up Mealie devices in Home Assistant.

## Extracted Text

On this page
Use cases
Supported versions
Prerequisites
Configuration
Available calendars
Shopping Lists
Sensors
List of actions
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
Mealie is an open source, self-hosted recipe manager, meal planner, and shopping list. The Mealie integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will fetch and allow you to create and update data held in your Mealie instance.
View your upcoming meal plans in the calendars.
Use automations or your voice assistant to add items to a shopping list.
Use zone presence-detection to remind you when you approach a store that you have items on your shopping list to pick up.
Search for a recipe by ingredient.
Mealie instances version 2 and later are supported.
You create your API token on your Mealie installation:
Sign in to Mealie.
Go to your user (profile).
Go to Manage Your API Tokens under ( /user/profile/api-tokens ).
Enter a meaningful token name, such as ‘Home Assistant’.
Select Generate .
Copy the token that now appears so that you can later paste it into Home Assistant.
To add the Mealie service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Mealie .
Follow the instructions on screen to complete the setup.
URL
The URL of your Mealie installation.
API token
The API token for your Mealie installation you generated in the prerequisites.
Verify SSL certificate
Enable this unless you are using a self-signed certificate on your Mealie installation.
The integration will create a calendar A calendar entity represents a schedule of events coming from a local or external calendar source. It can be used to trigger automations based on the start or end of an event, react to offsets (like 15 minutes before), or retrieve event details through services. [Learn more] for every type of meal plan, which are updated once an hour:
Breakfast
Lunch
Dinner
Side
Dessert
Drink
Snack
The integration will create a to-do list for every Mealie shopping list, which are updated every 5 minutes.
The integration provides the following sensors for the statistics, which are updated every 15 minutes:
number of recipes
categories (such as beverage, dessert, Italian, seafood)
tags (such as alcohol)
tools (such as instant pot, air fryer, or BBQ)
users
The Mealie integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Get meal plan ( mealie.get_mealplan )
Get the Mealie meal plan for a specified date range.
Get recipe ( mealie.get_recipe )
Get a Mealie recipe by its ID or slug.
Get recipes ( mealie.get_recipes )
Search Mealie for recipes that match your search terms.
Get shopping list items ( mealie.get_shopping_list_items )
Get the items on a Mealie shopping list.
Import recipe ( mealie.import_recipe )
Import a recipe into Mealie from a URL.
Set a meal plan ( mealie.set_mealplan )
Plan a recipe or a meal note on a specific date in Mealie.
Set random meal plan ( mealie.set_random_mealplan )
Plan a random recipe on a specific date in Mealie.
For an overview of every action across all integrations, see the actions reference .
When editing a food item within the shopping list the item will be converted to a note style item.
If you are using the Mealie app for Home Assistant (formerly known as Mealie add-on), use the direct URL with port number (default 9090) for the Mealie web page. Do not use the ingress URL that ends with /xxx_mealie.
Before reporting an issue, enable debug logging and restart the integration. As soon as the issue re-occurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible , download the diagnostics The diagnostics integration provides a way to download diagnostic data from a device or integration for sharing in issue reports. Sharing diagnostics data when reporting an issue allows developers to diagnose and fix your reported problem quicker. [Learn more] data. If you have collected the debug log and the diagnostics data, include them in the issue report.
This integration follows standard integration removal, once the integration is removed you can remove the API token (assuming it was only used by this integration) by going to your Account in the Mealie web interface, then to Manage Your API Tokens and deleting the token you created for Home Assistant.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Mealie service was introduced in Home Assistant 2024.7, and it's used by
2470 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@joostlek
@andrew-codechimp
Categories
Calendar
To-do list
Back to top
