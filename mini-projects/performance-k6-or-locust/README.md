# Performance testing (Locust)

## Goal
Show a lightweight load test that can run locally or in CI for smoke-level performance checks.

## Scope
- Single endpoint load
- Simple user behavior model

## Key skills demonstrated
- Load test design basics
- Headless execution
- Interpreting failure thresholds

## Minimal runnable skeleton
Dependencies
- Python 3.11+
- Locust

Commands
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
./scripts/run_locust_smoke.sh https://example.com
```

## Suggested test cases
- Baseline latency under load
- Error rate stays under threshold
- P95 response time tracked

## Next improvements
- [ ] Add multiple user journeys
- [ ] Add CI artifacts and trend charts
