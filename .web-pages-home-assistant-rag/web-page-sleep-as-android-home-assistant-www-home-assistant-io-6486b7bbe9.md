---
source_url: "https://www.home-assistant.io/integrations/sleep_as_android"
final_url: "https://www.home-assistant.io/integrations/sleep_as_android"
canonical_url: "https://www.home-assistant.io/integrations/sleep_as_android/"
source_handle: "web:www-home-assistant-io:6486b7bbe9c7"
source_section: "integrations-sleep-as-android"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "032075dcf722fa34748dd60023e4918daf1c3dce5ddde94b045454eed6b976a4"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Sleep as Android - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/sleep_as_android
- Final URL: https://www.home-assistant.io/integrations/sleep_as_android
- Canonical URL: https://www.home-assistant.io/integrations/sleep_as_android/
- Fetched at: 2026-06-28T03:16:39Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Sleep as Android with Home Assistant.

## Extracted Text

On this page
About Sleep as Android
How you can use this integration
Prerequisites
Configuration
Sensors
Events
Alarm clock
Smart wake-up
User notifications
Sleep health
Lullaby
Sleep phase
Sleep tracking
Sound recognition
Jet lag prevention
Automation
Control Sleep as Android via Home Assistant
Data updates
Known limitations
Troubleshooting
Removing the integration
To remove an integration instance from Home Assistant
The Sleep as Android integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] connects the Sleep as Android app to Home Assistant, allowing you to trigger automations based on alarm clock or sleep cycle events.
Sleep as Android is a smart alarm clock with sleep cycle tracking capabilities and numerous other features to analyze and improve sleeping habits. It is available exclusively for Android devices and can be downloaded from Google Play .
The Sleep as Android integration allows you to trigger sleep-related automations. You can trigger actions when sleep tracking starts or stops, such as dimming the lights or adjusting thermostat settings. Alarm events allow you to respond to snoozing or dismissing alarms — like starting a morning routine or sending a notification if the alarm was skipped. Additionally, you can react to specific sleep phases or sound detections (for example, snoring or baby crying), or monitor critical conditions such as sleep apnea.
This integration uses webhooks to receive events from Sleep as Android. By default, webhook triggers can only be accessed from devices on the same network as Home Assistant. If you want to receive events while away from your home network, remote access must be enabled, either by adding a remote URL or via Home Assistant Cloud .
Steps to set up the integration:
Preferably, open Home Assistant on the device you want to connect to the Sleep as Android integration and initiate the setup.
You will be presented a URL during the setup process. Mark the URL and copy it to the clipboard.
Open the Sleep as Android app and go to Settings > Services > Automation > Webhooks .
Turn on the switch to enable webhooks and paste the webhook URL from your clipboard into the URL field.
Note
To receive updates from Sleep as Android while away from home, your Home Assistant instance must be remotely accessible.
You can enable this by configuring a remote URL for Home Assistant or by using Home Assistant Cloud.
When setting up the Sleep as Android integration, the webhook is created using your external or cloud URL if remote access is available at that time.
If your instance is not remotely accessible during setup, the webhook will use your internal URL instead.
In this case, you will need to manually update the webhook to use your remote URL once remote access is configured.
Tip
If you scroll to the top and select Events , you can individually select and deselect the events the Sleep as Android app should trigger.
To add the Sleep as Android service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Sleep as Android .
Follow the instructions on screen to complete the setup.
Next alarm : The scheduled time of your upcoming alarm.
Alarm label : The label or description assigned to the next alarm.
The integration offers various event entities that will display the most recent events from Sleep as Android.
Events related to the alarm clock feature.
Event type Description alert_dismiss Alarm dismissed alert_start Alarm started rescheduled Alarm rescheduled skip_next Alarm skipped snooze_clicked Snoozing snooze_canceled Snoozing canceled
Events related to the smart wake-up feature.
Event type Description before_smart_period 45min before smart wake-up smart_period Smart wake-up started
Events related to user notifications.
Event type Description wake_up_check Wake-up check show_skip_next_alarm Skip next alarm time_to_bed_alarm_alert Time to bed
Events related to sleep health.
Event type Description antisnoring Anti-snoring triggered apnea_alarm Sleep apnea detected
Events related to the Lullaby feature.
Event type Description start Lullaby started playing stop Lullaby stopped playing volume_down Lullaby started lowering volume
Events when entering a new sleep phase.
Event type Description awake Woke up deep_sleep Deep sleep light_sleep Light sleep not_awake Fell asleep rem REM sleep
Warning
Be cautious when automating based on sleep phase events, especially deep and light sleep, as these can trigger lots of events throughout the night, and they may not precisely correlate with the resulting sleep graph as Sleep as Android can only detect phases reliably using whole-night data.
Events related to the sleep tracking feature.
Event type Description paused Tracking paused resumed Tracking resumed started Tracking started stopped Tracking stopped
Events triggered when a specific sound is detected during sleep tracking.
Event type Description baby Baby crying cough Coughing or sneezing laugh Laughter snore Snoring talk Talking
Event type Description jet_lag_start Jet lag prevention started jet_lag_stop Jet lag prevention stopped
Here’s an example automation: when your Sleep as Android alarm starts ringing, your bedroom blinds will automatically open.
alias : Open window blinds on Alarm triggers : - trigger : state entity_id : - event.sleep_as_android_alarm_clock attribute : event_type to : alert_start not_from : unavailable conditions : - condition : state entity_id : person.user1 state : home actions : - action : cover.open_cover target : entity_id : cover.bedroom_blinds mode : single
The Sleep as Android app can be automated through its Intent API , allowing you to perform actions such as:
Enable or disable alarms
Snooze or dismiss alarms
Start, stop, or pause sleep tracking
Stop lullaby playback
Thanks to the Home Assistant Companion App for Android , which supports broadcasting intents , you can trigger these actions directly from Home Assistant.
To make this even easier, you can import the following blueprint. It supports nearly all Sleep as Android actions, so you can automate your sleep routine without writing any custom scripts:
This integration receives push updates from the Sleep as Android app whenever an event is triggered. If no events occur, the displayed data may become outdated.
If Home Assistant is unreachable when an event is pushed, for example when you are away from your home network without remote access, the Sleep as Android integration will miss the update. The app does not retry sending it.
The integration does not support controlling the Sleep as Android app, such as setting alarm times or turning off alarms.
The Sleep as Android integration receives updates via a push from your Sleep as Android app to a webhook. If you encounter issues, verify that your Home Assistant is reachable from your mobile phone.
In any case, when reporting an issue, please enable debug logging , restart the integration, and as soon as the issue reoccurs, stop the debug logging again ( download of debug log file will start automatically ). Further, if still possible, please also download the diagnostics data. If you have collected the debug log and the diagnostics data, provide them with the issue report.
This integration can be removed by following these steps:
Go to Settings > Devices & services and select the integration card.
From the list of devices, select the integration instance you want to remove.
Next to the entry, select the three dots menu. Then, select Delete .
Open the Sleep as Android app and go to Settings > Services > Automation > Webhooks . Turn off webhooks and remove the URL.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Sleep as Android service was introduced in Home Assistant 2025.9, and it's used by
1553 active installations.
Its IoT class is Local Push.
🏆 Platinum quality
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@tr4nt0r
Categories
Event
Sensor
Back to top
