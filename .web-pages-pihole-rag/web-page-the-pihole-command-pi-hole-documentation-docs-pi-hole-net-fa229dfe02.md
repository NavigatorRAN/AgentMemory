# The pihole Command - Pi-hole documentation

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.pi-hole.net/main/pihole-command
- Final URL: https://docs.pi-hole.net/main/pihole-command/
- Canonical URL: https://docs.pi-hole.net/main/pihole-command/
- Fetched at: 2026-06-23T13:43:32Z
- Content type: text/html; charset=UTF-8

## Extracted Text

Skip to content
The pihole Command
Pi-hole makes use of many commands, and here we will break down those required to administer the program via the command-line Interface.
Index Invocation Core Script pihole
Pi-hole Core ¶
Feature Invocation Core pihole Allowlisting, Denylisting and Regex pihole allow , pihole deny , pihole --regex , pihole --wild , pihole --allow-regex , pihole --allow-wild Debugger pihole debug Log Flush pihole flush Network Flush pihole networkflush Repair pihole repair Tail pihole tail Set password pihole setpassword Gravity pihole updateGravity Logging pihole logging Query pihole query Update pihole updatePihole Version pihole version Uninstall pihole uninstall Status pihole status Enable & Disable pihole enable Checkout pihole checkout
Core Script ¶
Help Command pihole --help Script Location /usr/local/bin/pihole Example Usage pihole -b advertiser.example.com
The core script of Pi-hole provides the ability to tie many DNS related functions into a simple and user-friendly management system, so that one may easily block unwanted content such as advertisements. For both the Command-line Interface ( CLI ) and Web Interface, we achieve this through the pihole command (this helps minimize code duplication, and allows users to read exactly what's happening using bash scripting). This "wrapper" elevates the current user (whether it be your own user account, or www-data ) using sudo , but restricts the elevation to solely what can be called through the wrapper.
Allowlisting, Denylisting and Regex ¶
Help Command pihole allow --help , pihole deny --help , pihole --regex --help , pihole --wild --help , pihole --allow-regex --help , pihole --allow-wild --help Script Location /opt/pihole/list.sh Example Usage pihole --regex '^example.com$' '.*\.example2.net'
Administrators need to be able to manually add and remove domains for various purposes, and these commands serve that purpose.
See Regex Blocking for more information about using Regex .
Basic Script Process :
Each domain is validated using regex (except when using --regex ), to ensure invalid domains and IDNs are not added
A domain gets added to or removed from the domainlist table in /etc/pihole/gravity.db
The DNS server is then reloaded
Debugger ¶
Help Command N/A Script Location /opt/pihole/piholeDebug.sh Example Usage pihole debug
The Pi-hole debugger will attempt to diagnose any issues, and link to an FAQ with instructions as to how an admin can rectify the issue. Once the debugger has finished, the admin has the option to upload the generated log to the Pi-hole developers, who can help with diagnosing and rectifying persistent issues.
Log Flush ¶
Help Command N/A Script Location /opt/pihole/piholeLogFlush.sh Example Usage pihole flush
When invoked manually, this command will allow you to empty Pi-hole's log, which is located at /var/log/pihole/pihole.log . The command also serves to rotate the log daily, if the logrotate application is installed.
Network Flush ¶
Help Command N/A Script Location /opt/pihole/piholeNetworkFlush.sh Example Usage pihole networkflush --arp
This command empties Pi-hole's network table. If the optional --arp is given, the ARP table will also be cleared.
Repair ¶
Help Command N/A Script Location /etc/.pihole/automated install/basic-install.sh Example Usage pihole repair
There are times where the administrator will need to repair the Pi-hole installation, which is performed via this command.
basic-install.sh will be run with Repair option, which will retain your existing settings and will attempt to repair any scripts or dependencies as necessary. The rest of basic-install.sh will then run as appropriate.
Tail ¶
Help Command N/A Script Location /usr/local/bin/pihole Example Usage pihole tail
Since Pi-hole will log DNS queries by default, using this command to watch the log in real-time can be useful for debugging a problematic site, or even just for sheer curiosities sake.
Gravity ¶
Help Command N/A Script Location /opt/pihole/gravity.sh Example Usage pihole -g
Gravity is one of the most important scripts of Pi-hole. Its main purpose is to retrieve subscribed lists, and then consolidate them into one unique list for the built-in DNS server to use, but it also serves to complete the process of manual allowlisting, denylisting and wildcard update. It is run automatically each week, but it can be invoked manually at any time.
It will determine Internet connectivity, and give time for pihole-FTL to be resolvable on low-end systems if has just been restarted
It extracts all URLs and domains from the adlists table in /etc/pihole/gravity.db
It runs through each URL , downloading it if necessary
curl checks the server's Last-Modified header to ensure it is getting a newer version
It will attempt to parse the file into a domains-only format if necessary
Lists are merged, comments removed, sorted uniquely and stored in the gravity table of /etc/pihole/gravity.db
Gravity cleans up temporary content and reloads the DNS server
Logging ¶
Help Command pihole logging --help Script Location /usr/local/bin/pihole Example Usage pihole logging off
This command specifies whether the Pi-hole log should be used.
Query ¶
Help Command pihole query --help Script Location /usr/local/bin/pihole Example Usage pihole -q -exact -adlist example.domain.com
This command will query your allowlist, denylist, wildcards and subscribed lists for a specified domain.
User-specified options are handled
Using idn , it will convert Internationalized domain names into punycode
Database at /etc/pihole/gravity.db is queried to return a list of subscribed lists in which the queried domain exists.
Update ¶
Help Command pihole updatePihole Script Location /opt/pihole/update.sh Example Usage pihole -up
Check Pi-hole Core, Web Interface and FTL repositories to determine what upgrades (if any) are required. It will then automatically update and reinstall if necessary.
Script determines if updates are available by querying GitHub
Updated files are downloaded to the local filesystem using git
basic-install.sh is run
Version ¶
Help Command pihole version Script Location /opt/pihole/version.sh Example Usage pihole -v
Shows installed versions of Pi-hole, Web Interface & FTL .
Uninstall ¶
Help Command N/A Script Location /etc/.pihole/automated install/uninstall.sh Example Usage pihole uninstall
Uninstall Pi-hole from your system, giving the option to remove each dependency individually.
Status ¶
Help Command N/A Script Location /usr/local/bin/pihole Example Usage pihole status
Display the running status of Pi-hole's DNS and blocking services.
Enable & Disable ¶
Help Command pihole disable --help / pihole enable --help Script Location /usr/local/bin/pihole Example Usage pihole disable 5m / pihole enable
Toggle Pi-hole's ability to block unwanted domains. The disable option has the option to set a specified time before blocking is automatically re-enabled.
Checkout ¶
Help Command pihole checkout --help Script Location /opt/pihole/piholeCheckout.sh Example Usage pihole checkout dev
Switch Pi-hole subsystems to a different GitHub branch. An admin can specify repositories as well as branches.
Password ¶
Help Command N/A Script Location /usr/local/bin/pihole Example Usage pihole setpassword
Set the Web Interface an API password. Password can be entered as an option (e.g: pihole setpassword secretpassword ), or separately as to not display on the screen (e.g: pihole setpassword ).
Reload Lists ¶
Help Command N/A Script Location /usr/local/bin/pihole Example Usage pihole reloadlists
Reload DNS lists. Note: This will NOT re-read any *.conf files
Reload DNS ¶
Help Command N/A Script Location /usr/local/bin/pihole Example Usage pihole reloaddns
Flush and reload the pihole- FTL DNS cache. Note: This will NOT re-read any *.conf files
November 26, 2025
Back to top
