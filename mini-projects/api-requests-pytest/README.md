# API Requests + Pytest

## Goal
Create a fast API regression check with clear assertions and failure messages.

## Scope
- Read-only requests
- Status, schema, and key field validation

## Key skills demonstrated
- Requests + Pytest structure
- Assertion quality and readable failures
- Contract-minded API checks

## Minimal runnable skeleton
Dependencies
- Python 3.11+
- Requests
- Pytest

Commands
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pytest
```

Allure report
```bash
pytest --alluredir=allure-results
allure generate allure-results --clean -o allure-report
```

## Suggested test cases
- Health endpoint returns 200
- Key resource fetch returns expected fields
- Error payload shape on 4xx
- Rate limit headers present

## Next improvements
- [ ] Add JSON schema validation
- [ ] Add auth and env config
- [ ] Add negative tests and edge cases
