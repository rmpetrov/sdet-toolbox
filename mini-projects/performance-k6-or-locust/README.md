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

## Why it matters
- Performance smoke checks can catch obvious latency or stability regressions before deeper testing begins.
- Threshold-based execution is useful for repeatable release checks and faster troubleshooting.
- Keeping the scenario small makes it easier to understand what failed and why.

## How to run
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
bash ../../scripts/run_locust_smoke.sh https://example.com
```

You can override the defaults with environment variables such as `USERS`, `SPAWN_RATE`, `DURATION`, `P95_MS`, and `MAX_FAIL`.

From the repository root, you can also run `make perf-smoke` for the default example target.
