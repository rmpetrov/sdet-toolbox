# Contract testing

## Goal
Validate API contracts early to prevent breaking changes.

## Scope
- Schema-driven validation
- Provider or consumer perspective

## Key skills demonstrated
- OpenAPI schema validation
- JSON Schema usage for payload checks
- Deterministic contract checks

## Minimal runnable skeleton
Dependencies
- Python 3.11+
- Pytest
- jsonschema
- openapi-spec-validator
- PyYAML

Commands
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pytest
```

## Suggested test cases
- OpenAPI spec validation
- Response payload matches OpenAPI schema
- Required fields and type checks
- Backward compatibility checks

## Next improvements
- [ ] Add provider verification against live API
- [ ] Add Pact contract tests
- [ ] Add versioned schemas and change log
