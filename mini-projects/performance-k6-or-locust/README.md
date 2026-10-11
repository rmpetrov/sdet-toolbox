# Performance testing (Locust)

Lightweight performance smoke example for checking whether a simple user path stays within basic failure and latency thresholds.

## What this project validates
- A repeated `GET /` request against a target host
- Failure-count threshold enforcement
- P95 response-time threshold enforcement from Locust CSV output

## Testing scope
- The current Locust user model contains a single task and is meant for smoke-level execution, not full load or capacity analysis.
- The helper script runs headless and evaluates the aggregated results after the run finishes.
- Default settings are intentionally modest: 5 users, 30 seconds, no failures allowed, and `p95 <= 1000ms`.

## Tools used
- Python 3.11
- Locust
- Bash helper script for threshold checks

## How to run
From the repository root:

```bash
cd mini-projects/performance-k6-or-locust
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
bash ../../scripts/run_locust_smoke.sh http://127.0.0.1:8000
```

You can override the defaults with environment variables such as `USERS`, `SPAWN_RATE`, `DURATION`, `P95_MS`, and `MAX_FAIL`.

From the repository root, you can also run `make perf-smoke` after starting the local server described in the root README.

Start the target before running. Use only hosts you control or have permission to exercise. This example is not executed by CI and does not establish application capacity. The directory name is historical; it contains Locust only.
