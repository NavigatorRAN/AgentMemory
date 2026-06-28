# Alternative - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/installation/alternative
- Final URL: https://www.home-assistant.io/installation/alternative
- Canonical URL: https://www.home-assistant.io/installation/alternative/
- Fetched at: 2026-06-28T02:25:09Z
- Content type: text/html; charset=UTF-8

## Description

Alternative ways to install Home Assistant

## Extracted Text

On this page
Install Home Assistant Operating System
Download the appropriate image
Create the virtual machine
Hypervisor specific configuration
Start up your virtual machine
Install Home Assistant Container
Synology NAS
QNAP NAS
Community Notes
Restart Home Assistant
Docker compose
Exposing devices
Optimizations
Community provided guides
VirtualBox (Intel chip) (.vdi)
KVM/Proxmox (.qcow2)
VMware ESXi/vSphere (.ova)
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
VMware ESXi/vSphere
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
Use the E1000 or E1000E virtual network adapter. There are confirmed mDNS/Multicast discovery issues when using VMware’s VMXnet3 virtual network adapter.
Start the virtual machine.
Observe the boot process of the Home Assistant Operating System.
Once completed, you will be able to reach Home Assistant on homeassistant.local:8123 . If you have a stricter network configuration, you might need to access Home Assistant at homeassistant:8123 or http://X.X.X.X:8123 (replace X.X.X.X with your virtual machine’s IP address).
With the Home Assistant Operating System installed and accessible, you can continue with onboarding.
Onboarding
Synology with DSM now supports container management through the Container Manager package, allowing you to install Home Assistant without the need for command-line. For details about the package (including compatibility-information, if your NAS is supported), see https://www.synology.com/en-us/dsm/packages/ContainerManager .
The steps would be:
Using Synology’s Package Center, install the Container Manager package.
Launch the Container Manager app and navigate to the Registry section.
On the Registry page, search for homeassistant/home-assistant and select Download . Choose the stable tag.
Wait for the image to be pulled.
Navigate to the Image section of the Container Manager app.
Select the homeassistant/home-assistant image and select Run .
On the General Settings page:
Choose a container-name you want (for example, homeassistant ).
Set Enable auto-restart if you like.
On the Advanced Settings page:
In the Volume Settings section, select Add Folder and choose either an existing folder or add a new folder (for example, in the docker shared folder, add a new folder named homeassistant and then within that new folder add another new folder config ), then select Select . Then edit the Mount path to be /config with the permissions set as Read/Write . This configures where Home Assistant will store configs and logs.
To ensure that Home Assistant displays the correct timezone, in the Environment section, select the Add button and in the Variable field add TZ and in the value add your timezone (for example, Europe/London ). Timezones can be found here .
In the Network section, set the Network dropdown as host .
Ensure Run this container after the wizard is finished is checked and select Done .
Your Home Assistant within Docker should now run and will serve the web interface from port 8123 on your Docker host (this will be your Synology NAS IP address - for example http://192.168.1.10:8123 ).
If you are using the built-in firewall, you must also add the port 8123 to allowed list. This can be found in Control Panel > Security and then the Firewall tab. Select Edit Rules besides the Firewall Profile dropdown box. Create a new rule and select Custom for Ports and add 8123. Edit Source IP if you like or leave it at default All . Action should stay at Allow .
To use a Z-Wave USB stick for Z-Wave control, the Home Assistant Docker container needs extra configuration to access to the USB stick. While there are multiple ways to do this, the least privileged way of granting access can only be performed via the Terminal, at the time of writing. See this page for configuring Terminal access to your Synology NAS:
https://www.synology.com/en-global/knowledgebase/DSM/help/DSM/AdminCenter/system_terminal
Tip
See this page for accessing the Terminal via SSH
Adjust the following Terminal command as follows :
Replace /PATH_TO_YOUR_CONFIG points at the folder where you want to store your configuration - make sure that you keep the :/config part
Replace /PATH_TO_YOUR_USB_STICK matches the path for your USB stick (for example, /dev/ttyACM0 for most Synology users)
Replace Australia/Melbourne with your timezone
Run it in Terminal.
sudo docker run --restart always -d --name homeassistant -v /PATH_TO_YOUR_CONFIG:/config --device = /PATH_TO_YOUR_USB_STICK -e TZ = Australia/Melbourne --net = host ghcr.io/home-assistant/home-assistant:stable
Complete the remainder of the Z-Wave configuration by following the instructions here.
Remark: to update your Home Assistant on your Docker within Synology NAS, you just have to do the following:
Go to the Container Manager app and move to the Image section.
Find homeassistant/home-assistant within Image and select Update .
Wait until the system-message/-notification comes up, that the download is finished (there is no progress bar).
Move to the Container section.
Stop your container if it’s running.
Right-click on it and select Action > Reset . You won’t lose any data, as all files are stored in your configuration-directory.
Start the container again - it will then boot up with the new Home Assistant image.
Remark: to restart your Home Assistant within Synology NAS, you just have to do the following:
Go to the Container Manager app and move to the Container section.
Right-click on it and select Action > Restart .
Note
If you want to use a USB Bluetooth adapter or Z-Wave USB Stick with Home Assistant on Synology Docker these instructions do not correctly configure the container to access the USB devices. To configure these devices on your Synology Docker Home Assistant you can follow the instructions provided here by Phil Hawthorne.
QNAP with QTS supports Docker, allowing you to install Home Assistant using Docker without the need for command-line. For details about the package (including compatibility-information, if your NAS is supported), see https://www.qnap.com/solution/container_station/en/index.php .
Install the Container Station package on your Qnap NAS.
Launch Container Station and move to the Create Container section.
Search image homeassistant/home-assistant with Docker Hub and select Install .
Choose the stable version and select Next .
Select Advanced Settings .
Within Shared Folders select Volume from host > Add and choose either an existing folder or add a new folder. The mount point has to be /config , so that Home Assistant will use it for the configuration and logs.
Within Network and select Network Mode to Host .
To ensure that Home Assistant displays the correct timezone go to the Environment tab and select the plus sign then add variable = TZ & value = Europe/London choosing your correct timezone .
Wait for some time until your NAS has created the container.
Your Home Assistant within Docker should now run and will serve the web interface from port 8123 on your Docker host (this will be your Qnap NAS IP address - for example http://192.xxx.xxx.xxx:8123 ).
Remark: To update your Home Assistant on your Docker within Qnap NAS, you just remove container and image and do steps again (Don’t remove the config folder).
Note that some users have reported issues creating Home Assistant containers on ARM QNAP systems (for example, TS-233) with Container Station 3. A possible workaround is the Docker compose approach based on a YAML file (see section Docker compose ). In the QNAP Container Station 3 UI, this can be accessed by going to the Applications section and selecting Create . You are then prompted to enter YAML code, which can be copied from that shown in the Docker compose section. Take care to modify this code in two ways: firstly, add a first line reading version: '3' ; secondly, replace the text /PATH_TO_YOUR_CONFIG by a valid path on your NAS system, for example /share/Container/HomeAssistant/config .
Once the Home Assistant Container is running Home Assistant should be accessible using http://<host>:8123 (replace with the hostname or IP of the system). You can continue with onboarding.
If you change the configuration, you have to restart the server. To do that you have 3 options.
In your Home Assistant UI, go to Settings > System and in the top-right corner, select the three dots menu. Then, select Restart Home Assistant .
Go to Settings > Developer tools > Actions , select homeassistant.restart and select Perform action .
Restart it from a terminal.
Docker CLI
Docker Compose
docker restart homeassistant
docker compose restart
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
Additional installation guides can be found on our Community Forum .
These Community Guides are provided as-is. Some of these install methods are more limited than the methods above. Some integrations may not work due to limitations of the platform.
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
