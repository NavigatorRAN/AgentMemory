# qmrestore(1)

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/qmrestore.1.html
- Final URL: https://pve.proxmox.com/pve-docs/qmrestore.1.html
- Fetched at: 2026-06-23T13:58:27Z
- Content type: text/html

## Extracted Text

☰
qmrestore(1)
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↑
NAME
qmrestore - Restore QemuServer vzdump Backups
SYNOPSIS
qmrestore help
qmrestore <archive> <vmid> [OPTIONS]
Restore QemuServer vzdump backups.
<archive> : <string>
The backup file. You can pass - to read from standard input.
<vmid> : <integer> (100 - 999999999)
The (unique) ID of the VM.
--bwlimit <number> (0 - N)
Override I/O bandwidth limit (in KiB/s).
--force <boolean>
Allow to overwrite existing VM.
--ha-managed <boolean> ( default = 0 )
Add the VM as a HA resource after it was restored.
--live-restore <boolean>
Start the VM immediately from the backup and restore in background. PBS only.
--pool <string>
Add the VM to the specified pool.
--start <boolean> ( default = 0 )
Start VM after it was restored successfully.
--storage <storage ID>
Default storage.
--unique <boolean>
Assign a unique random ethernet address.
DESCRIPTION
Restore the QemuServer vzdump backup archive to virtual machine
vmid . Volumes are allocated on the original storage if there is no
storage specified.
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
