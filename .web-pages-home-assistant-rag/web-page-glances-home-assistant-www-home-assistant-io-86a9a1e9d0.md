# Glances - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/glances
- Final URL: https://www.home-assistant.io/integrations/glances
- Canonical URL: https://www.home-assistant.io/integrations/glances/
- Fetched at: 2026-06-28T02:46:11Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Glances sensors into Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Integration entities
The Glances integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor the system information provided by the Glances API. This enables one to track remote host and display their stats in Home Assistant.
Important
Support for Glances api version 2 is deprecated. It is recommended to upgrade your Glances server to version 3. Once upgraded, reload the integration to connect again.
These sensors needs a running instance of glances in Web Server Mode on the host. The minimal supported version of glances is 2.3.
For details about auto-starting glances , please refer to Start Glances through Systemd .
To add the Glances service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Glances .
Follow the instructions on screen to complete the setup.
Glances integration will add the following sensors if available in the platform:
For each detected disk (or mount point) the following sensors will be created:
disk_use_percent: The used disk space in percent.
disk_use: The used disk space.
disk_free: The free disk space.
disk_size: The total size of the disk.
For each detected physical disk, the following sensors will be created:
diskio_read: Average rate of data read from the device in megabytes per second.
diskio_write: Average rate of data written to the device in megabytes per second.
memory_use_percent: The used memory in percent.
memory_use: The used memory.
memory_free: The free memory.
swap_use_percent: The used swap space in percent.
swap_use: The used swap space.
swap_free: The free swap space.
processor_load: The load.
process_running: The number of running processes.
process_total: The total number of processes.
process_thread: The number of threads.
process_sleeping: The number of sleeping processes.
cpu_use_percent: The used CPU in percent.
sensor_temp: A temperature sensor for each device that provides temperature (depends on platform).
docker_active: The count of active Docker containers.
docker_cpu_use: The total CPU usage in percent of Docker containers.
docker_memory_use: The total memory used by Docker containers.
For each detected raid the following sensors will be created:
raid_available: The number of available devices for the raid.
raid_used: The number of devices used by the raid.
For each detected network interface, the following sensors will be created:
network_rx: Average rate of data received since last update in Megabits per second.
network_tx: Average rate of data sent since last update in Megabits per second.
For each detected GPU (video card) the following sensors will be created:
memory_use: The amount of available VRAM used in percent.
processor_use: The load on the GPU processor in percent.
temperature: The temperature that the GPU reports, in degrees Celsius.
fan_speed: The speed of the GPU fan, in percent.
uptime: The server uptime.
Not all platforms can provide all metrics. For instance the GPU sensors require installing the py3nvml Python package, and the cpu temp sensor requires installing and configuring lmsensors in Ubuntu, and may not be available at all in other platforms.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Glances service was introduced in Home Assistant 0.7.3, and it's used by
1.2% of the active installations.
Its IoT class is Local Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@engrbm87
Categories
System monitor
Back to top
