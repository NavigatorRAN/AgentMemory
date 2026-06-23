# Telephony — Give Hermes phone capabilities without core tool changes | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/productivity/productivity-telephony
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/productivity/productivity-telephony
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/productivity/productivity-telephony
- Fetched at: 2026-06-23T14:20:35Z
- Content type: text/html; charset=utf-8

## Description

Give Hermes phone capabilities without core tool changes

## Extracted Text

Skip to main content
On this page
Give Hermes phone capabilities without core tool changes. Provision and persist a Twilio number, send and receive SMS/MMS, make direct calls, and place AI-driven outbound calls through Bland.ai or Vapi.
Skill metadata ​
Source Optional — install with hermes skills install official/productivity/telephony Path optional-skills/productivity/telephony Version 1.0.0 Author Nous Research License MIT Platforms linux, macos, windows Tags telephony , phone , sms , mms , voice , twilio , bland.ai , vapi , calling , texting Related skills maps , google-workspace , agentmail
Reference: full SKILL.md ​
info
The following is the complete skill definition that Hermes loads when this skill is triggered. This is what the agent sees as instructions when the skill is active.
Telephony — Numbers, Calls, and Texts without Core Tool Changes
This optional skill gives Hermes practical phone capabilities while keeping telephony out of the core tool list.
It ships with a helper script, scripts/telephony.py , that can:
save provider credentials into ${HERMES_HOME:-~/.hermes}/.env
search for and buy a Twilio phone number
remember that owned number for later sessions
send SMS / MMS from the owned number
poll inbound SMS for that number with no webhook server required
make direct Twilio calls using TwiML <Say> or <Play>
import the owned Twilio number into Vapi
place outbound AI calls through Bland.ai or Vapi
What this solves ​
This skill is meant to cover the practical phone tasks users actually want:
outbound calls
texting
owning a reusable agent number
checking messages that arrive to that number later
preserving that number and related IDs between sessions
future-friendly telephony identity for inbound SMS polling and other automations
It does not turn Hermes into a real-time inbound phone gateway. Inbound SMS is handled by polling the Twilio REST API. That is enough for many workflows, including notifications and some one-time-code retrieval, without adding core webhook infrastructure.
Safety rules — mandatory ​
Always confirm before placing a call or sending a text.
Never dial emergency numbers.
Never use telephony for harassment, spam, impersonation, or anything illegal.
Treat third-party phone numbers as sensitive operational data:
do not save them to Hermes memory
do not include them in skill docs, summaries, or follow-up notes unless the user explicitly wants that
It is fine to persist the agent-owned Twilio number because that is part of the user's configuration.
VoIP numbers are not guaranteed to work for all third-party 2FA flows. Use with caution and set user expectations clearly.
Decision tree — which service to use? ​
Use this logic instead of hardcoded provider routing:
1) "I want Hermes to own a real phone number" ​
Use Twilio .
Why:
easiest path to buying and keeping a number
best SMS / MMS support
simplest inbound SMS polling story
cleanest future path to inbound webhooks or call handling
Use cases:
receive texts later
send deployment alerts / cron notifications
maintain a reusable phone identity for the agent
experiment with phone-based auth flows later
2) "I only need the easiest outbound AI phone call right now" ​
Use Bland.ai .
quickest setup
one API key
no need to first buy/import a number yourself
Tradeoff:
less flexible
voice quality is decent, but not the best
3) "I want the best conversational AI voice quality" ​
Use Twilio + Vapi .
Twilio gives you the owned number
Vapi gives you better conversational AI call quality and more voice/model flexibility
Recommended flow:
Buy/save a Twilio number
Import it into Vapi
Save the returned VAPI_PHONE_NUMBER_ID
Use ai-call --provider vapi
4) "I want to call with a custom prerecorded voice message" ​
Use Twilio direct call with a public audio URL.
easiest way to play a custom MP3
pairs well with Hermes text_to_speech plus a public file host or tunnel
Files and persistent state ​
The skill persists telephony state in two places:
${HERMES_HOME:-~/.hermes}/.env ​
Used for long-lived provider credentials and owned-number IDs, for example:
TWILIO_ACCOUNT_SID
TWILIO_AUTH_TOKEN
TWILIO_PHONE_NUMBER
TWILIO_PHONE_NUMBER_SID
BLAND_API_KEY
VAPI_API_KEY
VAPI_PHONE_NUMBER_ID
PHONE_PROVIDER (AI call provider: bland or vapi)
~/.hermes/telephony_state.json ​
Used for skill-only state that should survive across sessions, for example:
remembered default Twilio number / SID
remembered Vapi phone number ID
last inbound message SID/date for inbox polling checkpoints
This means:
the next time the skill is loaded, diagnose can tell you what number is already configured
twilio-inbox --since-last --mark-seen can continue from the previous checkpoint
Locate the helper script ​
After installing this skill, locate the script like this:
SCRIPT = " $( find ~/.hermes/skills -path '*/telephony/scripts/telephony.py' -print -quit ) "
If SCRIPT is empty, the skill is not installed yet.
Install ​
This is an official optional skill, so install it from the Skills Hub:
hermes skills search telephony
hermes skills install official/productivity/telephony
Provider setup ​
Twilio — owned number, SMS/MMS, direct calls, inbound SMS polling ​
Sign up at:
https://www.twilio.com/try-twilio
Then save credentials into Hermes:
python3 " $SCRIPT " save-twilio ACXXXXXXXXXXXXXXXXXXXXXXXXXXXX your_auth_token_here
Search for available numbers:
python3 " $SCRIPT " twilio-search --country US --area-code 702 --limit 5
Buy and remember a number:
python3 " $SCRIPT " twilio-buy "+17025551234" --save-env
List owned numbers:
python3 " $SCRIPT " twilio-owned
Set one of them as the default later:
python3 " $SCRIPT " twilio-set-default "+17025551234" --save-env
# or
python3 " $SCRIPT " twilio-set-default PNXXXXXXXXXXXXXXXXXXXXXXXXXXXX --save-env
Bland.ai — easiest outbound AI calling ​
https://app.bland.ai
Save config:
python3 " $SCRIPT " save-bland your_bland_api_key --voice mason
Vapi — better conversational voice quality ​
https://dashboard.vapi.ai
Save the API key first:
python3 " $SCRIPT " save-vapi your_vapi_api_key
Import your owned Twilio number into Vapi and persist the returned phone number ID:
python3 " $SCRIPT " vapi-import-twilio --save-env
If you already know the Vapi phone number ID, save it directly:
python3 " $SCRIPT " save-vapi your_vapi_api_key --phone-number-id vapi_phone_number_id_here
Diagnose current state ​
At any time, inspect what the skill already knows:
python3 " $SCRIPT " diagnose
Use this first when resuming work in a later session.
Common workflows ​
A. Buy an agent number and keep using it later ​
Save Twilio credentials:
python3 " $SCRIPT " save-twilio AC .. . auth_token_here
Search for a number:
python3 " $SCRIPT " twilio-search --country US --area-code 702 --limit 10
Buy it and save it into ${HERMES_HOME:-~/.hermes}/.env + state:
Next session, run:
This shows the remembered default number and inbox checkpoint state.
B. Send a text from the agent number ​
python3 " $SCRIPT " twilio-send-sms "+15551230000" "Your deployment completed successfully."
With media:
python3 " $SCRIPT " twilio-send-sms "+15551230000" "Here is the chart." --media-url "https://example.com/chart.png"
C. Check inbound texts later with no webhook server ​
Poll the inbox for the default Twilio number:
python3 " $SCRIPT " twilio-inbox --limit 20
Only show messages that arrived after the last checkpoint, and advance the checkpoint when you're done reading:
python3 " $SCRIPT " twilio-inbox --since-last --mark-seen
This is the main answer to “how do I access messages the number receives next time the skill is loaded?”
D. Make a direct Twilio call with built-in TTS ​
python3 " $SCRIPT " twilio-call "+15551230000" --message "Hello! This is Hermes calling with your status update." --voice Polly.Joanna
E. Call with a prerecorded / custom voice message ​
This is the main path for reusing Hermes's existing text_to_speech support.
Use this when:
you want the call to use Hermes's configured TTS voice rather than Twilio <Say>
you want a one-way voice delivery (briefing, alert, joke, reminder, status update)
you do not need a live conversational phone call
Generate or host audio separately, then:
python3 " $SCRIPT " twilio-call "+155****0000" --audio-url "https://example.com/briefing.mp3"
Recommended Hermes TTS -> Twilio Play workflow:
Generate the audio with Hermes text_to_speech .
Make the resulting MP3 publicly reachable.
Place the Twilio call with --audio-url .
Example agent flow:
Ask Hermes to create the message audio with text_to_speech
If needed, expose the file with a temporary static host / tunnel / object storage URL
Use twilio-call --audio-url ... to deliver it by phone
Good hosting options for the MP3:
a temporary public object/storage URL
a short-lived tunnel to a local static file server
any existing HTTPS URL the phone provider can fetch directly
Important note:
Hermes TTS is great for prerecorded outbound messages
Bland/Vapi are better for live conversational AI calls because they handle the real-time telephony audio stack themselves
Hermes STT/TTS alone is not being used here as a full duplex phone conversation engine; that would require a much heavier streaming/webhook integration than this skill is trying to introduce
F. Navigate a phone tree / IVR with Twilio direct calling ​
If you need to press digits after the call connects, use --send-digits .
Twilio interprets w as a short wait.
python3 " $SCRIPT " twilio-call "+18005551234" --message "Connecting to billing now." --send-digits "ww1w2w3"
This is useful for reaching a specific menu branch before handing off to a human or delivering a short status message.
G. Outbound AI phone call with Bland.ai ​
python3 " $SCRIPT " ai-call "+15551230000" "Call the dental office, ask for a cleaning appointment on Tuesday afternoon, and if they do not have Tuesday availability, ask for Wednesday or Thursday instead." --provider bland --voice mason --max-duration 3
Check status:
python3 " $SCRIPT " ai-status < call_id > --provider bland
Ask Bland analysis questions after completion:
python3 " $SCRIPT " ai-status < call_id > --provider bland --analyze "Was the appointment confirmed?,What date and time?,Any special instructions?"
H. Outbound AI phone call with Vapi on your owned number ​
Import your Twilio number into Vapi:
Place the call:
python3 " $SCRIPT " ai-call "+15551230000" "You are calling to make a dinner reservation for two at 7:30 PM. If that is unavailable, ask for the nearest time between 6:30 and 8:30 PM." --provider vapi --max-duration 4
Check result:
python3 " $SCRIPT " ai-status < call_id > --provider vapi
Suggested agent procedure ​
When the user asks for a call or text:
Determine which path fits the request via the decision tree.
Run diagnose if configuration state is unclear.
Gather the full task details.
Confirm with the user before dialing or texting.
Use the correct command.
Poll for results if needed.
Summarize the outcome without persisting third-party numbers to Hermes memory.
What this skill still does not do ​
real-time inbound call answering
webhook-based live SMS push into the agent loop
guaranteed support for arbitrary third-party 2FA providers
Those would require more infrastructure than a pure optional skill.
Pitfalls ​
Twilio trial accounts and regional rules can restrict who you can call/text.
Some services reject VoIP numbers for 2FA.
twilio-inbox polls the REST API; it is not instant push delivery.
Vapi outbound calling still depends on having a valid imported number.
Bland is easiest, but not always the best-sounding.
Do not store arbitrary third-party phone numbers in Hermes memory.
Verification checklist ​
After setup, you should be able to do all of the following with just this skill:
diagnose shows provider readiness and remembered state
search and buy a Twilio number
persist that number to ${HERMES_HOME:-~/.hermes}/.env
send an SMS from the owned number
poll inbound texts for the owned number later
place a direct Twilio call
place an AI call via Bland or Vapi
References ​
Twilio phone numbers: https://www.twilio.com/docs/phone-numbers/api
Twilio messaging: https://www.twilio.com/docs/messaging/api/message-resource
Twilio voice: https://www.twilio.com/docs/voice/api/call-resource
Vapi docs: https://docs.vapi.ai/
Bland.ai: https://app.bland.ai/
Skill metadata
Reference: full SKILL.md
What this solves
Safety rules — mandatory
Decision tree — which service to use?
1) "I want Hermes to own a real phone number"
2) "I only need the easiest outbound AI phone call right now"
3) "I want the best conversational AI voice quality"
4) "I want to call with a custom prerecorded voice message"
Files and persistent state
${HERMES_HOME:-~/.hermes}/.env
~/.hermes/telephony_state.json
Locate the helper script
Install
Provider setup
Twilio — owned number, SMS/MMS, direct calls, inbound SMS polling
Bland.ai — easiest outbound AI calling
Vapi — better conversational voice quality
Diagnose current state
Common workflows
A. Buy an agent number and keep using it later
B. Send a text from the agent number
C. Check inbound texts later with no webhook server
D. Make a direct Twilio call with built-in TTS
E. Call with a prerecorded / custom voice message
F. Navigate a phone tree / IVR with Twilio direct calling
G. Outbound AI phone call with Bland.ai
H. Outbound AI phone call with Vapi on your owned number
Suggested agent procedure
What this skill still does not do
Pitfalls
Verification checklist
References
