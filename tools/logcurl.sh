#!/usr/bin/env bash
# usage: ./tools/logcurl.sh STEP METHOD URL OUTFILE [HEADER1] [HEADER2] ...
# ex:    ./tools/logcurl.sh DADJOKE_JSON GET https://icanhazdadjoke.com/ data/raw/dadjoke_json.txt "Accept: application/json"

set -euo pipefail
STEP="$1"; METHOD="$2"; URL="$3"; OUT="$4"; shift 4
HDRS=("$@")

TS=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
HDR_ARGS=()
REQ_HEADERS="NONE"
if [ ${#HDRS[@]} -gt 0 ]; then
  REQ_HEADERS=$(printf "%s; " "${HDRS[@]}")
  for h in "${HDRS[@]}"; do HDR_ARGS+=(-H "$h"); done
fi

mkdir -p "$(dirname "$OUT")" logs

# Do the request
START=$(date +%s%3N)
curl -s -X "$METHOD" "${HDR_ARGS[@]}" "$URL" -o "$OUT" --write-out "%{http_code} %{content_type} %{size_download} %{time_total}" > /tmp/.cw 2>/tmp/.cerr || true
END=$(date +%s%3N)

read -r STATUS CT BYTES TIME_TOTAL < /tmp/.cw
DURATION_MS=$((END-START))
SHA256=$(sha256sum "$OUT" | awk '{print $1}')

# Derive key fields heuristically
KEY_FIELDS=""
case "$STEP" in
  DADJOKE_JSON) KEY_FIELDS=$(jq -r '"joke_id="+.id+" joke_len="+(.joke|length|tostring)' "$OUT" 2>/dev/null || echo "joke_id=? joke_len=?");;
  DECK_CREATE)  KEY_FIELDS=$(jq -r '"deck_id="+.deck_id+" success="+(.success|tostring)' "$OUT" 2>/dev/null || echo "deck_id=? success=?");;
  DECK_DRAW)    KEY_FIELDS=$(jq -r '"card1="+.cards[0].value+"-"+.cards[0].suit' "$OUT" 2>/dev/null || echo "card1=?");;
  *)            KEY_FIELDS="";;
esac

cat >> logs/curl_activity.log <<LOG
TS=${TS}
STEP=${STEP}
METHOD=${METHOD}
URL=${URL}
REQ_HEADERS=${REQ_HEADERS}
RESP_STATUS=${STATUS}
RESP_CT=${CT}
BYTES=${BYTES}
DURATION_MS=${DURATION_MS}
SAVED=${OUT}
SHA256=${SHA256}
KEY_FIELDS=${KEY_FIELDS}
RESULT=$( [ "$STATUS" -ge 200 ] && [ "$STATUS" -lt 400 ] && echo REQUEST_OK || echo REQUEST_ERR )

LOG
