# The Home Assistant user interface is acting weird - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/faq/browser
- Final URL: https://www.home-assistant.io/faq/browser
- Canonical URL: https://www.home-assistant.io/faq/browser/
- Fetched at: 2026-06-28T02:23:48Z
- Content type: text/html; charset=UTF-8

## Description

If buttons, cards, or whole pages start to look or behave strangely after an update, it is almost always a caching issue in your browser or app. Refreshing usually fixes it.

## Extracted Text

If buttons, cards, or whole pages start to look or behave strangely, it is almost always a caching issue. The Home Assistant user interface caches a lot of things in your browser to make it fast, and sometimes that cache gets out of sync with what is actually running on your Home Assistant.
This typically happens after:
Installing, updating, or removing a custom card or custom dashboard element from outside the official integration store, such as through HACS.
In rare cases, after a Home Assistant update.
To fix it:
Close all browser tabs and Home Assistant app windows that have Home Assistant open.
Open Home Assistant again. In most cases, this is enough.
If the issue is still there, do a hard refresh of the page, or clear your browser cache for Home Assistant, and try again.
A hard refresh reloads the page while bypassing the cache:
On Windows and Linux, press Ctrl + F5 or Ctrl + Shift + R .
On macOS, press Cmd + Shift + R .
On the Home Assistant Companion app for Android or iOS, pull down on the page to refresh.
If a hard refresh is not enough, you can clear the browser cache for Home Assistant specifically:
Chrome, Edge, or Brave : Open Home Assistant, then press F12 to open the developer tools. Right-click the refresh button in the browser toolbar and select Empty cache and hard reload .
Firefox : Open the menu, go to Settings > Privacy & Security > Cookies and Site Data > Manage Data , search for your Home Assistant address, select it, and select Remove Selected .
Safari : Open Safari > Settings > Privacy > Manage Website Data , search for your Home Assistant address, select it, and select Remove .
Home Assistant Companion app : Go to Settings in the app and select Reset frontend cache .
If a specific custom card is the cause, removing or updating that card will resolve it.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View given feedback
Entries
About Home Assistant
Can the rest of my household use Home Assistant?
Do Home Assistant updates break things?
Do I need to know how to code to use Home Assistant?
Do I need to learn YAML to use Home Assistant?
Does Home Assistant work with Apple Home, Google Home, and Alexa?
Does Home Assistant work without an internet connection?
How long does it take to set up Home Assistant?
Is Home Assistant free?
Is Home Assistant reliable?
Is my smart home data private with Home Assistant?
What hardware do I need to run Home Assistant?
Who is Home Assistant for?
Common
When is the next Home Assistant release?
Configuration
My integration does not show up
Why does Home Assistant use YAML for power-user configuration?
Why doesn't this entity have a unique ID?
Documentation
The documentation is missing or out of date
What tools do you use to build the documentation?
Home Assistant
404 Client Error: Not Found ('no such image: homeassistant/...)
Can I run Home Assistant from a USB drive on a Raspberry Pi 4?
Do I need to leave the USB stick connected for Wi-Fi?
I'm trying to find my files on the host or SD card. Where are they?
Why does the start button for an app flash red when I select it?
Installation
What is the difference between Home Assistant Operating System and Home Assistant Container?
Usage
After updating, my browser login gets stuck
Connection error
found character ' ' that cannot start any token
Problems with dependencies
The Home Assistant user interface is acting weird
