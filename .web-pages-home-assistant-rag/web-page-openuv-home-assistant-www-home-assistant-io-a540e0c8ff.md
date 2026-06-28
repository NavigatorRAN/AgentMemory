# OpenUV - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/openuv
- Final URL: https://www.home-assistant.io/integrations/openuv
- Canonical URL: https://www.home-assistant.io/integrations/openuv/
- Fetched at: 2026-06-28T03:06:19Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate OpenUV within Home Assistant.

## Extracted Text

On this page
Generating an API Key
Configuration
Sensors
Updating data
Protection window
Examples of Updating Data
Expired API Keys and Re-authentication
The OpenUV integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] displays UV and Ozone data from openuv.io .
Warning
The guidelines within this documentation constitute estimates which are intended to help
informed decision making. They should not replace analysis, advice, or diagnosis from a
trained medical professional.
To generate an API key, log in at the OpenUV website .
To add the OpenUV service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select OpenUV .
Follow the instructions on screen to complete the setup.
Name Type Value Current Ozone Level Sensor ozone level in du (Dobson Units) Current UV Index Sensor UV Index (numerical value) Current UV Level Sensor UV Level (as literal) Max UV Index Sensor max UV Index for the day (at solar noon) Protection window Binary sensor whether sunblock protection should be used Skin Type 1 Safe Exposure Time Sensor the amount of time Fitzpatrick skin type 1 can be in the sun unprotected Skin Type 2 Safe Exposure Time Sensor the amount of time Fitzpatrick skin type 2 can be in the sun unprotected Skin Type 3 Safe Exposure Time Sensor the amount of time Fitzpatrick skin type 3 can be in the sun unprotected Skin Type 4 Safe Exposure Time Sensor the amount of time Fitzpatrick skin type 4 can be in the sun unprotected Skin Type 5 Safe Exposure Time Sensor the amount of time Fitzpatrick skin type 5 can be in the sun unprotected Skin Type 6 Safe Exposure Time Sensor the amount of time Fitzpatrick skin type 6 can be in the sun unprotected
Important
OpenUV does not automatically update data for its entities! Users must manually
update data via the homeassistant.update_entity action.
Beginning February 1, 2019, the “Limited” plan (which is what new users are given by
default) is limited to 50 API requests per day. Because different API plans and
locations will have different requirements, the OpenUV integration does not automatically
query the API for new data after it initially loads. To request new data, the
homeassistant.update_entity action should be used.
Note that in the case of UV and ozone data, selecting any one of:
Current Ozone Level
Current UV Index
Current UV Level
Max UV Index
Skin Type 1 Safe Exposure Time
Skin Type 2 Safe Exposure Time
Skin Type 3 Safe Exposure Time
Skin Type 4 Safe Exposure Time
Skin Type 5 Safe Exposure Time
Skin Type 6 Safe Exposure Time
…as the target for the homeassistant.update_entity action will update the data for
all of these entities.
To protect against possible API call waste, all calls to homeassistant.update_entity
that reference an OpenUV entity are throttled to a minimum of 15 minutes between calls.
The Protection Window binary sensor will be on when sunblock protection should be used.
By default, this occurs anytime the UV index is above 3.5. This behavior can be
configured via the config entry options within the UI. Two parameters are given:
Starting UV index for the protection window : the UV index that, when passed, indicates
protection should be utilized
Ending UV index for the protection window : the UV index that, when passed, indicates
protection is no longer required
Update the UV index data every 20 minutes while the sun is at least 10 degrees above the
horizon:
automation : - alias : " Update OpenUV" triggers : - trigger : time_pattern minutes : " /20" conditions : - condition : numeric_state entity_id : sun.sun value_template : " {{ state.attributes.elevation }}" above : 10 actions : - action : homeassistant.update_entity target : entity_id : sensor.LATITUDE_LONGITUDE_current_uv_index
Update the protection window once a day at 12:00pm:
automation : - alias : " Update OpenUV" triggers : - trigger : time at : " 12:00:00" actions : - action : homeassistant.update_entity target : entity_id : binary_sensor.LATITUDE_LONGITUDE_protection_window
To perform an optimal amount of API calls in locations where the amount of daylight
varies, you need to know the total hours of daylight on the longest day of the year. If,
for example, this is 17 hours, you can perform 2 calls around every 45 minutes without
running into the 50 API call limit per day:
automation : - alias : " Update OpenUV" triggers : # Time pattern of /45 will not work as expected, as it will sometimes be true # twice per hour (on the whole hour and on the whole hour + 45 minutes); use a # more frequent time pattern and a condition to get the intended behavior: - trigger : time_pattern minutes : " /15" conditions : - condition : sun after : sunrise before : sunset # The last call will most likely fall before the sunset, leaving the UV index at # something other than 0 for the remainder of the night; to fix this, we allow # one more action after the sun has set: before_offset : " +00:45:00" - condition : template # We check if the last trigger has been 40 minutes or more ago so we don't run # into timing issues; by checking for 40 minutes or greater, we ensure this is # only true at the 45 minute mark: value_template : >- {{ state_attr('automation.update_openuv', 'last_triggered') == None or ( now() - state_attr('automation.update_openuv', 'last_triggered') ) >= timedelta(hours = 0, minutes = 40) }} actions : - action : homeassistant.update_entity target : entity_id : # Update both UV and protection window data: - binary_sensor.LATITUDE_LONGITUDE_protection_window - sensor.LATITUDE_LONGITUDE_current_uv_index
In OpenUV, an HTTP 403 response indicates one of two conditions:
An invalid API key
An API key whose daily/monthly limit is reached
Unfortunately, the integration is unable to determine which is which from the API data
provided by OpenUV. So, this strategy is followed:
Any HTTP 403 response will create a persistent notification asking you to
re-authenticate the OpenUV integration.
In the case of an overrun API call limit, once the homeassistant.update_entity
action is again successful, existing re-authentication notifications will
automatically be removed.
If you receive a re-authentication notification and are certain that your key has merely
reached its daily call limit, you can safely ignore it.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The OpenUV service was introduced in Home Assistant 0.76, and it's used by
2820 active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bachya
Categories
Binary sensor
Health
Sensor
Back to top
