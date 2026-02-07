# Data quality tests

## Goal
Detect bad data early with lightweight validations and clear failure output.

## Scope
- Schema and rule checks on batch data
- Local CSV example

## Key skills demonstrated
- Data validation with Pandera
- Practical data checks tied to risk
- Test-driven data quality

## Minimal runnable skeleton
Dependencies
- Python 3.11+
- Pandas
- Pandera
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
- Null checks on key fields
- Type and range validation
- Uniqueness constraints
- Referential integrity

## Next improvements
- [ ] Add Great Expectations suite
- [ ] Add data drift checks
- [ ] Add CI artifact with failed rows
