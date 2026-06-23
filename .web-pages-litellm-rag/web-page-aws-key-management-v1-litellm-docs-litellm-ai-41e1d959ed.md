# AWS Key Management V1 | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/secret_managers/aws_kms
- Final URL: https://docs.litellm.ai/docs/secret_managers/aws_kms
- Canonical URL: https://docs.litellm.ai/docs/secret_managers/aws_kms
- Fetched at: 2026-06-23T14:33:13Z
- Content type: text/html; charset=utf-8

## Description

✨ This is an Enterprise Feature

## Extracted Text

Skip to main content
Copy as Markdown
info
✨ This is an Enterprise Feature
Enterprise Pricing
Contact us here to get a free trial
tip
[BETA] AWS Key Management v2 is on the enterprise tier. Go here for docs
Use AWS KMS to storing a hashed copy of your Proxy Master Key in the environment.
export LITELLM_MASTER_KEY="djZ9xjVaZ..." # 👈 ENCRYPTED KEY
export AWS_REGION_NAME="us-west-2"
general_settings :
key_management_system : "aws_kms"
key_management_settings :
hosted_keys : [ "LITELLM_MASTER_KEY" ] # 👈 WHICH KEYS ARE STORED ON KMS
See Decryption Code
