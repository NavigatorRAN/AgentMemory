# Can I run Home Assistant from a USB drive on a Raspberry Pi 4? - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/faq/usb_boot
- Final URL: https://www.home-assistant.io/faq/usb_boot
- Canonical URL: https://www.home-assistant.io/faq/usb_boot/
- Fetched at: 2026-06-28T02:24:29Z
- Content type: text/html; charset=UTF-8

## Description

Yes, with caveats. The recommended option is to keep the SD card and offload your data to a USB drive using the data disk feature.

## Extracted Text

Yes, but with caveats. There are two ways to use a USB drive with a Raspberry Pi 4.
Recommended: data disk on USB
Home Assistant Operating System Home Assistant OS, the Home Assistant Operating System, is an embedded, minimalistic, operating system designed to run the Home Assistant ecosystem on single board computers (like the Raspberry Pi) or Virtual Machines. It includes Home Assistant Core, the Home Assistant Supervisor, and supports apps. Home Assistant Supervisor keeps it up to date, removing the need for you to manage an operating system. Home Assistant Operating System is the recommended installation type for most users. has a data disk feature that moves all your data to an attached USB drive (such as an SSD), while the SD card stays in place to boot the operating system. This gives you most of the speed and reliability benefits of an SSD without the complexity of booting from USB. See using an external data disk for instructions.
Booting fully from USB
Booting Home Assistant Operating System completely from a USB drive (without an SD card) is possible with some devices, but it is delicate. The boot process passes through firmware, U-Boot, and the operating system, each of which has to negotiate with the USB device, and there is a real chance of the boot failing at one of these stages.
USB drives that are known to work with Raspberry Pi OS (see the Raspberry Pi forum) are more likely to work with Home Assistant Operating System. However, because Home Assistant Operating System has U-Boot in the boot chain, some drives that work fine on Raspberry Pi OS do not work on Home Assistant Operating System. Finding the right combination of hardware can take some experimentation.
If you simply want a more reliable storage setup than an SD card, the data disk option above is the safer route.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Entries
About Home Assistant
Can the rest of my household use Home Assistant?
Do Home Assistant updates break things?
Do I need to know how to code to use Home Assistant?
Do I need to learn YAML to use Home Assistant?
Does Home Assistant work with Apple Home, Google Home, and Alexa?
Does Home Assistant work without an internet connection?
How long does it take to set up Home Assistant?
Is Home Assistant free?
Is Home Assistant reliable?
Is my smart home data private with Home Assistant?
What hardware do I need to run Home Assistant?
Who is Home Assistant for?
Common
When is the next Home Assistant release?
Configuration
My integration does not show up
Why does Home Assistant use YAML for power-user configuration?
Why doesn't this entity have a unique ID?
Documentation
The documentation is missing or out of date
What tools do you use to build the documentation?
Home Assistant
404 Client Error: Not Found ('no such image: homeassistant/...)
Can I run Home Assistant from a USB drive on a Raspberry Pi 4?
Do I need to leave the USB stick connected for Wi-Fi?
I'm trying to find my files on the host or SD card. Where are they?
Why does the start button for an app flash red when I select it?
Installation
What is the difference between Home Assistant Operating System and Home Assistant Container?
Usage
After updating, my browser login gets stuck
Connection error
found character ' ' that cannot start any token
Problems with dependencies
The Home Assistant user interface is acting weird
