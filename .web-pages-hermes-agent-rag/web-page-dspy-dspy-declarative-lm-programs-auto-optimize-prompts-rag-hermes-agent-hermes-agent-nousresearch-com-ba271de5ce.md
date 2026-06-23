# Dspy — DSPy: declarative LM programs, auto-optimize prompts, RAG | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-research-dspy
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-research-dspy
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-research-dspy
- Fetched at: 2026-06-23T14:20:12Z
- Content type: text/html; charset=utf-8

## Description

DSPy: declarative LM programs, auto-optimize prompts, RAG

## Extracted Text

Skip to main content
On this page
DSPy: declarative LM programs, auto-optimize prompts, RAG.
Skill metadata ​
Source Optional — install with hermes skills install official/mlops/dspy Path optional-skills/mlops/research/dspy Version 1.0.0 Author Orchestra Research License MIT Dependencies dspy , openai , anthropic Platforms linux, macos, windows Tags Prompt Engineering , DSPy , Declarative Programming , RAG , Agents , Prompt Optimization , LM Programming , Stanford NLP , Automatic Optimization , Modular AI
Reference: full SKILL.md ​
info
The following is the complete skill definition that Hermes loads when this skill is triggered. This is what the agent sees as instructions when the skill is active.
DSPy: Declarative Language Model Programming
When to Use This Skill ​
Use DSPy when you need to:
Build complex AI systems with multiple components and workflows
Program LMs declaratively instead of manual prompt engineering
Optimize prompts automatically using data-driven methods
Create modular AI pipelines that are maintainable and portable
Improve model outputs systematically with optimizers
Build RAG systems, agents, or classifiers with better reliability
GitHub Stars : 22,000+ | Created By : Stanford NLP
Installation ​
# Stable release
pip install dspy
# Latest development version
pip install git+https://github.com/stanfordnlp/dspy.git
# With specific LM providers
pip install dspy [ openai ] # OpenAI
pip install dspy [ anthropic ] # Anthropic Claude
pip install dspy [ all ] # All providers
Quick Start ​
Basic Example: Question Answering ​
import dspy
# Configure your language model
lm = dspy . Claude ( model = "claude-sonnet-4-5-20250929" )
dspy . settings . configure ( lm = lm )
# Define a signature (input → output)
class QA ( dspy . Signature ) :
"""Answer questions with short factual answers."""
question = dspy . InputField ( )
answer = dspy . OutputField ( desc = "often between 1 and 5 words" )
# Create a module
qa = dspy . Predict ( QA )
# Use it
response = qa ( question = "What is the capital of France?" )
print ( response . answer ) # "Paris"
Chain of Thought Reasoning ​
# Use ChainOfThought for better reasoning
class MathProblem ( dspy . Signature ) :
"""Solve math word problems."""
problem = dspy . InputField ( )
answer = dspy . OutputField ( desc = "numerical answer" )
# ChainOfThought generates reasoning steps automatically
cot = dspy . ChainOfThought ( MathProblem )
response = cot ( problem = "If John has 5 apples and gives 2 to Mary, how many does he have?" )
print ( response . rationale ) # Shows reasoning steps
print ( response . answer ) # "3"
Core Concepts ​
1. Signatures ​
Signatures define the structure of your AI task (inputs → outputs):
# Inline signature (simple)
qa = dspy . Predict ( "question -> answer" )
# Class signature (detailed)
class Summarize ( dspy . Signature ) :
"""Summarize text into key points."""
text = dspy . InputField ( )
summary = dspy . OutputField ( desc = "bullet points, 3-5 items" )
summarizer = dspy . ChainOfThought ( Summarize )
When to use each:
Inline : Quick prototyping, simple tasks
Class : Complex tasks, type hints, better documentation
2. Modules ​
Modules are reusable components that transform inputs to outputs:
dspy.Predict ​
Basic prediction module:
predictor = dspy . Predict ( "context, question -> answer" )
result = predictor ( context = "Paris is the capital of France" ,
question = "What is the capital?" )
dspy.ChainOfThought ​
Generates reasoning steps before answering:
cot = dspy . ChainOfThought ( "question -> answer" )
result = cot ( question = "Why is the sky blue?" )
print ( result . rationale ) # Reasoning steps
print ( result . answer ) # Final answer
dspy.ReAct ​
Agent-like reasoning with tools:
from dspy . predict import ReAct
class SearchQA ( dspy . Signature ) :
"""Answer questions using search."""
answer = dspy . OutputField ( )
def search_tool ( query : str ) - > str :
"""Search Wikipedia."""
# Your search implementation
return results
react = ReAct ( SearchQA , tools = [ search_tool ] )
result = react ( question = "When was Python created?" )
dspy.ProgramOfThought ​
Generates and executes code for reasoning:
pot = dspy . ProgramOfThought ( "question -> answer" )
result = pot ( question = "What is 15% of 240?" )
# Generates: answer = 240 * 0.15
3. Optimizers ​
Optimizers improve your modules automatically using training data:
BootstrapFewShot ​
Learns from examples:
from dspy . teleprompt import BootstrapFewShot
# Training data
trainset = [
dspy . Example ( question = "What is 2+2?" , answer = "4" ) . with_inputs ( "question" ) ,
dspy . Example ( question = "What is 3+5?" , answer = "8" ) . with_inputs ( "question" ) ,
]
# Define metric
def validate_answer ( example , pred , trace = None ) :
return example . answer == pred . answer
# Optimize
optimizer = BootstrapFewShot ( metric = validate_answer , max_bootstrapped_demos = 3 )
optimized_qa = optimizer . compile ( qa , trainset = trainset )
# Now optimized_qa performs better!
MIPRO (Most Important Prompt Optimization) ​
Iteratively improves prompts:
from dspy . teleprompt import MIPRO
optimizer = MIPRO (
metric = validate_answer ,
num_candidates = 10 ,
init_temperature = 1.0
)
optimized_cot = optimizer . compile (
cot ,
trainset = trainset ,
num_trials = 100
BootstrapFinetune ​
Creates datasets for model fine-tuning:
from dspy . teleprompt import BootstrapFinetune
optimizer = BootstrapFinetune ( metric = validate_answer )
optimized_module = optimizer . compile ( qa , trainset = trainset )
# Exports training data for fine-tuning
4. Building Complex Systems ​
Multi-Stage Pipeline ​
class MultiHopQA ( dspy . Module ) :
def __init__ ( self ) :
super ( ) . __init__ ( )
self . retrieve = dspy . Retrieve ( k = 3 )
self . generate_query = dspy . ChainOfThought ( "question -> search_query" )
self . generate_answer = dspy . ChainOfThought ( "context, question -> answer" )
def forward ( self , question ) :
# Stage 1: Generate search query
search_query = self . generate_query ( question = question ) . search_query
# Stage 2: Retrieve context
passages = self . retrieve ( search_query ) . passages
context = "\n" . join ( passages )
# Stage 3: Generate answer
answer = self . generate_answer ( context = context , question = question ) . answer
return dspy . Prediction ( answer = answer , context = context )
# Use the pipeline
qa_system = MultiHopQA ( )
result = qa_system ( question = "Who wrote the book that inspired the movie Blade Runner?" )
RAG System with Optimization ​
from dspy . retrieve . chromadb_rm import ChromadbRM
# Configure retriever
retriever = ChromadbRM (
collection_name = "documents" ,
persist_directory = "./chroma_db"
class RAG ( dspy . Module ) :
def __init__ ( self , num_passages = 3 ) :
self . retrieve = dspy . Retrieve ( k = num_passages )
self . generate = dspy . ChainOfThought ( "context, question -> answer" )
context = self . retrieve ( question ) . passages
return self . generate ( context = context , question = question )
# Create and optimize
rag = RAG ( )
# Optimize with training data
optimizer = BootstrapFewShot ( metric = validate_answer )
optimized_rag = optimizer . compile ( rag , trainset = trainset )
LM Provider Configuration ​
Anthropic Claude ​
lm = dspy . Claude (
model = "claude-sonnet-4-5-20250929" ,
api_key = "your-api-key" , # Or set ANTHROPIC_API_KEY env var
max_tokens = 1000 ,
temperature = 0.7
OpenAI ​
lm = dspy . OpenAI (
model = "gpt-4" ,
api_key = "your-api-key" ,
max_tokens = 1000
Local Models (Ollama) ​
lm = dspy . OllamaLocal (
model = "llama3.1" ,
base_url = "http://localhost:11434"
Multiple Models ​
# Different models for different tasks
cheap_lm = dspy . OpenAI ( model = "gpt-3.5-turbo" )
strong_lm = dspy . Claude ( model = "claude-sonnet-4-5-20250929" )
# Use cheap model for retrieval, strong model for reasoning
with dspy . settings . context ( lm = cheap_lm ) :
context = retriever ( question )
with dspy . settings . context ( lm = strong_lm ) :
answer = generator ( context = context , question = question )
Common Patterns ​
Pattern 1: Structured Output ​
from pydantic import BaseModel , Field
class PersonInfo ( BaseModel ) :
name : str = Field ( description = "Full name" )
age : int = Field ( description = "Age in years" )
occupation : str = Field ( description = "Current job" )
class ExtractPerson ( dspy . Signature ) :
"""Extract person information from text."""
person : PersonInfo = dspy . OutputField ( )
extractor = dspy . TypedPredictor ( ExtractPerson )
result = extractor ( text = "John Doe is a 35-year-old software engineer." )
print ( result . person . name ) # "John Doe"
print ( result . person . age ) # 35
Pattern 2: Assertion-Driven Optimization ​
from dspy . primitives . assertions import assert_transform_module , backtrack_handler
class MathQA ( dspy . Module ) :
self . solve = dspy . ChainOfThought ( "problem -> solution: float" )
def forward ( self , problem ) :
solution = self . solve ( problem = problem ) . solution
# Assert solution is numeric
dspy . Assert (
isinstance ( float ( solution ) , float ) ,
"Solution must be a number" ,
backtrack = backtrack_handler
return dspy . Prediction ( solution = solution )
Pattern 3: Self-Consistency ​
from collections import Counter
class ConsistentQA ( dspy . Module ) :
def __init__ ( self , num_samples = 5 ) :
self . qa = dspy . ChainOfThought ( "question -> answer" )
self . num_samples = num_samples
# Generate multiple answers
answers = [ ]
for _ in range ( self . num_samples ) :
result = self . qa ( question = question )
answers . append ( result . answer )
# Return most common answer
most_common = Counter ( answers ) . most_common ( 1 ) [ 0 ] [ 0 ]
return dspy . Prediction ( answer = most_common )
Pattern 4: Retrieval with Reranking ​
class RerankedRAG ( dspy . Module ) :
self . retrieve = dspy . Retrieve ( k = 10 )
self . rerank = dspy . Predict ( "question, passage -> relevance_score: float" )
self . answer = dspy . ChainOfThought ( "context, question -> answer" )
# Retrieve candidates
passages = self . retrieve ( question ) . passages
# Rerank passages
scored = [ ]
for passage in passages :
score = float ( self . rerank ( question = question , passage = passage ) . relevance_score )
scored . append ( ( score , passage ) )
# Take top 3
top_passages = [ p for _ , p in sorted ( scored , reverse = True ) [ : 3 ] ]
context = "\n\n" . join ( top_passages )
# Generate answer
return self . answer ( context = context , question = question )
Evaluation and Metrics ​
Custom Metrics ​
def exact_match ( example , pred , trace = None ) :
"""Exact match metric."""
return example . answer . lower ( ) == pred . answer . lower ( )
def f1_score ( example , pred , trace = None ) :
"""F1 score for text overlap."""
pred_tokens = set ( pred . answer . lower ( ) . split ( ) )
gold_tokens = set ( example . answer . lower ( ) . split ( ) )
if not pred_tokens :
return 0.0
precision = len ( pred_tokens & gold_tokens ) / len ( pred_tokens )
recall = len ( pred_tokens & gold_tokens ) / len ( gold_tokens )
if precision + recall == 0 :
return 2 * ( precision * recall ) / ( precision + recall )
Evaluation ​
from dspy . evaluate import Evaluate
# Create evaluator
evaluator = Evaluate (
devset = testset ,
metric = exact_match ,
num_threads = 4 ,
display_progress = True
# Evaluate model
score = evaluator ( qa_system )
print ( f"Accuracy: { score } " )
# Compare optimized vs unoptimized
score_before = evaluator ( qa )
score_after = evaluator ( optimized_qa )
print ( f"Improvement: { score_after - score_before : .2% } " )
Best Practices ​
1. Start Simple, Iterate ​
# Start with Predict
# Add reasoning if needed
qa = dspy . ChainOfThought ( "question -> answer" )
# Add optimization when you have data
optimized_qa = optimizer . compile ( qa , trainset = data )
2. Use Descriptive Signatures ​
# ❌ Bad: Vague
class Task ( dspy . Signature ) :
input = dspy . InputField ( )
output = dspy . OutputField ( )
# ✅ Good: Descriptive
class SummarizeArticle ( dspy . Signature ) :
"""Summarize news articles into 3-5 key points."""
article = dspy . InputField ( desc = "full article text" )
3. Optimize with Representative Data ​
# Create diverse training examples
dspy . Example ( question = "factual" , answer = "...).with_inputs(" question" ) ,
dspy . Example ( question = "reasoning" , answer = "..." ) . with_inputs ( "question" ) ,
dspy . Example ( question = "calculation" , answer = "..." ) . with_inputs ( "question" ) ,
# Use validation set for metric
def metric ( example , pred , trace = None ) :
return example . answer in pred . answer
4. Save and Load Optimized Models ​
# Save
optimized_qa . save ( "models/qa_v1.json" )
# Load
loaded_qa = dspy . ChainOfThought ( "question -> answer" )
loaded_qa . load ( "models/qa_v1.json" )
5. Monitor and Debug ​
# Enable tracing
dspy . settings . configure ( lm = lm , trace = [ ] )
# Run prediction
result = qa ( question = "..." )
# Inspect trace
for call in dspy . settings . trace :
print ( f"Prompt: { call [ 'prompt' ] } " )
print ( f"Response: { call [ 'response' ] } " )
Comparison to Other Approaches ​
Feature Manual Prompting LangChain DSPy Prompt Engineering Manual Manual Automatic Optimization Trial & error None Data-driven Modularity Low Medium High Type Safety No Limited Yes (Signatures) Portability Low Medium High Learning Curve Low Medium Medium-High
When to choose DSPy:
You have training data or can generate it
You need systematic prompt improvement
You're building complex multi-stage systems
You want to optimize across different LMs
When to choose alternatives:
Quick prototypes (manual prompting)
Simple chains with existing tools (LangChain)
Custom optimization logic needed
Resources ​
Documentation : https://dspy.ai
GitHub : https://github.com/stanfordnlp/dspy (22k+ stars)
Discord : https://discord.gg/XCGy2WDCQB
Twitter : @DSPyOSS
Paper : "DSPy: Compiling Declarative Language Model Calls into Self-Improving Pipelines"
See Also ​
references/modules.md - Detailed module guide (Predict, ChainOfThought, ReAct, ProgramOfThought)
references/optimizers.md - Optimization algorithms (BootstrapFewShot, MIPRO, BootstrapFinetune)
references/examples.md - Real-world examples (RAG, agents, classifiers)
Skill metadata
Reference: full SKILL.md
When to Use This Skill
Installation
Quick Start
Basic Example: Question Answering
Chain of Thought Reasoning
Core Concepts
1. Signatures
2. Modules
3. Optimizers
4. Building Complex Systems
LM Provider Configuration
Anthropic Claude
OpenAI
Local Models (Ollama)
Multiple Models
Common Patterns
Pattern 1: Structured Output
Pattern 2: Assertion-Driven Optimization
Pattern 3: Self-Consistency
Pattern 4: Retrieval with Reranking
Evaluation and Metrics
Custom Metrics
Evaluation
Best Practices
1. Start Simple, Iterate
2. Use Descriptive Signatures
3. Optimize with Representative Data
4. Save and Load Optimized Models
5. Monitor and Debug
Comparison to Other Approaches
Resources
See Also
