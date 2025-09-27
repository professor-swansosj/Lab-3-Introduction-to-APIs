# Lab Instructions

## Lab Title
Introduction to APIs

## Version
`v1.0 / 9/25`

## Estimated Time
- `1.5 - 2 Hours`
    - `30-40 minutes with cURL`
    - `30 minutes with Postman`
    - `20-30 minutes exploring authenticaiton and reflection`

---

## Learning Objectives
By the end of this lab, you will be able to:
- Objective 1 – Define what an API (Application Programming Interface) is and explain why APIs are essential in modern software and networking.
- Objective 2 – Identify the parts of an HTTP request and response: URL, method, headers, body, and status code.
- Objective 3 – Use cURL to:
    - Objective 3.1 - Make basic GET requests to a public API.
    - Objective 3.2 - Enable verbose output to analyze status codes and headers.
    - Objective 3.3 - Request and manipulate JSON output into a more readable format.
    - Objective 3.4 - Redirect output to files and process it in common developer workflows.
- Objective 4 – Use Postman to:
    - Objective 4.1 - Build and send API requests to public APIs.
    - Objective 4.2 - Organize requests into a saved collection for reuse.
- Objective 5 – Explain the concept of API authentication and demonstrate it with an example using an API key or bearer token.

These objectives build foundational skills for aspiring **network engineers** and **infrastructure specialists**.

---

## Tools & Technologies
You will use:
- Editor/Runtime
    - Visual Studio Code + Dev Containers extension
    - Docker Desktop (Windows/macOS; WSL2 enabled on Windows)
    - Git & GitHub Classroom repository

- Language & Libraries (preinstalled in container)
    - Python 3.x (no direct use in this lab, but included for continuity)
- API Tools
    - cURL (command-line API client)
    - Postman (graphical API client; desktop or web app)
    - jq (optional, for JSON pretty-printing in terminal)
