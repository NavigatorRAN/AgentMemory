# ekey bionyx - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ekeybionyx
- Final URL: https://www.home-assistant.io/integrations/ekeybionyx
- Canonical URL: https://www.home-assistant.io/integrations/ekeybionyx/
- Fetched at: 2026-06-28T02:39:28Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate ekey bionyx devices into Home Assistant.

## Extracted Text

On this page
Prerequisites
Configuration
Supported functionality
Events
Limitations
Removing the integration
The ekey bionyx integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows Home Assistant to receive events from your ekey fingerprint reader .
The ekey bionyx app.
The ekey device needs to be set up in plus mode in the app.
The ekey bionyx Third-Party API needs to be enabled in the app.
To add the ekey bionyx hub to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select ekey bionyx .
Follow the instructions on screen to complete the setup.
Tip
Prefer using local IPs when setting up the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] instead of domain names because the events will be more responsive.
Once the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] is added, open the ekey app and assign events to the fingers you wish to use as triggers.
The ekey bionyx integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following entities.
The functions defined during setup are represented in Home Assistant as events. You can use these events as triggers in automations.
The ekey integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows only five functions per ekey system.
You cannot link multiple Home Assistant instances to the same ekey system.
Based on the limited lifetime of the token, you have two options for cleanly resetting the connection to Home Assistant:
Delete the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in Home Assistant, set it up again (triggering the deletion process), and abort when you are in the step of naming the functions.
Delete the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in Home Assistant, then disable and re-enable the Third-Party API in the ekey app (this resets all functions and webhooks, even outside of Home Assistant).
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The ekey bionyx hub was introduced in Home Assistant 2025.10, and it's used by
169 active installations.
Its IoT class is Local Push.
🥉 Bronze quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@richardpolzer
Categories
Event
Back to top
