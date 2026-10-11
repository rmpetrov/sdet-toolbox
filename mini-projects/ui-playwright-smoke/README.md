# UI Playwright smoke

Playwright + pytest smoke suite for checking inline HTML in a small, reproducible example.

## What this project validates
- Page rendering and expected document title
- Visibility and href attribute of a sample link
- Stable selector usage for smoke-level regression checks

## Testing scope
- The current tests use `page.set_content(...)` rather than an external site, which keeps execution deterministic and fast.
- Coverage is intentionally small and focused on obvious breakage detection rather than broad end-to-end workflow coverage.
- The tests do not click the link, navigate, or exercise a deployed application.

## Tools used
- Python 3.11
- pytest
- Playwright
- `pytest-playwright`
- Allure for optional reporting

## How to run
From the repository root:

```bash
cd mini-projects/ui-playwright-smoke
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
