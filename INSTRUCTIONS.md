# Instructions — Lab 3 — Introduction to APIs

## Objectives
- Use Bash to automate API calls with cURL and capture HTTP status codes.
- Parse JSON responses with jq and extract specific fields.
- Apply Linux scripting fundamentals (shebang, set -euo pipefail, functions, variables, traps).
- Use Postman to explore requests and export runnable cURL and Python code.
- Document API interactions via files (GitHub) and screenshots (Canvas).

## Prerequisites
- Python 3.11 (via the provided dev container)
- Accounts: GitHub, Canvas
- Devices/Sandboxes: Public APIs (Dad Jokes, Deck of Cards)
- Technical: - Linux/Bash basics: variables, functions, redirection, executable scripts.
- cURL installed and usable from terminal.
- jq installed for JSON parsing.
- Postman (desktop or web) signed in.
- Git and GitHub Classroom workflow (clone, commit, push, PR).

## Overview
This lab builds core API muscle memory without Python: you'll write a Bash script that calls the Dad Jokes and Deck of Cards APIs using cURL, capture HTTP status codes, and parse JSON with jq into tidy text summaries. You'll also explore the same requests in Postman, then export their cURL and Python code snippets to include in your repository. GitHub collects your scripts, logs, and parsed artifacts; Canvas collects Postman screenshots and a short reflection.


> **Before you begin:** Verify tools: `bash --version`, `curl --version`, `jq --version`. If any are missing, install them before proceeding. Ensure you can write to `data/` and `logs/`.


## Resources
- [Dad Jokes API](https://icanhazdadjoke.com/api)- [Deck of Cards API](https://deckofcardsapi.com/)- [cURL Manual](https://curl.se/docs/manual.html)- [jq Manual](https://jqlang.github.io/jq/manual/)- [HTTP Status Codes (MDN)](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)- [Postman Downloads](https://www.postman.com/downloads/)
## Deliverables
- GitHub: `scripts/api_lab.sh` (executable Bash script using curl + jq, with logging).
- GitHub: Raw JSON saved under `data/` (see steps for filenames).
- GitHub: Parsed summaries saved under `data/` (txt files).
- GitHub: Postman exports saved as `data/postman_curl.txt` and `data/postman_python.py`.
- GitHub: `logs/lab3.log` containing required markers.
- Canvas: 3 Postman screenshots (Headers/Status/Body; Code Generator pane; Deck workflow).
- Canvas: 2-3 sentence reflection (HTTP verbs and status codes).
- Grading: **75 points**

Follow these steps in order.

> **Logging Requirement:** Write progress to `logs/lab3.log` as you complete each step.

## Step 1 — Clone the Repository
**Goal:** Get your starter locally.

**What to do:**  
Clone your GitHub Classroom repo and `cd` into it. Create `scripts/`, `data/`, and `logs/` if missing.
Initialize the log with `echo 'LAB3_START' >> logs/lab3.log`.


**You're done when:**  
- Repo present; folders exist (`scripts/`, `data/`, `logs/`).
- `LAB3_START` appears in `logs/lab3.log`.


**Log marker to add:**  
`[LAB3_START]`

## Step 2 — Author Bash Script (Linux fundamentals)
**Goal:** Create a robust script with functions, status capture, and traps.

**What to do:**  
Create `scripts/api_lab.sh` with:
  - Shebang: `#!/usr/bin/env bash`
  - `set -euo pipefail` and `IFS=$'\n\t'`
  - A `log()` function that appends to `logs/lab3.log`
  - A `cleanup()` trap for EXIT to close out gracefully
  - Variables for API URLs and output paths
  - Use `curl -sS -H 'Accept: application/json' -w '%{http_code}' -o <file>` to capture body & status
Make it executable: `chmod +x scripts/api_lab.sh`
Log `BASH_OK` when the script validates prerequisites and starts.


**You're done when:**  
- Script is executable and runs basic prechecks.
- Log contains `BASH_OK`.


**Log marker to add:**  
`[BASH_OK]`

## Step 3 — Dad Jokes via cURL + jq
**Goal:** Fetch JSON and parse fields.

**What to do:**  
In the script:
  1) Use cURL to GET `https://icanhazdadjoke.com/` with `Accept: application/json`
     - Save body to `data/dad_joke.json`
     - Save HTTP status to a variable; if not 200, log `CURL_JOKE_FAIL` and exit non-zero.
  2) Use `jq -r '.id, .joke' data/dad_joke.json` to extract fields and save to `data/dad_joke.txt`
Log `CURL_JOKE_OK` and `JQ_JOKE_OK` on success.


**You're done when:**  
- `data/dad_joke.json` and `data/dad_joke.txt` exist and are non-empty.
- Log contains `CURL_JOKE_OK` and `JQ_JOKE_OK`.


**Log marker to add:**  
`[CURL_JOKE_OK, JQ_JOKE_OK]`

## Step 4 — Deck of Cards (create + draw) via cURL + jq
**Goal:** Perform a multi-step API flow and summarize results.

**What to do:**  
In the script:
  1) Create a deck:
     - `curl https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1`
       Save to `data/deck_create.json`; capture status; ensure 200 → log `DECK_CREATE_OK`.
     - Extract `deck_id` with `jq -r '.deck_id'`.
  2) Draw 2 cards:
     - `curl https://deckofcardsapi.com/api/deck/$deck_id/draw/?count=2`
       Save to `data/deck_draw.json`; capture status; ensure 200 → log `DECK_DRAW_OK`.
     - Extract values/suits with `jq -r '.cards[] | "\(.value) of \(.suit)"'`
       Save summary to `data/deck_summary.txt` (include `remaining` too).
