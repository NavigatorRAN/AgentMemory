# Multi-factor authentication - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/docs/authentication/multi-factor-auth
- Final URL: https://www.home-assistant.io/docs/authentication/multi-factor-auth
- Canonical URL: https://www.home-assistant.io/docs/authentication/multi-factor-auth/
- Fetched at: 2026-06-28T02:12:50Z
- Content type: text/html; charset=UTF-8

## Description

Guide on configuring different multi-factor authentication modules.

## Extracted Text

On this page
Available MFA modules
Time-based One-Time Password MFA module
Notify multi-factor authentication module
The Multi-factor Authentication (MFA) modules require you to solve a second challenge after you provide your password.
A password can be compromised in a number of ways, for example, it can be guessed if it is a simple password. MFA provides a second level of defense by requiring:
something you know, like your username and password, and
something you have, like a one-time password sent to your phone.
You can use MFA with any of the other authentication providers. If more than one MFA module is enabled, you can choose one when you log in.
You can turn MFA on and off in the profile page for your user account.
Time-based One-Time Password (TOTP) is widely adopted in modern authentication systems.
Home Assistant generates a secret key which is synchronized with an app on your phone. Every thirty seconds or so the phone app generates a random six digit number. Because Home Assistant knows the secret key, it knows which number will be generated. If you enter the correct digits, then you’re in.
Setting up TOTP
Enable TOTP in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] like this:
homeassistant : auth_mfa_modules : - type : totp
If no auth_mfa_modules configuration section is defined in configuration.yaml a TOTP module named Authenticator app will be autoloaded.
You will need an authenticator app on your phone. We recommend either Google Authenticator or Authy . Both are available for iOS or Android.
Restart Home Assistant.
Go to your User profile and select the Security tab.
In the Multi-factor authentication modules section, select Enable and a new secret key will be generated.
Go to your phone app and enter the key, either by scanning the QR code or typing in the key below the QR code manually.
Caution
Please treat the secret key like a password - never expose it to others.
Your phone app will now start generating a different six-digit code every thirty seconds or so. Enter one of these into Home Assistant under the QR code where it asks for a Code .
Result: Home Assistant and your phone app are now in sync and you can now use the code displayed in the app to log in.
Using TOTP
Once TOTP is enabled, Home Assistant requires the latest code from your phone app before you can log in.
Note
TOTP is time based so it relies on your Home Assistant clock being accurate. If the verification keeps failing, make sure the clock on Home Assistant is correct.
The Notify MFA module uses the notify integration to send you an HMAC-based One-Time Password . It is typically sent to your phone, but can be sent to any destination supported by a notify action. You use this password to log in.
Setting up MFA notify
Add Notify MFA to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file like this:
homeassistant : auth_mfa_modules : - type : notify include : - notify_entity
Configuration Variables
Looking for your configuration file?
exclude list ( Optional )
The list of notifying entities you want to exclude.
include list ( Optional )
The list of notifying entities you want to include.
message template ( Optional )
The message template.
# Example configuration, with a message template. homeassistant : auth_mfa_modules : - type : totp name : " Authenticator app" - type : notify message : " I almost forget, to get into my clubhouse, you need to say {}"
After restarting Home Assistant, go to User profile and select the Security tab. In the Multi-factor authentication modules section. Under Notify one-time password , select Enable .
Try logging out, then logging in again. You will be asked for the six-digit one-time password that was sent to your notify entity. Enter the password to log in.
If the validation failed, a new one-time password will be sent again.
The Notify MFA module can’t tell if the one-time password was delivered successfully. If you don’t get the notification, you won’t be able to log in.
You can disable the Notify MFA module by editing or removing the file [your_config_dir]/.storage/auth_module.notify .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Documentation
Overview
|
FAQ
Glossary
Automations
Dashboards
Voice assistants
Organization
Home energy management
Templating
Common tasks
Configuration
Authentication
Auth providers
Multi-factor authentication
I'm locked out
Tools and helpers
iOS and Android apps
Official hardware
Home Assistant Green
Home Assistant Connect ZBT-1
Home Assistant Connect ZBT-2
Home Assistant Connect ZWA-2
Home Assistant Yellow
Home Assistant Voice Preview Edition
Back to top
