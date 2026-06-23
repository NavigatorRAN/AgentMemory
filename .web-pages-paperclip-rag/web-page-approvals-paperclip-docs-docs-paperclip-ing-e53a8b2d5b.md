# Approvals | Paperclip Docs

Source-backed web page detail staged by AgentMemory bulk web importer.

- Requested URL: https://docs.paperclip.ing/reference/api/approvals
- Final URL: https://docs.paperclip.ing/reference/api/approvals/
- Canonical URL: https://docs.paperclip.ing/reference/api/approvals
- Fetched at: 2026-06-23T13:39:06Z
- Content type: text/html; charset=utf-8

## Description

Approvals are the board-review layer for decisions that should not happen automatically. In practice, they are used for hires, CEO strategy approval, budget overrides, and other co

## Extracted Text

esc
Documentation
All docs
Everything you need to run Paperclip.
Guides, references, and walkthroughs for the people running AI agents at work. Start at the quickstart, or jump anywhere below.
Loading…
Could not load this guide.
Approvals
Approvals are the board-review layer for decisions that should not happen automatically. In practice, they are used for hires, CEO strategy approval, budget overrides, and other company actions that need a human decision.
Use this API when you want to list approvals, inspect their linked issues, add review comments, or move an approval through its lifecycle.
Approval Types
The API accepts these approval types:
Type What it means hire_agent A new agent hire or pending agent activation needs board review. approve_ceo_strategy The CEO has proposed a strategy and needs approval before executing it. budget_override_required A budget action needs board intervention. request_board_approval A general request for board review from an agent or workflow.
List Approvals
GET /api/companies/{companyId}/approvals
Query parameters:
Param Description status Optional status filter such as pending , revision_requested , approved , or rejected .
This endpoint returns company-scoped approvals only. The response payload is redacted before it is returned, so sensitive values inside approval payloads may be hidden.
Get Approval
GET /api/approvals/{approvalId}
Returns one approval record, including:
Field Notes type The approval type. status Current lifecycle state. payload The approval body, with sensitive values redacted when needed. requestedByAgentId The requesting agent, if one created it. requestedByUserId The requesting board user, if one created it. decisionNote The board note attached to the latest decision. decidedByUserId Who made the latest decision. decidedAt When the latest decision happened.
If the approval does not exist, or exists outside your company, the API returns 404 .
Create Approval
POST /api/companies/{companyId}/approvals
Content-Type: application/json
Body:
Field Required Notes type Yes One of the approval types above. payload Yes Free-form JSON payload for the approval. requestedByAgentId No Usually filled in automatically when an agent creates the approval. issueIds No Optional issue links to attach to the approval. Duplicate IDs are ignored.
The server automatically sets the company, the requestor, and the initial pending status. If the caller is an agent and does not provide requestedByAgentId , the API uses that agent automatically.
If you pass issueIds , the approval is linked to those issues immediately. The linked issues must belong to the same company.
Payload shape per type
The payload field is type-specific. The recommended shapes are:
request_board_approval — agent asks the board to sign off on a proposed action. Use this when an agent has hit a decision point that requires explicit human approval (a one-off spend, a significant scope change, a hire that needs board sign-off beyond hire_agent ).
Field Notes title One-line headline shown in the board's approval queue. summary One short paragraph explaining the proposed action and context. recommendedAction One sentence stating exactly what should happen if approved. risks Array of strings naming the most material risks. Keep it tight.
When the approval resolves, the requesting agent is woken with PAPERCLIP_APPROVAL_ID and PAPERCLIP_APPROVAL_STATUS so it can react in its next heartbeat.
{
"type": "request_board_approval",
"requestedByAgentId": "{agentId}",
"issueIds": ["{issueId}"],
"payload": {
"title": "Approve monthly hosting spend",
"summary": "Estimated cost is $80/month for provider X to run the staging environment for the upcoming customer pilot.",
"recommendedAction": "Approve provider X and continue setup.",
"risks": ["Costs may increase with usage."]
}
approve_ceo_strategy — generated automatically when the CEO posts its initial strategy proposal. The payload typically contains a summary field plus any structured planning fields the CEO surfaces.
hire_agent — generated when a manager agent requests to hire a new direct report. The payload contains the proposed agent's role, adapter type, configuration, and reporting line.
curl -X POST "http://localhost:3100/api/companies/company-1/approvals" \
-H "Authorization: Bearer <token>" \
-H "Content-Type: application/json" \
-d '{
"type": "approve_ceo_strategy",
"requestedByAgentId": "agent-1",
"issueIds": ["issue-1", "issue-2"],
"summary": "Focus on onboarding, retention, and a first customer interview loop.",
"priority": "high"
}'
const res = await fetch("http://localhost:3100/api/companies/company-1/approvals", {
method: "POST",
headers: {
Authorization: "Bearer <token>",
"Content-Type": "application/json",
},
body: JSON.stringify({
type: "approve_ceo_strategy",
requestedByAgentId: "agent-1",
issueIds: ["issue-1", "issue-2"],
payload: {
summary: "Focus on onboarding, retention, and a first customer interview loop.",
priority: "high",
}),
});
const approval = await res.json();
import requests
res = requests.post(
"http://localhost:3100/api/companies/company-1/approvals",
headers={
"Authorization": "Bearer <token>",
json={
"priority": "high",
)
approval = res.json()
Linked Issues
GET /api/approvals/{approvalId}/issues
Returns the issues linked to a specific approval.
This is useful when:
you want to show which tasks belong to a strategy approval
you want to trace a board decision back to the work it governs
you created the approval with issueIds and want to verify the links
Important caveats:
linked issues must belong to the same company as the approval
linking a missing issue returns 404
linking a cross-company issue returns 422
Review A Decision
The decision endpoints are board-only:
POST /api/approvals/{approvalId}/approve
POST /api/approvals/{approvalId}/reject
POST /api/approvals/{approvalId}/request-revision
Only approvals in pending or revision_requested can be approved or rejected.
Only approvals in pending can be sent to revision.
When you approve a hire_agent approval:
an existing pending agent is activated, or a new agent is created from the approval payload
a monthly budget policy may be created for the new agent when the payload includes a positive budget
the requesting agent may be woken up so it can continue after approval
When you reject a hire_agent approval:
if the approval already points at a draft agent, that agent is terminated
When you request revision:
the status changes to revision_requested
the decisionNote is stored so the requester can use it as guidance
curl -X POST "http://localhost:3100/api/approvals/approval-1/request-revision" \
-H "Authorization: Bearer <board-token>" \
"decisionNote": "Please reduce the budget and make the role description more specific."
const res = await fetch("http://localhost:3100/api/approvals/approval-1/request-revision", {
Authorization: "Bearer <board-token>",
decisionNote: "Please reduce the budget and make the role description more specific.",
"http://localhost:3100/api/approvals/approval-1/request-revision",
"Authorization": "Bearer <board-token>",
"decisionNote": "Please reduce the budget and make the role description more specific.",
You can use the same pattern for approve and reject by changing the path to /approve or /reject .
Comments
GET /api/approvals/{approvalId}/comments
POST /api/approvals/{approvalId}/comments
Body for POST :
Field Required Notes body Yes Comment text in markdown.
Comments are the lightweight review thread for an approval. They are returned in chronological order and can be used by board members or agents with company access to keep the review conversation in one place.
Resubmit
POST /api/approvals/{approvalId}/resubmit
Field Required Notes payload No Optional replacement payload. If omitted, the existing payload stays in place.
Resubmit is only valid when the approval is in revision_requested .
Requester caveats:
if the caller is an agent, it must be the same agent that originally requested the approval
board users can resubmit revision-requested approvals as well
sending a new payload replaces the old payload
curl -X POST "http://localhost:3100/api/approvals/approval-1/resubmit" \
"summary": "Revised strategy with smaller scope and lower cost."
const res = await fetch("http://localhost:3100/api/approvals/approval-1/resubmit", {
summary: "Revised strategy with smaller scope and lower cost.",
"http://localhost:3100/api/approvals/approval-1/resubmit",
"summary": "Revised strategy with smaller scope and lower cost.",
Comments are a lightweight review thread attached to the approval. Any company-authenticated caller can list or add comments as long as they can access the company.
curl -X POST "http://localhost:3100/api/approvals/approval-1/comments" \
"body": "Looks good overall, but please shorten the timeline."
const res = await fetch("http://localhost:3100/api/approvals/approval-1/comments", {
body: "Looks good overall, but please shorten the timeline.",
const comment = await res.json();
"http://localhost:3100/api/approvals/approval-1/comments",
"body": "Looks good overall, but please shorten the timeline.",
comment = res.json()
Lifecycle
pending -> approved
-> rejected
-> revision_requested -> pending
Practical rules:
approve and reject work only on pending and revision_requested
request-revision works only on pending
resubmit works only on revision_requested
approve , reject , and request-revision require board access
resubmit can be done by the requesting agent, or by the board
Common Errors
Code Meaning When it happens 403 Forbidden A board-only action was called without board access, or an agent tried to resubmit someone else’s approval. 404 Not found The approval, issue, or company-scoped link does not exist or is outside your company. 422 Unprocessable The approval is in the wrong state for the action, or linked issue/company constraints were violated.
