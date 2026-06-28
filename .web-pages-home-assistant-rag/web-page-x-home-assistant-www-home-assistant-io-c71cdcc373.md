# X - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/twitter
- Final URL: https://www.home-assistant.io/integrations/twitter
- Canonical URL: https://www.home-assistant.io/integrations/twitter/
- Fetched at: 2026-06-28T03:24:24Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add X notifications to Home Assistant.

## Extracted Text

On this page
Setup
App permissions
Generate tokens and secrets
Configuration
The X integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] uses X to deliver notifications from Home Assistant.
Make sure you have a developer account registered with X, then go to X Apps and create an application. If you don’t have a developer account you need to apply for one, it can take some time to get approved.
If you do not perform this step, your application will only receive read permissions and will not be able to post tweets on behalf of your account on X.
Visit Settings of the application.
Select Set up under User authentication settings .
Check the box for OAuth 1.0a .
Set the app permission to Read and write .
Enter a callback and website URL and click save.
It does not matter for the integration what you enter as a callback or website URL.
Visit Keys and tokens of the application.
Select Regenerate under Consumer keys to get your Consumer Key and Consumer Secret .
Select Regenerate under Access Tokens and Secret to get your Access Token and Access Token Secret .
To add X to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : twitter consumer_key : YOUR_API_KEY consumer_secret : YOUR_API_SECRET access_token : YOUR_ACCESS_TOKEN access_token_secret : YOUR_ACCESS_SECRET
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
consumer_key string Required
Your Consumer Key (API Key) for the application.
consumer_secret string Required
Your Consumer Secret (API Secret) for the application.
access_token string Required
Your Access Token for the application.
access_token_secret string Required
Your Access Token Secret for the application.
username string ( Optional )
X handle without @ or with @ and quoting for direct messaging.
To use notifications, please see the getting started with automation page .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The X integration was introduced in Home Assistant 0.12, and it's used by
44 active installations.
Its IoT class is Cloud Push.
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
