---
source_url: "https://www.home-assistant.io/installation/troubleshooting"
final_url: "https://www.home-assistant.io/installation/troubleshooting"
canonical_url: "https://www.home-assistant.io/installation/troubleshooting/"
source_handle: "web:www-home-assistant-io:27fdddad14b8"
source_section: "installation-troubleshooting"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fede2e11e220ca49e98fc2507e78916898695983c7d7490e4e8fb2b4d3380275"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Troubleshooting installation problems - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/installation/troubleshooting
- Final URL: https://www.home-assistant.io/installation/troubleshooting
- Canonical URL: https://www.home-assistant.io/installation/troubleshooting/
- Fetched at: 2026-06-28T02:25:30Z
- Content type: text/html; charset=UTF-8

## Description

Common installation problems and their solutions.

## Extracted Text

On this page
Can’t access Home Assistant in my browser
Symptom: “This site can’t be reached”
Description
Resolution
“Error installing Home Assistant”
Symptom: During onboarding, there is an “Error installing Home Assistant”
Stuck at “Preparing Home Assistant”
Symptom: Onboarding seems stuck at “Preparing Home Assistant”
It can happen that you run into trouble while installing and onboarding Home Assistant. This page is here to help you solve the most common problems.
When trying to access Home Assistant in the browser, the browser shows the message “This site can’t be reached”.
This means the browser can’t find your Home Assistant installation on the network.
To resolve this issue, try the following steps:
Make sure your Home Assistant device is powered up (LEDs are on).
Make sure your Home Assistant installation is connected to the internet:
Make sure the Ethernet cable is plugged-in to both Home Assistant and to your router or switch.
Make sure your network has internet access.
During first startup, time will be synchronized. Ensure NTP is allowed in your network.
During first startup, Home Assistant completes the installation. It needs access to the following URLs:
version.home-assistant.io: to fetch new version information.
github.com: to update metadata of the Home Assistant app store.
ghcr.io: the GitHub container registry to fetch new Home Assistant updates.
Make sure the system on which you opened the browser to access Home Assistant is connected to the same network as Home Assistant.
For example, if the system your Browser runs on is using Wi-Fi, make sure it is using the same Wi-Fi Home Assistant is connected to.
Make sure you typed the address correctly.
Especially if the message includes the error code “ERR_CONNECTION_REFUSED”, it is likely that there was a typo in the port part of the URL ( :8123 ).
Typically, the URL is http://homeassistant.local:8123 .
If you are running an older Windows version or have a stricter network configuration, try http://homeassistant:8123 instead.
The system might still be starting up. Wait for a couple of minutes and refresh the page.
Refreshing might work differently depending on your browser. Look for the refresh icon, or press CTRL+R or CTRL+SHIFT+R.
Check your router’s web interface to see what IP address is assigned to your Home Assistant installation.
Enter this IP address ( http://x.x.x.x:8123 ) directly into your browser.
If you still can’t reach Home Assistant, connect keyboard and monitor to the device Home Assistant is running on to access the console and see where Home Assistant gets stuck.
If you are using a Home Assistant Green, follow these steps to access the console .
If you are using a Home Assistant Yellow, follow these steps to access the console from Windows , or to access the console from Linux or macOS .
Reach out to our community for help .
You are in the onboarding procedure, but you get the message Error installing Home Assistant .
After changing your network environment, wait a few minutes. Home Assistant will try to reconnect.
You are in the onboarding procedure, but the process seems stuck at the step Preparing Home Assistant .
Select Show details to view the log files.
The log files might provide more information on the current status.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Getting started
Installation
Home Assistant Green
Home Assistant Yellow
Raspberry Pi
ODROID
Generic x86-64
Linux
macOS
Windows
Other systems
Troubleshooting
Onboarding
Concepts and terminology
Editing the dashboard
Adding integrations
Automating devices
Presence detection
Join the community
Next steps
Back to top
