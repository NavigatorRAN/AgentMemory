# Profiler - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/profiler
- Final URL: https://www.home-assistant.io/integrations/profiler
- Canonical URL: https://www.home-assistant.io/integrations/profiler/
- Fetched at: 2026-06-28T03:09:11Z
- Content type: text/html; charset=UTF-8

## Description

Profile Home Assistant.

## Extracted Text

On this page
Configuration
Action: Start
Action: Memory
Action: Start log objects
Action: Stop log objects
Action: Start log object sources
Action: Stop log object sources
Action: Dump log objects
Action: Log thread frames
Action: Log event loop scheduled
Action: LRU stats
Action: Set asyncio debug
Action: Log current tasks
Action: Dump sockets
The Profiler integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a profile which is a set of statistics that identifies how much time each part of Home Assistant is taking. It can help track down a performance issue or provide insight about a misbehaving integration.
To add the Profiler integration to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Profiler .
Follow the instructions on screen to complete the setup.
The profiler.start action starts the profiler for the specified number of seconds.
Data attribute Optional Description seconds yes The number of seconds to run the profile. Defaults to 60.0
When the profile is complete, Profiler will generate a Python cprof and a callgrind.out file in your configuration directory. The exact path to these files will appear in a persistent notification so they can be easily located and copied to your desktop.
The cprof file can be viewed with:
SnakeViz
Gprof2dot
Additionally, the profiler will generate a callgrind.out file that can be viewed with:
KCachegrind or QCachegrind
The gprof2dot tool generates DOT files, which can be converted to images using the dot tool from Graphviz or viewed directly using xdot . The -e and -n parameters can be used to set the minimum percentage required to include a function in the output file. Observe these examples:
# Generating the .dot files:
gprof2dot -f pstats -e 0.05 -n 0.25 profile.1234567890123456.cprof -o profile.dot
gprof2dot -f callgrind -e 0.05 -n 0.25 callgrind.out.1234567890123456 -o callgrind.dot
# Converting to SVG and PNG formats:
dot callgrind.dot -Tsvg -o callgrind.svg
dot callgrind.dot -Tpng -o callgrind.png
# Alternatively, both commands in a single line:
gprof2dot -f pstats profile.1234567890123456.cprof | dot -Tsvg -o profile.svg
The profiler.memory action starts the memory profiler for the specified number of seconds.
When the memory profile is complete, Profiler will generate a .hpy file in your configuration directory. The exact path to these files will appear in a persistent notification so they can be easily located and copied to your desktop.
The hpy file can be viewed with any text editor. A visual representation can be viewed using the Heapy Profile Browser which is a part of the guppy3 package and can be launched via the below script:
#! /usr/bin/python3
from guppy import hpy hpy (). pb ()
The profiler.start_log_objects action starts logging the growth of objects in memory.
Data attribute Optional Description scan_interval yes The frequency between logging objects. Defaults to 30.0
Periodically log the growth of new objects in memory. This action’s primary use case is finding memory leaks. This action can be run for long periods to find slow leaks. For finding fast leaks, profiler.start_log_object_sources is preferred; however, it is much more CPU intensive.
See the corresponding documentation for growth() regarding the format in which this data is logged.
The profiler.stop_log_objects action stops logging the growth of objects in memory.
The profiler.start_log_object_sources action starts logging the growth of objects in memory and attempts to find the source of the new objects.
Data attribute Optional Description scan_interval yes The frequency between logging objects. Defaults to 30.0 max_objects yes The number of new objects to examine for source information. Defaults to 5
Periodically log the growth of new objects in memory. This action’s primary use case is finding memory leaks.
This action is similar to start_log_objects except that it is much more CPU intensive since it will attempt to locate the source of each new object up to max_objects each time it logs.
The profiler.stop_log_object_sources action stops logging the growth of objects with sources in memory.
The profiler.dump_log_objects action helps investigate objects in memory. When start_log_objects highlights the growth of a collection of objects in memory, this action can help investigate. The repr of each object that matches type will be logged.
Data attribute Optional Description type no The type of object to dump to the log.
This action is useful for investigating the state of objects in memory. For example, if your system has templates that are rendering too frequently, the below example actions shows how to find which templates are the source of the problem:
action : profiler.dump_log_objects data : type : RenderInfo
action : profiler.dump_log_objects data : type : Template
The profiler.log_thread_frames action logs the current frames for each running thread to help discover run away threads, why the executor is overloaded, or other threading problems.
An example is below:
[homeassistant.components.profiler] Thread [SyncWorker_6]: File "/usr/local/lib/python3.8/threading.py", line 890, in _bootstrap
self._bootstrap_inner()
File "/usr/local/lib/python3.8/threading.py", line 932, in _bootstrap_inner
self.run()
File "/usr/local/lib/python3.8/threading.py", line 870, in run
self._target(*self._args, **self._kwargs)
File "/usr/local/lib/python3.8/concurrent/futures/thread.py", line 80, in _worker
work_item.run()
File "/usr/local/lib/python3.8/concurrent/futures/thread.py", line 57, in run
result = self.fn(*self.args, **self.kwargs)
File "/usr/src/homeassistant/homeassistant/components/samsungtv/media_player.py", line 139, in update
self._state = STATE_ON if self._bridge.is_on() else STATE_OFF
File "/usr/src/homeassistant/homeassistant/components/samsungtv/bridge.py", line 72, in is_on
return self._get_remote() is not None
File "/usr/src/homeassistant/homeassistant/components/samsungtv/bridge.py", line 274, in _get_remote
self._remote.open()
File "/usr/local/lib/python3.8/site-packages/samsungtvws/remote.py", line 146, in open
self.connection = websocket.create_connection(
File "/usr/local/lib/python3.8/site-packages/websocket/_core.py", line 511, in create_connection
websock.connect(url, **options)
File "/usr/local/lib/python3.8/site-packages/websocket/_core.py", line 219, in connect
self.sock, addrs = connect(url, self.sock_opt, proxy_info(**options),
File "/usr/local/lib/python3.8/site-packages/websocket/_http.py", line 120, in connect
sock = _open_socket(addrinfo_list, options.sockopt, options.timeout)
File "/usr/local/lib/python3.8/site-packages/websocket/_http.py", line 170, in _open_socket
sock.connect(address)
The profiler.log_event_loop_scheduled action logs what is scheduled in the event loop. This can be helpful in tracking down integrations that do not stop listeners when Home Assistant stops or do not have sufficient locking to avoid scheduling updates before the previous update is finished.
Each upcoming scheduled item is logged similar to the below example:
[homeassistant.components.profiler] Scheduled: <TimerHandle when=1528307.1818668307 async_track_point_in_utc_time.<locals>.run_action(<Job HassJobType.Coroutinefunction <bound method DataUpdateCoordinator._handle_refresh_interval of <homeassistant.components.screenlogic.ScreenlogicDataUpdateCoordinator object at 0x7f985d896d30>>>) at /usr/src/homeassistant/homeassistant/helpers/event.py:1175>`
The profiler.lru_stats action logs statistics from lru_cache and lru-dict to help tune Home Assistant and locate memory leaks.
The profiler.set_asyncio_debug action enables or disables asyncio debug mode. When enabled, asyncio will run in debug mode . Use this action to help identify an integration that is blocking the event loop.
Data attribute Optional Description enabled yes Boolean to enable asyncio debug.
The profiler.log_current_tasks action logs all currently running tasks. This action can help track down task leaks or find tasks that are delaying startup.
[homeassistant.components.profiler] Task: <Task pending name='Task-1133' coro=<HubConnector._listener() running at /usr/local/lib/python3.12/site-packages/aioharmony/hubconnector_websocket.py:362> wait_for=<Future pending cb=[Task.task_wakeup()]>>
The profiler.dump_sockets action logs all sockets used by Home Assistant. This action can help identify what network connections are currently open, mainly to help track down connections that are not being closed properly.
Example output:
[homeassistant.components.profiler] Sockets used by Home Assistant:
<socket.socket [closed] fd=-1, family=2, type=1, proto=6>
<socket.socket fd=97, family=2, type=1, proto=6, laddr=('192.168.1.10', 80), raddr=('192.168.1.14', 59086)>
<socket.socket fd=7, family=1, type=1, proto=0>
<socket.socket fd=8, family=1, type=1, proto=0>
<socket.socket fd=11, family=10, type=1, proto=6, laddr=('::', 80, 0, 0)>
<socket.socket fd=12, family=2, type=1, proto=6, laddr=('0.0.0.0', 80)>
<socket.socket fd=15, family=10, type=2, proto=0, laddr=('::', 5353, 0, 0)>
...
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Profiler integration was introduced in Home Assistant 0.117, and it's used by
3191 active installations.
🏠 Internal integration
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@bdraco
Categories
Utility
Back to top
