# pvesubscription(1)

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/pvesubscription.1.html
- Final URL: https://pve.proxmox.com/pve-docs/pvesubscription.1.html
- Fetched at: 2026-06-23T13:58:11Z
- Content type: text/html

## Extracted Text

☰
pvesubscription(1)
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↑
NAME
pvesubscription - Proxmox VE Subscription Manager
SYNOPSIS
pvesubscription <COMMAND> [ARGS] [OPTIONS]
pvesubscription delete
Delete subscription key of this node.
pvesubscription get
Read subscription info.
pvesubscription help [OPTIONS]
Get help about specified command.
--extra-args <array>
Shows help for a specific command
--verbose <boolean>
Verbose output format.
pvesubscription set <key>
Set subscription key.
<key> : \s*pve([1248])([cbsp])-[0-9a-f]{10}\s*
Proxmox VE subscription key
pvesubscription set-offline-key <data>
Internal use only! To set an offline key, use the package
proxmox-offline-mirror-helper instead.
<data> : <string>
A signed subscription info blob
pvesubscription update [OPTIONS]
Update subscription info.
--force <boolean> ( default = 0 )
Always connect to server, even if local cache is still valid.
DESCRIPTION
This tool is used to handle Proxmox VE subscriptions.
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
