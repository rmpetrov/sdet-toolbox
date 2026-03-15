# Data quality tests

Data quality checks focused on schema, null, type, range, and uniqueness validation for a small batch-style dataset.

## What this project validates
- Required columns and expected data types
- Positive and unique `user_id` values
- Basic email format checks
- Age range rules and boolean coercion for `is_active`

## Testing scope
- The example reads a local CSV file from `data/sample.csv`.
- Validation is implemented with a Pandera schema inside a pytest test for simple, reproducible execution.
- The current scope is a compact batch-data example rather than a full pipeline or warehouse test suite.

## Tools used
- Python 3.11
- pytest
- pandas
- Pandera
- Allure for optional reporting

## Why it matters
- Data quality issues can break analytics, product decisions, and downstream integrations just as easily as code defects.
- Schema and rule checks help catch defects early and provide repeatable evidence for release confidence.
- Local validation makes it easier to troubleshoot bad records and evolve quality rules over time.

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

From the repository root, you can also run `make test-data`.
