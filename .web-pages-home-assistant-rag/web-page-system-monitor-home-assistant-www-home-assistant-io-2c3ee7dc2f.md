---
source_url: "https://www.home-assistant.io/integrations/systemmonitor"
final_url: "https://www.home-assistant.io/integrations/systemmonitor"
canonical_url: "https://www.home-assistant.io/integrations/systemmonitor/"
source_handle: "web:www-home-assistant-io:2c3ee7dc2f0d"
source_section: "integrations-systemmonitor"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "e055384ccb67b2fb848d11e0690b583fca065fa10b137e8882ddd0f34c51da69"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# System monitor - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/systemmonitor
- Final URL: https://www.home-assistant.io/integrations/systemmonitor
- Canonical URL: https://www.home-assistant.io/integrations/systemmonitor/
- Fetched at: 2026-06-28T03:20:31Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to monitor the Home Assistant host.

## Extracted Text

On this page
Configuration
Sensors
Disks
Network
Pressure Stall Information (PSI)
Other
Add process binary sensor
Disk usage
Processor temperature
The System monitor integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor disk usage, memory usage, network usage, CPU usage, and running processes on which Home Assistant is running.
To add the System monitor integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select System monitor .
Follow the instructions on screen to complete the setup.
Note
All entities are disabled by default, you need to enable the entities that you wish to use.
All sensors are also marked as diagnostic and won’t be automatically added to automatic dashboards.
One sensor per discovered disk/mount point will be created
Disk free : Amount of free space on the disk
Disk use : Amount of used space on the disk
Disk usage (%) : Percentage of disk space used
One sensor per discovered network interface will be created
IPv4 address : The IPv4 address assigned to the network interface
IPv6 address : The IPv6 address assigned to the network interface
Network in : Total bytes received on the network interface
Network out : Total bytes sent from the network interface
Packets in : Number of packets received on the network interface
Packets out : Number of packets sent from the network interface
Network throughput in : Current inbound network speed (bytes per second)
Network throughput out : Current outbound network speed (bytes per second)
PSI can tell you if your system is limited by CPU, memory or IO.
Unlike memory utilization, PSI can actually tell you if your system doesn’t have enough memory.
The some line indicates the share of time in which at least some tasks are stalled on a given resource.
The full line indicates the share of time in which all non-idle tasks are stalled on a given resource simultaneously.
In this state, actual CPU cycles are wasted, and a workload that spends extended time in this state is considered to be thrashing.
This has a severe impact on performance, and it’s useful to distinguish this situation from a state where some tasks are stalled, but the CPU is still doing productive work.
As such, time spent in this subset of the stall state is tracked separately and exported in the full averages.
Memory Pressure Some/Full 10s, 60s, 300s Average in %
Memory Pressure Some/Full Total in accumlated us
IO Pressure Some/Full 10s, 60s, 300s Average in %
IO Pressure Some/Full Total in accumlated us
CPU Pressure Some 10s, 60s, 300s Average in %
CPU Pressure Some Total in accumlated us
https://docs.kernel.org/accounting/psi.html
https://facebookmicrosites.github.io/psi/docs/overview
Battery : Percentage of battery remaining
Battery empty : Expected time when the battery is empty if not plugged in
Charging : Battery is charging (binary sensor)
Fan speed : Built-in fan speeds
Load (1 min) : System load average over the last 1 minute
Load (5 min) : System load average over the last 5 minutes
Load (15 min) : System load average over the last 15 minutes
Memory free : Amount of available system memory
Memory use : Amount of system memory used
Memory usage (%) : Percentage of system memory used
Processor use : Percentage of CPU usage
Processor temperature : Current temperature of the processor
Swap free : Amount of available swap memory
Swap use : Amount of used swap memory
Swap usage (%) : Percentage of swap memory used
Uptime : The date and time when the system was last started
The process binary sensor needs to be configured by the config entry options. Go to Settings > Devices & services , select the System Monitor integration and select Configure .
You can select from the pre-populated list (current running processes) or manually enter the process name, to which a binary sensor will be created per selected process .
The disk usage sensors do not support monitoring folder/directory sizes. Instead, it is only targeting “disks” (more specifically mount points on Linux).
Example output from the Linux df -H command
$ df -H
Filesystem Size Used Avail Use% Mounted on
/dev/root 29G 12G 16G 42% /
devtmpfs 805M 0 805M 0% /dev
tmpfs 934M 0 934M 0% /dev/shm
/dev/mmcblk0p1 253M 54M 199M 22% /boot
If no hardware sensor data is available (e.g., because the integration runs in a virtualized environment), the sensor entity will not be created.
The unit of measurement (Celsius vs. Fahrenheit) will be chosen based on the system configuration.
Only the very first processor related hardware sensor is read, that is, no individual core temperatures are available (even if the hardware sensor provides that level of detail).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The System monitor integration was introduced in Home Assistant pre 0.7, and it's used by
13.7% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@gjohansson-ST
Categories
System monitor
Back to top
