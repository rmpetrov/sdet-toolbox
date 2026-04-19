# sdet-toolbox

[![CI](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Lint](https://img.shields.io/github/actions/workflow/status/rmpetrov/sdet-toolbox/ci.yml?branch=main&label=lint)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Tests](https://img.shields.io/github/actions/workflow/status/rmpetrov/sdet-toolbox/ci.yml?branch=main&label=tests)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Pages](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/pages-report.yml/badge.svg?branch=main)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/pages-report.yml)

Practical QA and test engineering toolkit with compact, runnable projects for UI smoke checks, API validation, contract testing, data quality checks, and lightweight performance coverage. The examples are intentionally small enough to run locally, troubleshoot in CI, and reuse as validation-focused starting points.

## Quick links
- [Mini-projects catalog](mini-projects/README.md)
- [GitHub Actions CI](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
- [Published reports](https://rmpetrov.github.io/sdet-toolbox/)
- [Test strategy](docs/test-strategy.md)
- [Reporting notes](docs/reporting.md)
- [Related Playwright framework repo](https://github.com/rmpetrov/playwright-tests)

## What this repo covers
- UI smoke checks for critical user-facing paths
- API response validation with readable assertions and predictable fixtures
- Contract safety using OpenAPI and JSON Schema validation
- Data quality checks for schema, null, type, range, and uniqueness rules
- Performance smoke execution with simple pass/fail thresholds
- Reproducible execution through pinned dependencies, Make targets, CI, and report generation

## Mini-project map
- [ui-playwright-smoke](mini-projects/ui-playwright-smoke/README.md): Playwright + pytest smoke checks for fast UI regression signal
- [api-requests-pytest](mini-projects/api-requests-pytest/README.md): Python-based API validation with local endpoints and clear failure diagnostics
- [contract-testing](mini-projects/contract-testing/README.md): OpenAPI and JSON Schema checks for contract consistency
- [data-quality-tests](mini-projects/data-quality-tests/README.md): Pandera-based data validation for schema and business-rule coverage
- [performance-k6-or-locust](mini-projects/performance-k6-or-locust/README.md): Locust smoke example with lightweight thresholds for response time and failures

## Why this repo matters
- It shows practical validation work across UI, API, contract, data, and performance-focused checks.
- It favors maintainable automation over broad but brittle coverage.
- It is useful for regression confidence, troubleshooting, and repeatable local or CI execution.
- It includes report publishing and CI visibility where that helps make failures easier to inspect.

## Tools and stack
- Python 3.11
- pytest
- Playwright
- Requests
- pandas
- Pandera
- `jsonschema`
- `openapi-spec-validator`
- OpenAPI YAML examples
- Locust
- Ruff
- Allure
- GitHub Actions

## How to run
```bash
make setup
make lint
make test
make perf-smoke
make report
```

- `make setup` creates the shared tooling environment used for linting and formatting.
- `make test` runs the API, contract, data quality, and UI projects in isolated virtual environments under `.venvs/`.
- `make test-ui` installs Playwright browsers inside the UI project environment before running the smoke suite.
- `make report` generates local Allure HTML into `site/reports` and requires the Allure CLI to be installed.
- `make perf-smoke` runs the Locust smoke example against `https://example.com` by default.

## Project structure
```text
.
|-- docs/
|-- mini-projects/
|   |-- api-requests-pytest/
|   |-- contract-testing/
|   |-- data-quality-tests/
|   |-- performance-k6-or-locust/
|   `-- ui-playwright-smoke/
|-- .venvs/
|-- scripts/
|-- Makefile
`-- requirements-dev.txt
```

## CI, reports, and docs
- CI runs linting plus the API, contract, data quality, and UI test projects on GitHub Actions.
- The Pages workflow publishes Allure reports for the UI, API, contract, and data quality projects.
- Supporting docs cover [test strategy](docs/test-strategy.md), [CI/CD](docs/ci-cd.md), [reporting](docs/reporting.md), and [flaky test handling](docs/flaky-tests.md).

## Contact
- LinkedIn: [https://www.linkedin.com/in/rmpetrov/](https://www.linkedin.com/in/rmpetrov/)
- Email: [rpetrovqa@gmail.com](mailto:rpetrovqa@gmail.com)
