# qmeventd(8)

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/qmeventd.8.html
- Final URL: https://pve.proxmox.com/pve-docs/qmeventd.8.html
- Fetched at: 2026-06-23T13:58:25Z
- Content type: text/html

## Extracted Text

☰
qmeventd(8)
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↑
NAME
qmeventd - PVE QEMU Eventd Daemon
SYNOPSIS
qmeventd [-f] [-v] PATH
-v
Turn on verbose messages
-f
Do not daemonize server
PATH
The path to listen on
This service is usually started and managed using systemd toolset. The
service is called qmeventd .
systemctl start qmeventd
systemctl stop qmeventd
systemctl status qmeventd
DESCRIPTION
qmeventd is a daemon that listens on PATH for incoming connections from
a qemu qmp socket, and waits for SHUTDOWN events. When a client then
disconnects, it executes /usr/sbin/qm cleanup . This makes it easy
to clean up leftover tap devices, vgpus, etc.
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
