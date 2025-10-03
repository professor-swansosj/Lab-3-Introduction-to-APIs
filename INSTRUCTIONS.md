# Instructions — Lab 3 — Introduction to APIs

## Objectives
- Define what an API is and why HTTP APIs matter for modern software and networking.
- Identify URL, method, headers, body, and status code in HTTP requests/responses.
- Use cURL to make GET requests (plain + JSON), enable verbose output, and redirect to files.
- Pretty-print and summarize JSON responses for human-readable artifacts.
- Use Postman to build requests, save a collection, and compare cURL vs Postman.
- Explain API authentication and demonstrate 401 vs 200 with a bearer token example.

## Prerequisites
- Python 3.11 (via the provided dev container)
- Accounts: GitHub
- Devices/Sandboxes: Public APIs (Dad Jokes, Deck of Cards)

## Overview
Learn API fundamentals using cURL and Postman. Practice plain vs JSON responses, verbose headers/status inspection, multi-step workflows with Deck of Cards, and a simple auth demo. Produce clean artifacts (raw outputs, pretty JSON, summaries, screenshots) and a Postman collection—skills you’ll reuse with Python `requests` in later labs.


> **Before you begin:** Ensure the dev container opens and network access works (DNS + HTTPS). Confirm `curl` and `jq` versions; install `jq` if needed. Sign into Postman (desktop or web).


