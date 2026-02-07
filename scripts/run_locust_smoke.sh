#!/usr/bin/env bash
set -euo pipefail

TARGET_HOST="${1:-https://example.com}"
USERS="${USERS:-5}"
SPAWN_RATE="${SPAWN_RATE:-1}"
DURATION="${DURATION:-30s}"
P95_MS="${P95_MS:-1000}"
MAX_FAIL="${MAX_FAIL:-0}"

STATS_FILE="/tmp/locust_stats.csv"

locust -f scripts/locust_smoke.py \
  --headless \
  -u "$USERS" \
  -r "$SPAWN_RATE" \
  -t "$DURATION" \
  --host "$TARGET_HOST" \
  --csv="${STATS_FILE%.csv}" \
  --only-summary

TOTAL_LINE=$(tail -n +2 "${STATS_FILE}_stats.csv" | awk -F',' '$1=="Aggregated" {print $0}' | tail -n 1)
if [ -z "$TOTAL_LINE" ]; then
  echo "No aggregated stats found"
  exit 1
fi

FAILS=$(echo "$TOTAL_LINE" | awk -F',' '{print $5}')
P95=$(echo "$TOTAL_LINE" | awk -F',' '{print $11}')

if [ "$FAILS" -gt "$MAX_FAIL" ]; then
  echo "Failed: errors=$FAILS (max=$MAX_FAIL)"
  exit 1
fi

if [ "$P95" -gt "$P95_MS" ]; then
  echo "Failed: p95=${P95}ms (max=${P95_MS}ms)"
  exit 1
fi

echo "OK: errors=$FAILS, p95=${P95}ms"
