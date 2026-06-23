# pvestatd(8)

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/pvestatd.8.html
- Final URL: https://pve.proxmox.com/pve-docs/pvestatd.8.html
- Fetched at: 2026-06-23T13:58:09Z
- Content type: text/html

## Extracted Text

☰
pvestatd(8)
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↑
NAME
pvestatd - PVE Status Daemon
SYNOPSIS
pvestatd <COMMAND> [ARGS] [OPTIONS]
pvestatd help [OPTIONS]
Get help about specified command.
--extra-args <array>
Shows help for a specific command
--verbose <boolean>
Verbose output format.
pvestatd restart
Restart the daemon (or start if not running).
pvestatd start [OPTIONS]
Start the daemon.
--debug <boolean> ( default = 0 )
Debug mode - stay in foreground
pvestatd status
Get daemon status.
pvestatd stop
Stop the daemon.
DESCRIPTION
This daemon queries the status of VMs, storages and containers at
regular intervals. The result is sent to all nodes in the cluster.
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
