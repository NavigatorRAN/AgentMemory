# Plugin validation fixes - OpenClaw

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.openclaw.ai/clawhub/plugin-validation-fixes
- Final URL: https://docs.openclaw.ai/clawhub/plugin-validation-fixes
- Canonical URL: https://docs.openclaw.ai/clawhub/plugin-validation-fixes
- Fetched at: 2026-06-23T14:37:05Z
- Content type: text/html; charset=utf-8

## Description

Fix ClawHub plugin package validation findings before publishing

## Extracted Text

Close
Get started
Plugin validation fixes
ClawHub validates plugin packages before publish and can also show findings from
automated package scans. This page covers author-facing findings, which means
findings the plugin author can fix in their package metadata, manifest, SDK
imports, or published artifact.
It does not cover internal Plugin Inspector coverage findings. If a full report
contains scanner maintenance codes without author remediation guidance, those
are for OpenClaw maintainers rather than plugin authors.
After applying any fix, rerun:
bash Copy code clawhub package validate <path-to-plugin>
Author-facing findings
Code Start here package-json-missing Add package metadata package-openclaw-metadata-missing Add the package openclaw block package-openclaw-entry-missing Declare OpenClaw package entrypoints package-entrypoint-missing Publish the declared entrypoint package-install-metadata-incomplete Complete install metadata package-plugin-api-compat-missing Declare plugin API compatibility package-min-host-version-drift Align minimum host version package-manifest-version-drift Align package and manifest versions package-openclaw-unsupported-metadata Remove unsupported OpenClaw package metadata package-npm-pack-unavailable Make the npm artifact packable package-npm-pack-entrypoint-missing Include entrypoints in npm pack output package-npm-pack-metadata-missing Include metadata in npm pack output manifest-name-missing Add a manifest display name manifest-unknown-fields Remove unsupported manifest fields manifest-unknown-contracts Remove unsupported contract keys legacy-root-sdk-import Replace root SDK imports reserved-sdk-import Remove reserved SDK imports sdk-load-session-store Replace whole-session-store access legacy-before-agent-start Replace before_agent_start provider-auth-env-vars Move provider env vars to setup metadata channel-env-vars Mirror channel env vars in current metadata security-manifest-schema-unavailable Remove unavailable security manifest schema references unrecognized-security-manifest Remove unsupported security manifest files
Package metadata
package-json-missing
The package root does not include package.json , so ClawHub cannot identify the
npm package, version, entrypoints, or OpenClaw metadata.
Add package.json with name , version , and type .
Add an openclaw block when the package ships an OpenClaw plugin.
Use Building plugins for a minimal package
example and Plugin manifest
for the package versus manifest split.
Rerun clawhub package validate <path-to-plugin> .
package-openclaw-metadata-missing
The package has package.json , but it does not declare OpenClaw package
metadata.
Add package.json#openclaw .
Include entrypoint metadata such as openclaw.extensions or
openclaw.runtimeExtensions .
Add compatibility and install metadata when the package will be published or
installed through ClawHub.
See package.json fields that affect discovery .
package-openclaw-entry-missing
The package metadata exists, but it does not declare an OpenClaw runtime
entrypoint.
Add openclaw.extensions for native plugin entrypoints.
Add openclaw.runtimeExtensions when the published package should load built
JavaScript.
Keep all entrypoint paths inside the package directory.
See Plugin entry points and
package.json fields that affect discovery .
package-entrypoint-missing
The package declares an OpenClaw entrypoint, but the referenced file is missing
from the package being validated.
Check each path in openclaw.extensions , openclaw.runtimeExtensions ,
openclaw.setupEntry , and openclaw.runtimeSetupEntry .
Build the package if the entrypoint is generated into dist .
Update the metadata if the entrypoint moved.
See Plugin entry points .
package-install-metadata-incomplete
ClawHub cannot tell how the package should be installed or updated.
Fill openclaw.install with the supported install source, such as
clawhubSpec , npmSpec , or localPath .
Set openclaw.install.defaultChoice when more than one install source is
available.
Use openclaw.install.minHostVersion for the minimum OpenClaw host version.
package-plugin-api-compat-missing
The package does not declare the OpenClaw plugin API range it supports.
Add openclaw.compat.pluginApi to package.json .
Use the OpenClaw plugin API version or semver floor that you built and tested
against.
Keep this separate from the package version. The package version describes the
plugin release; openclaw.compat.pluginApi describes the host API contract.
package-min-host-version-drift
The package minimum host version does not match the OpenClaw version metadata
the package was built against.
Check openclaw.install.minHostVersion .
Check any OpenClaw build metadata in the package, such as the OpenClaw version
used during release.
Align the minimum host version with the host version range the package
actually supports.
package-manifest-version-drift
The package version and plugin manifest version disagree.
Prefer package.json#version as the package release version.
If openclaw.plugin.json also has version , update it to match or remove
stale manifest version metadata when package metadata is authoritative.
Publish a new package version after changing published metadata.
See Plugin manifest .
package-openclaw-unsupported-metadata
The package.json#openclaw block contains fields that are not supported
OpenClaw package metadata.
Remove unsupported fields such as openclaw.bundle .
Keep native plugin metadata in openclaw.plugin.json .
Keep package entrypoints, compatibility, install, setup, and catalog metadata
in supported package.json#openclaw fields.
Published artifact
package-npm-pack-unavailable
The package cannot be packed into the artifact ClawHub would inspect or
publish.
Run npm pack --dry-run from the package root.
Fix invalid package metadata, broken lifecycle scripts, or files entries that
make packing fail.
Remove private: true if this package is intended for public publishing.
package-npm-pack-entrypoint-missing
The package can be packed, but the packed artifact does not include the
entrypoint files declared in package.json#openclaw .
Run npm pack --dry-run and inspect the files that would be included.
Build generated entrypoints before packing.
Update files , .npmignore , or build output so declared entrypoints are
included.
package-npm-pack-metadata-missing
The packed artifact is missing OpenClaw metadata that exists in your source
package.
Run npm pack --dry-run and inspect the included metadata files.
Ensure package.json includes the openclaw block in the packed artifact.
Ensure openclaw.plugin.json is included when the package is a native
OpenClaw plugin.
Update files or .npmignore so package metadata is not excluded.
See Building plugins .
Manifest metadata
manifest-name-missing
The native plugin manifest does not include a display name.
Add a non-empty name field to openclaw.plugin.json .
Keep name human-readable and keep id as the stable machine id.
manifest-unknown-fields
The plugin manifest has top-level fields that OpenClaw does not support.
Compare each top-level field with the
manifest field reference .
Remove custom fields from openclaw.plugin.json .
Move package or install metadata into supported package.json#openclaw fields
instead of the manifest.
manifest-unknown-contracts
The manifest declares unsupported keys inside contracts .
Compare each key under contracts with the
contracts reference .
Remove unsupported contract keys.
Move runtime behavior into plugin registration code, and keep contracts
limited to static capability ownership metadata.
SDK and compatibility migration
legacy-root-sdk-import
The plugin imports from the deprecated root SDK barrel:
openclaw/plugin-sdk .
Replace root-barrel imports with focused public subpath imports.
Use openclaw/plugin-sdk/plugin-entry for definePluginEntry .
Use openclaw/plugin-sdk/channel-core for channel entry helpers.
Use Import conventions and
Plugin SDK subpaths to find the narrow import.
reserved-sdk-import
The plugin imports an SDK path reserved for bundled plugins or internal
compatibility.
Replace reserved OpenClaw internal SDK imports with documented public
openclaw/plugin-sdk/* subpaths.
If the behavior has no public SDK, keep the helper inside your package or
request a public OpenClaw API.
Use Plugin SDK subpaths and
SDK migration to choose a supported import.
sdk-load-session-store
The plugin still uses the deprecated whole-session-store helper
loadSessionStore .
Use getSessionEntry(...) or listSessionEntries(...) when reading session
state.
Use patchSessionEntry(...) or upsertSessionEntry(...) when writing session
Avoid loading, mutating, and saving the whole session store object.
Keep loadSessionStore(...) only while your declared compatibility range
still supports older OpenClaw versions that require it.
See Runtime API and
Plugin SDK subpaths .
legacy-before-agent-start
The plugin still uses the legacy before_agent_start hook.
Move model or provider override work to before_model_resolve .
Move prompt or context mutation work to before_prompt_build .
Keep before_agent_start only while your declared compatibility range still
supports older OpenClaw versions that require it.
See Hooks and
Plugin compatibility .
provider-auth-env-vars
The manifest still uses legacy providerAuthEnvVars provider auth metadata.
Mirror provider env-var metadata into setup.providers[].envVars .
Keep providerAuthEnvVars only as compatibility metadata while your supported
OpenClaw range still needs it.
See setup reference and
SDK migration .
channel-env-vars
The manifest uses legacy or older channel env-var metadata without the current
setup or config metadata ClawHub expects.
Keep channel env-var metadata declarative so OpenClaw can inspect setup status
without loading channel runtime.
Mirror env-driven channel setup into the current setup, channel config, or
package channel metadata used by your plugin shape.
Keep channelEnvVars only as compatibility metadata while older supported
OpenClaw versions still require it.
See Plugin manifest and
Channel plugins .
Security manifest
security-manifest-schema-unavailable
The package ships openclaw.security.json with a schema reference that ClawHub
does not recognize as available.
Remove the schema URL if it is advisory-only.
Use a documented versioned schema only after OpenClaw publishes one.
unrecognized-security-manifest
The package ships an unsupported security manifest file.
Remove openclaw.security.json until OpenClaw documents a versioned security
manifest schema and ClawHub behavior.
Keep security-sensitive behavior documented in your public package docs or
README until the manifest contract exists.
Related
ClawHub CLI
ClawHub publishing
Building plugins
Plugin manifest
Plugin entry points
Plugin compatibility
Was this useful? Yes No
Open issue
On this page
Install OpenClaw Set up Telegram Fix Gateway Build a plugin
Ask Molty
Responses are generated using AI and may contain mistakes.
