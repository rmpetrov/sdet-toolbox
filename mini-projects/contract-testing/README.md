# Contract testing

## Goal
Validate API contracts early to prevent breaking changes.

## Scope
- Schema-driven validation
- Provider or consumer perspective

## Key skills demonstrated
- JSON Schema usage
- Deterministic contract checks
- Failure messaging for providers

## Minimal runnable skeleton
Dependencies
- Python 3.11+
- Pytest
- jsonschema

Commands
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pytest
```

## Suggested test cases
- Contract validation for key resources
- Required fields and type checks
- Backward compatibility checks
- Optional fields with defaults

## Next improvements
- [ ] Add provider verification against live API
- [ ] Add versioned schemas and change log
- [ ] Add contract tests in CI gate
