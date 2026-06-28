---
source_url: "https://www.home-assistant.io/integrations/route53"
final_url: "https://www.home-assistant.io/integrations/route53"
canonical_url: "https://www.home-assistant.io/integrations/route53/"
source_handle: "web:www-home-assistant-io:cfa5862d0cd1"
source_section: "integrations-route53"
collection: "home-assistant-docs"
doc_type: "api-reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "328f58af06cc312640d537e8a06e35432ca29d8d6532714d181546b6120b2c92"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "api-docs"
---

# AWS Route53 - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/route53
- Final URL: https://www.home-assistant.io/integrations/route53
- Canonical URL: https://www.home-assistant.io/integrations/route53/
- Fetched at: 2026-06-28T03:12:57Z
- Content type: text/html; charset=UTF-8

## Description

Automatically update your AWS Route53 DNS records.

## Extracted Text

On this page
Setup
Configuration
List of actions
Related topics
With the AWS Route53 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] can you keep your AWS Route53 DNS records up to date.
The integration will run every hour, but can also be started manually by using the route53.update_records action.
This platform uses the API from ipify.org to set the public IP address.
You will need to configure your AWS Account with a suitable IAM policy and API keys for this to function.
If you are familiar with this process, you can skip the next section and head directly to the configuration section.
On the AWS side, you need to do the following;
Create a suitable zone for a domain that you own and manage in Route53, the domain home.yourdomain.com is used as an example.
Once created, write down the Hosted Zone ID value for the domain. This is needed for the plugin and IAM configuration.
Create an IAM Policy that provides update and query access to this domain explicitly and has no other permissions to the AWS account.
Here is an IAM Policy sample, don’t forget to update your Zone ID on the Resource line.
{ "Version" : "2012-10-17" , "Statement" : [ { "Sid" : "VisualEditor0" , "Effect" : "Allow" , "Action" : [ "route53:GetHostedZone" , "route53:ChangeResourceRecordSets" , "route53:ListResourceRecordSets" ], "Resource" : "arn:aws:route53:::hostedzone/YOURZONEIDGOESHERE" }, { "Sid" : "VisualEditor1" , "Effect" : "Allow" , "Action" : "route53:TestDNSAnswer" , "Resource" : "*" } ] }
Once this has been done, create a new user called homeassistant and add the IAM policy to the user, allowing it to manage this DNS resource.
Under the security credentials tab for the homeassistant user, create a set of access keys for placement in the integration definition YAML.
To use the integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes.
# Example configuration.yaml entry route53 : aws_access_key_id : ABC123 aws_secret_access_key : DEF456 zone : ZONEID678 domain : yourdomain.com records : - vpn - hassio - home
Configuration Variables
Looking for your configuration file?
aws_access_key_id string Required
The AWS access key ID for the account that has IAM access to the domain.
aws_secret_access_key string Required
The AWS secret access key for the account that has IAM access to the domain.
zone string Required
The AWS zone ID for the domain in Route53.
domain string Required
The domain name for the domain in Route53.
records list Required
A list of records you want to update. Use . to update the default record ie. yourdomain.com .
ttl integer ( Optional , default: 300 )
The TTL value for the DNS records.
The AWS Route53 integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides the following actions. Each link below opens a dedicated page with examples, parameters, and a step-by-step UI walkthrough.
Update records ( route53.update_records )
Updates your AWS Route53 DNS records with your current public IP address.
For an overview of every action across all integrations, see the actions reference .
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The AWS Route53 integration was introduced in Home Assistant 0.81, and it's used by
91 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Network
Back to top
