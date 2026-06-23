# Docker, Helm, Terraform | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/deploy
- Final URL: https://docs.litellm.ai/docs/proxy/deploy
- Canonical URL: https://docs.litellm.ai/docs/proxy/deploy
- Fetched at: 2026-06-23T14:30:08Z
- Content type: text/html; charset=utf-8

## Description

There are no limits on the number of users, keys, or teams you can create on LiteLLM OSS.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
No Limits on LiteLLM OSS
There are no limits on the number of users, keys, or teams you can create on LiteLLM OSS.
You can find the Dockerfile to build litellm proxy here
Note: Production requires at least 4 CPU cores and 8 GB RAM.
Quick Start ​
info
Facing issues with pulling the docker image? Email us at support@berri.ai .
To start using Litellm, run the following commands in a shell:
Docker
LiteLLM CLI
Docker Compose (Proxy + DB)
docker pull docker.litellm.ai/berriai/litellm:main-latest
See all docker images
$ uv tool install 'litellm[proxy]'
Use this docker compose to spin up the proxy with a postgres database running locally.
# Get the docker compose file
curl -O https://raw.githubusercontent.com/BerriAI/litellm/main/docker-compose.yml
curl -O https://raw.githubusercontent.com/BerriAI/litellm/main/prometheus.yml
# Add the master key - you can change this after setup
echo 'LITELLM_MASTER_KEY="sk-1234"' > .env
# Add the litellm salt key - you cannot change this after adding a model
# It is used to encrypt / decrypt your LLM API Key credentials
# We recommend - https://1password.com/password-generator/
# password generator to get a random hash for litellm salt key
echo 'LITELLM_SALT_KEY="sk-1234"' >> .env
# Start
docker compose up
Verify Docker image signatures ​
All LiteLLM Docker images are signed with cosign . Every release is signed with the same key introduced in commit 0112e53 .
Verify using the pinned commit hash (recommended):
A commit hash is cryptographically immutable, so this is the strongest way to ensure you are using the original signing key:
cosign verify \
--key https://raw.githubusercontent.com/BerriAI/litellm/0112e53046018d726492c814b3644b7d376029d0/cosign.pub \
ghcr.io/berriai/litellm:<release-tag>
Verify using a release tag (convenience):
Tags are protected in this repository and resolve to the same key. This option is easier to read but relies on tag protection rules:
--key https://raw.githubusercontent.com/BerriAI/litellm/<release-tag>/cosign.pub \
Replace <release-tag> with the version you are deploying (e.g. v1.83.0-stable ).
Expected output:
The following checks were performed on each of these signatures:
- The cosign claims were validated
- The signatures were verified against the specified public key
Learn more about LiteLLM's release signing in the CI/CD v2 announcement . For a complete guide covering all image variants, CI/CD enforcement, and deployment best practices, see the Docker Image Security Guide .
Docker Run ​
Step 1. CREATE config.yaml ​
Example litellm_config.yaml
model_list :
- model_name : azure - gpt - 4o
litellm_params :
model : azure/<your - azure - model - deployment >
api_base : os.environ/AZURE_API_BASE # runs os.getenv("AZURE_API_BASE")
api_key : os.environ/AZURE_API_KEY # runs os.getenv("AZURE_API_KEY")
api_version : "2025-01-01-preview"
Step 2. RUN Docker Image ​
docker run \
-v $(pwd)/litellm_config.yaml:/app/config.yaml \
-e AZURE_API_KEY=d6*********** \
-e AZURE_API_BASE=https://openai-***********/ \
-p 4000:4000 \
docker.litellm.ai/berriai/litellm:main-stable \
--config /app/config.yaml --detailed_debug
Get Latest Image 👉 here
Step 3. TEST Request ​
Pass model=azure-gpt-4o this was set on step 1
curl --location 'http://0.0.0.0:4000/chat/completions' \
--header 'Content-Type: application/json' \
--data '{
"model": "azure-gpt-4o",
"messages": [
{
"role": "user",
"content": "what llm are you"
}
]
}'
Docker Run - CLI Args ​
See all supported CLI args here :
Here's how you can run the docker image and pass your config to litellm
docker run docker.litellm.ai/berriai/litellm:main-stable --config your_config.yaml
Here's how you can run the docker image and start litellm on port 8002 with num_workers=8
docker run docker.litellm.ai/berriai/litellm:main-stable --port 8002 --num_workers 8
Use litellm as a base image ​
# Use the provided base image
FROM docker.litellm.ai/berriai/litellm:main-stable
# Set the working directory to /app
WORKDIR /app
# Copy the configuration file into the container at /app
COPY config.yaml .
# Make sure your docker/entrypoint.sh is executable
RUN chmod +x ./docker/entrypoint.sh
# Expose the necessary port
EXPOSE 4000/tcp
# Override the CMD instruction with your desired command and arguments
# WARNING: FOR PROD DO NOT USE `--detailed_debug` it slows down response times, instead use the following CMD
# CMD ["--port", "4000", "--config", "config.yaml"]
CMD ["--port", "4000", "--config", "config.yaml", "--detailed_debug"]
Build from published LiteLLM packages ​
Follow these instructions to build a Docker container from published LiteLLM packages. If your company has a strict requirement around security or image provenance, you can follow these steps.
Note: Copy the schema.prisma file from the LiteLLM repository into your build directory alongside this Dockerfile.
Dockerfile
FROM cgr.dev/chainguard/python:latest-dev
ARG UV_IMAGE=ghcr.io/astral-sh/uv:0.10.9
USER root
ENV UV_TOOL_BIN_DIR=/usr/local/bin
# Install runtime dependencies
RUN apk update && \
apk add --no-cache gcc python3-dev openssl openssl-dev
COPY --from=$UV_IMAGE /uv /usr/local/bin/uv
COPY --from=$UV_IMAGE /uvx /usr/local/bin/uvx
RUN uv tool install 'litellm[proxy,proxy-runtime,extra_proxy]==1.57.3' \
--python python
# Copy Prisma schema file
COPY schema.prisma .
# Generate prisma client
RUN prisma generate
ENTRYPOINT ["litellm"]
CMD ["--port", "4000"]
Build the docker image
docker build \
-f Dockerfile \
-t litellm-proxy-from-package-5 .
Run the docker image
-e OPENAI_API_KEY="sk-1222" \
-e DATABASE_URL="postgresql://xxxxxxxxx \
litellm-proxy-from-package-5 \
Terraform ​
s/o Nicholas Cecere for his LiteLLM User Management Terraform
👉 Go here for Terraform
Kubernetes ​
Deploying a config file based litellm instance just requires a simple deployment that loads
the config.yaml file via a config map. Also it would be a good practice to use the env var
declaration for api keys, and attach the env vars with the api key values as an opaque secret.
apiVersion : v1
kind : ConfigMap
metadata :
name : litellm - config - file
data :
config.yaml : |
model_list:
- model_name: gpt-4o
litellm_params:
model: azure/gpt-4o-ca
api_base: https://my-endpoint-canada-berri992.openai.azure.com/
api_key: os.environ/CA_AZURE_OPENAI_API_KEY
---
kind : Secret
type : Opaque
name : litellm - secrets
CA_AZURE_OPENAI_API_KEY : bWVvd19pbV9hX2NhdA== # your api key in base64
apiVersion : apps/v1
kind : Deployment
name : litellm - deployment
labels :
app : litellm
spec :
selector :
matchLabels :
template :
containers :
- name : litellm
image : docker.litellm.ai/berriai/litellm : main - stable # it is recommended to fix a version generally
args :
- "--config"
- "/app/proxy_server_config.yaml"
ports :
- containerPort : 4000
volumeMounts :
- name : config - volume
mountPath : /app/proxy_server_config.yaml
subPath : config.yaml
envFrom :
- secretRef :
volumes :
configMap :
To avoid issues with predictability, difficulties in rollback, and inconsistent environments, use versioning or SHA digests (for example, litellm:main-v1.30.3 or litellm@sha256:12345abcdef... ) instead of litellm:main-stable .
Helm Chart ​
[BETA] Helm Chart is BETA. If you run into an issues/have feedback please let us know https://github.com/BerriAI/litellm/issues
Use this when you want to use litellm helm chart as a dependency for other charts. The litellm-helm OCI is hosted here https://github.com/BerriAI/litellm/pkgs/container/litellm-helm
Step 1. Pull the litellm helm chart ​
helm pull oci://docker.litellm.ai/berriai/litellm-helm
# Pulled: docker.litellm.ai/berriai/litellm-helm:0.1.2
# Digest: sha256:7d3ded1c99c1597f9ad4dc49d84327cf1db6e0faa0eeea0c614be5526ae94e2a
Step 2. Unzip litellm helm ​
Unzip the specific version that was pulled in Step 1
tar -zxvf litellm-helm-0.1.2.tgz
Step 3. Install litellm helm ​
helm install lite-helm ./litellm-helm
Step 4. Expose the service to localhost ​
kubectl --namespace default port-forward $POD_NAME 8080:$CONTAINER_PORT
Your LiteLLM Proxy Server is now running on http://127.0.0.1:4000 .
That's it ! That's the quick start to deploy litellm
Make LLM API Requests ​
💡 Go here 👉 to make your first LLM API Request
LiteLLM is compatible with several SDKs - including OpenAI SDK, Anthropic SDK, Mistral SDK, LLamaIndex, Langchain (Js, Python)
Deployment Options ​
Docs When to Use Quick Start call 100+ LLMs + Load Balancing Deploy with Database + use Virtual Keys + Track Spend (Note: When deploying with a database providing a DATABASE_URL and LITELLM_MASTER_KEY are required in your env ) LiteLLM container + Redis + load balance across multiple litellm containers LiteLLM Database container + PostgresDB + Redis + use Virtual Keys + Track Spend + load balance across multiple litellm containers
Deploy with Database ​
Docker, Kubernetes, Helm Chart ​
High Traffic Deployments (1000+ RPS)
If you expect high traffic (1000+ requests per second), Redis is required to prevent database connection exhaustion and deadlocks.
Add this to your config:
general_settings :
use_redis_transaction_buffer : true
litellm_settings :
cache : true
cache_params :
type : redis
host : your - redis - host
See Resolve DB Deadlocks for details.
Requirements:
Need a postgres database (e.g. Supabase , Neon , etc) Set DATABASE_URL=postgresql://<user>:<password>@<host>:<port>/<dbname> in your env
Set a LITELLM_MASTER_KEY , this is your Proxy Admin key - you can use this to create other keys (🚨 must start with sk- )
Kubernetes
Helm
Helm OCI Registry (GHCR)
We maintain a separate Dockerfile for reducing build time when running LiteLLM proxy with a connected Postgres Database
docker pull docker.litellm.ai/berriai/litellm-database:main-stable
-e LITELLM_MASTER_KEY=sk-1234 \
-e DATABASE_URL=postgresql://<user>:<password>@<host>:<port>/<dbname> \
docker.litellm.ai/berriai/litellm-database:main-stable \
Your LiteLLM Proxy Server is now running on http://0.0.0.0:4000 .
Step 1. Create deployment.yaml ​
replicas : 3
- name : litellm - container
image : docker.litellm.ai/berriai/litellm : main - stable
imagePullPolicy : Always
env :
- name : AZURE_API_KEY
value : "d6******"
- name : AZURE_API_BASE
value : "https://ope******"
- name : LITELLM_MASTER_KEY
value : "sk-1234"
- name : DATABASE_URL
value : "po**********"
- "/app/proxy_config.yaml" # Update the path to mount the config file
volumeMounts : # Define volume mount for proxy_config.yaml
mountPath : /app/proxy_config.yaml
subPath : config.yaml # Specify the field under data of the ConfigMap litellm-config
readOnly : true
livenessProbe :
httpGet :
path : /health/liveliness
port : 4000
initialDelaySeconds : 120
periodSeconds : 15
successThreshold : 1
failureThreshold : 3
timeoutSeconds : 10
readinessProbe :
path : /health/readiness
volumes : # Define volume to mount proxy_config.yaml
name : litellm - config
kubectl apply -f /path/to/deployment.yaml
Step 2. Create service.yaml ​
kind : Service
name : litellm - service
- protocol : TCP
targetPort : 4000
type : NodePort
kubectl apply -f /path/to/service.yaml
Step 3. Start server ​
kubectl port-forward service/litellm-service 4000:4000
Use this to deploy litellm using a helm chart. Link to the LiteLLM Helm Chart Step 1. Clone the repository ​
git clone https://github.com/BerriAI/litellm.git
Step 2. Deploy with Helm ​
Run the following command in the root of your litellm repo. This will set the litellm proxy master key as sk-1234
helm install \
--set masterkey=sk-1234 \
mydeploy \
deploy/charts/litellm-helm
Step 3. Expose the service to localhost ​
kubectl \
port-forward \
service/mydeploy-litellm-helm \
4000:4000
If you need to set your litellm proxy config.yaml, you can find this in values.yaml
Use this when you want to use litellm helm chart as a dependency for other charts. The litellm-helm OCI is hosted here https://github.com/BerriAI/litellm/pkgs/container/litellm-helm Step 1. Pull the litellm helm chart ​
Deploy with Redis ​
Use Redis when you need litellm to load balance across multiple litellm containers
The only change required is setting Redis on your config.yaml
LiteLLM Proxy supports sharing rpm/tpm shared across multiple litellm instances, pass redis_host , redis_password and redis_port to enable this. (LiteLLM will use Redis to track rpm/tpm usage )
- model_name : gpt - 4o
model : azure/<your - deployment - name >
api_base : <your - azure - endpoint >
api_key : <your - azure - api - key >
rpm : 6 # Rate limit for this deployment: in requests per minute (rpm)
model : azure/gpt - 4o - ca
api_base : https : //my - endpoint - canada - berri992.openai.azure.com/
rpm : 6
router_settings :
redis_host : <your redis host >
redis_password : <your redis password >
redis_port : 1992
Start docker container with config
Deploy with Database + Redis ​
Start litellm-database docker container with config
docker run --name litellm-proxy \
docker.litellm.ai/berriai/litellm-database:main-stable --config your_config.yaml
(Non Root) - without Internet Connection ​
By default prisma generate downloads prisma's engine binaries . This might cause errors when running without internet connection.
Use this docker image to deploy litellm with pre-generated prisma binaries.
docker pull docker.litellm.ai/berriai/litellm-non_root:main-stable
Published Docker Image link
Advanced Deployment Settings ​
1. Custom server root path (Proxy base url) ​
Refer to Custom Root Path for more details.
2. SSL Certification ​
Use this, If you need to set ssl certificates for your on prem litellm proxy
Pass ssl_keyfile_path (Path to the SSL keyfile) and ssl_certfile_path (Path to the SSL certfile) when starting litellm proxy
docker run docker.litellm.ai/berriai/litellm:main-stable \
--ssl_keyfile_path ssl_test/keyfile.key \
--ssl_certfile_path ssl_test/certfile.crt
Provide an ssl certificate when starting litellm proxy server
3. Http/2 with Hypercorn ​
Use this if you want to run the proxy with hypercorn to support http/2
Step 1. Build your custom docker image with hypercorn
# 👉 Key Change: Install hypercorn
RUN uv add hypercorn
Step 2. Pass the --run_hypercorn flag when starting the proxy
-v $(pwd)/proxy_config.yaml:/app/config.yaml \
-e LITELLM_LOG="DEBUG"\
-e SERVER_ROOT_PATH="/api/v1"\
-e LITELLM_MASTER_KEY="sk-1234"\
your_custom_docker_image \
--config /app/config.yaml
--run_hypercorn
4. Granian ASGI server (higher throughput) — Beta ​
Beta feature
--run_granian is in beta . Uvicorn is still the default server. Try Granian when you need more gateway throughput or see instability under load with uvicorn; report issues on GitHub .
Use this to run the proxy with Granian , a Rust-backed ASGI server. The HTTP stack runs in Rust instead of pure Python, which helps the proxy stay responsive when many clients hit health checks, auth, routing, and caching at once.
Why it helps:
Higher throughput — In LiteLLM benchmarks, Granian showed a 10–20 RPS improvement over uvicorn with the same worker count (see PR #26027 ).
Better stability — Sustained load tests showed steadier latency and fewer spikes than uvicorn.
Fewer failures — Error rates under load were lower (near-zero failures in the compared runs vs uvicorn).
Granian is included in litellm[proxy] and requires Python 3.9+. Scale throughput with --num_workers .
Example (benchmark setup from PR #26027 ):
litellm --config config.yaml --port 4000 --run_granian --num_workers 4
Or with Docker:
--config /app/config.yaml \
--port 4000 \
--run_granian \
--num_workers 4
SSL: Both --ssl_certfile_path and --ssl_keyfile_path are required when enabling TLS with Granian.
Not supported with Granian:
--max_requests_before_restart (use Gunicorn if you need per-request worker recycling)
--ciphers (Hypercorn only)
See CLI Arguments — Server Backend Options for full flag details.
5. Keepalive Timeout ​
Defaults to 5 seconds. Between requests, connections must receive new data within this period or be disconnected.
Usage Example:
In this example, we set the keepalive timeout to 75 seconds.
docker run
--keepalive_timeout 75
Or set via environment variable:
Environment Variable
export KEEPALIVE_TIMEOUT=75
docker run docker.litellm.ai/berriai/litellm:main-stable
Restart Workers After N Requests ​
Use this to mitigate memory growth by recycling workers after a fixed number of requests. When set, each worker restarts after completing the specified number of requests. Defaults to disabled when unset.
Usage Examples:
docker run (CLI flag)
--max_requests_before_restart 10000
export MAX_REQUESTS_BEFORE_RESTART=10000
6. config.yaml file on s3, GCS Bucket Object/url ​
Use this if you cannot mount a config file on your deployment service (example - AWS Fargate, Railway etc)
LiteLLM Proxy will read your config.yaml from an s3 Bucket or GCS Bucket
GCS Bucket
s3
Set the following .env vars
LITELLM_CONFIG_BUCKET_TYPE = "gcs" # set this to "gcs"
LITELLM_CONFIG_BUCKET_NAME = "litellm-proxy" # your bucket name on GCS
LITELLM_CONFIG_BUCKET_OBJECT_KEY = "proxy_config.yaml" # object key on GCS
Start litellm proxy with these env vars - litellm will read your config from GCS
-e DATABASE_URL=<database_url> \
-e LITELLM_CONFIG_BUCKET_NAME=<bucket_name> \
-e LITELLM_CONFIG_BUCKET_OBJECT_KEY="<object_key>> \
-e LITELLM_CONFIG_BUCKET_TYPE="gcs" \
docker.litellm.ai/berriai/litellm-database:main-stable --detailed_debug
LITELLM_CONFIG_BUCKET_NAME = "litellm-proxy" # your bucket name on s3
LITELLM_CONFIG_BUCKET_OBJECT_KEY = "litellm_proxy_config.yaml" # object key on s3
Start litellm proxy with these env vars - litellm will read your config from s3
docker.litellm.ai/berriai/litellm-database:main-stable
7. Disable pulling live model prices ​
Disable pulling the model prices from LiteLLM's hosted model prices file , if you're seeing long cold start times or network security issues.
export LITELLM_LOCAL_MODEL_COST_MAP="True"
This will use the local model prices file instead.
Platform-specific Guide ​
AWS ECS - Elastic Container Service
AWS EKS - Kubernetes
AWS Cloud Formation Stack
Google Cloud Run
Render deploy
Railway
Terraform-based ECS Deployment ​
LiteLLM maintains a dedicated Terraform tutorial for deploying the proxy on ECS. Follow the step-by-step guide in the litellm-ecs-deployment repository to provision the required ECS services, task definitions, and supporting AWS resources.
Clone the tutorial repository to review the Terraform modules and variables.
git clone https://github.com/BerriAI/litellm-ecs-deployment.git
cd litellm-ecs-deployment
Initialize and validate the Terraform project before applying it to your chosen workspace/account.
terraform init
terraform plan
terraform apply
Once terraform apply completes, do ./build.sh to push the repository on ECR and update the ECS cluster. Use that endpoint (port 4000 by default) for API requests to your LiteLLM proxy.
Kubernetes (AWS EKS) ​
Step1. Create an EKS Cluster with the following spec
eksctl create cluster --name=litellm-cluster --region=us-west-2 --node-type=t2.small
Step 2. Mount litellm proxy config on kub cluster
This will mount your local file called proxy_config.yaml on kubernetes cluster
kubectl create configmap litellm-config --from-file=proxy_config.yaml
Step 3. Apply kub.yaml and service.yaml
Clone the following kub.yaml and service.yaml files and apply locally
Use this kub.yaml file - litellm kub.yaml
Use this service.yaml file - litellm service.yaml
Apply kub.yaml
kubectl apply -f kub.yaml
Apply service.yaml - creates an AWS load balancer to expose the proxy
kubectl apply -f service.yaml
# service/litellm-service created
Step 4. Get Proxy Base URL
kubectl get services
# litellm-service LoadBalancer 10.100.6.31 a472dc7c273fd47fd******.us-west-2.elb.amazonaws.com 4000:30374/TCP 63m
Proxy Base URL = a472dc7c273fd47fd******.us-west-2.elb.amazonaws.com:4000
That's it, now you can start using LiteLLM Proxy
AWS Cloud Formation Stack ​
LiteLLM AWS Cloudformation Stack - Get the best LiteLLM AutoScaling Policy and Provision the DB for LiteLLM Proxy
This will provision:
LiteLLMServer - EC2 Instance
LiteLLMServerAutoScalingGroup
LiteLLMServerScalingPolicy (autoscaling policy)
LiteLLMDB - RDS::DBInstance
Using AWS Cloud Formation Stack ​
LiteLLM Cloudformation stack is located here - litellm.yaml 1. Create the CloudFormation Stack: ​
In the AWS Management Console, navigate to the CloudFormation service, and click on "Create Stack."
On the "Create Stack" page, select "Upload a template file" and choose the litellm.yaml file
Now monitor the stack was created successfully. 2. Get the Database URL: ​
Once the stack is created, get the DatabaseURL of the Database resource, copy this value 3. Connect to the EC2 Instance and deploy litellm on the EC2 container ​
From the EC2 console, connect to the instance created by the stack (e.g., using SSH).
Run the following command, replacing <database_url> with the value you copied in step 2
4. Access the Application: ​
Once the container is running, you can access the application by going to http://<ec2-public-ip>:4000 in your browser.
Google Cloud Run ​
Fork this repo - github.com/BerriAI/example_litellm_gcp_cloud_run
Edit the litellm_config.yaml file in the repo to include your model settings
Deploy your forked github repo on Google Cloud Run
Testing your deployed proxy ​
Assuming the required keys are set as Environment Variables
https://litellm-7yjrj3ha2q-uc.a.run.app is our example proxy, substitute it with your deployed cloud run app
curl https://litellm-7yjrj3ha2q-uc.a.run.app/v1/chat/completions \
-H "Content-Type: application/json" \
-d '{
"model": "gpt-4o",
"messages": [{"role": "user", "content": "Say this is a test!"}],
"temperature": 0.7
Render ​
https://render.com/
Railway ​
https://railway.app
Step 1: Click the button to deploy to Railway
Step 2: Set PORT = 4000 on Railway Environment Variables
Extras ​
Docker compose ​
Step 1
(Recommended) Use the example file docker-compose.yml given in the project root. e.g. https://github.com/BerriAI/litellm/blob/main/docker-compose.yml
Here's an example docker-compose.yml file
version : "3.9"
services :
litellm :
build :
context : .
target : runtime
- "4000:4000" # Map the container port to the host, change the host port if necessary
- ./litellm - config.yaml : /app/config.yaml # Mount the local configuration file
# You can change the port or number of workers as per your requirements or pass any new supported CLI argument. Make sure the port passed here matches with the container port defined above in `ports` value
command : [ "--config" , "/app/config.yaml" , "--port" , "4000" , "--num_workers" , "8" ]
# ...rest of your docker-compose config if any
Step 2
Create a litellm-config.yaml file with your LiteLLM config relative to your docker-compose.yml file.
Check the config doc here
Step 3
Run the command docker-compose up or docker compose up as per your docker installation.
Use -d flag to run the container in detached mode (background) e.g. docker compose up -d
Your LiteLLM container should be running now on the defined port e.g. 4000 .
IAM-based Auth for RDS DB ​
Set AWS env var
export AWS_WEB_IDENTITY_TOKEN='/path/to/token'
export AWS_ROLE_NAME='arn:aws:iam::123456789012:role/MyRole'
export AWS_SESSION_NAME='MySession'
See all Auth options
Add RDS credentials to env
export DATABASE_USER="db-user"
export DATABASE_PORT="5432"
export DATABASE_HOST="database-1-instance-1.cs1ksmwz2xt3.us-west-2.rds.amazonaws.com"
export DATABASE_NAME="database-1-instance-1"
export DATABASE_SCHEMA="schema-name" # skip to use the default "public" schema
Run proxy with iam+rds
litellm --config /path/to/config.yaml --iam_token_db_auth
✨ Blocking web crawlers ​
Note: This is an enterprise only feature .
To block web crawlers from indexing the proxy server endpoints, set the block_robots setting to true in your litellm_config.yaml file.
litellm_config.yaml
block_robots : true
How it works ​
When this is enabled, the /robots.txt endpoint will return a 200 status code with the following content:
robots.txt
User-agent: *
Disallow: /
Deployment FAQ ​
Q: Is Postgres the only supported database, or do you support other ones (like Mongo)?
A: We explored MySQL but that was hard to maintain and led to bugs for customers. Currently, PostgreSQL is our primary supported database for production deployments.
Q: If there is Postgres downtime, how does LiteLLM react? Does it fail-open or is there API downtime?
A: You can gracefully handle DB unavailability if it's on your VPC. See our production guide for more details: Gracefully Handle DB Unavailability
Quick Start
Verify Docker image signatures
Docker Run
Docker Run - CLI Args
Use litellm as a base image
Build from published LiteLLM packages
Terraform
Helm Chart
Deployment Options
Deploy with Database
Deploy with Redis
Deploy with Database + Redis
(Non Root) - without Internet Connection
Advanced Deployment Settings
1. Custom server root path (Proxy base url)
2. SSL Certification
3. Http/2 with Hypercorn
4. Granian ASGI server (higher throughput) — Beta
5. Keepalive Timeout
Restart Workers After N Requests
6. config.yaml file on s3, GCS Bucket Object/url
7. Disable pulling live model prices
Platform-specific Guide
Terraform-based ECS Deployment
Kubernetes (AWS EKS)
Render
Extras
Docker compose
IAM-based Auth for RDS DB
✨ Blocking web crawlers
Deployment FAQ
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
