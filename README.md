## Start here (60 sec)
- [playwright-tests repo](https://github.com/rmpetrov/playwright-tests)
- [playwright-tests reports (GitHub Pages)](https://rmpetrov.github.io/playwright-tests/)
- [sdet-toolbox reports (GitHub Pages)](https://rmpetrov.github.io/sdet-toolbox/)
- [playwright-tests CI workflow runs](https://github.com/rmpetrov/playwright-tests/actions)

# sdet-toolbox

[![CI](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Lint](https://img.shields.io/github/actions/workflow/status/rmpetrov/sdet-toolbox/ci.yml?branch=main&label=lint)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Tests](https://img.shields.io/github/actions/workflow/status/rmpetrov/sdet-toolbox/ci.yml?branch=main&label=tests)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Pages](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/pages-report.yml/badge.svg?branch=main)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/pages-report.yml)

Recruiter-first SDET portfolio with runnable mini-projects, CI, and published reports.

## Quick start
```bash
python3 -m venv .venv
make setup
make lint
make test
make report
```

- Local reports: `site/reports` (after `make report`, requires Allure CLI)
- CI workflow: [GitHub Actions CI](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
- Published reports: [GitHub Pages report portal](https://rmpetrov.github.io/sdet-toolbox/)
- `make lint`: check-only; fails on lint/format violations and does not modify files
- `make fmt`: applies lint fixes and formatting

## Portfolio map
- [playwright-tests](https://github.com/rmpetrov/playwright-tests): end-to-end UI + API framework, CI, and reports
- `sdet-toolbox` (this repo): compact showcase with CI, reports, and focused samples
- [ui-playwright-smoke](mini-projects/ui-playwright-smoke/README.md): Playwright + Pytest UI smoke suite on local targets
- [api-requests-pytest](mini-projects/api-requests-pytest/README.md): API checks with Requests + Pytest fixtures
- [contract-testing](mini-projects/contract-testing/README.md): OpenAPI and JSON schema validation
- [data-quality-tests](mini-projects/data-quality-tests/README.md): data validation with Pandera on CSV samples
- [performance-k6-or-locust](mini-projects/performance-k6-or-locust/README.md): Locust smoke load test skeleton

## Skills demonstrated → Evidence
- CI/CD → [sdet-toolbox CI workflow](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml), [playwright-tests CI runs](https://github.com/rmpetrov/playwright-tests/actions)
- Reporting → [sdet-toolbox reports](https://rmpetrov.github.io/sdet-toolbox/), [playwright-tests reports](https://rmpetrov.github.io/playwright-tests/), [reporting approach](docs/reporting.md)
- Flaky test policy → [flaky tests playbook](docs/flaky-tests.md)
- Page Object Model (POM) → [playwright-tests repo](https://github.com/rmpetrov/playwright-tests)
- API tests → [api-requests-pytest](mini-projects/api-requests-pytest/README.md), [contract-testing](mini-projects/contract-testing/README.md)

## Key docs
- [Architecture & test strategy](docs/test-strategy.md)
- [CI/CD pipeline](docs/ci-cd.md)

## Contact
- LinkedIn: [https://www.linkedin.com/in/rmpetrov/](https://www.linkedin.com/in/rmpetrov/)
- Email: [rpetrovqa@gmail.com](mailto:rpetrovqa@gmail.com)
