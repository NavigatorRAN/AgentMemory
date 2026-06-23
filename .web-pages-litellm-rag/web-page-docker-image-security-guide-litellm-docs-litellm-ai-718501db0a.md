# Docker Image Security Guide | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/proxy/docker_image_security
- Final URL: https://docs.litellm.ai/docs/proxy/docker_image_security
- Canonical URL: https://docs.litellm.ai/docs/proxy/docker_image_security
- Fetched at: 2026-06-23T14:30:08Z
- Content type: text/html; charset=utf-8

## Description

LiteLLM signs every Docker image published to GHCR with cosign starting from v1.83.0. This page covers how to verify signatures, enforce verification in CI/CD, and follow recommended deployment patterns.

## Extracted Text

Skip to main content
On this page
Copy as Markdown
LiteLLM signs every Docker image published to GHCR with cosign starting from v1.83.0 . This page covers how to verify signatures, enforce verification in CI/CD, and follow recommended deployment patterns.
Signed images ​
All image variants published to ghcr.io/berriai/ are signed with the same cosign key:
Image Description ghcr.io/berriai/litellm Core proxy ghcr.io/berriai/litellm-database Proxy with Postgres dependencies ghcr.io/berriai/litellm-non_root Non-root variant ghcr.io/berriai/litellm-spend_logs Spend-logs sidecar
The signing key was introduced in commit 0112e53 and the public key is checked into the repository at cosign.pub .
Enterprise images
Enterprise images ( litellm-ee ) follow the same signing process. Contact support@berri.ai to confirm coverage for your specific enterprise image tag.
Verify image signatures ​
Install cosign following the official instructions .
Verify with the pinned commit hash (recommended) ​
A commit hash is cryptographically immutable, making this the strongest verification method:
cosign verify \
--key https://raw.githubusercontent.com/BerriAI/litellm/0112e53046018d726492c814b3644b7d376029d0/cosign.pub \
ghcr.io/berriai/litellm:v1.83.0-stable
Replace the image reference with any signed variant:
# litellm-database
ghcr.io/berriai/litellm-database:v1.83.0-stable
# litellm-non_root
ghcr.io/berriai/litellm-non_root:v1.83.0-stable
Verify with a release tag (convenience) ​
Tags are protected in this repository and resolve to the same key:
--key https://raw.githubusercontent.com/BerriAI/litellm/v1.83.0-stable/cosign.pub \
Expected output ​
The following checks were performed on each of these signatures:
- The cosign claims were validated
- The signatures were verified against the specified public key
Enforce verification in CI/CD ​
Kubernetes — Sigstore Policy Controller ​
The Sigstore Policy Controller rejects pods whose images fail cosign verification.
Install the controller:
helm repo add sigstore https://sigstore.github.io/helm-charts
helm install policy-controller sigstore/policy-controller \
-n cosign-system --create-namespace
Create a ClusterImagePolicy with the LiteLLM public key:
apiVersion : policy.sigstore.dev/v1beta1
kind : ClusterImagePolicy
metadata :
name : litellm - signed - images
spec :
images :
- glob : "ghcr.io/berriai/litellm*"
authorities :
- key :
data : |
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEKi4ivqGpE231OGH50PKbqy1Y1Kkb
POJC8+i2Wko82gBOUCe3M0Vw86H/4rhUhfoYEti4gdJ9wZbYmK0I2EE96g==
-----END PUBLIC KEY-----
Label the namespace to enable enforcement:
kubectl label namespace litellm policy.sigstore.dev/include=true
Any pod in that namespace using an unsigned ghcr.io/berriai/litellm* image will be rejected at admission.
GCP — Binary Authorization ​
Binary Authorization can enforce cosign signatures on Cloud Run and GKE.
Create a cosign-based attestor using the LiteLLM public key:
# Import the public key into a Cloud KMS keyring or use a PGP/PKIX attestor.
# See: https://cloud.google.com/binary-authorization/docs/creating-attestors-console
Configure a Binary Authorization policy that requires the attestor for ghcr.io/berriai/litellm* images.
Enable the policy on your Cloud Run service or GKE cluster.
Refer to the GCP Binary Authorization docs for full setup steps.
AWS — ECS / ECR ​
AWS does not natively verify cosign signatures at deploy time. Common approaches:
CI/CD gate : Run cosign verify in your deployment pipeline before pushing to ECR or updating the ECS task definition. Fail the pipeline if verification fails.
OPA/Gatekeeper on EKS : If running on EKS, use the Sigstore Policy Controller (same as the Kubernetes approach above).
GitHub Actions gate ​
Add a verification step before any deployment job:
- name : Verify LiteLLM image signature
run : |
ghcr.io/berriai/litellm-database:${{ env.LITELLM_VERSION }}
Recommended deployment patterns ​
Pin by digest ​
Digest pinning guarantees the exact image content regardless of tag mutations:
image : ghcr.io/berriai/litellm - database@sha256 : <digest >
Get the digest after pulling:
docker inspect --format='{{index .RepoDigests 0}}' \
Cosign verification works with digests too:
ghcr.io/berriai/litellm-database@sha256:<digest>
Use stable release tags ​
If digest pinning is too rigid for your workflow, use plain semver / PEP 440 release tags (e.g. v1.86.2 ). These are immutable release tags that will not be overwritten.
main-stable and main-latest are deprecated
LiteLLM has moved to PEP 440 / semver versioning, so stable releases are now published as plain vX.Y.Z tags (e.g. v1.86.2 ) instead of the older vX.Y.Z-stable form. The rolling main-stable tag is still being updated for backwards compatibility but is deprecated; pin to a specific vX.Y.Z tag (or a digest) instead. The rolling main-latest tag is deprecated and is no longer being updated; use latest instead.
Avoid latest in production. This rolling tag points to the most recent build and can change between deployments.
Safe upgrade checklist ​
Verify the new image — run cosign verify against the new release tag or digest.
Test in staging — deploy the verified image to a non-production environment.
Update your pinned reference — change the digest or tag in your deployment manifest.
Deploy to production — roll out using your standard deployment process.
Monitor /health — confirm the proxy is healthy after the upgrade.
Further reading ​
CI/CD v2 announcement — background on LiteLLM's signing infrastructure
Docker deployment guide — full Docker, Helm, and Terraform setup
cosign documentation — cosign usage and key management
Sigstore Policy Controller — Kubernetes admission control
Signed images
Verify image signatures
Verify with the pinned commit hash (recommended)
Verify with a release tag (convenience)
Expected output
Enforce verification in CI/CD
Kubernetes — Sigstore Policy Controller
GCP — Binary Authorization
AWS — ECS / ECR
GitHub Actions gate
Recommended deployment patterns
Pin by digest
Use stable release tags
Safe upgrade checklist
Further reading
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
