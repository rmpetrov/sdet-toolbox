# Contract testing

Validation-focused contract example using OpenAPI and JSON Schema to catch interface drift before it turns into a regression.

## What this project validates
- OpenAPI document validity
- JSON fixture compliance with a standalone schema
- Response payload compliance with the schema defined in `openapi.yaml`

## Testing scope
- The project validates local artifacts: `openapi.yaml`, `contracts/user.schema.json`, and `fixtures/user.json`.
- Checks are deterministic and run without a live provider, which makes them fast and easy to troubleshoot.
- The current example focuses on schema compatibility rather than full provider verification.

## Tools used
- Python 3.11
- pytest
- `jsonschema`
- `openapi-spec-validator`
- PyYAML
- Allure for optional reporting

## Why it matters
- Contract validation helps prevent breaking API changes from reaching downstream consumers.
- Schema-based checks provide useful regression coverage even when a live environment is unavailable.
- Clear contract failures make troubleshooting easier during release preparation and change review.

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

From the repository root, you can also run `make test-contract`.
