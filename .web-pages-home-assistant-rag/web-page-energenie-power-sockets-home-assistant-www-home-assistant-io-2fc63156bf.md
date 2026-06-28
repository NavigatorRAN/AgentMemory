# Energenie Power Sockets - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/energenie_power_sockets
- Final URL: https://www.home-assistant.io/integrations/energenie_power_sockets
- Canonical URL: https://www.home-assistant.io/integrations/energenie_power_sockets/
- Fetched at: 2026-06-28T02:40:17Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Energenie Power-Strip switches into Home Assistant.

## Extracted Text

On this page
Configuration
Troubleshooting
The Energenie Power-Sockets integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to include Energenie USB Power-Sockets into your Home Assistant setup.
To add the Energenie Power Sockets device to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Energenie Power Sockets .
Follow the instructions on screen to complete the setup.
If you are running a Home Assistant Container Home Assistant Container is a standalone container-based installation of Home Assistant Core. Any OCI compatible runtime can be used, but the documentation focus is on Docker. [Learn more] installation: Depending on your system configuration, it may be necessary to grant explicit user access rights to the USB device by creating an udev rule.
Creating an udev rule
Find the vendor_id and product_id of the USB device by calling lsusb :
lsusb
#e.g.: Bus 001 Device 005: ID 04b4:fd15 Cypress Semiconductor Corp. Energenie EG-PMS2
Create an udev rule by calling:
sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="04b4", ATTR{idProduct}=="fd15", MODE="0666"' > /lib/udev/rules.d/60-energenie-usb.rules
sudo udevadm control --reload-rules sudo udevadm trigger
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Energenie Power Sockets device was introduced in Home Assistant 2024.5, and it's used by
1 active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gnumpi
Categories
Switch
Back to top
