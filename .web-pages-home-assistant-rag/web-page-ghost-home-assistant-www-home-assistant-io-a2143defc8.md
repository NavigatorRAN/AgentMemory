# Ghost - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/ghost
- Final URL: https://www.home-assistant.io/integrations/ghost
- Canonical URL: https://www.home-assistant.io/integrations/ghost/
- Fetched at: 2026-06-28T02:45:57Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Ghost with Home Assistant.

## Extracted Text

On this page
Prerequisites
Create a Ghost Admin API integration
Configuration
Supported functionality
Entities
Data updates
Examples
Announce milestone member counts
Known limitations
Troubleshooting
Invalid API key
Cannot connect to Ghost
Missing revenue data
Missing SocialWeb/ActivityPub data
Removing the integration
To remove an integration instance from Home Assistant
The Ghost integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your Ghost publication metrics in Home Assistant, including member counts, revenue, post statistics, and email newsletter performance.
A Ghost site running version 6.0 or later
A Ghost administrator staff user account
In Ghost Admin, go to Settings > Integrations .
Under Custom Integrations , select Add custom integration .
Enter a name, like Home Assistant .
Copy the API URL .
Copy the Admin API Key .
To add the Ghost service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Ghost .
Follow the instructions on screen to complete the setup.
API URL
The API URL of your Ghost site. You can find it in the Ghost Admin under Settings > Integrations > Custom .
Admin API Key
The Admin API key for your Ghost site. You can find it in the Ghost Admin under Settings > Integrations > Custom .
The Ghost integration provides the following entities.
Sensors Member metrics
Total Members : Total number of subscribers
Paid Members : Number of paying subscribers
Free Members : Number of free subscribers
Comped Members : Number of complimentary subscribers
Gift Members : Number of subscribers with a gift subscription
Revenue metrics
MRR : Monthly Recurring Revenue (USD)
ARR : Annual Recurring Revenue (USD)
Content metrics
Published Posts : Number of published posts
Draft Posts : Number of draft posts
Scheduled Posts : Number of scheduled posts
Latest Post : Title of the most recent post
Total Comments : Total number of comments
Email newsletter metrics
Latest Email : Title of the most recent newsletter
Latest Email Sent : Number of emails sent
Latest Email Opened : Number of emails opened
Latest Email Open Rate : Open rate percentage
Latest Email Clicked : Number of link clicks
Latest Email Click Rate : Click rate percentage
SocialWeb (ActivityPub) metrics
SocialWeb Followers : Number of Fediverse followers
SocialWeb Following : Number of accounts being followed
Newsletter subscribers
For each active newsletter on your Ghost site, an additional sensor is created showing the subscriber count for that newsletter.
The integration polls Data polling is the process of querying a device or service at regular intervals to check for updates or retrieve data. By defining a custom polling interval, you can control how frequently your system checks for new data, which can help optimize performance and reduce unnecessary network traffic. [Learn more] your Ghost site every 5 minutes to update sensor data.
automation : - alias : " Member milestone celebration" triggers : - trigger : state entity_id : sensor.my_ghost_site_total_members conditions : - condition : template value_template : " {{ trigger.to_state.state | int % 100 == 0 }}" actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " Milestone reached!" message : " You now have {{ trigger.to_state.state }} members!"
Revenue metrics (MRR/ARR) are only available for sites with Stripe connected.
ActivityPub/SocialWeb metrics require Ghost 6 or later with ActivityPub enabled.
Symptom: “Invalid API key” error during setup
When trying to set up the integration, you receive an “Invalid API key” error.
Description
This error occurs when the API key format is incorrect or the key has been invalidated.
Resolution
To resolve this issue, try the following steps:
Ensure the API key contains a colon ( : ) separating the key ID from the secret (format: id:secret ).
Verify you copied the Admin API Key, not the Content API Key.
Check that the custom integration in Ghost has not been deleted or regenerated.
Symptom: “Cannot connect” error during setup
When trying to set up the integration, you receive a connection error.
This error occurs when Home Assistant cannot reach your Ghost site.
Verify the API URL is correct and includes the protocol (for example, https://example.com ).
Ensure your Ghost site is accessible from your Home Assistant instance.
Check that no firewall or proxy is blocking the connection.
Symptom: MRR and ARR sensors show as unavailable
The MRR (Monthly Recurring Revenue) and ARR (Annual Recurring Revenue) sensors display as unavailable.
Revenue sensors require an active Stripe connection with paid members.
To resolve this issue, check the following:
Verify your Ghost site has Stripe connected.
Confirm you have at least one paid member.
Symptom: SocialWeb sensors show as unavailable
The SocialWeb followers and following sensors display as unavailable.
These sensors require Ghost 6 or later with ActivityPub enabled.
Verify you are running Ghost 6 or later.
Ensure ActivityPub is enabled in your Ghost settings.
This integration follows standard integration removal. No extra steps are required.
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Ghost service was introduced in Home Assistant 2026.3, and it's used by
19 active installations.
Its IoT class is Cloud Polling.
🥇 Gold quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@johnonolan
Categories
Sensor
Back to top
