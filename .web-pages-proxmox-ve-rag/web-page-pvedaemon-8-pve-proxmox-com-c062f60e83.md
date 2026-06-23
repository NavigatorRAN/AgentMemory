# pvedaemon(8)

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/pvedaemon.8.html
- Final URL: https://pve.proxmox.com/pve-docs/pvedaemon.8.html
- Fetched at: 2026-06-23T13:57:44Z
- Content type: text/html

## Extracted Text

☰
pvedaemon(8)
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↑
NAME
pvedaemon - PVE API Daemon
SYNOPSIS
pvedaemon <COMMAND> [ARGS] [OPTIONS]
pvedaemon help [OPTIONS]
Get help about specified command.
--extra-args <array>
Shows help for a specific command
--verbose <boolean>
Verbose output format.
pvedaemon restart
Restart the daemon (or start if not running).
pvedaemon start [OPTIONS]
Start the daemon.
--debug <boolean> ( default = 0 )
Debug mode - stay in foreground
pvedaemon status
Get daemon status.
pvedaemon stop
Stop the daemon.
DESCRIPTION
This daemon exposes the whole Proxmox VE API on 127.0.0.1:85 . It runs as
root and has permission to do all privileged operations.
The daemon listens to a local address only, so you cannot access
it from outside. The pveproxy daemon exposes the API to the outside
world.
Number of Workers
pvedaemon delegates handling of incoming requests to worker processes. By
default, pvedaemon spawns 3 worker processes, which is sufficient for most
workloads. For automation-heavy workloads that issue a huge volume of API
requests and that experience slow request handling or timeouts, the number of
worker processes can be increased by setting MAX_WORKERS in
/etc/default/pvedaemon , for example:
MAX_WORKERS=5
Note that a higher number of worker processes may result in higher CPU usage.
The number of worker processes must be greater than 0 and smaller than 128.
The same setting exists for pveproxy .
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
