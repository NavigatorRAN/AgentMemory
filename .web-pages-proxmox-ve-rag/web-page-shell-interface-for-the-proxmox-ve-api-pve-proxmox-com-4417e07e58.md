# Shell interface for the Proxmox VE API

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/chapter-pvesh.html
- Final URL: https://pve.proxmox.com/pve-docs/chapter-pvesh.html
- Fetched at: 2026-06-23T13:55:42Z
- Content type: text/html

## Extracted Text

☰
Shell interface for the Proxmox VE API
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↩Index
Table of Contents
↑
The Proxmox VE management tool ( pvesh ) allows to directly invoke API
function, without using the REST/HTTPS server.
Only root is allowed to do that.
EXAMPLES
Get the list of nodes in my cluster
# pvesh get /nodes
Get a list of available options for the datacenter
# pvesh usage cluster/options -v
Set the HTMl5 NoVNC console as the default console for the datacenter
# pvesh set cluster/options -console html5
Version 9.2.2
Last updated
Thu May 21 22:27:14 CEST 2026
