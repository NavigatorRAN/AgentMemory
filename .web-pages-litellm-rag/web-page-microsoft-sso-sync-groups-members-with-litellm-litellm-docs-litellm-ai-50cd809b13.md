# Microsoft SSO: Sync Groups, Members with LiteLLM | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/msft_sso
- Final URL: https://docs.litellm.ai/docs/tutorials/msft_sso
- Canonical URL: https://docs.litellm.ai/docs/tutorials/msft_sso
- Fetched at: 2026-06-23T14:34:29Z
- Content type: text/html; charset=utf-8

## Description

Sync Microsoft SSO Groups, Members with LiteLLM Teams.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Sync Microsoft SSO Groups, Members with LiteLLM Teams.
Prerequisites ​
An Azure Entra ID account with administrative access
A LiteLLM Enterprise App set up in your Azure Portal
Access to Microsoft Entra ID (Azure AD)
Overview of this tutorial ​
Auto-Create Entra ID Groups on LiteLLM Teams
Sync Entra ID Team Memberships
Set default params for new teams and users auto-created on LiteLLM
1. Auto-Create Entra ID Groups on LiteLLM Teams ​
In this step, our goal is to have LiteLLM automatically create a new team on the LiteLLM DB when there is a new Group Added to the LiteLLM Enterprise App on Azure Entra ID.
1.1 Create a new group in Entra ID ​
Navigate to your Azure Portal > Groups > New Group. Create a new group.
1.2 Assign the group to your LiteLLM Enterprise App ​
On your Azure Portal, navigate to Enterprise Applications > Select your litellm app
Once you've selected your litellm app, click on Users and Groups > Add user/group
Now select the group you created in step 1.1. And add it to the LiteLLM Enterprise App. At this point we have added Production LLM Evals Group to the LiteLLM Enterprise App. The next steps is having LiteLLM automatically create the Production LLM Evals Group on the LiteLLM DB when a new user signs in.
1.3 Sign in to LiteLLM UI via SSO ​
Sign into the LiteLLM UI via SSO. You should be redirected to the Entra ID SSO page. This SSO sign in flow will trigger LiteLLM to fetch the latest Groups and Members from Azure Entra ID.
1.4 Check the new team on LiteLLM UI ​
On the LiteLLM UI, Navigate to Teams , You should see the new team Production LLM Evals Group auto-created on LiteLLM.
How this works ​
When a SSO user signs in to LiteLLM:
LiteLLM automatically fetches the Groups under the LiteLLM Enterprise App
It finds the Production LLM Evals Group assigned to the LiteLLM Enterprise App
LiteLLM checks if this group's ID exists in the LiteLLM Teams Table
Since the ID doesn't exist, LiteLLM automatically creates a new team with:
Name: Production LLM Evals Group
ID: Same as the Entra ID group's ID
2. Sync Entra ID Team Memberships ​
In this step, we will have LiteLLM automatically add a user to the Production LLM Evals Team on the LiteLLM DB when a new user is added to the Production LLM Evals Group in Entra ID.
2.1 Navigate to the Production LLM Evals Group in Entra ID ​
Navigate to the Production LLM Evals Group in Entra ID.
2.2 Add a member to the group in Entra ID ​
Select Members > Add members
In this stage you should add the user you want to add to the Production LLM Evals Team.
2.3 Sign in as the new user on LiteLLM UI ​
Sign in as the new user on LiteLLM UI. You should be redirected to the Entra ID SSO page. This SSO sign in flow will trigger LiteLLM to fetch the latest Groups and Members from Azure Entra ID. During this step LiteLLM sync it's teams, team members with what is available from Entra ID
2.4 Check the team membership on LiteLLM UI ​
On the LiteLLM UI, Navigate to Teams , You should see the new team Production LLM Evals Group . Since your are now a member of the Production LLM Evals Group in Entra ID, you should see the new team Production LLM Evals Group on the LiteLLM UI.
3. Set default params for new teams auto-created on LiteLLM ​
Since litellm auto creates a new team on the LiteLLM DB when there is a new Group Added to the LiteLLM Enterprise App on Azure Entra ID, we can set default params for new teams created.
This allows you to set a default budget, models, etc for new teams created.
3.1 Set default_team_params on litellm ​
Navigate to your litellm config file and set the following params
litellm config with default_team_params
litellm_settings :
default_team_params : # Applied to all /team/new calls (including SSO auto-created teams) when the field is not explicitly set
max_budget : 100 # Optional[float]: $100 budget for the team
budget_duration : 30d # Optional[str]: 30 days budget_duration for the team
models : [ "gpt-3.5-turbo" ] # Optional[List[str]]: models for the team (only applied to SSO auto-created teams)
team_member_permissions : # Optional[List[str]]: permissions granted to non-admin team members
- "/team/daily/activity" # Allow members to view team usage
3.2 Auto-create a new team on LiteLLM ​
In this step you should add a new group to the LiteLLM Enterprise App on Azure Entra ID (like we did in step 1.1). We will call this group Default LiteLLM Prod Team on Azure Entra ID.
Start litellm proxy server with your config
Sign into LiteLLM UI via SSO
Navigate to Teams and you should see the new team Default LiteLLM Prod Team auto-created on LiteLLM
Note LiteLLM will set the default params for this new team.
4. Using Entra ID App Roles for User Permissions ​
You can assign user roles directly from Entra ID using App Roles. LiteLLM will automatically read the app roles from the JWT token during SSO sign-in and assign the corresponding role to the user.
4.1 Supported Roles ​
LiteLLM supports the following app roles (case-insensitive):
proxy_admin - Admin over the entire LiteLLM platform
proxy_admin_viewer - Read-only admin access (can view all keys and spend)
org_admin - Admin over a specific organization (can create teams and users within their org)
internal_user - Standard user (can create/view/delete their own keys and view their own spend)
4.2 Create App Roles in Entra ID ​
Navigate to your App Registration on https://portal.azure.com/
Go to App roles > Create app role
Configure the app role:
Display name : Proxy Admin (or your preferred display name)
Value : proxy_admin (use one of the supported role values above)
Description : Administrator access to LiteLLM proxy
Allowed member types : Users/Groups
Click Apply to save the role
4.3 Assign Users to App Roles ​
Navigate to Enterprise Applications on https://portal.azure.com/
Select your LiteLLM application
Go to Users and groups > Add user/group
Select the user and assign them to one of the app roles you created
4.4 Test the Role Assignment ​
Sign in to LiteLLM UI via SSO as a user with an assigned app role
LiteLLM will automatically extract the app role from the JWT token
The user will be assigned the corresponding LiteLLM role in the database
The user's permissions will reflect their assigned role
How it works:
When a user signs in via Microsoft SSO, LiteLLM extracts the roles claim from the JWT id_token
If any of the roles match a valid LiteLLM role (case-insensitive), that role is assigned to the user
If multiple roles are present, LiteLLM uses the first valid role it finds
This role assignment persists in the LiteLLM database and determines the user's access level
Video Walkthrough ​
This walks through setting up sso auto-add for Microsoft Entra ID
Follow along this video for a walkthrough of how to set this up with Microsoft Entra ID
Prerequisites
Overview of this tutorial
1. Auto-Create Entra ID Groups on LiteLLM Teams
1.1 Create a new group in Entra ID
1.2 Assign the group to your LiteLLM Enterprise App
1.3 Sign in to LiteLLM UI via SSO
1.4 Check the new team on LiteLLM UI
2. Sync Entra ID Team Memberships
2.1 Navigate to the Production LLM Evals Group in Entra ID
2.2 Add a member to the group in Entra ID
2.3 Sign in as the new user on LiteLLM UI
2.4 Check the team membership on LiteLLM UI
3. Set default params for new teams auto-created on LiteLLM
3.1 Set default_team_params on litellm
3.2 Auto-create a new team on LiteLLM
4. Using Entra ID App Roles for User Permissions
4.1 Supported Roles
4.2 Create App Roles in Entra ID
4.3 Assign Users to App Roles
4.4 Test the Role Assignment
Video Walkthrough
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
