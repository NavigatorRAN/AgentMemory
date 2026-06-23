# CLI Arguments | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/cli
- Final URL: https://docs.litellm.ai/docs/proxy/cli
- Canonical URL: https://docs.litellm.ai/docs/proxy/cli
- Fetched at: 2026-06-23T14:29:45Z
- Content type: text/html; charset=utf-8

## Description

This page documents all command-line interface (CLI) arguments available for the LiteLLM proxy server.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
This page documents all command-line interface (CLI) arguments available for the LiteLLM proxy server.
Server Configuration ​
--host ​
Default: '0.0.0.0'
The host for the server to listen on.
Usage:
litellm --host 127.0.0.1
Usage - set Environment Variable: HOST
export HOST=127.0.0.1
litellm
--port ​
Default: 4000
The port to bind the server to.
litellm --port 8080
Usage - set Environment Variable: PORT
export PORT=8080
--num_workers ​
Default: Number of logical CPUs in the system, or 4 if that cannot be determined
The number of worker processes to spin up (uvicorn, gunicorn, or Granian --workers ).
litellm --num_workers 4
Usage - set Environment Variable: NUM_WORKERS
export NUM_WORKERS=4
--config ​
Short form: -c
Default: None
Path to the proxy configuration file (e.g., config.yaml).
litellm --config path/to/config.yaml
--log_config ​
Type: str
Path to the logging configuration file for uvicorn.
litellm --log_config path/to/log_config.conf
--keepalive_timeout ​
Type: int
Set the uvicorn keepalive timeout in seconds (uvicorn timeout_keep_alive parameter).
litellm --keepalive_timeout 30
Usage - set Environment Variable: KEEPALIVE_TIMEOUT
export KEEPALIVE_TIMEOUT=30
--max_requests_before_restart ​
Restart worker after this many requests. This is useful for mitigating memory growth over time.
For uvicorn: maps to limit_max_requests
For gunicorn: maps to max_requests
litellm --max_requests_before_restart 10000
Usage - set Environment Variable: MAX_REQUESTS_BEFORE_RESTART
export MAX_REQUESTS_BEFORE_RESTART=10000
--max_requests_before_restart_jitter ​
Adds a random amount in [0, jitter] to --max_requests_before_restart for each worker so workers recycle at staggered request counts instead of all at once. Has no effect without --max_requests_before_restart .
For uvicorn: maps to limit_max_requests_jitter (requires uvicorn>=0.41.0 ; on older versions the flag is ignored with a warning)
For gunicorn: maps to max_requests_jitter
litellm --max_requests_before_restart 10000 --max_requests_before_restart_jitter 1000
Usage - set Environment Variable: MAX_REQUESTS_BEFORE_RESTART_JITTER
export MAX_REQUESTS_BEFORE_RESTART_JITTER=1000
Server Backend Options ​
--run_gunicorn ​
Default: False
Type: bool (Flag)
Starts proxy via gunicorn instead of uvicorn. Better for managing multiple workers in production.
litellm --run_gunicorn
--run_hypercorn ​
Starts proxy via hypercorn instead of uvicorn. Supports HTTP/2.
litellm --run_hypercorn
--run_granian ​
Status: Beta — opt in when you want higher gateway throughput; uvicorn remains the default.
Starts the proxy via Granian (Rust-backed ASGI server) instead of uvicorn. Supports HTTP/1 and HTTP/2.
Why use it: Granian moves the HTTP layer off Python into a Rust runtime, which tends to handle concurrent proxy traffic more predictably than uvicorn alone. In LiteLLM load tests, Granian showed a 10–20 RPS improvement over an equivalent uvicorn multi-worker setup, with better stability under sustained load and fewer request failures .
Requirements: Python 3.9+ and the granian package (included in litellm[proxy] ).
Limitations when using Granian:
--max_requests_before_restart is not supported (Granian uses workers_lifetime in seconds, not a per-request limit).
--ciphers is not applied.
--keepalive_timeout and --log_config apply to uvicorn only.
litellm --config config.yaml --run_granian --num_workers 4
--skip_server_startup ​
Skip starting the server after setup (useful for database migrations only).
litellm --skip_server_startup
SSL/TLS Configuration ​
--ssl_keyfile_path ​
Path to the SSL keyfile. Use this when you want to provide SSL certificate when starting proxy.
litellm --ssl_keyfile_path /path/to/key.pem --ssl_certfile_path /path/to/cert.pem
Usage - set Environment Variable: SSL_KEYFILE_PATH
export SSL_KEYFILE_PATH=/path/to/key.pem
--ssl_certfile_path ​
Path to the SSL certfile. Use this when you want to provide SSL certificate when starting proxy.
litellm --ssl_certfile_path /path/to/cert.pem --ssl_keyfile_path /path/to/key.pem
Usage - set Environment Variable: SSL_CERTFILE_PATH
export SSL_CERTFILE_PATH=/path/to/cert.pem
--ciphers ​
Ciphers to use for the SSL setup. Only used with --run_hypercorn .
litellm --run_hypercorn --ssl_keyfile_path /path/to/key.pem --ssl_certfile_path /path/to/cert.pem --ciphers "ECDHE+AESGCM"
Model Configuration ​
--model or -m ​
The model name to pass to LiteLLM.
litellm --model gpt-3.5-turbo
--alias ​
An alias for the model, for user-friendly reference. Use this to give a litellm model name (e.g., "huggingface/codellama/CodeLlama-7b-Instruct-hf") a more user-friendly name ("codellama").
litellm --alias my-gpt-model
--api_base ​
The API base for the model LiteLLM should call.
litellm --model huggingface/tinyllama --api_base https://k58ory32yinf1ly0.us-east-1.aws.endpoints.huggingface.cloud
--api_version ​
Default: 2024-07-01-preview
For Azure services, specify the API version.
litellm --model azure/gpt-deployment --api_version 2023-08-01 --api_base https://<your api base>"
--headers ​
Headers for the API call (as JSON string).
litellm --model my-model --headers '{"Authorization": "Bearer token"}'
--add_key ​
Add a key to the model configuration.
litellm --add_key my-api-key
--save ​
Save the model-specific config.
litellm --model gpt-3.5-turbo --save
Model Parameters ​
--temperature ​
Type: float
Set the temperature for the model.
litellm --temperature 0.7
--max_tokens ​
Set the maximum number of tokens for the model output.
litellm --max_tokens 50
--request_timeout ​
Set the timeout in seconds for completion calls.
litellm --request_timeout 300
--max_budget ​
Set max budget for API calls. Works for hosted models like OpenAI, TogetherAI, Anthropic, etc.
litellm --max_budget 100.0
--drop_params ​
Drop any unmapped params.
litellm --drop_params
--add_function_to_prompt ​
If a function passed but unsupported, pass it as a part of the prompt.
litellm --add_function_to_prompt
Database Configuration ​
--iam_token_db_auth ​
Connects to an RDS database using IAM token authentication instead of a password. This is useful for AWS RDS instances that are configured to use IAM database authentication.
When enabled, LiteLLM will generate an IAM authentication token to connect to the database.
Required Environment Variables:
DATABASE_HOST - The RDS database host
DATABASE_PORT - The database port
DATABASE_USER - The database user
DATABASE_NAME - The database name
DATABASE_SCHEMA (optional) - The database schema
litellm --iam_token_db_auth
Usage - set Environment Variable: IAM_TOKEN_DB_AUTH
export IAM_TOKEN_DB_AUTH=True
export DATABASE_HOST=mydb.us-east-1.rds.amazonaws.com
export DATABASE_PORT=5432
export DATABASE_USER=mydbuser
export DATABASE_NAME=mydb
--use_prisma_db_push ​
Use prisma db push instead of prisma migrate for database schema updates. This is useful when you want to quickly sync your database schema without creating migration files.
litellm --use_prisma_db_push
Debugging ​
--debug ​
Enable debugging mode for the input.
litellm --debug
Usage - set Environment Variable: DEBUG
export DEBUG=True
--detailed_debug ​
Enable detailed debugging mode to view verbose debug logs.
litellm --detailed_debug
Usage - set Environment Variable: DETAILED_DEBUG
export DETAILED_DEBUG=True
--local ​
For local debugging purposes.
litellm --local
Testing & Health Checks ​
--test ​
Proxy chat completions URL to make a test request to.
litellm --test
--test_async ​
Calls async endpoints /queue/requests and /queue/response .
litellm --test_async
--num_requests ​
Default: 10
Number of requests to hit async endpoint with (used with --test_async ).
litellm --test_async --num_requests 100
--health ​
Runs a health check on all models in config.yaml.
litellm --health
Other Options ​
--version ​
Short form: -v
Print LiteLLM version and exit.
litellm --version
--telemetry ​
Default: True
Type: bool
Help track usage of this feature. Turn off for privacy.
litellm --telemetry False
--use_queue ​
To use celery workers for async endpoints.
litellm --use_queue
Server Configuration
--host
--port
--num_workers
--config
--log_config
--keepalive_timeout
--max_requests_before_restart
--max_requests_before_restart_jitter
Server Backend Options
--run_gunicorn
--run_hypercorn
--run_granian
--skip_server_startup
SSL/TLS Configuration
--ssl_keyfile_path
--ssl_certfile_path
--ciphers
Model Configuration
--model or -m
--alias
--api_base
--api_version
--headers
--add_key
--save
Model Parameters
--temperature
--max_tokens
--request_timeout
--max_budget
--drop_params
--add_function_to_prompt
Database Configuration
--iam_token_db_auth
--use_prisma_db_push
Debugging
--debug
--detailed_debug
--local
Testing & Health Checks
--test
--test_async
--num_requests
--health
Other Options
--version
--telemetry
--use_queue
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
