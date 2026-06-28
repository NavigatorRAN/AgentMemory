---
source_url: "https://www.home-assistant.io/integrations/plex"
final_url: "https://www.home-assistant.io/integrations/plex"
canonical_url: "https://www.home-assistant.io/integrations/plex/"
source_handle: "web:www-home-assistant-io:2c82b99624b4"
source_section: "integrations-plex"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "21fb463ceb78c8931e4396d8af33c1889b8a55375425c293c46bea065d238d6a"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Plex Media Server - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/plex
- Final URL: https://www.home-assistant.io/integrations/plex
- Canonical URL: https://www.home-assistant.io/integrations/plex/
- Fetched at: 2026-06-28T03:08:35Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Plex into Home Assistant.

## Extracted Text

On this page
Configuration
Integration options
Manual configuration
Sensor
Button
Update
Media player
Action: Play media
Compatibility
Sonos playback
Examples:
List of actions
Notes
The Plex Media Server integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to connect Home Assistant to a Plex Media Server . Once configured, actively streaming Plex Clients show up as media players and report playback status and library sizes via sensors in Home Assistant. Media players will allow you to control media playback and see the current playing item.
Support for playing music directly on linked Sonos speakers is available in the Sonos playback section.
There is currently support for the following device types within Home Assistant:
If a Plex server has been claimed by a Plex account via the claim interface , Home Assistant will require authentication to connect.
To add the Plex Media Server service to your Home Assistant instance, use this My button:
Plex Media Server can be auto-discovered by Home Assistant. If an instance was found,
it will be shown as Discovered . You can then set it up right away.
Manual configuration steps
If it wasn’t discovered automatically, don’t worry! You can set up a
manual integration entry:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select Plex Media Server .
Follow the instructions on screen to complete the setup.
During setup, you will need to log in as a server administrator. The integration will check all possible ways to connect to your Plex server(s), that is, local or public addresses, HTTP or HTTPS, by IP or using a subdomain of plex.direct , or by using a Plex relay if all other methods fail. The integration will prefer local over public and secure over insecure, in that order. The selected address is shown on the Plex card on the Integrations page.
If your router enforces DNS rebind protection, connections to the local plex.direct hostname may fail (see Plex documentation ). To avoid this, configure your router to allow DNS rebinding for plex.direct by following the instructions in the documentation link.
Several options are provided to adjust the behavior of media_player entities. These can be changed at Plex > Options on the Integrations page.
Use episode art : Display TV episode art instead of TV show art.
Monitored users : A list of accounts with access to the Plex server. Only selected users will create media_player entities.
Ignore new managed/shared users : Enable to ignore new Plex accounts granted access to the server.
Ignore Plex Web clients : Do not create media_player entities for Plex Web clients.
Alternatively, you can manually configure a Plex server connection by selecting the “Configure Plex server manually” when configuring a Plex integration. This will allow you to specify the server connection options which will be validated before setup is completed. The available options are described below:
Host : The IP address or hostname of your Plex server. Optional if ‘Token’ is provided.
Port : The port of your Plex Server.
Use SSL : Use HTTPS to connect to Plex server.
Verify SSL certificate : Verify the SSL certificate of your Plex server. May be used if connecting with an IP or if using a self-signed certificate.
Token : A valid authorization token for your Plex server. If provided without ‘Host’, a connection URL will be retrieved from Plex.
The activity sensor provides a count of users currently watching media from the Plex server. Clicking the sensor shows details for the active users and media streams.
The library sensors show a count of items in each library. Depending on the library contents, the sensor will show extra detail in its attributes. For example, a library sensor for TV shows will represent the total number of episodes in the library and its attributes will also report the number of shows and seasons it contains. The last added media item (movie, album, or episode) and a timestamp showing when it was added to its respective library are also provided.
In addition to the item count, the last added media item (movie, album, or episode) and a timestamp showing when it was added are also provided with each library sensor.
Example automation to use the last_added_item attribute on library sensors to notify when new media has been added:
alias : " Plex - New media added" triggers : - trigger : state entity_id : sensor.plex_library_movies id : movie - trigger : state entity_id : sensor.plex_library_music id : album - trigger : state entity_id : sensor.plex_library_tv_shows id : episode actions : - action : notify.send_message target : entity_id : notify.my_device data : title : " New {{ trigger.id }} added" message : " {{ trigger.to_state.attributes.last_added_item }}"
Important
The library sensors are disabled by default, but can be enabled via the Plex integration page. After the sensors are enabled, you may need to add a new item to your library before the last added media attribute is populated.
A button.scan_clients entity is available to discover new controllable Plex clients. This may be necessary in scripts or automations which control a Plex client app, but where the underlying device must be turned on first. This button is preferred over the legacy plex.scan_for_clients action.
Example script:
play_plex_on_tv : sequence : - action : media_player.select_source target : entity_id : media_player.smart_tv data : source : " Plex" - wait_for_trigger : - trigger : state entity_id : media_player.smart_tv to : " on" timeout : seconds : 10 - action : button.press target : entity_id : button.scan_clients_plex - wait_template : " {{ not is_state('media_player.plex_smart_tv', 'unavailable') }}" timeout : " 00:00:10" continue_on_timeout : false - action : media_player.play_media target : entity_id : media_player.plex_smart_tv data : media_content_id : " {"library_name" : " Movies" , " title" : " Zoolander" } " media_content_type: movie
Notifications of new releases of Plex Media Server are shown using an Update entity. Detailed release notes are provided.
Automatic upgrades of Plex Media Server can be triggered for some installation types, such as Windows and certain NAS devices.
The Plex media player platform will create media player entities for each connected client device. These entities will display media information, playback progress, and playback controls (if supported by the streaming device).
By default, the Plex integration will create media player entities for all local, managed, and shared users on the Plex server. To customize which users or client types to monitor, adjust the “ Monitored users ”, “ Ignore new managed/shared users ”, and “ Ignore Plex Web clients ” options described under Integration Options .
The media_player.play_media action plays media hosted on a Plex server on a Plex client or other supported device.
Required fields within the media_content_id payloads are marked as such, others are optional. There are special parameters that can be added to any query:
shuffle : Shuffles the playback order of the media. Accepts 1 or true to enable.
resume : Resumes playback at the last partially watched position if available, otherwise plays at the beginning.
offset : The desired playback start position in seconds.
allow_multiple : A search must find one specific item to succeed. This parameter accepts multiple matches in a search and enqueues all found items for playback. Accepts 1 or true to enable.
username : A username for a local Plex user account. This is only required if the Plex server has multiple users and you wish to play media for a specific user.
continuous : Plex will automatically play the next episode in the series. Accepts 1 or true to enable.
Simplified examples are provided for music , TV episodes , and movies . See advanced searches for complex/smart search capabilities.
Note
Refer to these links if casting to non-Plex players:
Chromecast
Sonos
The integration must be configured with a token for playback commands to work. This can occur if using the List of IP addresses and networks that are allowed without auth option on the Plex server. If that feature is required, it’s recommended to configure the integration with that feature temporarily disabled.
Music Data attribute Description entity_id entity_id of the client media_content_id Quoted JSON containing:
library_name (Required)
artist_name or artist.title
album_name or album.title
track_name or track.title
track_number or track.index
shuffle (0 or 1)
allow_multiple (0 or 1)
media_content_type MUSIC Examples:
Play Hello from Adele’s album 25 in the library Music
entity_id : media_player.plex_player media_content_type : MUSIC media_content_id : ' { "library_name": "Music", "artist_name": "Adele", "album_name": "25", "track_name": "Hello" }'
Play a random track from Stevie Wonder in the library Music
entity_id : media_player.plex_player media_content_type : MUSIC media_content_id : ' { "library_name": "Music", "artist_name": "Stevie Wonder", "shuffle": "1" }'
Playlist Data attribute Description entity_id entity_id of the client media_content_id Quoted JSON containing:
playlist_name (Required)
media_content_type PLAYLIST Example:
Plays the playlist The Best of Disco with shuffle enabled
entity_id : media_player.plex_player media_content_type : PLAYLIST media_content_id : ' { "playlist_name": "The Best of Disco", "shuffle": "1" }'
TV episode Data attribute Description entity_id entity_id of the client media_content_id Quoted JSON containing:
show_name or show.title
season_number or season.index
episode_number or episode.index
resume (0 or 1)
offset (in seconds)
continuous (0 or 1)
media_content_type EPISODE Examples:
Play Rick and Morty S2E5 from library Adult TV
entity_id : media_player.plex_player media_content_type : EPISODE media_content_id : ' { "library_name": "Adult TV", "show_name": "Rick and Morty", "season_number": 2, "episode_number": 5 }'
Play a random episode of Sesame Street from the library Kids TV
entity_id : media_player.plex_player media_content_type : EPISODE media_content_id : ' { "library_name": "Kids TV", "show_name": "Sesame Street", "shuffle": "1" }'
Resume the next unfinished episode of 60 Minutes from the library News TV
entity_id : media_player.plex_player media_content_type : EPISODE media_content_id : ' { "library_name": "News TV", "show_name": "60 Minutes", "episode.unwatched": true, "episode.inProgress": [true, false], "resume": 1, "sort": "addedAt:asc", "maxresults": 1 }'
Play Rick and Morty episodes continuously starting from S2E5
entity_id : media_player.plex_player media_content_type : EPISODE media_content_id : ' { "library_name": "Adult TV", "show_name": "Rick and Morty", "season_number": 2, "episode_number": 5, "continuous": 1}'
Movie Data attribute Description entity_id entity_id of the client media_content_id Quoted JSON containing:
title
media_content_type movie Examples:
Play Blade from the library Adult Movies
entity_id : media_player.plex_player media_content_type : movie media_content_id : ' { "library_name": "Adult Movies", "title": "Blade" }'
Advanced searches
Instead of searching for a specific known piece of media, many additional parameters are available to run more powerful searches. This can also be used when a simple search for a title has multiple matches, such as with movie remakes.
These are examples of optional keys that can be included in the media_content_id JSON payload customize the search:
unwatched : Restrict search to unwatched items only ( true , false )
actor : Restrict search for movies that include a specific actor
collection : Restrict search within a named Plex collection (“Back to the Future”, “Indiana Jones”)
contentRating : Restrict search to a specific content rating (“PG”, “R”)
country : Restrict search to a specific country of origin
decade : Restrict search to a specific decade (“1960”, “2010”)
director : Restrict search to a specific director
genre : Restrict search to a specific genre (“Animation”, “Drama”, “Sci-Fi”)
resolution : Restrict search to a specific video resolution (480, 720, 1080, “4k”)
year : Restrict search to a specific year
More parameters and additional details can be found in the plexapi library documentation .
Examples
Below are examples of advanced searches. All examples show what can be sent in the media_content_id parameter.
Note that some searches may require "maxresults": 1 to limit the result to a single item. However, an “item” may be a group of media, such as an album, season, artist, or show.
The search will attempt to guess the type of media based on the search parameters by using the most specific media type provided. For example, a search using artist.title and album.year will search for albums for the artist that were released in a specific year. If you add track.title to the search, it will instead try to find the track. You may specify the type of media to search for with the libtype parameter which can be one of movie , episode , season , show , track , album , or artist . This could be useful if searching for an album where you only know the name of a specific track (see example below).
# Play the original instead of the 2004 remake: { "library_name" : "Movies" , "title" : "The Manchurian Candidate" , "year" : 1962 } # "Lazy" searches are also possible (would find the sequel, "Die Hard: With a Vengeance" ): { "library_name" : "Movies" , "title" : "die hard" , "year" : 1995 } # Play for an artist's album where only a track name is known: { "library_name" : "Music" , "artist.title" : "Stevie" , "track.title" : "Higher Ground" } # Play all albums with "orange" in the title: { "library_name" : "Music" , "album.title" : "orange" , "allow_multiple" : true } # Watch the most recently added movie { "library_name" : "Movies" , "sort" : "addedAt:desc" , "maxresults" : 1 } # Play an unwatched movie from the "Bond" collection which was released in the 2000 s { "library_name" : "Movies" , "collection" : "Bond" , "decade" : 2000 , "unwatched" : true } # Play the most recently added TV show which has been partially watched { "library_name" : "TV Shows" , "inProgress" : true , "sort" : "addedAt:desc" , "maxresults" : 1 } # Listen to a random electronic album which was added over 3 years ago but hasn't been listened to for at least 3 months { "library_name" : "Music" , "addedAt<<" : "3y" , "album.genre" : "Electronic" , "album.lastViewedAt<<" : "3mon" , "sort" : "random" , "maxresults" : 1 } # Watch the worst rated movie from the 2000 s starring either Nicolas Cage or Danny Devito { "library_name" : "Movies" , "actor" : [ "Nicolas Cage" , "Danny DeVito" ], "decade" : 2000 , "sort" : "audienceRating:asc" , "maxresults" : 1 }
Client Limitations Remote clients Controls are unavailable Apple TV None iOS None NVidia Shield None Plexamp None (music playback only) Plex Desktop & Web Controls are unavailable (as of June 2022) Plex HTPC None
To play Plex music directly to Sonos speakers, the following requirements must be met:
Remote access enabled for your Plex server.
Sonos speakers linked to your Plex account (Instructions) .
Sonos integration configured.
Call the media_player.play_media action with the entity_id of a Sonos integration device and media_content_type prepended with plex:// . Both music and playlist media_content_type values are supported.
Play a track with advanced filtering on a Sonos Speaker
entity_id : media_player.sonos_speaker media_content_type : music media_content_id : ' plex://{ "library_name": "Music", "artist_name": "Adele", "album_name": "25", "track_name": "Hello" }'
Play a playlist on a Sonos Speaker
entity_id : media_player.sonos_speaker media_content_type : playlist media_content_id : ' plex://{ "playlist_name": "Party Mix" }'
The Plex Media Server integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Refresh library ( plex.refresh_library )
Refreshes a Plex library to scan for new and updated media.
For an overview of every action across all integrations, see the actions reference .
The Plex integration supports multiple Plex servers. Additional connections can be configured under Settings > Devices & services .
Movies must be located under the ‘Movies’ section in a Plex library to properly view the ‘playing’ state.
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Plex Media Server service was introduced in Home Assistant 0.7.4, and it's used by
3.8% of the active installations.
Its IoT class is Local Push.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@jjlawren
Categories
Back to top
