---
source_url: "https://www.home-assistant.io/integrations/aws"
final_url: "https://www.home-assistant.io/integrations/aws"
canonical_url: "https://www.home-assistant.io/integrations/aws/"
source_handle: "web:www-home-assistant-io:4223cc9f71d3"
source_section: "integrations-aws"
collection: "home-assistant-docs"
doc_type: "reference"
language: "en"
import_run_id: "home-assistant-docs-legacy-backfill"
content_hash: "fb6c1f61a579a963b908041033a60a6e6c031aefa01a00d6616d525798ecea1d"
memory_event_id: ""
wiki_slug: ""
chunk_profile: "reference-docs"
---

# Amazon Web Services (AWS) - Home Assistant

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://www.home-assistant.io/integrations/aws
- Final URL: https://www.home-assistant.io/integrations/aws
- Canonical URL: https://www.home-assistant.io/integrations/aws/
- Fetched at: 2026-06-28T02:30:16Z
- Content type: text/html; charset=UTF-8

## Description

Instructions on how to integrate Amazon Web Services with Home Assistant.

## Extracted Text

On this page
Setup
Configuration
Configuration for credentials
Configuration for notify
Lambda notify usage
SNS notify usage
Setting up SNS within AWS
SQS Notify Usage
EventBridge Notify Usage
Related topics
The AWS integration Integrations connect and integrate Home Assistant with your devices, services, and more. [Learn more] provides a single place to interact with Amazon Web Services . Currently it provides a notification platform that can send a message to AWS SQS , AWS SNS , or invoke AWS Lambda functions.
You have to have an AWS account to use Amazon Web Services, create one here with a 12 months free tier benefit. Even in the first 12-months, you may still be billed if you use more resources than offered in the free tier. We advise you to monitor your costs in the AWS Billing Console closely. You can read the Control your AWS costs guide for more information.
The lambda , sns , sqs , and events services, used in the aws integration, all provide an Always Free tier for all users even after the 12-month period. The general usage in Home Automation will most likely not reach the free tier limit. Please read Lambda Pricing , SNS Pricing , SQS Pricing , and EventBridge Pricing for more details.
The aws integration is using botocore to communicate with Amazon Web Services, which is also used by the AWS Command Client Interface tool. Therefore, aws shares the same credential and profiles with awscli tool. Please read Configuring the AWS CLI to learn how to get access keys and how to manage them on your local system securely.
To use the aws integration and the notify platform in your installation, add the following to your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
After changing the configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file, restart Home Assistant to apply the changes. The integration is now shown on the integrations page under Settings > Devices & services . Its entities are listed on the integration card itself and on the Entities tab.
# Example configuration.yaml entry aws : credentials : - name : My AWS Account aws_access_key_id : AWS_ID aws_secret_access_key : AWS_SECRET notify : # use the first credential defined in aws integration by default - service : lambda region_name : us-east-1
Configuration Variables
Looking for your configuration file?
name string Required
Give your AWS credential a name, so that you can refer it in other AWS platforms.
aws_access_key_id string ( Optional )
Your AWS Access Key ID. If provided, you must also provide an aws_secret_access_key and must not provide a profile_name . Required if aws_secret_access_key is provided.
aws_secret_access_key string ( Optional )
Your AWS Secret Access Key. If provided, you must also provide an aws_access_key_id and must not provide a profile_name . Required if aws_access_key_id is provided.
profile_name string ( Optional )
A credentials profile name.
validate boolean ( Optional , default: true )
Whether validate credential before use. Validate credential needs IAM.GetUser permission.
service string Required
Amazon Web Services will be used for notification. You can choose from lambda , sns , or sqs .
region_name string Required
The region identifier to connect to, for example, us-east-1 .
credential_name string ( Optional )
A reference to an aws credential. Notify platform will use the default profile defined in ~/.aws if none of credential_name , aws_access_key_id , or profile_name was given.
Your AWS Access Key ID. If provided, you must also provide an aws_secret_access_key .
Your AWS Secret Access Key. If provided, you must also provide an aws_access_key_id . Required if aws_access_key_id is provided.
name string ( Optional , default: notify )
Setting the optional parameter name allows multiple notifiers to be created. The notifier will bind to the notify.NOTIFIER_NAME action.
context string ( Optional )
An optional dictionary you can provide to pass custom context through to the notification handler.
AWS Lambda is a notification platform and thus can be controlled by calling the notify action as described here . It will invoke a Lambda for all targets given in the notification payload. A target can be formatted as a function name, an entire ARN ( Amazon Resource Name ) or a partial ARN. For more information, please see the botocore documentation .
The Lambda event payload will contain everything passed in the action payload. Here is an example payload that would be sent to Lambda:
{ "title" : "Test message!" , "target" : "arn:aws:lambda:us-east-1:123456789012:function:ProcessKinesisRecords" , "data" : { "test" : "okay" }, "message" : "Hello world!" }
The context will look like this:
{ "custom" : { "two" : "three" , "test" : "one" } }
AWS SNS is a notification platform and thus can be controlled by calling the notify action as described here . It will publish a message to all targets given in the notification payload. A target must be a SNS topic or endpoint ARN ( Amazon Resource Name ). For more information, please see the botocore documentation .
If one exists, the SNS Subject will be set to the title. All attributes from the payload, except the message, will be sent as stringified message attributes.
Log into your AWS console and under “Security and Identity”, select “Identity & Access Management”.
On the left-hand side, select “Users” then click “Create New Users”. Enter a name here and then click “Create”.
You can either download the credentials or click the arrow to display them one time.
Warning
If you do not download them, you will lose them and will have to recreate a new user.
Copy/Paste the two keys that are shown here in your configuration.yaml The configuration.yaml file is the main configuration file for Home Assistant. It lists the integrations to be loaded and their specific configurations. In some cases, the configuration needs to be edited manually directly in the configuration.yaml file. Most integrations can be configured in the UI. [Learn more] file.
On the left-hand side of the screen go back to “Users” and select the user you just created. On the “Permissions” tab click the “Attach Policy” icon. Search for “SNS” and attach the policy “AmazonSNSFullAccess”.
Back to the AWS Console you now need to find “SNS” and click in to that service. It is under the Mobile Services group.
On the left-hand side, select “Topics” then “Create new topic”.
Choose a Topic Name and Display Name.
Now check the box next to the Topic you just created and under Actions, select “Subscribe to topic”.
In the box that pops up, select the Protocol = SMS and enter in the phone number next to “Endpoint” you wish to SMS. Now click “Create”.
Repeat for additional numbers.
Back in the “Users” section you will see a long alphanumeric line that starts with “arn:” and ends with the Topic Name you choose previously. This is what your “target” in Home Assistant will be.
AWS SQS is a notification platform and thus can be controlled by calling the notify action as described here . It will publish a message to the queue for all targets given in the notification payload. A target must be a SQS topic URL. For more information, please see the SQS documentation and botocore documentation
The SQS event payload will contain everything passed in the action payload. SQS payloads will be published as stringified JSON. All attributes from the payload, except message, will also be sent as stringified message attributes. Here is an example message that would be published to the SQS queue:
{ "title" : "Test message!" , "target" : "https://sqs.us-east-1.amazonaws.com/123456789012/queue2%22" , "data" : { "test" : "okay" }, "message" : "Hello world!" }
AWS EventBridge is a notification platform and thus can be controlled by calling the notify action as described here . It will publish a message to the event bus for all targets given in the notification payload. A target must be a name of an event bus accessible by the given credentials. A target is not required, and the default event bus will be used if none are specified. For more information, please see the EventBridge documentation and botocore documentation
There are two options for generating the event detail based on the action payload. If the detail attribute is specified, then its value will be serialized as a JSON object and used for the event detail. If the attribute is not specified, then the value of the message attribute is serialized as a simple JSON object with a single key named message and the value of the message supplied to the action.
Here are a couple of examples showing the action input and corresponding API entry:
// Service call payload { "message" : "Hello world!" } // Corresponding Entries { "Detail" : "{ \" message \" : \" Hello world! \" }" "DetailType" : "" , "Source" : "homeassistant" , "Resources" : [], }
// Service Call Payload: { "target" : [ "eventbus1" , "eventbus2" ] "data" : { "detail_type" : "test_event" : "detail" : { "key1" , "value1" , "key2" , "value2" }, "resources" : [ "resource1" , "resource2" ], "source" : "example" } } // Corresponding Entries [ { "Detail" : "{ \" key1 \" : \" value1 \" , \" key2 \" : \" key2 \" : \" value2 \" }" "DetailType" : "test_event" , "EventBusName" : "eventbus1" , "Resources" : [ "resource1" , "resource2" ], "Source" : "example" }, { "Detail" : "{ \" key1 \" : \" value1 \" , \" key2 \" : \" key2 \" : \" value2 \" }" "DetailType" : "test_event" , "EventBusName" : "eventbus2" , "Resources" : [ "resource1" , "resource2" ], "Source" : "example" } ]
Configuration file
Help us improve our documentation
Suggest an edit to this page, or provide/view feedback for this page.
Edit
Provide feedback
View pending feedback
The Amazon Web Services (AWS) integration was introduced in Home Assistant 0.91, and it's used by
45 active installations.
Its IoT class is Cloud Push.
💾 Legacy integration
View source on GitHub
View known issues
View feature requests
Integration owners
This integration is community maintained.
If you are a developer and would like to help, feel free to contribute!
Categories
Notifications
Back to top
