# RESTful Notifications - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/notify.rest
- Final URL: https://www.home-assistant.io/integrations/notify.rest
- Canonical URL: https://www.home-assistant.io/integrations/notify.rest/
- Fetched at: 2026-06-28T03:03:56Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add RESTful notifications to Home Assistant.

## Extracted Text

On this page
Using templates
The RESTful Notifications integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to deliver RESTful notifications from Home Assistant to another party.
To enable the REST notification in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file:
# Example configuration.yaml entry notify : - name : NOTIFIER_NAME platform : rest resource : http://IP_ADDRESS/ENDPOINT
Configuration Variables
Looking for your configuration file?
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
resource string Required
The resource or endpoint that will receive the value.
method string ( Optional , default: GET )
The method of the request. Valid options are GET , POST or POST_JSON .
verify_ssl boolean ( Optional , default: true )
Verify the SSL certificate of the endpoint.
authentication string ( Optional , default: basic )
Type of the HTTP authentication. basic or digest .
username string ( Optional )
The username for accessing the REST endpoint.
password string ( Optional )
The password for accessing the REST endpoint.
headers string ( Optional )
The headers for the request.
message_param_name string ( Optional , default: message )
Parameter name for the message.
title_param_name string ( Optional )
Parameter name for the title.
target_param_name string ( Optional )
Parameter name for the target.
data template ( Optional )
Template dictionary of extra parameters to send to the resource.
To use notifications, please see the getting started with automation page .
For incoming data, a value template translates incoming JSON or raw data to a valid payload.
Incoming payloads are rendered with possible JSON values, so when rendering, the value_json can be used to access the attributes in a JSON based payload, otherwise the value variable can be used for non-json based data.
Additional, the this can be used as variables in the template. The this attribute refers to the current entity state of the entity.
Further information about this variable can be found in the template documentation
Note
Example value template with json:
With given payload:
{ "state" : "ON" , "temperature" : 21.902 }
Template {{ value_json.temperature | round(1) }} renders to 21.9 .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RESTful Notifications integration was introduced in Home Assistant 0.13, and it's used by
8.2% of the active installations.
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Back to top
