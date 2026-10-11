#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_HOST="${1:-http://127.0.0.1:8000}"
LOCUST_BIN="${LOCUST_BIN:-locust}"
PYTHON_BIN="${PYTHON_BIN:-python3}"
stats_dir=$(mktemp -d)
trap 'rm -rf "$stats_dir"' EXIT

"$LOCUST_BIN" -f "$root_dir/mini-projects/performance-k6-or-locust/locustfile.py" \
  --headless -u "${USERS:-5}" -r "${SPAWN_RATE:-1}" -t "${DURATION:-30s}" \
  --host "$TARGET_HOST" --csv="$stats_dir/locust" --only-summary \
  --exit-code-on-error 0

"$PYTHON_BIN" - "$stats_dir/locust_stats.csv" "${P95_MS:-1000}" "${MAX_FAIL:-0}" <<'PY'
import csv
import sys

with open(sys.argv[1], newline="") as stream:
    aggregate = next((row for row in csv.DictReader(stream) if row["Name"] == "Aggregated"), None)
if aggregate is None or int(aggregate["Request Count"]) == 0:
    sys.exit("Failed: no requests recorded")
failures = int(aggregate["Failure Count"])
p95 = float(aggregate["95%"])
if failures > int(sys.argv[3]) or p95 > float(sys.argv[2]):
    sys.exit(f"Failed: errors={failures} (max={sys.argv[3]}), p95={p95}ms (max={sys.argv[2]}ms)")
print(f"OK: errors={failures}, p95={p95}ms")
PY
