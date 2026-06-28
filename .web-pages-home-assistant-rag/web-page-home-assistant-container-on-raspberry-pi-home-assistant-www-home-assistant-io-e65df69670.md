# Home Assistant Container on Raspberry Pi - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/installation/raspberrypi-other
- Final URL: https://www.home-assistant.io/installation/raspberrypi-other
- Canonical URL: https://www.home-assistant.io/installation/raspberrypi-other/
- Fetched at: 2026-06-28T02:25:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions to install Home Assistant Container on a Raspberry Pi using Docker.

## Extracted Text

On this page
Install Home Assistant Container
Platform installation
Restart Home Assistant
Docker compose
Exposing devices
Optimizations
Related topics
While we recommend using the Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. , you can also use the Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] method to install Home Assistant. Before you continue, be aware of the limitations and differences compared to the Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. . You can find more information on the installation page . Most notably,
apps are only available with the Home Assistant Operating System.
These below instructions are for an installation of Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] running in your own container environment, which you manage yourself. Any OCI compatible runtime can be used, however this guide will focus on installing it with Docker.
Note
This installation type does not have access to apps . If you want to use apps, you need to use another installation type. The recommended type is Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. . Checkout the overview table of installation types to see the differences.
Important
Prerequisites
This guide assumes that you already have an operating system setup and a container runtime installed (like Docker).
If you are using Docker, you need Docker Engine 23.0.0 or later. Docker Desktop will not work; you must use Docker Engine .
Installation with Docker is straightforward. Adjust the following command so that:
/PATH_TO_YOUR_CONFIG points at the folder where you want to store your configuration and run it. Make sure that you keep the :/config part.
MY_TIME_ZONE is a tz database name , like TZ=America/Los_Angeles .
D-Bus is optional but required if you plan to use the Bluetooth integration .
Install
Update
docker run -d \ --name homeassistant \ --privileged \ --restart = unless-stopped \ -e TZ = MY_TIME_ZONE \ -v /PATH_TO_YOUR_CONFIG:/config \ -v /run/dbus:/run/dbus:ro \ --network = host \
ghcr.io/home-assistant/home-assistant:stable
# if this returns "Image is up to date" then you can stop here
docker pull ghcr.io/home-assistant/home-assistant:stable
# stop the running container
docker stop homeassistant
# remove it from Docker's list of containers
docker rm homeassistant
# finally, start a new one
docker run -d \ --name homeassistant \ --restart = unless-stopped \ --privileged \ -e TZ = MY_TIME_ZONE \ -v /PATH_TO_YOUR_CONFIG:/config \ -v /run/dbus:/run/dbus:ro \ --network = host \
Once the Home Assistant Container is running Home Assistant should be accessible using http://<host>:8123 (replace with the hostname or IP of the system). You can continue with onboarding.
Onboarding
If you change the configuration, you have to restart the server. To do that you have 3 options.
In your Home Assistant UI, go to Settings > System and in the top-right corner, select the three dots menu. Then, select Restart Home Assistant .
Go to Settings > Developer tools > Actions , select homeassistant.restart and select Perform action .
Restart it from a terminal.
Docker CLI
Docker Compose
docker restart homeassistant
docker compose restart
Tip
docker compose should already be installed on your system. If not, you can manually install it.
As the Docker command becomes more complex, switching to docker compose can be preferable and support automatically restarting on failure or system restart. Create a compose.yaml file:
services : homeassistant : container_name : homeassistant image : " ghcr.io/home-assistant/home-assistant:stable" volumes : - /PATH_TO_YOUR_CONFIG:/config - /etc/localtime:/etc/localtime:ro - /run/dbus:/run/dbus:ro restart : unless-stopped privileged : true network_mode : host environment : TZ : Europe/Amsterdam
Start it by running:
docker compose up -d
Once the Home Assistant Container is running, Home Assistant should be accessible using http://<host>:8123 (replace with the hostname or IP of the system). You can continue with onboarding.
In order to use Zigbee or other integrations that require access to devices, you need to map the appropriate device into the container. Ensure the user that is running the container has the correct privileges to access the /dev/tty* file, then add the device mapping to your container instructions:
docker run ... --device /dev/ttyUSB0:/dev/ttyUSB0 ...
services : homeassistant : ... devices : - /dev/ttyUSB0:/dev/ttyUSB0
The Home Assistant Container is using an alternative memory allocation library jemalloc for better memory management and Python runtime speedup.
As the jemalloc configuration used can cause issues on certain hardware featuring a page size larger than 4K (like some specific ARM64-based SoCs), it can be disabled by passing the environment variable DISABLE_JEMALLOC with any value, for example:
docker run ... -e "DISABLE_JEMALLOC=true" ...
services : homeassistant : ... environment : DISABLE_JEMALLOC : true
The error message <jemalloc>: Unsupported system page size is one known indicator.
Installing the home assistant os on raspberry pi
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Getting started
Installation
Home Assistant Green
Home Assistant Yellow
Raspberry Pi
ODROID
Generic x86-64
Linux
macOS
Windows
Other systems
Troubleshooting
Concepts and terminology
Editing the dashboard
Adding integrations
Automating devices
Presence detection
Join the community
Next steps
Back to top