Log `JQ_DECK_OK` after all jq parsing completes.


**You're done when:**  
- `data/deck_create.json`, `data/deck_draw.json`, and `data/deck_summary.txt` exist.
- Log contains `DECK_CREATE_OK`, `DECK_DRAW_OK`, and `JQ_DECK_OK`.


**Log marker to add:**  
`[DECK_CREATE_OK, DECK_DRAW_OK, JQ_DECK_OK]`

## Step 5 — Postman Exploration + Code Export
**Goal:** Demonstrate tool fluency beyond the CLI.

**What to do:**  
In Postman:
  - Send Dad Jokes GET with `Accept: application/json`. Inspect Headers, Status, and JSON Body.
  - Open the Code Generator and export both cURL and Python code snippets for the same request.
  - Save those snippets to the repo as:
      `data/postman_curl.txt`
      `data/postman_python.py`
Log `POSTMAN_EXPORT_CURL_OK` and `POSTMAN_EXPORT_PY_OK` once files are saved.


**You're done when:**  
- Both files exist with meaningful content.
- Log contains `POSTMAN_EXPORT_CURL_OK` and `POSTMAN_EXPORT_PY_OK`.


**Log marker to add:**  
`[POSTMAN_EXPORT_CURL_OK, POSTMAN_EXPORT_PY_OK]`

## Step 6 — Canvas Screenshots + Reflection
**Goal:** Show understanding of HTTP anatomy and Postman.

**What to do:**  
Upload to Canvas:
  - Screenshot 1: Postman Dad Jokes request showing Headers, Status Code, and JSON Body.
  - Screenshot 2: Postman Code Generator window (showing cURL or Python export).
  - Screenshot 3: Deck of Cards create/draw workflow (URLs and JSON responses visible).
  - Reflection (2-3 sentences): explain GET vs POST and compare status 200 vs 404.
Log `CANVAS_SUBMITTED` locally after you submit to Canvas.


**You're done when:**  
- All three screenshots and the reflection are submitted to Canvas.
- Log contains `CANVAS_SUBMITTED`.


**Log marker to add:**  
`[CANVAS_SUBMITTED]`

## Step 7 — Wrap-up and Submit PR
**Goal:** Finalize logs and artifacts.

**What to do:**  
Ensure your script logs `LAB3_END` at completion (via `trap` or final step).
Commit and push all changes. Open a pull request targeting `main`.


**You're done when:**  
- PR open; repo contains scripts, data, and logs.
- `LAB3_END` present in `logs/lab3.log`.


**Log marker to add:**  
`[LAB3_END]`


## FAQ
**Q:** I got HTML instead of JSON from Dad Jokes.  
**A:** Include the header `Accept: application/json` in your curl command.

**Q:** jq says 'command not found'.  
**A:** Install jq (e.g., `sudo apt-get install -y jq`) or use your package manager.

**Q:** Deck draw fails with 'invalid deck_id'.  
**A:** Parse `deck_id` from the create response and reuse it literally in the draw URL.


## 🔧 Troubleshooting & Pro Tips
**Capture HTTP status codes**  
*Symptom:* You can't tell if the request succeeded.  
*Fix:* Use `-w '%{http_code}'` and `-o` to separate body and status, then check if status == 200.

**Stable scripts**  
*Symptom:* Silent failures.  
*Fix:* Use `set -euo pipefail`, check variables, and exit non-zero on API errors; log markers.

**File output redirection**  
*Symptom:* Nothing saved under data/.  
*Fix:* Create directories first; use `>`, `>>`, or `tee` appropriately.


## Grading Breakdown
| Step | Requirement | Points |
|---|---|---|
| Step 2 | Bash fundamentals implemented (shebang, set -euo pipefail, functions, trap) | 10 |
| Step 3 | Dad Jokes fetched; JSON + parsed text saved; markers `CURL_JOKE_OK`, `JQ_JOKE_OK` | 10 |
| Step 4 | Deck created + drawn; parsed summary saved; markers `DECK_CREATE_OK`, `DECK_DRAW_OK`, `JQ_DECK_OK` | 15 |
| Step 5 | Postman exports saved to repo; markers `POSTMAN_EXPORT_CURL_OK`, `POSTMAN_EXPORT_PY_OK` | 10 |
| Step 6 | Canvas screenshots (3) + reflection submitted; marker `CANVAS_SUBMITTED` | 15 |
| All steps | Log hygiene: start/end + required markers; consistent file outputs | 10 |
| Setup | Tools verified; script runnable; marker `BASH_OK` present | 5 |
| **Total** |  | **75** |

## Autograder Notes
- Log file: `logs/lab3.log`
- Required markers: `LAB3_START`, `BASH_OK`, `CURL_JOKE_OK`, `JQ_JOKE_OK`, `DECK_CREATE_OK`, `DECK_DRAW_OK`, `JQ_DECK_OK`, `POSTMAN_EXPORT_CURL_OK`, `POSTMAN_EXPORT_PY_OK`, `CANVAS_SUBMITTED`, `LAB3_END`

## Submission Checklist
- [ ] GitHub: `scripts/api_lab.sh` is executable and runs without errors.
- [ ] GitHub: `data/dad_joke.json` and `data/dad_joke.txt` exist.
- [ ] GitHub: `data/deck_create.json`, `data/deck_draw.json`, and `data/deck_summary.txt` exist.
- [ ] GitHub: `data/postman_curl.txt` and `data/postman_python.py` exist.
- [ ] GitHub: `logs/lab3.log` contains all required markers.
- [ ] Canvas: 3 Postman screenshots + reflection submitted.
- [ ] PR is open to `main` before deadline.
