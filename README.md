# sdet-toolbox

[![CI](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/ci.yml)
[![Pages](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/pages-report.yml/badge.svg?branch=main)](https://github.com/rmpetrov/sdet-toolbox/actions/workflows/pages-report.yml)

Five small, runnable test engineering examples. Each demonstrates a focused check using local sample code or data; this is a supporting portfolio repository.

| Example | Actual validation scope |
| --- | --- |
| [API: requests + pytest](mini-projects/api-requests-pytest/README.md) | Three tests against a local HTTP server: health response, sample post fields, and a 404 payload. |
| [UI: Playwright](mini-projects/ui-playwright-smoke/README.md) | Two Chromium tests against inline HTML: document title and a visible link with the expected href. No navigation or application workflow is tested. |
| [Contract testing](mini-projects/contract-testing/README.md) | OpenAPI document validity and one local JSON fixture against a Draft 7 schema and the OpenAPI user schema. No live provider or consumer compatibility verification. |
| [Data validation](mini-projects/data-quality-tests/README.md) | One Pandera check of a sample CSV: columns, coercible types, non-null values, unique positive IDs, age range, and emails containing `@`. |
| [Performance: Locust](mini-projects/performance-k6-or-locust/README.md) | Repeated GET / with aggregate failure-count and approximate p95 thresholds. No capacity or application performance claim. |

## Run locally

Use Python 3.11 (the CI version), Make, and Bash. Run these commands from the repository root:

```bash
make setup
make lint
make test
```

Make creates separate environments under `.venvs/`. Individual targets are `test-api`, `test-contract`, `test-data`, and `test-ui`. UI setup downloads Chromium; Linux may require `make test-ui PLAYWRIGHT_INSTALL_ARGS="--with-deps chromium"` to install system libraries. Dependencies require internet access for installation. Direct dependencies are pinned; transitive dependencies are not locked.

For a local performance demonstration, start a server in another terminal:

```bash
python3 -m http.server 8000 --bind 127.0.0.1 --directory mini-projects
```

Then run:

```bash
make perf-smoke
# For a target you control:
make perf-smoke PERF_HOST=http://127.0.0.1:8000
```

Defaults: 5 users, 30 seconds, zero failures, p95 <= 1000 ms. Override `USERS`, `SPAWN_RATE`, `DURATION`, `P95_MS`, or `MAX_FAIL` as needed. The local static server only demonstrates execution and threshold evaluation. Locust is not run in CI.

## CI and reports

CI runs Ruff and the four pytest suites and uploads Allure result artifacts, including on test failure. The separate Pages workflow reruns those suites on main and publishes reports after successful tests. See the [report portal](https://rmpetrov.github.io/sdet-toolbox/).

`make report` generates HTML in `site/reports/` from existing Allure results and requires the [Allure CLI](https://allurereport.org/docs/install/). Results accumulate across local runs; clear old result directories before a fresh report. Reports do not preserve history between Pages builds.

See [test strategy](docs/test-strategy.md), [CI/CD](docs/ci-cd.md), [reporting](docs/reporting.md), [debugging flaky tests](docs/flaky-tests.md), and [contributing](CONTRIBUTING.md).
