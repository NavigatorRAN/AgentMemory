---
source_url: "https://www.home-assistant.io/integrations/smtp"
final_url: "https://www.home-assistant.io/integrations/smtp"
canonical_url: "https://www.home-assistant.io/integrations/smtp/"
source_handle: "web:www-home-assistant-io:8c9f398c3e09"
source_section: "integrations-smtp"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "4f9b6b47c51e1ed5be3121031705d4ab6f5670cf3ad1e2f340e8fc406f31d090"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# SMTP - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/smtp
- Final URL: https://www.home-assistant.io/integrations/smtp
- Canonical URL: https://www.home-assistant.io/integrations/smtp/
- Fetched at: 2026-06-28T03:17:32Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add email notifications to Home Assistant.

## Extracted Text

On this page
Usage
Specific email provider configuration
Google Mail
The SMTP integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to deliver notifications from Home Assistant to an email recipient.
To enable notification by email in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - name : " NOTIFIER_NAME" platform : smtp sender : " YOUR_SENDER" recipient : " YOUR_RECIPIENT"
Check your email provider configuration or help pages to get the correct SMTP settings. A restart of Home Assistant is required to pick up the configuration changes.
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
sender string Required
email address of the sender.
recipient list | string Required
Default email address of the recipient of the notification. This can be a recipient address or a list of addresses for multiple recipients.
This is where you want to send your email notifications by default (when not specifying target in the action). Any email address(es) specified in the action’s target field will override this recipient content.
server string ( Optional , default: localhost )
SMTP server which is used to send the notifications.
port integer ( Optional , default: 587 )
The port that the SMTP server is using.
timeout integer ( Optional , default: 5 )
The timeout in seconds that the SMTP server is using.
username string ( Optional )
Username for the SMTP account.
password string ( Optional )
Password for the SMTP server that belongs to the given username. Make sure to wrap it in double quotes; e.g., "MY_PASSWORD" .
encryption string ( Optional , default: starttls )
Set mode for encryption, starttls , tls or none .
sender_name string ( Optional )
Sets a custom ‘sender name’ in the emails headers ( From : Custom name [email protected] ).
debug boolean ( Optional , default: false )
Enables Debug, e.g., true or false .
verify_ssl boolean ( Optional , default: true )
If the SSL certificate of the server needs to be verified.
A notify integration will be created using the name without spaces. In the above example, it will be called notify.NOTIFIER_NAME . To use the SMTP notification, refer to it in an automation or script like in this example:
- alias : " Send E-Mail Every Morning" triggers : - platform : time at : " 08:00:00" actions : - action : notify.NOTIFIER_NAME data : title : " Good Morning" message : " Rise and shine" target : - " [email protected] "
The optional target field is used to specify recipient(s) for this specific action. When target field is not used, this message will be sent to default recipient(s), specified in the recipient part of the smtp notifier in configuration.yaml . Line breaks can be added in the body part of the email by using \r\n , for instance message: "Rise and shine\r\n\r\nIt's a brand new day!"
Another example attaching images stored locally in a script:
burglar : alias : " Burglar Alarm" sequence : - action : shell_command.snapshot - delay : seconds : 1 - action : notify.NOTIFIER_NAME data : title : " Intruder alert" message : " Intruder alert at apartment!!" target : - " [email protected] " data : images : - /home/pi/snapshot1.jpg - /home/pi/snapshot2.jpg
The optional html field makes a custom text/HTML multi-part message, allowing total freedom for sending rich HTML emails by defining the HTML content. In them, if you need to include images, you can pass both arguments ( html and images ). The images will be attached with the basename of the images, so they can be included in the html page with src="cid:image_name.ext" .
The optional images field adds image attachments to the email. If html is defined, the images need to be added to the message in-line as described above (and as shown in the example below). If html is not defined, images will be added as separate attachments.
Important
When adding images, make sure the folders containing the attachments are added to allowlist_external_dirs .
See: Setup basic documentation
burglar : alias : " Burglar Alarm" sequence : - action : shell_command.snapshot - delay : seconds : 1 - action : notify.NOTIFIER_NAME data : message : " Intruder alert at apartment!!" data : images : - /home/pi/snapshot1.jpg - /home/pi/snapshot2.jpg html : > <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html lang="en" xmlns="http://www.w3.org/1999/xhtml"> <head> <meta charset="UTF-8"> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>Intruder alert</title> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css"> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css"> <style type="text/css"> @font-face { font-family: 'Open Sans'; font-style: normal; font-weight: 300; src: local('Open Sans Light'), local('OpenSans-Light'), url(http://fonts.gstatic.com/s/opensans/v13/DXI1ORHCpsQm3Vp6mXoaTZS3E-kSBmtLoNJPDtbj2Pk.ttf) format('truetype'); } h1,h2,h3,h4,h5,h6 { font-family:'Open Sans',Arial,sans-serif; font-weight:400; margin:10px 0 } </style> </head> <body> <div class="jumbotron jumbotron-fluid" style="background-color: #f00a2d; color: white;"> <div class="container py-0"> <h1>Intruder alert at apartment!!</h1> </div> </div> <div class="container-fluid"> <div class="row"> <div class="col-xs-12 col-md-6 px-0"> <img class="rounded" style="width: 100%;" alt="snapshot1" src="cid:snapshot1.jpg" /> </div> <div class="col-xs-12 col-md-6 px-0"> <img class="rounded" style="width: 100%;" alt="snapshot2" src="cid:snapshot2.jpg" /> </div> </div> <br> </div> </body> <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" integrity="sha384-6ePHh72Rl3hKio4HiJ841psfsRJveeS+aLoaEf3BWfS+gTF0XdAqku2ka8VddikM" crossorigin="anonymous"></script> <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script> </html>
To learn more about how to use notifications in your automations, please see the getting started with automation page .
Check below some configurations examples for specific email providers.
If you are in doubt about the SMTP settings required, check your email provider configuration or help pages for more information about its specific SMTP configuration.
A sample configuration entry for Google Mail.
# Example configuration.yaml entry for Google Mail. notify : - name : " NOTIFIER_NAME" platform : smtp server : " smtp.gmail.com" port : 587 timeout : 15 sender : " [email protected] " encryption : starttls username : " [email protected] " password : " YOUR_APP_PASSWORD" recipient : - " [email protected] " - " [email protected] " sender_name : " SENDER_NAME"
Google has some extra layers of protection that need special attention. You must use an application-specific password in your notification configuration.
If any of the following conditions are met you will not be able to create an app password:
You do not have 2-step verification enabled on your account.
You have 2-step verification enabled but have only added a security key as an authentication mechanism.
Your Google account is enrolled in Google’s Advanced Protection Program .
Your Google account belongs to a Google Workspace that has disabled this feature. Accounts owned by a school, business, or other organization are examples of Google Workspace accounts.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The SMTP integration was introduced in Home Assistant pre 0.7, and it's used by
1.7% of the active installations.
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
