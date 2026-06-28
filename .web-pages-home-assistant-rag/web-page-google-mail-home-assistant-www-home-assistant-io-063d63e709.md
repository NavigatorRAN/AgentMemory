# Google Mail - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/google_mail
- Final URL: https://www.home-assistant.io/integrations/google_mail
- Canonical URL: https://www.home-assistant.io/integrations/google_mail/
- Fetched at: 2026-06-28T02:46:41Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to use Google Mail in Home Assistant.

## Extracted Text

On this page
Prerequisites
Scenario 1: You already have credentials
Scenario 2: You do not have credentials set up yet
Configuration
Troubleshooting
Action: Set vacation
Google Mail notify action data
Examples
Video tutorial
The Google Mail integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect your Google Mail to Home Assistant. The integration adds an action to allow you to set an email auto-response for when you go on vacation. A notify action is also added, allowing you to draft or send emails in plain text.
You need to configure developer credentials to allow Home Assistant to access your Google Account.
These credentials are the same as the ones for Nest and Google Sheets and YouTube .
These are not the same as Device Auth credentials previously recommended for Google Calendar .
In this case, all you need to do is enable the API:
Go the Google Developers Console Gmail API .
Confirm the project and Enable the API.
Continue with the steps described in the Configuration section.
In this case, you need to generate a client secret first:
To generate client ID and client secret
This section explains how to generate a client ID and client secret on
Google Developers Console .
First, go to the Google Developers Console to enable Gmail API .
Select Create project , enter a project name and select Create .
Enable the Gmail API.
Navigate to APIs & Services (left sidebar) > Credentials .
In the left sidebar, select OAuth consent screen .
It will take you to the Overview page and ask for Project Configuration :
Complete the App Information:
Set the App name (the name of the application asking for consent) to anything you want, for example, Home Assistant .
For a Support email , choose your email address from the dropdown menu.
Select Next .
For Audience, select External then select Next .
Under Contact Information, enter your email address (the same as above is fine). Select Next .
Read the policy and check the box if you agree. Select Continue .
Select Create .
In the left sidebar, select Audience :
Under Publishing status > Testing , select Publish app .
Otherwise, your credentials will expire every 7 days.
In the left sidebar, select Clients :
Select + Create Client .
For Application type, choose Web Application and give this client ID a name (like “Home Assistant Client”).
Add https://my.home-assistant.io/redirect/oauth to Authorized redirect URIs then select Create .
Note : This is not a placeholder. It is the URI that must be used.
From the resulting dialog take a note of Client ID and Client Secret you can not retrieve it again after closing the dialog.
Once you have noted these strings, select Close .
Congratulations! You are now the keeper of a client secret. Guard it in your treasure box. In most cases, your new credentials will be active within a few minutes. However, Google states that activation may take up to five hours in some circumstances.
To add the Google Mail service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Google Mail .
Follow the instructions on screen to complete the setup.
The integration setup will next give you instructions to enter the Application Credentials (OAuth Client ID and Client Secret) and authorize Home Assistant to connect to Google Mail.
OAuth and device authorization steps
Continue through the steps of selecting the account you want to authorize.
NOTE : You may get a message telling you that the app has not been verified and you will need to acknowledge that in order to proceed.
You can now see the details of what you are authorizing Home Assistant to access with two options at the bottom. Select Continue .
The page will now display Link account to Home Assistant? , note Your instance URL . If this is not correct, refer to My Home Assistant . If everything looks good, select Link Account .
You may close the window, and return back to Home Assistant where you should see a Success! message from Home Assistant.
If you have an error with your credentials you can delete them in the Application Credentials user interface.
The google_mail.set_vacation action allows you to set vacation options.
Create event action details
Data attribute Optional Description Example enabled yes Turn this off to end vacation responses. True title no The subject for the email. Vacation message yes Body of the email. I am on vacation. plain_text no Choose to send message in plain text or HTML. True restrict_contacts no Restrict automatic reply to contacts. True restrict_domain no Restrict automatic reply to domain. This only affects GSuite accounts. False start no First day of the vacation. 11-20-2022 end no Last day of the vacation. 11-26-2022
The added notify service will be named after the email address you chose on the consent screen. For example, an email address named “ [email protected] ” wil display as notify.example_gmail_com .
The following attributes can be placed inside the data key of the action for extended functionality:
Attribute Optional Description cc yes List of recipients to be carbon-copied. bcc yes List of recipients to be blind-carbon-copied. from yes Default is current authenticated user. Typically only applies to GSuite accounts where the user has delegate access to a shared mailbox. send yes Default is true. Set this to false to create a draft instead. Recipients are not required in this instance. alias_from yes Name that will be showed to the receivers instead of the user email. You have to set from if you want to use this option.
This is the full action to send an email:
action : notify.example_gmail_com data : message : " test" title : " test email" target : - " [email protected] " data : cc : - " [email protected] " bcc : - " [email protected] " from : " [email protected] " alias_from : " Example alias"
This video tutorial explains how to set up Gmail in Home Assistant and how you can create a dashboard and automations to send email and toggle your out-of-office notice.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Google Mail service was introduced in Home Assistant 2023.2, and it's used by
2891 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tkdrob
Categories
Notifications
Back to top
