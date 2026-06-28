# macOS - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/installation/macos
- Final URL: https://www.home-assistant.io/installation/macos
- Canonical URL: https://www.home-assistant.io/installation/macos/
- Fetched at: 2026-06-28T02:25:20Z
- Content type: text/html; charset=UTF-8

## Description

Install Home Assistant on macOS

## Extracted Text

On this page
Install Home Assistant Operating System
Download the appropriate image
Create the virtual machine
Hypervisor specific configuration
Start up your virtual machine
VirtualBox (Intel chip) (.vdi)
VirtualBox (Apple Silicon chip) (.vdi)
After downloading, decompress the image. If the image comes in a ZIP file, for example, unzip it.
Follow this guide if you already are running a supported virtual machine hypervisor. If you are not familiar with virtual machines, install Home Assistant OS directly on a Home Assistant Yellow , a Raspberry Pi , or an ODROID .
If VirtualBox is not supported on your Mac, and you have experience using virtual machines, you can try running the Home Assistant Operating System on UTM .
Load the appliance image into your virtual machine hypervisor. (Note: You are free to assign as much resources as you wish to the VM, please assign enough based on your app needs).
Minimum recommended assignments:
2 GB RAM
2vCPU
All these can be extended if your usage calls for more resources.
VirtualBox
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
Start the virtual machine.
Observe the boot process of the Home Assistant Operating System.
Once completed, you will be able to reach Home Assistant on homeassistant.local:8123 . If you have a stricter network configuration, you might need to access Home Assistant at homeassistant:8123 or http://X.X.X.X:8123 (replace X.X.X.X with your virtual machine’s IP address).
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
