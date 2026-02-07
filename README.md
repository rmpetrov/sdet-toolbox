# sdet-toolbox

[![CI](https://img.shields.io/badge/CI-TODO-lightgrey)](https://github.com/rmpetrov/sdet-toolbox/actions)
[![Lint](https://img.shields.io/badge/Lint-TODO-lightgrey)](https://github.com/rmpetrov/sdet-toolbox/actions)
[![Tests](https://img.shields.io/badge/Tests-TODO-lightgrey)](https://github.com/rmpetrov/sdet-toolbox/actions)
[![Pages](https://img.shields.io/badge/Pages-TODO-lightgrey)](https://rmpetrov.github.io/sdet-toolbox)

SDET showcase repo focused on fast signal, stable CI, and practical automation patterns. Built for 60-second skims by recruiters and hiring managers.

Quick links: [Mini-projects](mini-projects/README.md) | [Docs](docs/test-strategy.md) | [Playwright smoke](mini-projects/ui-playwright-smoke/README.md) | [API pytest](mini-projects/api-requests-pytest/README.md)

## Table of contents
- [What I deliver](#what-i-deliver)
- [Tech stack](#tech-stack)
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
- [API automation repo](https://github.com/rmpetrov/<api-automation-repo>)
- [Contract testing repo](https://github.com/rmpetrov/<contract-tests-repo>)
- [GitHub Pages reports](https://rmpetrov.github.io/<report-repo>)
- [CI pipelines](https://github.com/rmpetrov/<repo>/actions)
- [PRs showing quality practices](https://github.com/rmpetrov/<repo>/pulls)

## How to run locally
```bash
python -m venv .venv
source .venv/bin/activate
pip install -r mini-projects/ui-playwright-smoke/requirements.txt
playwright install
pytest mini-projects/ui-playwright-smoke
```

## Mini-projects catalog
- [UI Playwright smoke](mini-projects/ui-playwright-smoke/README.md)
- [API Requests + Pytest](mini-projects/api-requests-pytest/README.md)
- [Contract testing](mini-projects/contract-testing/README.md)
- [Performance testing](mini-projects/performance-k6-or-locust/README.md)
- [Data quality tests](mini-projects/data-quality-tests/README.md)

## Contact
- LinkedIn: [https://www.linkedin.com/in/<your-handle>/](https://www.linkedin.com/in/<your-handle>/)
- Email: [you@example.com](mailto:you@example.com)
