# Contract testing

Validation-focused contract example using OpenAPI and JSON Schema to catch interface drift before it turns into a regression.

## What this project validates
- OpenAPI document validity
- JSON fixture compliance with a standalone schema
- Response payload compliance with the schema defined in `openapi.yaml`

## Testing scope
- The project validates local artifacts: `openapi.yaml`, `contracts/user.schema.json`, and `fixtures/user.json`.
- Checks are deterministic and run without a live provider, which makes them fast and easy to troubleshoot.
- The current example focuses on validating a positive fixture rather than detecting changes between contract versions.

## Tools used
- Python 3.11
- pytest
- `jsonschema`
- `openapi-spec-validator`
- PyYAML
- Allure for optional reporting

## How to run
From the repository root:

```bash
cd mini-projects/contract-testing
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

The OpenAPI response check resolves the single local User reference and applies Draft 7 validation to its basic object/type/required/email constraints. It is not a general validator for all OpenAPI 3.0 schema features or nested references.
