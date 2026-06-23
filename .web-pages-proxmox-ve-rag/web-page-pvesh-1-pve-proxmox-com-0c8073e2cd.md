# pvesh(1)

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://pve.proxmox.com/pve-docs/pvesh.1.html
- Final URL: https://pve.proxmox.com/pve-docs/pvesh.1.html
- Fetched at: 2026-06-23T13:57:59Z
- Content type: text/html

## Extracted Text

☰
pvesh(1)
Proxmox Server Solutions GmbH
< support@proxmox.com >
version 9.2.2, Thu May 21 22:27:14 CEST 2026
↑
NAME
pvesh - Shell interface for the Proxmox VE API
SYNOPSIS
pvesh <COMMAND> [ARGS] [OPTIONS]
pvesh create <api_path> [OPTIONS] [FORMAT_OPTIONS]
Call API POST on <api_path>.
<api_path> : <string>
API path.
--noproxy <boolean>
Disable automatic proxying.
pvesh delete <api_path> [OPTIONS] [FORMAT_OPTIONS]
Call API DELETE on <api_path>.
pvesh get <api_path> [OPTIONS] [FORMAT_OPTIONS]
Call API GET on <api_path>.
pvesh help [OPTIONS]
Get help about specified command.
--extra-args <array>
Shows help for a specific command
--verbose <boolean>
Verbose output format.
pvesh ls <api_path> [OPTIONS] [FORMAT_OPTIONS]
List child objects on <api_path>.
pvesh set <api_path> [OPTIONS] [FORMAT_OPTIONS]
Call API PUT on <api_path>.
pvesh usage <api_path> [OPTIONS]
print API usage information for <api_path>.
--command <create | delete | get | set>
API command.
--returns <boolean>
Including schema for returned data.
DESCRIPTION
The Proxmox VE management tool ( pvesh ) allows to directly invoke API
function, without using the REST/HTTPS server.
Only root is allowed to do that.
FORMAT_OPTIONS
It is possible to specify the output format using the
--output-format parameter. The default format text uses ASCII-art
to draw nice borders around tables. It additionally transforms some
values into human-readable text, for example:
Unix epoch is displayed as ISO 8601 date string.
Durations are displayed as week/day/hour/minute/second count, i.e 1d 5h .
Byte sizes value include units ( B , KiB , MiB , GiB , TiB , PiB ).
Fractions are display as percentage, i.e. 1.0 is displayed as 100%.
You can also completely suppress output using option --quiet .
--human-readable <boolean> ( default = 1 )
Call output rendering functions to produce human readable text.
--noborder <boolean> ( default = 0 )
Do not draw borders (for text format).
--noheader <boolean> ( default = 0 )
Do not show column headers (for text format).
--output-format <json | json-pretty | text | yaml> ( default = text )
Output format.
--quiet <boolean>
Suppress printing results.
EXAMPLES
Get the list of nodes in my cluster
# pvesh get /nodes
Get a list of available options for the datacenter
# pvesh usage cluster/options -v
Set the HTMl5 NoVNC console as the default console for the datacenter
# pvesh set cluster/options -console html5
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
