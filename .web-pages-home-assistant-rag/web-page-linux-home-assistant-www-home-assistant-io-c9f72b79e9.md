# Linux - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/installation/linux
- Final URL: https://www.home-assistant.io/installation/linux
- Canonical URL: https://www.home-assistant.io/installation/linux/
- Fetched at: 2026-06-28T02:25:17Z
- Content type: text/html; charset=UTF-8

## Description

Install Home Assistant on a Linux

## Extracted Text

On this page
Install Home Assistant Operating System
Download the appropriate image
Create the virtual machine
Hypervisor specific configuration
Start up your virtual machine
Install Home Assistant Container
Platform installation
Restart Home Assistant
Docker compose
Exposing devices
Optimizations
Troubleshooting
No access to the frontend
VirtualBox (Intel chip) (.vdi)
KVM (.qcow2)
After downloading, decompress the image. If the image comes in a ZIP file, for example, unzip it.
Follow this guide if you already are running a supported virtual machine hypervisor. If you are not familiar with virtual machines, install Home Assistant OS directly on a Home Assistant Yellow , a Raspberry Pi , or an ODROID .
Load the appliance image into your virtual machine hypervisor. (Note: You are free to assign as much resources as you wish to the VM, please assign enough based on your app needs).
Minimum recommended assignments:
2 GB RAM
2vCPU
All these can be extended if your usage calls for more resources.
VirtualBox
Unraid
KVM (virt-manager)
KVM (virt-install)
Open VirtualBox and select the New button (the blue star).
Name: Type Home Assistant.
ISO Image: Leave this as None or Empty .
Type & Version: Select Linux , then select Oracle Linux (64-bit) (or ARM 64-bit if you are using a Mac with an M1/M2/M3 chip).
Select Next .
Configure hardware
Base Memory: Move the slider to at least 2048 MB (2GB).
Number of CPUs: Move the slider to at least 2 .
EFI: Check the box for Enable EFI (special OSes only) . This is required for Home Assistant to boot.
Secure Boot: Deselect Enable Secure Boot . Home Assistant OS does not boot with Secure Boot enabled.
Finalizing the wizard
On the Virtual Hard Disk screen, leave the settings as they are (it will suggest creating a new disk). We will swap this for your downloaded file in the next step.
Select Finish .
Attach the Home Assistant disk (VDI)
Select your new “Home Assistant” VM in the left-hand list and select the Settings icon (the orange gear).
Go to the Storage section on the left menu.
In the Storage Devices list, you will see a disk already listed under Controller: SATA . Right-click that disk and select Remove Attachment . This removes the empty placeholder disk.
Select the Add Hard Disk icon (the small disk with a green plus symbol) located next to the words Controller: SATA .
In the window that pops up, select the Add button at the top.
Find and select the .vdi file you previously downloaded and unzipped.
Select Choose to confirm the file.
Configure network
While still in the Settings window, go to the Network section.
Change the Attached to setting from NAT to Bridged Adapter .
Under Name , select the adapter you use for internet access. This allows Home Assistant to talk to other devices in your home.
Select OK .
By default, VirtualBox does not
free up unused disk space. To automatically shrink the vdi disk image the discard option must
be enabled using your host machine’s terminal:
VBoxManage storageattach <VM name> --storagectl "SATA" --port 0 --device 0 --nonrotational on --discard on
More details can be found about the command can be found here .
Download the .qcow2 image above and decompress it. ( Extract all in Windows)
Store the image in the isos share on your server.
Make sure under Settings > VM manager , Enable VMs is enabled.
Create a new virtual machine: VMS > Add VM .
Select type Linux and give the VM a name and a description.
Select the CPU cores you want to let the VM use and give it some memory.
Under Primary vDisk Location , select Manual and then select the qcow2 image.
Select your keyboard language under VM Console Keyboard .
Select br0 under Network Source .
Select virtio under Network model .
Select any USB-devices that you want to pass through to Home Assistant, such as Zigbee- or Z-Wave controllers.
Deselect Start VM after creation .
Select Create .
Select the name of your new VM and select the capacity number for your disk. Here, you can expand the disk to whatever your needs are. The default is 32 GB.
Select the icon of your new VM and select start with console (VNC) .
Create a new virtual machine in virt-manager .
Select Import existing disk image , provide the path to the QCOW2 image above.
Choose Generic Default for the operating system.
Check the box for Customize configuration before install .
Under Network Selection , select your bridge.
Under customization select Overview > Firmware > UEFI x86_64: … . Make sure to select a non-secureboot version of OVMF (does not contain words such as secure or secboot ), for example /usr/share/edk2/ovmf/OVMF_CODE.fd .
Select Add Hardware (bottom left), and select Channel .
Select device type: unix .
Select name: org.qemu.guest_agent.0 .
Finally, select Begin Installation (upper left corner).
virt-install --name haos --description "Home Assistant OS" --os-variant = generic --ram = 4096 --vcpus = 2 --disk <PATH TO QCOW2 FILE>,bus = scsi --controller type = scsi,model = virtio-scsi --import --graphics none --boot uefi
If you have a USB
dongle to attach, you need to add the option --hostdev busID.deviceId . You can
discover these IDs via the lsusb command. As example, if lsusb output is:
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 004: ID 30c9:0052 Luxvisions Innotech Limited Integrated RGB Camera
Bus 003 Device 003: ID 1a86:55d4 QinHeng Electronics SONOFF Zigbee 3.0 USB Dongle Plus V2
Bus 003 Device 002: ID 06cb:00fc Synaptics, Inc.
Bus 003 Device 005: ID 8087:0033 Intel Corp.
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
You can recognize the Sonoff dongle at Bus 003 Device 003 . So the command to install the VM will become:
virt-install --name haos --description "Home Assistant OS" --os-variant = generic --ram = 4096 --vcpus = 2 --disk <PATH TO QCOW2 FILE>,bus = scsi --controller type = scsi,model = virtio-scsi --import --graphics none --boot uefi --hostdev 003.003
Note that this configuration (bus 003, device 003) is just an example, your dongle could be on another bus and/or with another device ID.
Please check the correct IDs of your USB dongle with lsusb .
Start the virtual machine.
Observe the boot process of the Home Assistant Operating System.
Once completed, you will be able to reach Home Assistant on homeassistant.local:8123 . If you have a stricter network configuration, you might need to access Home Assistant at homeassistant:8123 or http://X.X.X.X:8123 (replace X.X.X.X with your virtual machine’s IP address).
With the Home Assistant Operating System installed and accessible, you can continue with onboarding.
Onboarding
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
Symptom: You cannot open the Home Assistant page in your browser. If you are not using Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. , the cause may be an access restriction.
In newer Linux distributions, the access to a host is very limited. This means that you can’t access the Home Assistant frontend that is running on a host outside of the host machine.
To fix this, you will need to open your machine’s firewall for TCP traffic to port 8123. The method for doing this will vary depending on your operating system and the firewall you have installed. Below are some suggestions to try. Google is your friend here.
For UFW systems (for example, Debian):
sudo ufw allow 8123/tcp
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
Concepts and terminology
Editing the dashboard
Adding integrations
Automating devices
Presence detection
Join the community
Next steps
Back to top
