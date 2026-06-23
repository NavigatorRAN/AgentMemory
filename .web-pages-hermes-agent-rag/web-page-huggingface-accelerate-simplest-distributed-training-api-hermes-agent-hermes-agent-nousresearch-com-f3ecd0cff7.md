# Huggingface Accelerate — Simplest distributed training API | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-accelerate
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-accelerate
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/mlops/mlops-accelerate
- Fetched at: 2026-06-23T14:19:48Z
- Content type: text/html; charset=utf-8

## Description

Simplest distributed training API

## Extracted Text

Skip to main content
On this page
Simplest distributed training API. 4 lines to add distributed support to any PyTorch script. Unified API for DeepSpeed/FSDP/Megatron/DDP. Automatic device placement, mixed precision (FP16/BF16/FP8). Interactive config, single launch command. HuggingFace ecosystem standard.
Skill metadata ​
Source Optional — install with hermes skills install official/mlops/accelerate Path optional-skills/mlops/accelerate Version 1.0.0 Author Orchestra Research License MIT Dependencies accelerate , torch , transformers Platforms linux, macos, windows Tags Distributed Training , HuggingFace , Accelerate , DeepSpeed , FSDP , Mixed Precision , PyTorch , DDP , Unified API , Simple
Reference: full SKILL.md ​
info
The following is the complete skill definition that Hermes loads when this skill is triggered. This is what the agent sees as instructions when the skill is active.
HuggingFace Accelerate - Unified Distributed Training
Quick start ​
Accelerate simplifies distributed training to 4 lines of code.
Installation :
pip install accelerate
Convert PyTorch script (4 lines):
import torch
+ from accelerate import Accelerator
+ accelerator = Accelerator ( )
model = torch . nn . Transformer ( )
optimizer = torch . optim . Adam ( model . parameters ( ) )
dataloader = torch . utils . data . DataLoader ( dataset )
+ model , optimizer , dataloader = accelerator . prepare ( model , optimizer , dataloader )
for batch in dataloader :
optimizer . zero_grad ( )
loss = model ( batch )
- loss . backward ( )
+ accelerator . backward ( loss )
optimizer . step ( )
Run (single command):
accelerate launch train.py
Common workflows ​
Workflow 1: From single GPU to multi-GPU ​
Original script :
# train.py
model = torch . nn . Linear ( 10 , 2 ) . to ( 'cuda' )
dataloader = torch . utils . data . DataLoader ( dataset , batch_size = 32 )
for epoch in range ( 10 ) :
batch = batch . to ( 'cuda' )
loss = model ( batch ) . mean ( )
loss . backward ( )
With Accelerate (4 lines added):
from accelerate import Accelerator # +1
accelerator = Accelerator ( ) # +2
model = torch . nn . Linear ( 10 , 2 )
model , optimizer , dataloader = accelerator . prepare ( model , optimizer , dataloader ) # +3
# No .to('cuda') needed - automatic!
accelerator . backward ( loss ) # +4
Configure (interactive):
accelerate config
Questions :
Which machine? (single/multi GPU/TPU/CPU)
How many machines? (1)
Mixed precision? (no/fp16/bf16/fp8)
DeepSpeed? (no/yes)
Launch (works on any setup):
# Single GPU
# Multi-GPU (8 GPUs)
accelerate launch --multi_gpu --num_processes 8 train.py
# Multi-node
accelerate launch --multi_gpu --num_processes 16 \
--num_machines 2 --machine_rank 0 \
--main_process_ip $MASTER_ADDR \
train.py
Workflow 2: Mixed precision training ​
Enable FP16/BF16 :
from accelerate import Accelerator
# FP16 (with gradient scaling)
accelerator = Accelerator ( mixed_precision = 'fp16' )
# BF16 (no scaling, more stable)
accelerator = Accelerator ( mixed_precision = 'bf16' )
# FP8 (H100+)
accelerator = Accelerator ( mixed_precision = 'fp8' )
model , optimizer , dataloader = accelerator . prepare ( model , optimizer , dataloader )
# Everything else is automatic!
with accelerator . autocast ( ) : # Optional, done automatically
accelerator . backward ( loss )
Workflow 3: DeepSpeed ZeRO integration ​
Enable DeepSpeed ZeRO-2 :
accelerator = Accelerator (
mixed_precision = 'bf16' ,
deepspeed_plugin = {
"zero_stage" : 2 , # ZeRO-2
"offload_optimizer" : False ,
"gradient_accumulation_steps" : 4
}
)
# Same code as before!
Or via config :
# Select: DeepSpeed → ZeRO-2
deepspeed_config.json :
{
"fp16" : { "enabled" : false } ,
"bf16" : { "enabled" : true } ,
"zero_optimization" : {
"stage" : 2 ,
"offload_optimizer" : { "device" : "cpu" } ,
"allgather_bucket_size" : 5e8 ,
"reduce_bucket_size" : 5e8
Launch :
accelerate launch --config_file deepspeed_config.json train.py
Workflow 4: FSDP (Fully Sharded Data Parallel) ​
Enable FSDP :
from accelerate import Accelerator , FullyShardedDataParallelPlugin
fsdp_plugin = FullyShardedDataParallelPlugin (
sharding_strategy = "FULL_SHARD" , # ZeRO-3 equivalent
auto_wrap_policy = "TRANSFORMER_AUTO_WRAP" ,
cpu_offload = False
fsdp_plugin = fsdp_plugin
# Select: FSDP → Full Shard → No CPU Offload
Workflow 5: Gradient accumulation ​
Accumulate gradients :
accelerator = Accelerator ( gradient_accumulation_steps = 4 )
with accelerator . accumulate ( model ) : # Handles accumulation
Effective batch size : batch_size * num_gpus * gradient_accumulation_steps
When to use vs alternatives ​
Use Accelerate when :
Want simplest distributed training
Need single script for any hardware
Use HuggingFace ecosystem
Want flexibility (DDP/DeepSpeed/FSDP/Megatron)
Need quick prototyping
Key advantages :
4 lines : Minimal code changes
Unified API : Same code for DDP, DeepSpeed, FSDP, Megatron
Automatic : Device placement, mixed precision, sharding
Interactive config : No manual launcher setup
Single launch : Works everywhere
Use alternatives instead :
PyTorch Lightning : Need callbacks, high-level abstractions
Ray Train : Multi-node orchestration, hyperparameter tuning
DeepSpeed : Direct API control, advanced features
Raw DDP : Maximum control, minimal abstraction
Common issues ​
Issue: Wrong device placement
Don't manually move to device:
# WRONG
# CORRECT
# Accelerate handles it automatically after prepare()
Issue: Gradient accumulation not working
Use context manager:
with accelerator . accumulate ( model ) :
Issue: Checkpointing in distributed
Use accelerator methods:
# Save only on main process
if accelerator . is_main_process :
accelerator . save_state ( 'checkpoint/' )
# Load on all processes
accelerator . load_state ( 'checkpoint/' )
Issue: Different results with FSDP
Ensure same random seed:
from accelerate . utils import set_seed
set_seed ( 42 )
Advanced topics ​
Megatron integration : See references/megatron-integration.md for tensor parallelism, pipeline parallelism, and sequence parallelism setup.
Custom plugins : See references/custom-plugins.md for creating custom distributed plugins and advanced configuration.
Performance tuning : See references/performance.md for profiling, memory optimization, and best practices.
Hardware requirements ​
CPU : Works (slow)
Single GPU : Works
Multi-GPU : DDP (default), DeepSpeed, or FSDP
Multi-node : DDP, DeepSpeed, FSDP, Megatron
TPU : Supported
Apple MPS : Supported
Launcher requirements :
DDP : torch.distributed.run (built-in)
DeepSpeed : deepspeed (pip install deepspeed)
FSDP : PyTorch 1.12+ (built-in)
Megatron : Custom setup
Resources ​
Docs: https://huggingface.co/docs/accelerate
GitHub: https://github.com/huggingface/accelerate
Version: 1.11.0+
Tutorial: "Accelerate your scripts"
Examples: https://github.com/huggingface/accelerate/tree/main/examples
Used by: HuggingFace Transformers, TRL, PEFT, all HF libraries
Skill metadata
Reference: full SKILL.md
Quick start
Common workflows
Workflow 1: From single GPU to multi-GPU
Workflow 2: Mixed precision training
Workflow 3: DeepSpeed ZeRO integration
Workflow 4: FSDP (Fully Sharded Data Parallel)
Workflow 5: Gradient accumulation
When to use vs alternatives
Common issues
Advanced topics
Hardware requirements
Resources
