# Upgrading LiteLLM Proxy (uv/venv) | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/troubleshoot/pip_venv_upgrade
- Final URL: https://docs.litellm.ai/docs/troubleshoot/pip_venv_upgrade
- Canonical URL: https://docs.litellm.ai/docs/troubleshoot/pip_venv_upgrade
- Fetched at: 2026-06-23T14:33:36Z
- Content type: text/html; charset=utf-8

## Description

Guide for upgrading LiteLLM Proxy when installed via uv in a virtual environment.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Guide for upgrading LiteLLM Proxy when installed via uv in a virtual environment.
Important
Always activate your virtual environment before running any litellm or prisma commands. All commands in this guide assume you're working inside an activated venv.
How uv/venv Upgrades Work ​
There are two pieces that need to stay in sync:
Prisma client - Generated Python code that talks to the DB
DB schema - Tables/columns in PostgreSQL
When you upgrade via uv, the litellm-proxy-extras package ships with a new schema.prisma and a migrations/ directory. But unlike the Docker image, uv add does not automatically regenerate the Prisma client or run migrations. You have to do both manually.
Upgrade Workflow (uv/venv) ​
1. Stop the proxy ​
Stop your running LiteLLM proxy instance.
2. (Optional) Back up your DB ​
pg_dump -h <host> -U <user> -d <db> -F c -f backup_$(date +%Y%m%d).dump
3. Upgrade the package ​
uv add 'litellm[proxy]==<version>'
4. Regenerate the Prisma client ​
prisma generate --schema <venv>/lib/python<version>/site-packages/litellm_proxy_extras/schema.prisma
Replace <venv> with your virtual environment path and <version> with your Python version (e.g., python3.11 , python3.12 , python3.13 ).
5. Apply DB migrations ​
You have two options:
Option A: Just start the proxy (simplest)
The proxy automatically runs prisma migrate deploy on startup, which applies any new migrations.
First, activate your virtual environment:
source <venv>/bin/activate
Then start the proxy:
litellm --config your_config.yaml --port 4000
Option B: Run manually before starting
Activate your virtual environment first:
Then run the migration with the explicit schema path:
prisma migrate deploy --schema <venv>/lib/python<version>/site-packages/litellm_proxy_extras/schema.prisma
6. Start the proxy ​
If you used Option B above, now start the proxy (with venv still activated):
How to Verify Migrations ​
Note: <schema-path> = <venv>/lib/python<version>/site-packages/litellm_proxy_extras/schema.prisma
Before applying migrations: Preview what will change ​
Run uv add 'litellm[proxy]==<version>' first (Step 3) so the new schema.prisma is available.
prisma migrate diff \
--from-url $DATABASE_URL \
--to-schema-datamodel <schema-path> \
--script
After applying migrations: Check status ​
prisma migrate status --schema <schema-path>
All migrations should have a finished_at timestamp and no rolled_back_at .
Key Things to Know ​
DISABLE_SCHEMA_UPDATE=true env var prevents auto-migration on startup - useful if you want full manual control
prisma db push is the nuclear option: force-syncs the DB to match the schema, bypassing migration history. Safe when all changes are additive (new columns/tables), but always have a backup.
The schema.prisma inside litellm_proxy_extras is the source of truth - always use that one, not one from a different version or from the git repo
Troubleshooting ​
If you encounter migration errors, see the Prisma Migration Troubleshooting Guide .
How uv/venv Upgrades Work
Upgrade Workflow (uv/venv)
1. Stop the proxy
2. (Optional) Back up your DB
3. Upgrade the package
4. Regenerate the Prisma client
5. Apply DB migrations
6. Start the proxy
How to Verify Migrations
Before applying migrations: Preview what will change
After applying migrations: Check status
Key Things to Know
Troubleshooting
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
