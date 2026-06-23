# Benchmark LLMs | liteLLM

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.litellm.ai/docs/tutorials/compare_llms
- Final URL: https://docs.litellm.ai/docs/tutorials/compare_llms
- Canonical URL: https://docs.litellm.ai/docs/tutorials/compare_llms
- Fetched at: 2026-06-23T14:33:57Z
- Content type: text/html; charset=utf-8

## Description

Easily benchmark LLMs for a given question by viewing

## Extracted Text

Skip to main content
On this page
Copy as Markdown
Easily benchmark LLMs for a given question by viewing
Responses
Response Cost
Response Time
Benchmark Output ​
Setup: ​
git clone https://github.com/BerriAI/litellm
cd to litellm/cookbook/benchmark dir
Located here:
https://github.com/BerriAI/litellm/tree/main/cookbook/benchmark
cd litellm/cookbook/benchmark
Install Dependencies ​
uv add litellm click tqdm tabulate termcolor
Configuration - Set LLM API Keys + LLMs in benchmark.py ​
In benchmark/benchmark.py select your LLMs, LLM API Key and questions
Supported LLMs: https://docs.litellm.ai/docs/providers
# Define the list of models to benchmark
models = [ 'gpt-3.5-turbo' , 'claude-2' ]
# Enter LLM API keys
os . environ [ 'OPENAI_API_KEY' ] = ""
os . environ [ 'ANTHROPIC_API_KEY' ] = ""
# List of questions to benchmark (replace with your questions)
questions = [
"When will BerriAI IPO?" ,
"When will LiteLLM hit $100M ARR?"
]
Run benchmark.py ​
python3 benchmark.py
Expected Output ​
Running question: When will BerriAI IPO? for model: claude-2: 100%|████████████████████████████████████████████████████████████████████████████████████| 3/3 [00:13<00:00, 4.41s/it]
Benchmark Results for 'When will BerriAI IPO?':
+-----------------+----------------------------------------------------------------------------------+---------------------------+------------+
| Model | Response | Response Time (seconds) | Cost ($) |
+=================+==================================================================================+===========================+============+
| gpt-3.5-turbo | As an AI language model, I cannot provide up-to-date information or predict | 1.55 seconds | $0.000122 |
| | future events. It is best to consult a reliable financial source or contact | | |
| | BerriAI directly for information regarding their IPO plans. | | |
| togethercompute | I'm not able to provide information about future IPO plans or dates for BerriAI | 8.52 seconds | $0.000531 |
| r/llama-2-70b-c | or any other company. IPO (Initial Public Offering) plans and timelines are | | |
| hat | typically kept private by companies until they are ready to make a public | | |
| | announcement. It's important to note that IPO plans can change and are subject | | |
| | to various factors, such as market conditions, financial performance, and | | |
| | regulatory approvals. Therefore, it's difficult to predict with certainty when | | |
| | BerriAI or any other company will go public. If you're interested in staying | | |
| | up-to-date with BerriAI's latest news and developments, you may want to follow | | |
| | their official social media accounts, subscribe to their newsletter, or visit | | |
| | their website periodically for updates. | | |
| claude-2 | I do not have any information about when or if BerriAI will have an initial | 3.17 seconds | $0.002084 |
| | public offering (IPO). As an AI assistant created by Anthropic to be helpful, | | |
| | harmless, and honest, I do not have insider knowledge about Anthropic's business | | |
| | plans or strategies. | | |
Support ​
🤝 Schedule a 1-on-1 Session: Book a 1-on-1 session with Krrish and Ishaan, the founders, to discuss any issues, provide feedback, or explore how we can improve LiteLLM for you.
Benchmark Output
Setup:
Install Dependencies
Configuration - Set LLM API Keys + LLMs in benchmark.py
Run benchmark.py
Expected Output
Support
🚅
LiteLLM Enterprise
SSO/SAML, audit logs, spend tracking, multi-team management, and guardrails — built for production.
Learn more →
