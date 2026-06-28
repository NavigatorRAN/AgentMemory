# Iperf3 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/iperf3
- Final URL: https://www.home-assistant.io/integrations/iperf3
- Canonical URL: https://www.home-assistant.io/integrations/iperf3/
- Fetched at: 2026-06-28T02:52:58Z
- Content type: text/html; charset=UTF-8

## Description

How to use Iperf3 within Home Assistant to measure your network bandwidth.

## Extracted Text

On this page
Setup
Configuration
Time period dictionary example
List of actions
Related topics
The Iperf3 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to measure network bandwidth performance against a private or public Iperf3 server.
Enabling this integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] will automatically create the Iperf3 sensors for the monitored conditions (below). By default, it will run every hour. The user can change the update frequency in the configuration by defining the scan_interval for a Iperf3 test to run.
This integration requires the iperf3 command to be installed on your OS. Please, refer to the official Iperf3 documentation for installation instructions.
To add the iperf3 sensor to your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
Once per hour, on the hour (default):
# Example configuration.yaml entry iperf3 : hosts : - host : iperf.he.net
Configuration Variables
Looking for your configuration file?
monitored_conditions list ( Optional )
Sensors to display in the frontend.
download
The download speed (Mbit/s).
upload
The upload speed (Mbit/s).
hosts list Required
A list of Iperf3 servers to perform the test against.
scan_interval time ( Optional , default: 60 minutes )
Minimum time interval between updates. Supported formats: scan_interval: 'HH:MM:SS' , scan_interval: 'HH:MM' and Time period dictionary (see example below).
manual boolean ( Optional , default: false )
true or false to turn manual mode on or off. Manual mode will disable scheduled tests.
Configuration variables (host):
host string Required
Server name/IP address running Iperf3 to test against.
port integer ( Optional , default: 5201 )
Port that Iperf3 is running on.
duration integer ( Optional , default: 10 )
Specify the test duration in seconds. Default is 10 and the valid range is from 5 to 10.
parallel integer
Specify the number of concurrent streams to connect to the server. Default is 1 and the valid range is from 1 to 20.
protocol string ( Optional , default: tcp )
Specify the protocol to be used on the test. Default is TCP and the valid values are TCP or UDP. If your Iperf3 server is located in the Internet, consider to use TCP instead of UDP. If the protocol is set to use UDP, the sensor may not get updated due to package retransmission issues due to its nature.
scan_interval : # At least one of these must be specified: days : 0 hours : 0 minutes : 3 seconds : 30 milliseconds : 0
You can find a list of public Iperf3 servers here . You can also start your own Iperf3 server using the mlabbe/iperf3’s Docker image or just refer to your iperf3 command’s man page.
The frequency when the test will be automatically triggered can be adjusted by setting the value scan_interval in seconds.
Parallel streams can help in some situations. As TCP attempts to be fair and conservative, you may consider increasing the parallel attribute. Use this value with careful and refer to Iperf3 man page for more information.
You can use the sensor.iperf3_update action to trigger a manual speed test for all sensors. Iperf3 has its own action that allows performing a speed test on a particular entity.
The Iperf3 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Speedtest ( iperf3.speedtest )
Runs an iperf3 speed test on demand.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Iperf3 integration was introduced in Home Assistant 0.71, and it's used by
244 active installations.
Its IoT class is Local Polling.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@rohankapoorcom
Categories
Sensor
System monitor
Back to top
