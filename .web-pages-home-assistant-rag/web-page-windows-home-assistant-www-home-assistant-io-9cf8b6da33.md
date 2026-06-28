# Windows - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/installation/windows
- Final URL: https://www.home-assistant.io/installation/windows
- Canonical URL: https://www.home-assistant.io/installation/windows/
- Fetched at: 2026-06-28T02:25:32Z
- Content type: text/html; charset=UTF-8

## Description

Install Home Assistant on Windows

## Extracted Text

On this page
Install Home Assistant Operating System
Download the appropriate image
Create the virtual machine
Hypervisor specific configuration
Edit the VM settings
Start up your virtual machine
VirtualBox (Intel chip) (.vdi)
VMware Workstation (.vmdk)
Hyper-V (.vhdx)
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
VMware Workstation
Hyper-V
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
Start VMware Workstation and select Create a New Virtual Machine .
Note: the exact name and location of the settings below depend on the VMware version. This procedure is based on version 17.
Select I will install the operating system later , then select Linux > Other Linux 5.x kernel 64-bit .
Give the VM a name, home-assistant , and define an easy to reach storage location, such as C:\home-assistant .
Specify the disk size and select Store virtual disk as a single file .
Select Customize Hardware .
Define the amount of memory and the number of cores the VM is allowed to use.
Remove the New CD/DVD entry. It will not be used.
Connect an Ethernet cable and make sure it is connected to your network.
Under Network adapter , select Bridged: Connected directly to the physical network .
Make sure Replicate physical network connection state is not selected.
Select Configure Adapters .
Make sure all virtual adapters and Bluetooth devices are deselected.
Select your host network adapter. Most likely, this is one of the first 2 checkboxes in the list:
Select the one for Ethernet.
The exact names of these adapters depend on your hardware.
At the end of the wizard, select Finish .
In Windows Explorer, go to the storage location of your newly created VM, for example under C:\home-assistant .
Delete the home-assistant.vmdk file.
In the Downloads folder, find the haos_ova_xx.x.vmdk file.
- If you haven’t unzipped the archive, unzip it.
- Within the folder, find the .vmdk file and rename it to home-assistant.vmdk .
- Paste the file (not the unzipped folder) into the C:\home-assistant folder.
Right-click the .vmx file and select Open with > Notepad .
Under .encoding , add a line. Enter firmware = "efi" .
Now continue with the next step to start your VM.
- If you see a message about side channel mitigations, select OK .
- If you see a message stating that the .vmdk file could not be found, in step 13, you likely pasted the folder, not the file. Repeat step 13.
⚠️ Hyper-V does not have USB support.
Create a new virtual machine.
Select Generation 2 .
Select Connection > Your Virtual Switch that is bridged .
Select Use an existing virtual hard disk and select the VHDX file from above.
After creation, go to Settings > Security and deselect Enable Secure Boot .
Start the virtual machine.
Observe the boot process of the Home Assistant Operating System.
Once completed, you will be able to reach Home Assistant on homeassistant.local:8123 . If you are running an older Windows version or have a stricter network configuration, you might need to access Home Assistant at homeassistant:8123 or http://X.X.X.X:8123 (replace X.X.X.X with your virtual machine’s IP address).
With the Home Assistant Operating System installed and accessible, you can continue with onboarding.
Onboarding
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