## Resources
- [Dad Jokes API](https://icanhazdadjoke.com/api) — Use Accept: application/json for JSON output.- [Deck of Cards API](https://deckofcardsapi.com/) — Create deck, then draw using the same deck_id.- [curl docs](https://curl.se/docs/manpage.html) — Flags: -v (verbose), -i (headers), -H (header), -o (output).- [HTTP status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)- [jq](https://stedolan.github.io/jq/)- [Postman](https://www.postman.com/)
## Deliverables
- Consistent README with objectives, deliverables, grading, troubleshooting.
- Stepwise instructions using cURL and Postman; logs + artifacts present.
- Grading: **75 points**

Follow these steps in order.

> **Logging Requirement:** Write progress to `logs/curl_activity.log` as you complete each step.

## Step 1 — Clone the Repository
**Goal:** Get your Classroom repo locally.

**What to do:**  
Clone and `cd` into the repo.

**You’re done when:**  
You’re in the repo folder and `git status` is clean.

**Log marker to add:**  
`[LAB3_START]`

## Step 2 — Open a Dev Container
**Goal:** Use the standardized environment.

**What to do:**  
Reopen in container; wait for install to complete.

**You’re done when:**  
Dev container status shows READY; tools run.

**Log marker to add:**  
`[[STEP 2] Dev Container Started]`

## Step 3 — Install & Verify Tools
**Goal:** Ensure `curl` and `jq` run; Postman installed.

**What to do:**  
Check versions; install `jq` if missing; sign into Postman.

**You’re done when:**  
Log shows TOOL_OK: curl and TOOL_OK: jq.

**Log marker to add:**  
`[TOOL_OK]`

## Step 4 — Warm-up: What is an HTTP API?
**Goal:** Identify URL/method/headers/body/status.

**What to do:**  
Pick any public API and write down the parts (theory only).

**You’re done when:**  
You can name all five parts.

**Log marker to add:**  
`[THEORY_OK]`

## Step 5 — cURL #1 — Dad Jokes (plain)
**Goal:** Make a simple GET.

**What to do:**  
Call Dad Jokes with no headers; save to `data/raw/dadjoke_plain.txt`.

**You’re done when:**  
File exists and is non-empty.

**Log marker to add:**  
`[REQUEST_OK: dadjoke_plain]`

## Step 6 — cURL #2 — JSON
**Goal:** Request JSON with Accept header.

**What to do:**  
Add `-H 'Accept: application/json'`; save to `data/raw/dadjoke_json.txt`.

**You’re done when:**  
File exists and contains JSON.

**Log marker to add:**  
`[REQUEST_OK: dadjoke_json]`

## Step 7 — cURL #3 — Verbose
**Goal:** Inspect status code + headers.

**What to do:**  
Repeat JSON request with `-v`; save to `data/raw/dadjoke_verbose.txt`.

**You’re done when:**  
File shows headers and a status (expect 200).

**Log marker to add:**  
`[REQUEST_OK: dadjoke_verbose]`

## Step 8 — cURL #4 — Pretty-print JSON
**Goal:** Make JSON human-readable.

**What to do:**  
Pretty-print the JSON to `data/reports/dadjoke_pretty.json` (e.g., `jq`).

**You’re done when:**  
Pretty file exists; log `PRETTY_OK`.

**Log marker to add:**  
`[PRETTY_OK: data/reports/dadjoke_pretty.json]`

## Step 9 — cURL #5 — Key fields
**Goal:** Extract a meaningful field.

**What to do:**  
Record `id` or `joke` in the log under `KEY_FIELDS`; include a SHA256 for one artifact.

**You’re done when:**  
Log shows `KEY_FIELDS` and `SHA256` lines.

**Log marker to add:**  
`[SHA256]`

## Step 10 — cURL #6 — Deck of Cards (create + draw)
**Goal:** Demonstrate multi-step workflow.

**What to do:**  
Create deck → save `data/raw/deck_newdeck.json` → extract `deck_id` → draw cards → save `data/raw/deck_draw.json` → summarize to `data/reports/deck_summary.txt`.

**You’re done when:**  
Both JSON files exist; summary has value + suit.

**Log marker to add:**  
`[REQUEST_OK: deck_create, REQUEST_OK: deck_draw]`

## Step 11 — Postman intro
**Goal:** Recreate cURL requests in a GUI.

**What to do:**  
Make a collection with Dad Jokes, Deck Create, Deck Draw; use a variable for `deck_id`.

**You’re done when:**  
Collection exported to `postman/API_Lab_Collection.json`.

**Log marker to add:**  
`[POSTMAN_OK]`

## Step 12 — Postman ↔︎ cURL parity
**Goal:** See equivalence of tools.

**What to do:**  
Export a request as cURL; compare flags/headers.

**You’re done when:**  
You can explain the mapping.

**Log marker to add:**  
`[PARITY_OK]`

## Step 13 — Authentication demo
**Goal:** Show 401 vs 200 with headers.

**What to do:**  
Call a safe demo endpoint without auth (expect 401) → add `Authorization: Bearer <token>` (expect 200).

**You’re done when:**  
Log shows `AUTH_401` and `AUTH_200` plus status lines.

**Log marker to add:**  
`[AUTH_401, AUTH_200]`

## Step 14 — Wrap-up & Submit
**Goal:** Ensure artifacts + logs match checklist.

**What to do:**  
Verify deliverables and screenshots; push branch and open PR.

**You’re done when:**  
Repo contains all required files; Actions run is green.

**Log marker to add:**  
`[LAB3_END]`


## FAQ
**Q:** Do I need a real token for the auth demo?  
**A:** No. Use a safe demo endpoint or a placeholder token to show 401 vs 200 behavior.

**Q:** Where do outputs go?  
**A:** Raw under `data/raw/`, pretty JSON and summaries under `data/reports/`, logs under `logs/`, screenshots under `screens/`.

**Q:** How do I keep `deck_id` consistent?  
**A:** Save the first response and copy the `deck_id` manually, or use a Postman variable.


## 🔧 Troubleshooting & Pro Tips
**cURL not found**  
*Symptom:* `curl: command not found`  
*Fix:* Install cURL (`sudo apt install curl`) or use the dev container.

**HTML instead of JSON**  
*Symptom:* Dad Jokes request prints HTML  
*Fix:* Add header `-H 'Accept: application/json'`.

**No status code/headers**  
*Symptom:* Output lacks status or headers  
*Fix:* Use `-v` for verbose output or `-i` for headers.

**401 Unauthorized**  
*Symptom:* Auth demo returns 401  
*Fix:* Add `Authorization: Bearer <token>` or use Postman’s Authorization tab.

**deck_id not found**  
*Symptom:* Draw step fails  
*Fix:* Create a new deck first; copy `deck_id` or store it as a variable.

**Unreadable JSON**  
*Symptom:* One-line JSON  
*Fix:* Pipe through `jq` or format in VS Code.


## Grading Breakdown
| Step | Requirement | Points |
|---|---|---|
| Tooling | `curl` installed & verified (TOOL_OK: curl in log) | 5 |
| Dad Jokes (plain) | Saved to `data/raw/dadjoke_plain.txt` | 5 |
| Dad Jokes (JSON) | Saved to `data/raw/dadjoke_json.txt` with Accept header | 5 |
| Verbose | Saved to `data/raw/dadjoke_verbose.txt` showing status + headers | 5 |
| Pretty-print | Saved to `data/reports/dadjoke_pretty.json` | 4 |
| Deck create | `data/raw/deck_newdeck.json` includes `deck_id` | 8 |
| Deck draw | `data/raw/deck_draw.json` uses same `deck_id` | 8 |
| Deck summary | `data/reports/deck_summary.txt` (value + suit) | 5 |
| Logs | `logs/curl_activity.log` includes LAB3_START/LAB3_END, REQUEST_OK lines, SHA256, and 401 + 200 auth demo | 10 |
| Postman collection | `postman/API_Lab_Collection.json` with required requests | 10 |
| Screenshots | `screens/*` (3 screenshots) show correct requests & responses | 10 |
| **Total** |  | **75** |

## Autograder Notes
- Log file: `logs/curl_activity.log`
- Required markers: `LAB3_START`, `[STEP 2] Dev Container Started`, `TOOL_OK: curl`, `TOOL_OK: jq`, `REQUEST_OK: dadjoke_plain`, `REQUEST_OK: dadjoke_json`, `REQUEST_OK: dadjoke_verbose`, `REQUEST_OK: deck_create`, `REQUEST_OK: deck_draw`, `STATUS_CODE: 200`, `STATUS_CODE: 401`, `AUTH_401`, `AUTH_200`, `SHA256`, `PRETTY_OK: data/reports/dadjoke_pretty.json`, `SUMMARY_OK: data/reports/deck_summary.txt`, `LAB3_END`

## Submission Checklist
- [ ] data/raw/dadjoke_plain.txt present
- [ ] data/raw/dadjoke_json.txt present
- [ ] data/raw/dadjoke_verbose.txt present
- [ ] data/raw/deck_newdeck.json contains deck_id
- [ ] data/raw/deck_draw.json present and matches deck_id
- [ ] data/reports/dadjoke_pretty.json present
- [ ] data/reports/deck_summary.txt present (value + suit)
- [ ] logs/curl_activity.log includes LAB3_START/LAB3_END, REQUEST_OK, SHA256, 401 + 200
- [ ] postman/API_Lab_Collection.json exported
- [ ] screens/postman_dadjoke.png, screens/postman_deckdraw.png, screens/postman_auth.png present
