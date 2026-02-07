# sdet-toolbox

[![CI](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Lint](https://img.shields.io/github/actions/workflow/status/rmpetrov/sdet-toolbox/ci.yml?branch=main&label=lint)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Tests](https://img.shields.io/github/actions/workflow/status/rmpetrov/sdet-toolbox/ci.yml?branch=main&label=tests)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Pages](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/pages-report.yml/badge.svg?branch=main)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/pages-report.yml)

SDET showcase repo focused on fast signal, stable CI, and practical automation patterns. Built for 60-second skims by recruiters and hiring managers.

Quick links: [Report portal](https://rmpetrov.github.io/sdet-toolbox/) | [Mini-projects](mini-projects/README.md) | [Docs](docs/test-strategy.md) | [Playwright smoke](mini-projects/ui-playwright-smoke/README.md) | [API pytest](mini-projects/api-requests-pytest/README.md)

## Highlights
- CI-ready suite with stable local-only demo targets
- OpenAPI contract validation with schema checks
- Playwright UI smoke that avoids flaky external dependencies
- Allure report pipeline published to GitHub Pages

## Why this matters
Fast signal, low maintenance, and evidence recruiters can verify quickly.

## Table of contents
- [What I deliver](#what-i-deliver)
- [Tech stack](#tech-stack)
- [Highlights](#highlights)
- [Why this matters](#why-this-matters)
- [What to look at first](#what-to-look-at-first)
- [Proof](#proof)
- [How to run locally](#how-to-run-locally)
- [Mini-projects catalog](#mini-projects-catalog)
- [Contact](#contact)

## What I deliver
- CI stability you can trust: fast feedback, clear ownership, and actionable failures
- Flake control: quarantine and root-cause paths, not just retries
- Test design that targets risk: pyramid-balanced suites with tight scope
- Maintainable Page Object Model patterns and test utilities
- API testing with schema validation, contract focus, and failure triage
- Reporting that tells a story: trends, failures, and the next action
- DevEx for QA: consistent workflows, templates, and contributor guidance

## Tech stack
- Python, Pytest
- Playwright, Requests
- Allure, HTML reports
- GitHub Actions
- Docker (optional for reproducible runs)

## What to look at first
- [Playwright UI smoke](mini-projects/ui-playwright-smoke/README.md)
- [API requests + pytest](mini-projects/api-requests-pytest/README.md)
- [Flaky tests playbook](docs/flaky-tests.md)

## Proof
- [Profile and pinned repos](https://github.com/rmpetrov/rmpetrov)
- [Playwright UI repo](https://github.com/rmpetrov/playwright-tests)
- [API automation (typed clients + Pydantic validation)](https://github.com/rmpetrov/playwright-tests/tree/main/api_tests)
- Contract testing (OpenAPI schema validation): `mini-projects/contract-testing`
- [GitHub Pages reports](https://rmpetrov.github.io/sdet-toolbox/)
- [CI pipelines](https://github.com/rmpetrov/playwright-tests/actions)
- PRs showing quality practices: [#15](https://github.com/rmpetrov/playwright-tests/pull/15), [#16](https://github.com/rmpetrov/playwright-tests/pull/16), [#17](https://github.com/rmpetrov/playwright-tests/pull/17)

## How to run locally
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r mini-projects/ui-playwright-smoke/requirements.txt
playwright install
pytest mini-projects/ui-playwright-smoke
```

Or use Make targets:
- `make test-ui`
- `make test-api`
- `make test-contract`
- `make test-data`
- `make perf-smoke`

## Mini-projects catalog
- [UI Playwright smoke](mini-projects/ui-playwright-smoke/README.md)
- [API Requests + Pytest](mini-projects/api-requests-pytest/README.md)
- [Contract testing](mini-projects/contract-testing/README.md)
- [Performance testing](mini-projects/performance-k6-or-locust/README.md)
- [Data quality tests](mini-projects/data-quality-tests/README.md)

## Contact
- LinkedIn: [https://www.linkedin.com/in/rmpetrov/](https://www.linkedin.com/in/rmpetrov/)
- Email: [rpetrovqa@gmail.com](mailto:rpetrovqa@gmail.com)
