---
source_url: "https://www.home-assistant.io/integrations/picnic"
final_url: "https://www.home-assistant.io/integrations/picnic"
canonical_url: "https://www.home-assistant.io/integrations/picnic/"
source_handle: "web:www-home-assistant-io:67c7037f9fb0"
source_section: "integrations-picnic"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "6d2184e32611daf740142832550113fa3a2c6242a6ab346a79ee3bea835e505a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# Picnic - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/picnic
- Final URL: https://www.home-assistant.io/integrations/picnic
- Canonical URL: https://www.home-assistant.io/integrations/picnic/
- Fetched at: 2026-06-28T03:08:04Z
- Content type: text/html; charset=UTF-8

## Description

How to set up and use the Picnic integration in Home Assistant.

## Extracted Text

On this page
Configuration
Sensors
Shopping cart
List of actions
The Picnic integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows one to get information from Picnic about orders, deliveries and cart content.
To add the Picnic service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Picnic .
Follow the instructions on screen to complete the setup.
This integration provides the following sensors. Some sensors are disabled by default when adding the integration.
Name Description Cart items count The amount of different products currently in the cart. Cart total price The total price for products currently in the cart. Selected slot start Start of the selected delivery slot, unknown if none is selected. Selected slot end End of the selected delivery slot, unknown if none is selected. Selected slot max order time Maximum time it’s still possible to place an order for the selected delivery slot, unknown if none is selected. Selected slot min order value The minimum order value needed to be able to place an order for the selected delivery window slot, unknown if none is selected. Last order slot start Start of the last placed order’s delivery slot Last order slot end End of the last placed order’s delivery slot Last order status Status of the last order, either CURRENT , CANCELLED or COMPLETED . Will only transition to COMPLETED after the invoice email has been sent. Last order max order time Maximum time it is/was still possible to add products to the last order. Last order delivery time The delivery time of the last order, unavailable if not yet delivered. Last order total price The total price of the last order. Next delivery ETA start Start of the ETA window of the next delivery, will get more precise if the driver is underway. Next delivery ETA end End of the ETA window of the next delivery. Next delivery slot start Start of the next delivery’s delivery slot. Next delivery slot end End of the next delivery’s delivery slot.
This integration provides a list containing the content of your shopping cart. This list is provided as a to-do list and can also be found in the to-do list dashboard in the main sidebar of your Home Assistant instance.
You can add products to your shopping cart by entering a name in the Add item field. Just like with the Add a product to the cart action, Picnic searches for the product and adds the first result to your cart.
The Picnic integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Add a product to the cart ( picnic.add_product )
Adds a product to your Picnic shopping cart by product ID or by searching for a product name.
For an overview of every action across all integrations, see the actions reference .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Picnic service was introduced in Home Assistant 2021.5, and it's used by
666 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@corneyl
@codesalatdev
Categories
Other
Back to top
