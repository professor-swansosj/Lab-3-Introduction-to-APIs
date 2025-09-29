# Lab 3 — Introduction to APIs

**Course:** Software Defined Networking  
**Module:** Network Automation Fundamentals • **Lab #:** 3  
**Estimated Time:** 1.5–2 hours

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


## Resources
- [Dad Jokes API](https://icanhazdadjoke.com/api) — Use Accept: application/json for JSON output.- [Deck of Cards API](https://deckofcardsapi.com/) — Create deck, then draw using the same deck_id.- [curl docs](https://curl.se/docs/manpage.html) — Flags: -v (verbose), -i (headers), -H (header), -o (output).- [HTTP status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)- [jq](https://stedolan.github.io/jq/)- [Postman](https://www.postman.com/)

## FAQ
**Q:** Do I need a real token for the auth demo?  
**A:** No. Use a safe demo endpoint or a placeholder token to show 401 vs 200 behavior.

**Q:** Where do outputs go?  
**A:** Raw under `data/raw/`, pretty JSON and summaries under `data/reports/`, logs under `logs/`, screenshots under `screens/`.

**Q:** How do I keep `deck_id` consistent?  
**A:** Save the first response and copy the `deck_id` manually, or use a Postman variable.



## Deliverables
- Consistent README with objectives, deliverables, grading, troubleshooting.
- Stepwise instructions using cURL and Postman; logs + artifacts present.
- Grading: **75 points**

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



## Autograder Notes
- Log file: `logs/curl_activity.log`
- Required markers: `LAB3_START`, `[STEP 2] Dev Container Started`, `TOOL_OK: curl`, `TOOL_OK: jq`, `REQUEST_OK: dadjoke_plain`, `REQUEST_OK: dadjoke_json`, `REQUEST_OK: dadjoke_verbose`, `REQUEST_OK: deck_create`, `REQUEST_OK: deck_draw`, `STATUS_CODE: 200`, `STATUS_CODE: 401`, `AUTH_401`, `AUTH_200`, `SHA256`, `PRETTY_OK: data/reports/dadjoke_pretty.json`, `SUMMARY_OK: data/reports/deck_summary.txt`, `LAB3_END`

## License
© 2025 Your Name — Classroom use.