# UI Playwright smoke

## Goal
Deliver a fast UI smoke suite that gates merges and catches obvious breakages.

## Scope
- Single browser, critical paths only
- Deterministic selectors and clear failure output

## Key skills demonstrated
- Playwright + Pytest wiring
- Page object thinking and stable selectors
- CI-friendly smoke design

## Minimal runnable skeleton
Dependencies
- Python 3.11+
- Playwright

Commands
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
playwright install
pytest
```

## Suggested test cases
- Home page loads with correct title
- Primary CTA is visible and clickable
- Authenticated user sees expected nav
- Critical form validations

## Next improvements
- [ ] Add POM layer and component helpers
- [ ] Add trace and screenshot artifacts on failure
- [ ] Add parallel runs and sharding strategy
