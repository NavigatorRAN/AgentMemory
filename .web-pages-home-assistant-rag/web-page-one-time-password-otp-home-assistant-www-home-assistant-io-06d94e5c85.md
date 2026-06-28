# One-Time Password (OTP) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/otp
- Final URL: https://www.home-assistant.io/integrations/otp
- Canonical URL: https://www.home-assistant.io/integrations/otp/
- Fetched at: 2026-06-28T03:06:49Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to add One-Time Password (OTP) sensors into Home Assistant.

## Extracted Text

On this page
Configuration
Generating a token
Related topics
The One-Time Password (OTP) integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] generates One-Time Passwords according to RFC6238 that is compatible with most OTP generators available, including Google Authenticator. You can use this when building custom security solutions and want to use “rolling codes”, that change every 30 seconds.
To add the One-Time Password (OTP) helper to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
At the top of the screen, select the tab: Helpers .
In the bottom right corner, select the
Create helper button.
From the list, select One-Time Password (OTP) .
Follow the instructions on screen to complete the setup.
A simple way to generate a token for a new sensor is to run this snippet of Python code in your Home Assistant virtual environment:
$ pip3 install pyotp
$ python3 -c 'import pyotp; print("Token:", pyotp.random_base32())'
Token: IHEDPEBEVA2WVHB7
To run in a Docker container:
$ docker exec -it home-assistant python -c 'import pyotp; print("Token:", pyotp.random_base32())'
Copy and paste the token into your Home Assistant configuration and add it to your OTP generator. Verify that they generate the same code.
Important
It is vital that your system clock is correct both on your Home Assistant instance and on your OTP generator device (e.g., your phone). If not, the generated codes will not match! Make sure NTP is running and syncing your time correctly before creating an issue.
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The One-Time Password (OTP) helper was introduced in Home Assistant 0.49, and it's used by
204 active installations.
Its IoT class is Local Polling.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Helper
Sensor
Utility
Back to top
