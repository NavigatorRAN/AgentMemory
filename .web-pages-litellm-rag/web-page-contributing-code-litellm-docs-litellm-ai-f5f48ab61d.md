# Contributing Code | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/extras/contributing_code
- Final URL: https://docs.litellm.ai/docs/extras/contributing_code
- Canonical URL: https://docs.litellm.ai/docs/extras/contributing_code
- Fetched at: 2026-06-23T14:23:56Z
- Content type: text/html; charset=utf-8

## Description

Checklist before submitting a PR

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Checklist before submitting a PR ​
Here are the core requirements for any PR submitted to LiteLLM:
Sign the Contributor License Agreement (CLA)
Keep scope as isolated as possible — your changes should address one specific problem at a time
Follow the Commit and Branch Conventions — PR titles are gated by CI
Proxy (Backend) PRs ​
Add testing — at least 1 test is a hard requirement ( details )
Ensure your PR passes:
Unit Tests — make test-unit
Formatting / Linting Tests — make lint
UI PRs ​
Ensure the UI builds successfully — npm run build
Ensure all UI unit tests pass — npm run test
If you are adding a new component or new logic , add corresponding tests
Contributor License Agreement (CLA) ​
Before contributing code to LiteLLM, you must sign our Contributor License Agreement (CLA) . This is a legal requirement for all contributions to be merged into the main repository. The CLA helps protect both you and the project by clearly defining the terms under which your contributions are made.
Important: We strongly recommend signing the CLA before starting work on your contribution to avoid delays in the review process. You can find and sign the CLA here .
Commit and Branch Conventions ​
LiteLLM enforces two community specs:
Commits follow Conventional Commits 1.0.0 — <type>(<scope>)!: <description>
Branches follow Conventional Branches — <type>/<description>
Enforcement happens in two places: opt-in local git hooks in .githooks/ , and a required CI check on the PR title (since squash-merge uses the PR title as the commit subject).
Commit message format ​
<type>(<optional scope>)!: <description>
<optional body>
<optional footer>
<type> is one of: feat , fix , docs , style , refactor , perf , test , build , ci , chore , revert .
<scope> is optional and lowercase.
! before : marks a breaking change.
<description> is required and must start with a lowercase letter (digits and symbols are also fine; only A–Z is rejected).
Examples:
feat(router): add weighted round-robin strategy
fix(bedrock): decouple STS region from aws_region_name
chore(deps): bump black to 26.3.1
refactor!: drop Python 3.8 support
PR titles must follow the same format — squash-merge uses the PR title as the commit subject and the Conventional PR Title workflow validates it.
Branch naming ​
Format: <type>/<short-description> where <type> is one of feature , bugfix , hotfix , release , chore .
feature/weighted-round-robin
bugfix/streaming-empty-chunks
chore/bump-black
hotfix/auth-bypass
release/v1.45.0
Branches always allowed (the pre-push hook bypasses them):
main
litellm_internal_staging
dependabot/*
gh-readonly-queue/*
Tag pushes and branch deletions are also skipped.
Installing the hooks ​
The hooks live in .githooks/ and are opt-in. Run once per clone:
make install-hooks
This sets core.hooksPath=.githooks for the local repository. After that:
git commit runs commit-msg , which validates the subject line.
git push runs pre-push , which validates branch names.
In a rare emergency you can bypass either hook per command:
git commit --no-verify -m "..."
git push --no-verify
To uninstall: git config --unset core.hooksPath .
Proxy (Backend) ​
1. Setting up your local dev environment ​
Step 1: Clone the repo
git clone https://github.com/BerriAI/litellm.git
Step 2: Install dev dependencies
uv sync --group dev --extra proxy
2. Adding tests ​
Add your tests to the tests/test_litellm/ directory .
This directory mirrors the litellm/ directory 1:1 and should only contain mocked tests.
Do not add real LLM API calls to this directory.
File naming convention for tests/test_litellm/ ​
The test directory follows the same structure as litellm/ :
test_{filename}.py maps to litellm/{filename}.py
litellm/proxy/test_caching_routes.py maps to litellm/proxy/caching_routes.py
3. Running unit tests ​
Run the following command from the root of the litellm directory:
make test-unit
4. Running linting tests ​
make lint
LiteLLM uses mypy for type checking. CI/CD also runs black for formatting.
5. Submit a PR ​
Push your changes to your fork on GitHub
Open a Pull Request from your fork
UI ​
Step 2: Navigate to the UI dashboard directory
cd ui/litellm-dashboard
Step 3: Install dependencies
npm install
Step 4: Start the development server
npm run dev
If you are adding a new component or new logic , you must add corresponding tests.
3. Running UI unit tests ​
npm run test
4. Building the UI ​
Ensure the UI builds successfully before submitting your PR:
npm run build
Advanced ​
Building the LiteLLM Docker Image ​
Follow these instructions if you want to build and run the LiteLLM Docker image yourself.
Step 2: Build the Docker image
Build using Dockerfile.non_root :
docker build -f docker/Dockerfile.non_root -t litellm_test_image .
Step 3: Run the Docker image
Make sure config.yaml is present in the root directory. This is your LiteLLM proxy config file.
docker run \
-v $(pwd)/proxy_config.yaml:/app/config.yaml \
-e DATABASE_URL="postgresql://xxxxxxxx" \
-e LITELLM_MASTER_KEY="sk-1234" \
-p 4000:4000 \
litellm_test_image \
--config /app/config.yaml --detailed_debug
Running the LiteLLM Proxy Locally ​
Navigate to the proxy/ directory:
cd litellm/litellm/proxy
Run the proxy:
python3 proxy_cli.py --config /path/to/config.yaml
# RUNNING on http://0.0.0.0:4000
Checklist before submitting a PR
Proxy (Backend) PRs
UI PRs
Contributor License Agreement (CLA)
Commit and Branch Conventions
Commit message format
Branch naming
Installing the hooks
Proxy (Backend)
1. Setting up your local dev environment
2. Adding tests
3. Running unit tests
4. Running linting tests
5. Submit a PR
UI
3. Running UI unit tests
4. Building the UI
Advanced
Building the LiteLLM Docker Image
Running the LiteLLM Proxy Locally
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
