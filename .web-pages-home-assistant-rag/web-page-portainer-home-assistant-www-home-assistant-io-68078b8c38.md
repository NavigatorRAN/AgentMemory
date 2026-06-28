# Portainer - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/portainer
- Final URL: https://www.home-assistant.io/integrations/portainer
- Canonical URL: https://www.home-assistant.io/integrations/portainer/
- Fetched at: 2026-06-28T03:08:47Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Portainer with Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Binary sensors
Buttons
Sensors
Switches
List of actions
Examples
Notify when a container went down
Supported devices
Endpoints
Containers
Stacks
Data updates
Defining a custom polling interval
Known limitations
Removing the integration
To remove an integration instance from Home Assistant
The Portainer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is used as an interface to the Portainer API .
Portainer is a lightweight management UI that allows you to easily manage your Docker containers, images, networks, and volumes. It works on every Docker host or Swarm cluster.
The Portainer API provides a way to manage Docker containers, images, networks, and volumes. It allows you to interact programmatically with your Docker host or Swarm cluster.
Before you can configure Portainer within Home Assistant, you need a few things:
have Portainer installed and a user with administrator rights on Portainer.
An access token.
Create a Portainer Access Token by following these steps:
Log in to your Portainer instance.
To create an access token, follow the steps in the Portainer documentation .
Copy the generated Access Token and store it somewhere safe, you will need it in the next steps.
To add the Portainer service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Portainer .
Follow the instructions on screen to complete the setup.
There is currently support for the following device types within Home Assistant:
Status : Reports whether a container is running.
Restart container : Restarts the container.
Pause container : Pauses the container.
Resume container : Resumes the container.
Recreate container : Recreates the container by pulling the latest tagged image.
Prune unused images : Removes unused Docker images from the endpoint.
Container sensors
State : Current container state (such as running , exited , paused ).
Image : The Docker image the container is based on.
CPU usage total : Total CPU time consumed by the container.
Memory usage : Current memory usage of the container.
Memory usage percentage : Memory usage as a percentage of the container’s limit.
Memory limit : Memory limit configured for the container.
Endpoint sensors
Docker version : Docker engine version running on the host.
API version : Docker API version on the host.
Kernel version : Kernel version of the host operating system.
Operating system : Operating system running on the host.
Total memory : Total memory available on the host.
Total CPU : Total CPU cores available on the host.
Containers running : Number of currently running containers.
Containers stopped : Number of stopped containers.
Containers paused : Number of paused containers.
Container count : Total number of containers on the endpoint.
Image count : Total number of Docker images.
Container disk usage total size : Total disk space used by containers.
Image disk usage total size : Total disk space used by images.
Volume disk usage total size : Total disk space used by volumes.
Stack sensors
Status : Whether the stack is active or inactive .
Type : The stack type: Compose , Swarm , or Kubernetes .
Container count : Number of containers belonging to the stack.
Container : Starts or stops an individual Docker container.
Stack : Starts or stops all containers in a stack.
The Portainer integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Prune unused images ( portainer.prune_images )
Removes unused images from a Portainer endpoint.
Recreate container ( portainer.recreate_container )
Recreates a container on a Portainer endpoint.
For an overview of every action across all integrations, see the actions reference .
The following examples show how to use the Portainer integration in Home Assistant automations. These examples are just a starting point, and you can use them as inspiration to create your own automations.
The following example sends a notification to your mobile device when a container went down.
automation : - alias : " Container went down" triggers : - trigger : state entity_id : - sensor.container_state to : - exited actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Container alert" message : " Container went down!"
The integration creates one device per Portainer endpoint (Docker host). Containers and stacks appear as child devices under their endpoint. If a container belongs to a stack, it is nested under that stack instead.
Each Docker host managed by Portainer is represented as an endpoint device, exposing host-level information such as Docker version, memory, CPU, and container counts.
Each Docker container is a child device under its endpoint or stack. Container devices expose resource usage sensors, a status binary sensor, a restart button, and a switch to start or stop the container.
Each Docker Compose or Swarm stack is a child device under its endpoint. Stack devices expose a status sensor, a type sensor, a container count sensor, and a switch to start or stop the entire stack.
Docker API Engine needs to be equal to or above version 1.44. Older versions are deprecated .
The integration normally updates every 60 seconds. For more detailed steps on how to define a custom polling interval, follow the procedure below.
If you want to define a specific interval at which your device is being polled for data, you can disable the default polling interval and create your own polling automation.
To add the automation:
Go to Settings > Devices & services , and select your integration.
On the integration entry, select the .
Then, select System options and toggle the button to disable polling.
To define your custom polling interval, create an automation.
Go to Settings > Automations & scenes and create a new automation.
Define any trigger and condition you like.
Select Add action , then select Other actions .
Select Perform action , and from the list, select the homeassistant.update_entity action .
Add the entities you want to poll to the Entity field. The homeassistant.update_entity action only supports targeting by entity. Selecting an area, device, or label is not supported.
Save your new automation to poll for data.
Currently, the integration does not support stacks or Edge computing.
This integration follows standard integration removal.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
After removing the integration, consider deleting the Portainer access token.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Portainer service was introduced in Home Assistant 2025.10, and it's used by
1869 active installations.
Its IoT class is Local Polling.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@erwindouna
Categories
Binary sensor
Button
Sensor
Switch
Back to top
