# UI Playwright smoke

Playwright + pytest smoke suite for validating critical UI paths in a small, reproducible example.

## What this project validates
- Page rendering and expected document title
- Visibility and behavior of a primary UI action
- Stable selector usage for smoke-level regression checks

## Testing scope
- The current tests use `page.set_content(...)` rather than an external site, which keeps execution deterministic and fast.
- Coverage is intentionally small and focused on obvious breakage detection rather than broad end-to-end workflow coverage.
- The example can be extended into live-environment checks, page objects, traces, and screenshots.

## Tools used
- Python 3.11
- pytest
- Playwright
- `pytest-playwright`
- Allure for optional reporting

## Why it matters
- UI smoke checks provide quick regression-oriented feedback on critical paths.
- Local, deterministic execution helps with troubleshooting and CI stability.
- Small, maintainable checks are easier to trust, review, and expand.

## How to run
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
playwright install chromium
pytest
```

Optional report generation:
```bash
pytest --alluredir=allure-results
allure generate allure-results --clean -o allure-report
```

From the repository root, you can also run `make test-ui`.
