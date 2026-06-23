# Database | Paperclip Docs

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.paperclip.ing/reference/deploy/database
- Final URL: https://docs.paperclip.ing/reference/deploy/database/
- Canonical URL: https://docs.paperclip.ing/reference/deploy/database
- Fetched at: 2026-06-23T13:39:58Z
- Content type: text/html; charset=utf-8

## Description

Paperclip uses PostgreSQL through Drizzle ORM. The same schema works across the supported database modes; the difference is where PostgreSQL is running and how Paperclip connects t

## Extracted Text

esc
Documentation
All docs
Everything you need to run Paperclip.
Guides, references, and walkthroughs for the people running AI agents at work. Start at the quickstart, or jump anywhere below.
Loading…
Could not load this guide.
Database
Paperclip uses PostgreSQL through Drizzle ORM. The same schema works across the supported database modes; the difference is where PostgreSQL is running and how Paperclip connects to it.
Use this page when you are choosing between embedded, local Docker, or hosted PostgreSQL.
Database Modes
Mode Best for Setup cost Embedded PostgreSQL Local development, one-command installs Zero config Local PostgreSQL in Docker A local prod-like database Low Hosted PostgreSQL Production and shared deployments Higher
Note: The app logic does not change across modes. Only DATABASE_URL and the storage location change.
Embedded PostgreSQL
This is the default mode when DATABASE_URL is not set.
pnpm dev
On first start, Paperclip:
creates ~/.paperclip/instances/default/db/
ensures the paperclip database exists
runs migrations for an empty database
starts serving requests
Data persists across restarts in that directory.
Use this mode when you want the simplest possible local setup.
Reset the local database by deleting the data directory:
rm -rf ~/.paperclip/instances/default/db
The Docker quickstart uses embedded PostgreSQL by default too. See Docker for the container setup.
Local PostgreSQL In Docker
Use this if you want a standard PostgreSQL server locally instead of the embedded runtime.
Start the database:
docker compose up -d
This starts PostgreSQL 17 on localhost:5432 .
Set the connection string in your environment:
cp .env.example .env
# DATABASE_URL=postgres://paperclip:paperclip@localhost:5432/paperclip
Then push the schema:
DATABASE_URL=postgres://paperclip:paperclip@localhost:5432/paperclip \
npx drizzle-kit push
Use this mode when you want to mirror a normal PostgreSQL deployment more closely while still staying local.
Hosted PostgreSQL
For production, use a hosted PostgreSQL provider such as Supabase .
Typical setup:
create a project at database.new
copy the connection string from the database settings
set DATABASE_URL in your deployment environment
Supabase exposes two useful connection styles:
direct connection on port 5432 for migrations and one-off scripts
pooled connection on port 6543 for the running application
If you use the pooled connection, disable prepared statements in packages/db/src/client.ts :
export function createDb(url: string) {
const sql = postgres(url, { prepare: false });
return drizzlePg(sql, { schema });
}
Warning: Use the direct connection for schema changes. Pointing migrations at the pooled endpoint is a common way to get avoidable connection errors.
Switching Modes
DATABASE_URL Result Not set Embedded PostgreSQL postgres://...localhost... Local Docker PostgreSQL postgres://...supabase.com... Hosted PostgreSQL
The Drizzle schema under packages/db/src/schema/ stays the same in every case.
Tip: If your deployment feels healthy but the data keeps disappearing, check whether you are still on embedded PostgreSQL. That mode is intentionally local and persistent only inside the instance directory.
