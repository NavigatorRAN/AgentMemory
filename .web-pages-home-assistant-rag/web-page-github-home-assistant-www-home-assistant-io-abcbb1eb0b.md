# GitHub - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/github
- Final URL: https://www.home-assistant.io/integrations/github
- Canonical URL: https://www.home-assistant.io/integrations/github/
- Fetched at: 2026-06-28T02:46:02Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate the GitHub integration into Home Assistant.

## Extracted Text

On this page
Configuration
Remove authorization
Action
Provided entities
Latest commit
Latest discussion
Latest issue
Latest pull request
Latest release
Latest tag
Diagnostic entities
Automation
Notify new releases
Notify new stars
The GitHub integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] allows you to monitor your favorite GitHub public repositories.
To add the GitHub service to your Home Assistant instance, use this My button:
Manual configuration steps
If the above My button doesn’t work, you can also perform the following steps
manually:
Browse to your Home Assistant instance.
Go to Settings > Devices & services .
In the bottom right corner, select the
Add Integration button.
From the list, select GitHub .
Follow the instructions on screen to complete the setup.
When you set up this integration, you will first be guided to allow the integration to use the GitHub API on your behalf. If you do not yet have a GitHub account you will be prompted to create one during the configuration of the integration.
When you have authorized the integration, you select repositories you want to monitor, the list contains repositories you have created and starred on GitHub with your account.
The integration works by subscribing to events on the repository to provide a push-like experience for the entities, which means that when a new issue is created or when someone open up a pull request with some fixes or when that new release you have been waiting for just got released this integration will help you get the information as soon as it happens.
After you have removed the integration from Settings > Devices & services , you need to manually revoke OAuth app authorization.
Go to your Authorized OAuth Apps
Find the “Home Assistant GitHub Integration” application
Click the 3 dots ( ... ) to the right of the name
Select “Revoke”
When you configure a repository to be tracked in this integration it will be represented as a service in the device panel and all entities related to the repository will be nested under that device. The device also provides a link to the repository on GitHub and an option to download diagnostics for the service.
This sensor shows the message of the latest commit done in the default branch as
the state.
The sensor provides additional attributes for the latest commit:
sha : The SHA for the commit
url : A URL that will show you the commit on GitHub
This sensor shows the title of the latest discussion that was created as the state.
The sensor provides additional attributes for the latest discussion:
number : The numerical ID that discussion was assigned
url : A URL that will show you the discussion on GitHub
This sensor shows the title of the latest issue that was created as the state.
The sensor provides additional attributes for the latest issue:
number : The numerical ID that issue was assigned
url : A URL that will show you the issue on GitHub
This sensor shows the title of the latest pull request that was created as the state.
The sensor provides additional attributes for the latest pull request:
number : The numerical ID that pull request was assigned
url : A URL that will show you the pull request on GitHub
This sensor shows the title of the latest release that was created in the repository.
The sensor provides additional attributes for the latest release:
tag : The tag name that the release is created for
url : A URL that will show you the release on GitHub
This sensor shows the title of the latest tag that was created in the repository.
The sensor provides additional attributes for the latest tag:
url : A URL that will show you the commit the tag was created for on GitHub
These entities are simpler diagnostic entities without any additional attributes:
Discussions : Shows the number of discussions
Forks : Shows the number of forks
Issues : Shows the number of open issues
Merged pull requests : Shows the number of merged pull requests
Pull requests : Shows the number of open pull requests
Stars : Shows the number of stars
Watchers : Shows the number of watchers
Here are some small examples on how you can automate using the provided entities from this integration.
Note
Remember that the action names and entity IDs used in these examples are examples as well,
you need to replace it with actions and entities that you have in your installation.
This example uses the Latest release entity provided by this integration, and a notify action,
triggers : - trigger : state entity_id : sensor.awesome_repository_latest_release actions : - action : notify.notify data : title : " New github/repository release" message : >- Link to the new release: https://github.com/github/repository/releases/{{ trigger.to_state.state }}
This example uses the Stars diagnostic entity provided by this integration, and a notify action,
triggers : - trigger : state entity_id : sensor.awesome_repository_stars actions : - action : notify.notify data : title : " New github/repository new star" message : >- github/repository was starred again! Total stars are now: {{ trigger.to_state.state }}
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The GitHub service was introduced in Home Assistant 0.88, and it's used by
1.4% of the active installations.
Its IoT class is Cloud Polling.
View source on GitHub
View known issues
View feature requests
Integration owners
We are incredibly grateful to the following contributors who currently maintain this integration:
@timmo001
@ludeeus
Categories
Sensor
Back to top
