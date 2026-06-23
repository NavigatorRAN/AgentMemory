# pvescheduler(8)

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/pvescheduler.8.html
- Final URL: https://pve.proxmox.com/pve-docs/pvescheduler.8.html
- Fetched at: 2026-06-23T13:57:56Z
- Content type: text/html

## Extracted Text

☰
pvescheduler(8)
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↑
NAME
pvescheduler - PVE Scheduler Daemon
SYNOPSIS
pvescheduler <COMMAND> [ARGS] [OPTIONS]
pvescheduler help [OPTIONS]
Get help about specified command.
--extra-args <array>
Shows help for a specific command
--verbose <boolean>
Verbose output format.
pvescheduler restart
Restart the daemon (or start if not running).
pvescheduler start [OPTIONS]
Start the daemon.
--debug <boolean> ( default = 0 )
Debug mode - stay in foreground
pvescheduler status
Get daemon status.
pvescheduler stop
Stop the daemon.
DESCRIPTION
This daemon is responsible for starting jobs according to the schedule,
such as replication and vzdump jobs.
For vzdump jobs, it gets its configuration from the file /etc/pve/jobs.cfg
Copyright and Disclaimer
Copyright © 2007-2022 Proxmox Server Solutions GmbH
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Affero General Public License for more details.
You should have received a copy of the GNU Affero General Public
License along with this program. If not, see
https://www.gnu.org/licenses/
Version 9.2.2
Last updated
Thu May 21 22:27:14 CEST 2026
