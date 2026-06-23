# spiceproxy(8)

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/spiceproxy.8.html
- Final URL: https://pve.proxmox.com/pve-docs/spiceproxy.8.html
- Fetched at: 2026-06-23T13:58:30Z
- Content type: text/html

## Extracted Text

☰
spiceproxy(8)
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↑
NAME
spiceproxy - SPICE Proxy Service
SYNOPSIS
spiceproxy <COMMAND> [ARGS] [OPTIONS]
spiceproxy help [OPTIONS]
Get help about specified command.
--extra-args <array>
Shows help for a specific command
--verbose <boolean>
Verbose output format.
spiceproxy restart
Restart the daemon (or start if not running).
spiceproxy start [OPTIONS]
Start the daemon.
--debug <boolean> ( default = 0 )
Debug mode - stay in foreground
spiceproxy status
Get daemon status.
spiceproxy stop
Stop the daemon.
DESCRIPTION
SPICE (the Simple Protocol for Independent
Computing Environments) is an open remote computing solution,
providing client access to remote displays and devices (e.g. keyboard,
mouse, audio). The main use case is to get remote access to virtual
machines and container.
This daemon listens on TCP port 3128, and implements an HTTP proxy to
forward CONNECT request from the SPICE client to the correct Proxmox VE
VM. It runs as user www-data and has very limited permissions.
Host based Access Control
It is possible to configure "apache2" like access control
lists. Values are read from file /etc/default/pveproxy .
See pveproxy documentation for details.
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
