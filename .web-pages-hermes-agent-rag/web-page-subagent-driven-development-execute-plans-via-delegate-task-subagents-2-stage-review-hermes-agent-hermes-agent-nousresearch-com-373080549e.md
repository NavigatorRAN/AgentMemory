# Subagent Driven Development — Execute plans via delegate_task subagents (2-stage review) | Hermes Agent

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/software-development/software-development-subagent-driven-development
- Final URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/software-development/software-development-subagent-driven-development
- Canonical URL: https://hermes-agent.nousresearch.com/docs/user-guide/skills/optional/software-development/software-development-subagent-driven-development
- Fetched at: 2026-06-23T14:20:51Z
- Content type: text/html; charset=utf-8

## Description

Execute plans via delegate_task subagents (2-stage review)

## Extracted Text

Skip to main content
On this page
Execute plans via delegate_task subagents (2-stage review).
Skill metadata ​
Source Optional — install with hermes skills install official/software-development/subagent-driven-development Path optional-skills/software-development/subagent-driven-development Version 1.1.0 Author Hermes Agent (adapted from obra/superpowers) License MIT Platforms linux, macos, windows Tags delegation , subagent , implementation , workflow , parallel Related skills plan , requesting-code-review , test-driven-development
Reference: full SKILL.md ​
info
The following is the complete skill definition that Hermes loads when this skill is triggered. This is what the agent sees as instructions when the skill is active.
Subagent-Driven Development
Overview ​
Execute implementation plans by dispatching fresh subagents per task with systematic two-stage review.
Core principle: Fresh subagent per task + two-stage review (spec then quality) = high quality, fast iteration.
When to Use ​
Use this skill when:
You have an implementation plan (from the plan skill or user requirements)
Tasks are mostly independent
Quality and spec compliance are important
You want automated review between tasks
vs. manual execution:
Fresh context per task (no confusion from accumulated state)
Automated review process catches issues early
Consistent quality checks across all tasks
Subagents can ask questions before starting work
The Process ​
1. Read and Parse Plan ​
Read the plan file. Extract ALL tasks with their full text and context upfront. Create a todo list:
# Read the plan
read_file ( "docs/plans/feature-plan.md" )
# Create todo list with all tasks
todo ( [
{ "id" : "task-1" , "content" : "Create User model with email field" , "status" : "pending" } ,
{ "id" : "task-2" , "content" : "Add password hashing utility" , "status" : "pending" } ,
{ "id" : "task-3" , "content" : "Create login endpoint" , "status" : "pending" } ,
] )
Key: Read the plan ONCE. Extract everything. Don't make subagents read the plan file — provide the full task text directly in context.
2. Per-Task Workflow ​
For EACH task in the plan:
Step 1: Dispatch Implementer Subagent ​
Use delegate_task with complete context:
delegate_task (
goal = "Implement Task 1: Create User model with email and password_hash fields" ,
context = """
TASK FROM PLAN:
- Create: src/models/user.py
- Add User class with email (str) and password_hash (str) fields
- Use bcrypt for password hashing
- Include __repr__ for debugging
FOLLOW TDD:
1. Write failing test in tests/models/test_user.py
2. Run: pytest tests/models/test_user.py -v (verify FAIL)
3. Write minimal implementation
4. Run: pytest tests/models/test_user.py -v (verify PASS)
5. Run: pytest tests/ -q (verify no regressions)
6. Commit: git add -A && git commit -m "feat: add User model with password hashing"
PROJECT CONTEXT:
- Python 3.11, Flask app in src/app.py
- Existing models in src/models/
- Tests use pytest, run from project root
- bcrypt already in requirements.txt
""" ,
toolsets = [ 'terminal' , 'file' ]
)
Step 2: Dispatch Spec Compliance Reviewer ​
After the implementer completes, verify against the original spec:
goal = "Review if implementation matches the spec from the plan" ,
ORIGINAL TASK SPEC:
- Create src/models/user.py with User class
- Fields: email (str), password_hash (str)
- Include __repr__
CHECK:
- [ ] All requirements from spec implemented?
- [ ] File paths match spec?
- [ ] Function signatures match spec?
- [ ] Behavior matches expected?
- [ ] Nothing extra added (no scope creep)?
OUTPUT: PASS or list of specific spec gaps to fix.
toolsets = [ 'file' ]
If spec issues found: Fix gaps, then re-run spec review. Continue only when spec-compliant.
Step 3: Dispatch Code Quality Reviewer ​
After spec compliance passes:
goal = "Review code quality for Task 1 implementation" ,
FILES TO REVIEW:
- src/models/user.py
- tests/models/test_user.py
- [ ] Follows project conventions and style?
- [ ] Proper error handling?
- [ ] Clear variable/function names?
- [ ] Adequate test coverage?
- [ ] No obvious bugs or missed edge cases?
- [ ] No security issues?
OUTPUT FORMAT:
- Critical Issues: [must fix before proceeding]
- Important Issues: [should fix]
- Minor Issues: [optional]
- Verdict: APPROVED or REQUEST_CHANGES
If quality issues found: Fix issues, re-review. Continue only when approved.
Step 4: Mark Complete ​
todo ( [ { "id" : "task-1" , "content" : "Create User model with email field" , "status" : "completed" } ] , merge = True )
3. Final Review ​
After ALL tasks are complete, dispatch a final integration reviewer:
goal = "Review the entire implementation for consistency and integration issues" ,
All tasks from the plan are complete. Review the full implementation:
- Do all components work together?
- Any inconsistencies between tasks?
- All tests passing?
- Ready for merge?
4. Verify and Commit ​
# Run full test suite
pytest tests/ -q
# Review all changes
git diff --stat
# Final commit if needed
git add -A && git commit -m "feat: complete [feature name] implementation"
Task Granularity ​
Each task = 2-5 minutes of focused work.
Too big:
"Implement user authentication system"
Right size:
"Create User model with email and password fields"
"Add password hashing function"
"Create login endpoint"
"Add JWT token generation"
"Create registration endpoint"
Red Flags — Never Do These ​
Start implementation without a plan
Skip reviews (spec compliance OR code quality)
Proceed with unfixed critical/important issues
Dispatch multiple implementation subagents for tasks that touch the same files
Make subagent read the plan file (provide full text in context instead)
Skip scene-setting context (subagent needs to understand where the task fits)
Ignore subagent questions (answer before letting them proceed)
Accept "close enough" on spec compliance
Skip review loops (reviewer found issues → implementer fixes → review again)
Let implementer self-review replace actual review (both are needed)
Start code quality review before spec compliance is PASS (wrong order)
Move to next task while either review has open issues
Handling Issues ​
If Subagent Asks Questions ​
Answer clearly and completely
Provide additional context if needed
Don't rush them into implementation
If Reviewer Finds Issues ​
Implementer subagent (or a new one) fixes them
Reviewer reviews again
Repeat until approved
Don't skip the re-review
If Subagent Fails a Task ​
Dispatch a new fix subagent with specific instructions about what went wrong
Don't try to fix manually in the controller session (context pollution)
Efficiency Notes ​
Why fresh subagent per task:
Prevents context pollution from accumulated state
Each subagent gets clean, focused context
No confusion from prior tasks' code or reasoning
Why two-stage review:
Spec review catches under/over-building early
Quality review ensures the implementation is well-built
Catches issues before they compound across tasks
Cost trade-off:
More subagent invocations (implementer + 2 reviewers per task)
But catches issues early (cheaper than debugging compounded problems later)
Integration with Other Skills ​
With plan ​
This skill EXECUTES plans created by the plan skill:
User requirements → plan → implementation plan
Implementation plan → subagent-driven-development → working code
With test-driven-development ​
Implementer subagents should follow TDD:
Write failing test first
Implement minimal code
Verify test passes
Commit
Include TDD instructions in every implementer context.
With requesting-code-review ​
The two-stage review process IS the code review. For final integration review, use the requesting-code-review skill's review dimensions.
With systematic-debugging ​
If a subagent encounters bugs during implementation:
Follow systematic-debugging process
Find root cause before fixing
Write regression test
Resume implementation
Example Workflow ​
[Read plan: docs/plans/auth-feature.md]
[Create todo list with 5 tasks]
--- Task 1: Create User model ---
[Dispatch implementer subagent]
Implementer: "Should email be unique?"
You: "Yes, email must be unique"
Implementer: Implemented, 3/3 tests passing, committed.
[Dispatch spec reviewer]
Spec reviewer: ✅ PASS — all requirements met
[Dispatch quality reviewer]
Quality reviewer: ✅ APPROVED — clean code, good tests
[Mark Task 1 complete]
--- Task 2: Password hashing ---
Implementer: No questions, implemented, 5/5 tests passing.
Spec reviewer: ❌ Missing: password strength validation (spec says "min 8 chars")
[Implementer fixes]
Implementer: Added validation, 7/7 tests passing.
[Dispatch spec reviewer again]
Spec reviewer: ✅ PASS
Quality reviewer: Important: Magic number 8, extract to constant
Implementer: Extracted MIN_PASSWORD_LENGTH constant
Quality reviewer: ✅ APPROVED
[Mark Task 2 complete]
... (continue for all tasks)
[After all tasks: dispatch final integration reviewer]
[Run full test suite: all passing]
[Done!]
Remember ​
Fresh subagent per task
Two-stage review every time
Spec compliance FIRST
Code quality SECOND
Never skip reviews
Catch issues early
Quality is not an accident. It's the result of systematic process.
Further reading (load when relevant) ​
When the orchestration involves significant context usage, long review loops, or complex validation checkpoints, load these references for the specific discipline:
references/context-budget-discipline.md — Four-tier context degradation model (PEAK / GOOD / DEGRADING / POOR), read-depth rules that scale with context window size, and early warning signs of silent degradation. Load when a run will clearly consume significant context (multi-phase plans, many subagents, large artifacts).
references/gates-taxonomy.md — The four canonical gate types (Pre-flight, Revision, Escalation, Abort) with behavior, recovery, and examples. Load when designing or reviewing any workflow that has validation checkpoints — use the vocabulary explicitly so each gate has defined entry, failure behavior, and resumption rules.
Both references adapted from gsd-build/get-shit-done (MIT © 2025 Lex Christopherson).
Skill metadata
Reference: full SKILL.md
Overview
When to Use
The Process
1. Read and Parse Plan
2. Per-Task Workflow
3. Final Review
4. Verify and Commit
Task Granularity
Red Flags — Never Do These
Handling Issues
If Subagent Asks Questions
If Reviewer Finds Issues
If Subagent Fails a Task
Efficiency Notes
Integration with Other Skills
With plan
With test-driven-development
With requesting-code-review
With systematic-debugging
Example Workflow
Remember
Further reading (load when relevant)
