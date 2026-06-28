# Remote Python Debugger - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/debugpy
- Final URL: https://www.home-assistant.io/integrations/debugpy
- Canonical URL: https://www.home-assistant.io/integrations/debugpy/
- Fetched at: 2026-06-28T02:36:13Z
- Content type: text/html; charset=UTF-8

## Description

Remote Python debugger (debugpy) for Visual Studio Code

## Extracted Text

On this page
Prerequisites
Configuration
Security
List of actions
Examples
Wait for a connection at startup
Listen on a different host or port
Visual Studio Code configuration
Known limitations
Removing the integration
Related topics
The Remote Python debugger integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to use the Visual Studio Code Python debug tooling with a remote Home Assistant instance.
It uses Microsoft’s debugpy library, which is the successor of ptvsd and the default library used by Visual Studio Code.
This is useful for testing changes on a local development install, or for connecting to a production server to debug issues. You can also load the integration without activating the debugger and inject it later with an action. This is particularly useful on a production system, as the debugger does not impact performance until it is injected.
To connect to the debugger, you need a debugpy-compatible debugging client on the computer you debug from. Visual Studio Code with the Python extension is the most common choice.
To enable the remote Python debugger integration, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry debugpy :
By default, this listens on all local interfaces on port 5678, does not wait for a connection, and starts when Home Assistant starts.
Configuration Variables
Looking for your configuration file?
host string ( Optional )
The local interface to listen on.
Default:
0.0.0.0 (all interfaces)
port integer ( Optional , default: 5678 )
Port to listen on.
start boolean ( Optional , default: true )
If true , the debugger will be injected on start of Home Assistant. Set it to false to inject it on demand using the debugpy.start action.
wait boolean ( Optional , default: false )
If true , wait for the debugger to connect before starting up Home Assistant. This option is ignored when start is set to false .
Warning
Anyone who can reach the debugger port can run arbitrary code on your Home Assistant instance. Only enable the debugger on a network you trust, and never expose the port directly to the internet.
If your Home Assistant instance is behind a firewall with only the HTTP(S) port exposed, the debugger is safe from outside connections.
The Remote Python Debugger integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Start the remote Python debugger ( debugpy.start )
Inject and start the remote Python debugger at runtime.
For an overview of every action across all integrations, see the actions reference .
If you want to debug something in the start-up sequence, configure the integration to wait for a connection first:
# Example configuration.yaml entry debugpy : start : true wait : true
The debugger is loaded quite early in the boot-up sequence, before any other integrations. This allows you to set breakpoints in async_setup or similar and debug the loading of integrations.
You can listen on a different server address or port:
# Example configuration.yaml entry debugpy : host : localhost port : 6789
This is useful for multi-homed servers, or for localhost only access.
Copy this into your launch.json in the .vscode subdirectory of your Visual Studio Code project to connect to the debugger.
{ // For more information , visit: https://go.microsoft.com/fwlink/?linkid= 830387 "version" : "0.2.0" , "configurations" : [ { // Example of attaching to local debug server "name" : "Python: Attach Local" , "type" : "debugpy" , "request" : "attach" , "connect" : { "port" : 5678 , "host" : "localhost" , }, "pathMappings" : [ { "localRoot" : "${workspaceFolder}" , "remoteRoot" : "." } ], }, { // Example of attaching to my production server "name" : "Python: Attach Remote" , "type" : "debugpy" , "request" : "attach" , "connect" : { "port" : 5678 , "host" : "homeassistant.local" , }, "pathMappings" : [ { "localRoot" : "${workspaceFolder}" , "remoteRoot" : "/usr/src/homeassistant" } ], } ] }
Using the debugger increases memory usage and decreases performance, even when no client is attached. Avoid enabling it permanently on a production server unless it is really required. To keep this cost off your system until you need it, set the start option to false and inject the debugger on demand with the Start action .
Once the debugger is started, there is no action to stop it again. To stop it, restart Home Assistant.
This integration is set up through YAML. To remove it, delete the debugpy entry from your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file and restart Home Assistant.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Remote Python Debugger service was introduced in Home Assistant 0.112, and it's used by
139 active installations.
Its IoT class is Local Push.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@frenck
Categories
Utility
Back to top
