# StepFun - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/providers/stepfun
- Final URL: https://docs.openclaw.ai/providers/stepfun
- Canonical URL: https://docs.openclaw.ai/providers/stepfun
- Fetched at: 2026-06-23T14:55:56Z
- Content type: text/html; charset=utf-8

## Description

Use StepFun models with OpenClaw

## Extracted Text

Close
Models Providers
The StepFun provider plugin supports two provider ids:
stepfun for the standard endpoint
stepfun-plan for the Step Plan endpoint
Warning
Standard and Step Plan are separate providers with different endpoints and model ref prefixes ( stepfun/... vs stepfun-plan/... ). Use a China key with the .com endpoints and a global key with the .ai endpoints.
Install plugin
Install the official plugin, then restart Gateway:
bash Copy code openclaw plugins install @openclaw/stepfun-provider openclaw gateway restart
Region and endpoint overview
Endpoint China ( .com ) Global ( .ai ) Standard https://api.stepfun.com/v1 https://api.stepfun.ai/v1 Step Plan https://api.stepfun.com/step_plan/v1 https://api.stepfun.ai/step_plan/v1
Auth env var: STEPFUN_API_KEY
Built-in catalog
Standard ( stepfun ):
Model ref Context Max output Notes stepfun/step-3.5-flash 262,144 65,536 Default standard model
Step Plan ( stepfun-plan ):
Model ref Context Max output Notes stepfun-plan/step-3.5-flash 262,144 65,536 Default Step Plan model stepfun-plan/step-3.5-flash-2603 262,144 65,536 Additional Step Plan model
Getting started
Choose your provider surface and follow the setup steps.
Standard
Best for: general-purpose use via the standard StepFun endpoint.
Choose your endpoint region
Auth choice Endpoint Region stepfun-standard-api-key-intl https://api.stepfun.ai/v1 International stepfun-standard-api-key-cn https://api.stepfun.com/v1 China
Run onboarding
bash Copy code openclaw onboard --auth-choice stepfun-standard-api-key-intl
Or for the China endpoint:
bash Copy code openclaw onboard --auth-choice stepfun-standard-api-key-cn
Non-interactive alternative
bash Copy code openclaw onboard --auth-choice stepfun-standard-api-key-intl \ --stepfun-api-key " $STEPFUN_API_KEY "
Verify models are available
bash Copy code openclaw models list --provider stepfun
Model refs
Default model: stepfun/step-3.5-flash
Step Plan
Best for: Step Plan reasoning endpoint.
Auth choice Endpoint Region stepfun-plan-api-key-intl https://api.stepfun.ai/step_plan/v1 International stepfun-plan-api-key-cn https://api.stepfun.com/step_plan/v1 China
bash Copy code openclaw onboard --auth-choice stepfun-plan-api-key-intl
bash Copy code openclaw onboard --auth-choice stepfun-plan-api-key-cn
bash Copy code openclaw onboard --auth-choice stepfun-plan-api-key-intl \ --stepfun-api-key " $STEPFUN_API_KEY "
bash Copy code openclaw models list --provider stepfun-plan
Default model: stepfun-plan/step-3.5-flash
Alternate model: stepfun-plan/step-3.5-flash-2603
Advanced configuration
Full config: Standard provider json5 Copy code { env : { STEPFUN_API_KEY : "your-key" }, agents : { defaults : { model : { primary : "stepfun/step-3.5-flash" } } }, models : { mode : "merge" , providers : { stepfun : { baseUrl : "https://api.stepfun.ai/v1" , api : "openai-completions" , apiKey : "${STEPFUN_API_KEY}" , models : [ { id : "step-3.5-flash" , name : "Step 3.5 Flash" , reasoning : true , input : [ "text" ], cost : { input : 0 , output : 0 , cacheRead : 0 , cacheWrite : 0 }, contextWindow : 262144 , maxTokens : 65536 , }, ], }, }, }, } Full config: Step Plan provider json5 Copy code { env : { STEPFUN_API_KEY : "your-key" }, agents : { defaults : { model : { primary : "stepfun-plan/step-3.5-flash" } } }, models : { mode : "merge" , providers : { "stepfun-plan" : { baseUrl : "https://api.stepfun.ai/step_plan/v1" , api : "openai-completions" , apiKey : "${STEPFUN_API_KEY}" , models : [ { id : "step-3.5-flash" , name : "Step 3.5 Flash" , reasoning : true , input : [ "text" ], cost : { input : 0 , output : 0 , cacheRead : 0 , cacheWrite : 0 }, contextWindow : 262144 , maxTokens : 65536 , }, { id : "step-3.5-flash-2603" , name : "Step 3.5 Flash 2603" , reasoning : true , input : [ "text" ], cost : { input : 0 , output : 0 , cacheRead : 0 , cacheWrite : 0 }, contextWindow : 262144 , maxTokens : 65536 , }, ], }, }, }, } Notes
The provider is an official external package; install it before setup.
step-3.5-flash-2603 is currently exposed only on stepfun-plan .
A single auth flow writes region-matched profiles for both stepfun and stepfun-plan , so both surfaces can be discovered together.
Use openclaw models list and openclaw models set <provider/model> to inspect or switch models.
Note
For the broader provider overview, see Model providers .
Related
Model selection
Overview of all providers, model refs, and failover behavior.
Configuration reference
Full config schema for providers, models, and plugins.
How to choose and configure models.
StepFun Platform
StepFun API key management and documentation.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
