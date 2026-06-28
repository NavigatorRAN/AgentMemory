# Monzo - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/monzo
- Final URL: https://www.home-assistant.io/integrations/monzo
- Canonical URL: https://www.home-assistant.io/integrations/monzo/
- Fetched at: 2026-06-28T03:01:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Monzo integration into Home Assistant.

## Extracted Text

On this page
Prerequisites and approval
Configuration
Adding a second account
Sensor
The Monzo integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Monzo bank accounts to Home Assistant.
Before adding the Monzo integration, you’ll need to create a Monzo developer account .
From here, you need to create a new OAuth client for Home Assistant to use by going to Clients > New OAuth Client .
Then, fill in the form as follows, making sure to copy the URL shown - don’t replace it with your own URL:
Name: Home Assistant
Logo URL: This can be left blank
Redirect URLs: https://my.home-assistant.io/redirect/oauth
Description: For example: Used by the Monzo Home Assistant Integration
Confidentiality: Confidential
Once submitted, you can proceed with adding the integration.
Go to Settings > Devices & services , and add the Monzo integration.
Fill in the OAuth details for the client you’ve created in the Monzo developer portal.
Important - After authorizing Home Assistant access via email, for security you’ll also need to verify again from within the Monzo app.
A reminder to do this will be displayed in Home Assistant before completing the installation - don’t proceed until you’ve done this from the popup in the mobile app.
If you’ve forgotten to do this, the integration will fail to load, but you can simply accept the popup and reload the integration without entering your details again.
To add the Monzo service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Monzo .
Follow the instructions on screen to complete the setup.
To add a second Monzo account in Home Assistant, repeat the above process for creating an OAuth client.
Then, in Home Assistant, add the new credentials before trying to add the new entry.
In the top right of Devices & services page, select the three dots menu, open Application Credentials , and select Add application credentials
It is recommended to include the person’s name in the Name field so you can distinguish it later.
Once added, you can return to Devices & services > Monzo > Add Entry to proceed with authentication.
The integration will create a device for each of your accounts and pots. For an account or a pot, you’ll have:
Balance: The current balance of the account.
Additionally, an account will also have:
Total Balance: The current balance of that account plus all of its pots.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Monzo service was introduced in Home Assistant 2024.6, and it's used by
69 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jakemartin-icl
Categories
Finance
Back to top