- APIs (targets for requests)
    - [Dad Jokes API](https://icanhazdadjoke.com/)
    - [Deck of Cards API](https://deckofcardsapi.com/)
    - Demo authentication API (for practicing headers & tokens)
- Command Line
    - Bash (WSL, macOS, devcontainer)

---

## Prerequisites
Before starting, make sure you:
- Understand basic Linux navigation and file manipulation
- Know how to clone, commit, and push using Git
- Have basic familiarity with the Linux terminal (navigating directories, running commands).
- Have access to the GitHub Classroom repository and Dev Container
- Understand simple text file redirection (> and >>) in Linux/WSL.
- Have completed Lab 2: Network Device Commands with Python, where they learned about CLI interactions and structured command output.
- (Optional but helpful) Recall JSON as a structured data format introduced in earlier Python lessons.

---

## Deliverables
Commit and push the following to your Classroom repo:
1. cURL Outputs (in `data/raw/`)
    - `data/raw/dadjoke_plain.txt`
        - Output of a basic cURL request to the Dad Jokes API (plain text).
    - `data/raw/dadjoke_json.txt`
        - Output of the Dad Jokes API request with JSON header applied.
    - `data/raw/dadjoke_verbose.txt`
        - Verbose mode output showing headers and status codes.
    - `data/raw/deck_newdeck.json`
        - JSON response of a request creating a new shuffled deck (contains `deck_id`)
    - `data/raw/deck_draw.json`
        - JSON response of a request drawing at least one card from the created deck.

2. Pretty-Printed JSON (in `data/reports/`)
    - `data/reports/dadjoke_pretty.json`
        - Human-readable (pretty-printed) JSON file containing one joke.
    - `data/reports/deck_summary.txt`
        - Short text summary showing the card(s) drawn (value + suit).

3. Logs (in `logs/`)
- `logs/curl_activity.log`
    - Must include at least:
        - LAB3_START / LAB3_END
        - TOOL_OK: curl, TOOL_OK: jq
        - REQUEST_OK entries for Dad Jokes plain, Dad Jokes JSON, Deck Create, Deck Draw
        - STATUS_CODE lines (at least one 200, and one error example such as 401 Unauthorized when testing auth).

4. Postman (in postman/)
    - `postman/API_Lab_Collection.json`
        - Exported Postman collection containing:
            - Dad Jokes API request (GET, JSON)
            - Deck of Cards API (new deck + draw card)
            - One request demonstrating authentication (Bearer token placeholder).

5. Screenshots (in `screens/`)
    - `screens/postman_dadjoke.png`
        - Screenshot of the Dad Jokes request in Postman showing response.
    - `screens/postman_deckdraw.png`
        - Screenshot of the Deck of Cards draw request in Postman.
    - `screens/postman_auth.png`
        - Screenshot of a Postman request with an Authorization header set.

> ⚠️ **Important:** No log file = no points, even if your code “worked.” The grader only checks for log entries.
- Do not rename deliverables — autograding will validate file presence and check for required fields (e.g., deck_id, status code 200, etc.).
- JSON files must contain actual API responses; screenshots must clearly show Postman’s request + response.

---

## Overview
This lab introduces students to the fundamentals of working with APIs—the glue that allows software systems to talk to one another. Instead of diving straight into Python, we’ll start with two widely used tools: cURL, a command-line utility, and Postman, a graphical API client.

Students will begin with the Dad Jokes API, practicing simple GET requests and exploring how output changes with headers, verbose flags, and JSON formatting. From there, they’ll move on to the Deck of Cards API, where they’ll simulate shuffling and drawing cards to see how APIs handle multi-step workflows.

Along the way, students will learn how to read HTTP responses, recognize status codes, and practice real-world developer tasks like formatting JSON. They’ll finish by testing API authentication, gaining insight into how secure APIs work.

This lab focuses on theory and practice at the tool level. Later labs will build on this foundation with Python’s `requests` library for scripting. 

---

## Instructions

Follow these steps in order:

### Step 1 – Clone the Repository
```bash
git clone <repo-url>
cd <repo-name>
```

This gives you the folder where all your work (files, logs, Postman exports, screenshots) will live.

### Step 2 – Open a Dev Container
1. Launch VS Code
2. Select "Reopen in Container"
3. Wait for dependencies to install
NOTE: This can take a few minutes on first load

LOG REQUIREMENT: Add `LAB3_START` and `[STEP 2] Dev Container Started` at the top of your `logs/curl_activity.log`.


### Step 3 – Install & verify tools
- Type curl --version in your terminal. Confirm it runs.
- Check jq --version. If missing, install it (or note NONE in the log).
- Install Postman (desktop app or web) and sign in.

Log: record TOOL_OK entries for curl, jq, and Postman.

### Step 4 – Warm-up: what an HTTP API is
Pick any public API URL (for example Dad Jokes). Identify and write down in your notes:
- The URL.
- The method (default is GET).
- Any headers you’re sending.
- The body (if any).
- The status code of the response.

This step is theory only — no files to submit.

### Step 5 – cURL #1 – Dad Jokes (plain request)
- Use cURL to send a simple GET to the Dad Jokes API.
- Save to data/raw/dadjoke_json.txt.

> Hint: Just `curl <url>` with no flags.

### Step 6 – cURL #2 – Ask for JSON
- Call the Dad Jokes API again, but this time request JSON instead of text.
- Save to data/raw/dadjoke_json.txt

### Step 7 – cURL #3 – Verbose mode
- Re-run the Dad Jokes request in JSON mode, but print it in verbose mode.
- Redirect the verbose output to data/raw/dadjoke_verbose.txt.

> Look carefully at the status code and headers.

### Step 8 – cURL #4 – Make JSON human-readable
- Take the JSON output and make it easier to read.
- Save the pretty-printed version as data/reports/dadjoke_pretty.json.

> Hint: VS Code can format JSON, or pipe through jq.

### Step 9 – cURL #5 – A “real” task
- From the JSON response, extract a single useful field (e.g., the id or joke).
- Write it into logs/curl_activity.log under KEY_FIELDS.
- Optionally append just the joke text into a new file for later (developer-style logging).

### Step 10 – cURL #6 – Deck of Cards (multi-step workflow)
- Create a new shuffled deck (GET request). Save as data/raw/deck_newdeck.json.
    - Verify you see a deck_id.
- Use that deck_id in a second request to draw cards. Save as data/raw/deck_draw.json.
- Write a short summary (value + suit) into data/reports/deck_summary.txt.

> This demonstrates how APIs keep state across requests.

### Step 11 – Postman intro
- Open Postman and create a new collection called SDN-101 – APIs.
- Add requests for:
    - Dad Jokes (JSON).
    - Deck Create.
    - Deck Draw.
- Use a collection/environment variable for the deck_id so you don’t need to paste it manually.

### Step 12 – Postman ↔︎ cURL parity
- In Postman, use the “Code” button to export one of your requests as cURL.
- Compare the output to what you typed earlier.

> This shows that Postman and cURL are just two ways to hit the same API.

### Step 13 – Authentication (concept + demo)
- Try calling a safe demo API endpoint with no authentication — note the 401 Unauthorized.
- Add an Authorization header (Bearer token placeholder) and rerun. Note the 200 OK.
- Record both in your log (AUTH_UNAUThed and AUTH_BEARER).

### Step 14 – Wrap-up & deliverables
- Reflect: when would you use cURL, and when Postman?
- Ensure all required files, logs, collection, and screenshots are in place (see Submission Checklist).

### Step 15 – Open a Pull Request
- Commit and push everything to your GitHub Classroom repo.
- Open a Pull Request for grading.

> LOG REQUIREMENT: Add LAB3_END at the bottom of logs/curl_activity.log.

## Troubleshooting
1. `cURL` not found
    - Symptom: `curl` command not found in terminal.
    - Fix: Install cURL (on Ubuntu/Debian: `sudo apt install curl`; on macOS: already included; on Windows: use WSL or install from curl.se).

2. HTML Responses instead of JSON
    - Symptom: cURL request to Dad Jokes API just prints raw HTML instead of JSON.
    - Fix: You forgot the `-H "Accept: application/json"` header. Add it to tell the server you want JSON back.

3. No Status Code or Headers
    - Symptom: cURL command runs but you don’t see any status code or headers.
    - Fix: Add the `-v` (verbose) flag to display request and response metadata.

4. Receive 401 Unauthorized
- Symptom: Postman request returns “401 Unauthorized.”
- Fix: Check that you added authentication properly in Postman’s Authorization tab or included the correct header.

5. Error `deck_id not found`
- Symptom: Deck of Cards API says “deck_id not found.”
- Fix: You must first create a new shuffled deck request. Copy the deck_id from that response into your draw request (or set it as a variable in Postman).

6. JSON Unreadable
- Symptom: JSON output looks like one long unreadable line.
- Fix: Pipe the output to a JSON pretty-printer such as `jq` (`curl ... | jq`) or save to a file and open in VS Code, which formats JSON automatically.

7. Postman Not Matching Instructions
- Symptom: Postman looks different from the screenshots/instructions.
- Fix: Postman updates frequently. Look for the same tabs (Params, Headers, Body, Authorization) even if icons have moved..

## :light_bulb: Pro Tips
- Use `curl -i` to see response headers without full verbose noise. Great for quickly checking status codes.
- Combine `-s` (silent) with `-o <file>` (output to file) to save API responses without cluttering your screen.
- In Postman, use Save as Example under a request to capture typical responses—handy for study and reference.
- Postman has a “Code Snippet” button that lets you export your request as `curl`, Python `requests`, or JavaScript—excellent for seeing how tools translate.
- The `jq` command-line tool is a developer favorite for filtering JSON. Example:
```bash
curl -s -H "Accept: application/json" https://icanhazdadjoke.com/ | jq '.joke'
```

This prints only the joke text.
- Authentication headers are just strings—never post your real API keys publicly. For this lab, we’ll use demo tokens only.
- When debugging API calls, start simple: test the URL with just `curl <url>` before adding headers or complex options.

## ✅ Grading Breakdown

| Step | Requirement | Points |
|------|-------------|--------|
| 1 | `curl` installed and verified in container/terminal (TOOL_OK: curl in log) | 3 |
| 2 | Dad Joke plain text request saved to `data/raw/dadjoke_plain.txt` | 5 |
| 3 | Dad Joke JSON request saved to `data/raw/dadjoke_json.txt` with correct header | 5 |
| 4 | Verbose output saved to `data/raw/dadjoke_verbose.txt` showing status code and headers | 5 |
| 5 | Pretty-printed JSON saved to `data/reports/dadjoke_pretty.json` | 4 |
| 6 | Shuffled Deck created and response saved to `data/raw/deck_newdeck.json` containing valid `deck_id` | 8 |
| 7 | Deck Draw request saved to `data/raw/deck_draw.json` using same `deck_id` | 8 |
| 8 | Deck Draw summary written to `data/reports/deck_summary.txt` (value + suit of cards) | 5 |
| 9 | `logs/curl_activity.log` present with LAB3_START/LAB3_END, REQUEST_OK lines, SHA256 hashes, and at least one 401 Unauthorized + 200 OK for auth demo | 10 |
| 10 | Postman collection exported to `postman/API_Lab_Collection.json` with required requests (Dad Joke JSON, Deck Create, Deck Draw, Auth Demo) | 10 |
| 11 | Screenshots present: `screens/postman_dadjoke.png`, `screens/postman_deckdraw.png`, `screens/postman_auth.png` showing correct requests and responses | 10 |
| **Total** |  | **75** |


## 📋 Submission Checklist

Before you submit, make sure your GitHub Classroom repo contains the following:

### Data Artifacts (in `data/raw/`)
- [ ] `dadjoke_plain.txt` → plain text joke from Dad Jokes API  
- [ ] `dadjoke_json.txt` → JSON joke with Accept: application/json header  
- [ ] `dadjoke_verbose.txt` → verbose output with headers + status code  
- [ ] `deck_newdeck.json` → new shuffled deck response (includes `deck_id`)  
- [ ] `deck_draw.json` → draw response using the same `deck_id`  

### Reports (in `data/reports/`)
- [ ] `dadjoke_pretty.json` → pretty-printed JSON joke  
- [ ] `deck_summary.txt` → short text summary of drawn card(s) (value + suit)  

### Logs (in `logs/`)
- [ ] `curl_activity.log` → contains LAB3_START / LAB3_END, REQUEST_OK lines, SHA256 hashes, and at least one 401 Unauthorized + 200 OK for auth demo  

### Postman (in `postman/`)
- [ ] `API_Lab_Collection.json` → exported collection with Dad Joke JSON, Deck Create, Deck Draw, and Auth Demo requests  

### Screenshots (in `screens/`)
- [ ] `postman_dadjoke.png` → shows Dad Jokes request + JSON response in Postman  
- [ ] `postman_deckdraw.png` → shows Deck Draw request + response in Postman  
- [ ] `postman_auth.png` → shows Auth request with Authorization header + successful response  

---

✅ Once all boxes are checked, **commit and push** your repo to GitHub Classroom.  
⚠️ Autograding will verify file presence, content checks (e.g., JSON keys, deck_id consistency), and log structure. Screenshots will be manually reviewed.  
