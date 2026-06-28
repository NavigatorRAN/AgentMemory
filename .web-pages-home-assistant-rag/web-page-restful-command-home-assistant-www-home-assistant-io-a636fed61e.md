---
source_url: "https://www.home-assistant.io/integrations/rest_command"
final_url: "https://www.home-assistant.io/integrations/rest_command"
canonical_url: "https://www.home-assistant.io/integrations/rest_command/"
source_handle: "web:www-home-assistant-io:a636fed61e9d"
source_section: "integrations-rest-command"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "8dfaab85d62cc5cb1bc31367b4282144bd36956589a4fe74a24c3396796a01d9"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# RESTful Command - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/rest_command
- Final URL: https://www.home-assistant.io/integrations/rest_command
- Canonical URL: https://www.home-assistant.io/integrations/rest_command/
- Fetched at: 2026-06-28T03:12:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate REST commands into Home Assistant.

## Extracted Text

On this page
Examples
Basic example which uses PUT method and payload encoded as form data
Using digest authentication
Using REST command Response in automations
Using templates to change the payload based on entities
How to test your new REST command
Using a REST command as an action in an automation
This integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can expose regular REST commands as actions. Actions can be called from a script or in automation .
To use this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] , add the following lines to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry rest_command : example_request : url : " http://example.com/"
Configuration Variables
Looking for your configuration file?
service_name map Required
The name used to expose the action. E.g., in the above example, it would be ‘rest_command.example_request’.
url template Required
The URL (supports template) for sending request.
method string ( Optional , default: get )
HTTP method to use (get, patch, post, put, or delete).
headers map ( Optional )
The headers for the requests.
payload template ( Optional )
A string/template to send with request.
authentication string ( Optional , default: basic )
Type of HTTP authentication. Either basic or digest .
username string ( Optional )
The username for HTTP authentication.
password string ( Optional )
The password for HTTP authentication.
timeout string ( Optional , default: 10 )
Timeout for requests in seconds.
content_type string ( Optional )
Content type for the request.
verify_ssl boolean ( Optional , default: true )
Verify the SSL certificate of the endpoint.
insecure_cipher boolean ( Optional , default: false )
Allow insecure ciphers for the request. This is useful for older servers/devices that do not support modern ciphers.
skip_url_encoding boolean ( Optional , default: false )
Skip internal URL canonicalization, which would have encoded the host part by IDNA codec and applied requoting to the path and query parts.
This example implements 2 REST commands to add actions for the missing shuffle functionality of the iTunes integration.
rest_command : shuffle_on : url : " http://YOUR_ITUNES-API_SERVER_IP:8181/shuffle" method : put content_type : " application/x-www-form-urlencoded" payload : " mode=songs" shuffle_off : url : " http://YOUR_ITUNES-API_SERVER_IP:8181/shuffle" method : put content_type : " application/x-www-form-urlencoded" payload : " mode=off"
This example shows how to use digest authentication with a REST command:
rest_command : secured_command : url : " http://example.com/api/secure-endpoint" method : post authentication : digest username : " your_username" password : " your_password" payload : ' {"data": "example"}' content_type : " application/json"
REST commands provide an action response in a dictionary containing status (containing the HTTP response code), content containing the response body as text or JSON and headers containing the response headers.
This response can be accessed in automations using response_variable .
The following example shows how the REST command response may be used in automations. In this case, checking the Traefik API for errors.
# Create a ToDo notification based on file contents automation : - alias : " Check API response" triggers : - ... actions : - action : rest_command.traefik_get_rawdata response_variable : traefik_response - if : " {{ traefik_response['status'] == 200 }}" then : - alias : " Parse data" variables : routers : " {{ traefik_response['content']['routers'] }}" router_errors : > {%- for router in routers -%} {%- if 'error' in routers[router] -%} {{router}}: {{ routers[router]['error'] }} {% endif -%} {%- endfor -%} got_errors : " {{ router_errors|length > 0 }}" - if : " {{ got_errors }}" then : - action : notify.send_message target : entity_id : notify.my_device data : title : " Traefik errors" message : " {{ router_errors }}" else : - action : notify.send_message target : entity_id : notify.my_device data : title : " Could not reach Traefik" message : " HTTP code: {{ traefik_response['returncode'] }}" rest_command : traefik_get_rawdata : url : http://127.0.0.1:8080/api/rawdata method : GET
The commands can be dynamic, using templates to insert values of other entities. Actions support variables for doing things with templates.
This example uses templates for dynamic parameters.
# Example configuration.yaml entry rest_command : my_request : url : https://slack.com/api/users.profile.set method : POST headers : authorization : !secret rest_headers_secret accept : " application/json, text/html" user-agent : ' Mozilla/5.0 {{ useragent }}' payload : ' {"profile":{"status_text": "{{ status }}","status_emoji": "{{ emoji }}"}}' content_type : ' application/json; charset=utf-8' verify_ssl : true
Call the new action from developer tools in the sidebar with some data like:
{ "status" : "My Status Goes Here" , "emoji" : ":plex:" }
automation : - alias : " Arrive at Work" triggers : - trigger : zone entity_id : device_tracker.my_device zone : zone.work event : enter actions : - action : rest_command.my_request data : status : " At Work" emoji : " :calendar:"
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The RESTful Command integration was introduced in Home Assistant 0.36, and it's used by
6.1% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jpbede
Categories
Automation
Back to top
