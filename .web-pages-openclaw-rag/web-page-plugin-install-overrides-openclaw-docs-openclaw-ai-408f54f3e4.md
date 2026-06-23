# Plugin install overrides - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/plugins/install-overrides
- Final URL: https://docs.openclaw.ai/plugins/install-overrides
- Canonical URL: https://docs.openclaw.ai/plugins/install-overrides
- Fetched at: 2026-06-23T14:50:20Z
- Content type: text/html; charset=utf-8

## Description

Test packaged plugin overrides with setup-time install flows

## Extracted Text

Close
Reference Plugin reference
Plugin install overrides let maintainers test setup-time plugin installs against
a specific npm package or local npm-pack tarball. They are for E2E and package
validation only. Normal users should install plugins with
openclaw plugins install .
Warning
Overrides execute plugin code from the source you provide. Use them only in an
isolated state directory or disposable test machine.
Environment
Overrides are disabled unless both variables are set:
bash Copy code export OPENCLAW_ALLOW_PLUGIN_INSTALL_OVERRIDES=1 export OPENCLAW_PLUGIN_INSTALL_OVERRIDES= '{ "codex" : "npm-pack:/tmp/openclaw-codex-2026.5.8.tgz" , "openclaw-web-search" : "npm:@openclaw/web-search@2026.5.8" } '
The override map is JSON keyed by plugin id. Values support:
npm:<registry-spec> for registry packages and exact versions or tags
npm-pack:<path.tgz> for local tarballs produced by npm pack
Relative npm-pack: paths resolve from the current working directory.
Behavior
When a setup-time flow asks to install a plugin whose id appears in the map,
OpenClaw uses the override source instead of the catalog, bundled, or default
npm source. This applies to onboarding and other flows that use the shared
setup-time plugin installer.
Overrides still enforce the expected plugin id. A tarball mapped to codex
must install a plugin whose manifest id is codex .
Overrides do not inherit official trusted-source status. Even when the catalog
entry normally represents an OpenClaw-owned package, an override is treated as
operator-supplied test input.
Workspace .env files cannot enable install overrides. Set these variables in
the trusted shell, CI job, or remote test command that launches OpenClaw.
Package E2E
Use an isolated state directory so package installs and install records do not
touch your normal OpenClaw state:
bash Copy code npm pack extensions/codex --pack-destination /tmp OPENCLAW_STATE_DIR= " $(mktemp -d) " \ OPENCLAW_ALLOW_PLUGIN_INSTALL_OVERRIDES=1 \ OPENCLAW_PLUGIN_INSTALL_OVERRIDES= '{"codex":"npm-pack:/tmp/openclaw-codex-2026.5.8.tgz"}' \ pnpm openclaw onboard --mode local
Verify the installed package under the state directory:
bash Copy code find " $OPENCLAW_STATE_DIR /npm/projects" -path '*/node_modules/@openclaw/codex/package.json' - print grep -R '"@openclaw/codex"' " $OPENCLAW_STATE_DIR /npm/projects" /*/package-lock.json
For live provider E2E, source the real API key from a trusted shell or CI secret
before launching the test command. Do not print keys; report only the source and
whether the key was present.
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
