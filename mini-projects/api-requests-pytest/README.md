# API Requests + Pytest

Python-based API checks for response validation, readable failure diagnostics, and repeatable local execution.

## What this project validates
- Health endpoint availability and expected payload
- Resource retrieval with key field checks
- Error response shape for missing resources

## Testing scope
- The test suite starts a local HTTP server in a pytest fixture, so the example stays self-contained and reproducible.
- Coverage is read-only and focused on status codes, response bodies, and clear assertions.
- The current example does not include auth, write operations, or environment-specific configuration.

## Tools used
- Python 3.11
- pytest
- Requests
- Allure for optional reporting

## Why it matters
- API checks add fast regression confidence below the UI layer.
- Local fixtures make failures easier to reproduce and troubleshoot.
- Clear assertions help turn broken responses into actionable debugging output.

## How to run
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pytest
```

Optional report generation:
```bash
pytest --alluredir=allure-results
allure generate allure-results --clean -o allure-report
```

From the repository root, you can also run `make test-api`.
