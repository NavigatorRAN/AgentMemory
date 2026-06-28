# Custom panel - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/panel_custom
- Final URL: https://www.home-assistant.io/integrations/panel_custom
- Canonical URL: https://www.home-assistant.io/integrations/panel_custom/
- Fetched at: 2026-06-28T03:07:23Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add customized panels to the front end of Home Assistant.

## Extracted Text

On this page
Related topics
The Custom panel integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to write your own panels in JavaScript and add them to Home Assistant. See the developer documentation on instructions how to build your own panels .
To enable customized panels in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry panel_custom : - name : my-panel sidebar_title : TodoMVC sidebar_icon : mdi:work url_path : my-todomvc module_url : /local/my-panel.js config : who : world
Tip
Store your custom panels in <config>/www to make them available in the frontend at the path /local .
Configuration Variables
Looking for your configuration file?
name string Required
Name of the web integration that renders your panel.
sidebar_title string ( Optional )
Friendly title for the panel in the sidebar. Omitting it means no sidebar entry (but still accessible through the URL).
sidebar_icon icon ( Optional , default: mdi:bookmark )
Icon for entry. Pick an icon that from Material Design Icons to use for your input and prefix the name with mdi: . For example mdi:car , mdi:ambulance , or mdi:motorbike .
url_path string ( Optional )
The URL your panel will be available on in the frontend. If omitted will default to the panel name.
js_url string ( Optional )
The URL that contains the JavaScript of your panel. If used together with module_url , will only be served to users that use the ES5 build of the frontend.
module_url string ( Optional )
The URL that contains the JavaScript module of your panel. Loaded as a JavaScript module instead of a script. If used together with module_url , will only be served to users that use the “latest” build of the frontend.
config list ( Optional )
Configuration to be passed into your web component when being instantiated.
require_admin boolean ( Optional , default: false )
If admin access is required to see this panel.
embed_iframe boolean ( Optional , default: false )
Set to true to embed panel in iframe. This is necessary if the panel is using the React framework or if it contains conflicting web components.
trust_external_script boolean ( Optional , default: false )
By default the user has to confirm before loading a script from an external source. Setting this to true will omit this confirmation.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Custom panel system was introduced in Home Assistant 0.26, and it's used by
2.7% of the active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is being maintained by the Home Assistant project.
Categories
Front end
Back to top
