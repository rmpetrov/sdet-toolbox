# Mini-projects

Small, validation-focused QA projects built to show practical testing workflows with clear scope, runnable checks, and useful failure signal. Each example keeps scope intentionally tight so the quality goal and execution flow stay easy to follow.

## Projects
- [UI Playwright smoke](ui-playwright-smoke/README.md): Playwright + pytest smoke checks for basic UI regression coverage
- [API Requests + Pytest](api-requests-pytest/README.md): local API validation example with readable assertions and failure output
- [Contract testing](contract-testing/README.md): schema and OpenAPI checks for interface safety
- [Data quality tests](data-quality-tests/README.md): data validation focused on schema and rule enforcement
- [Performance testing](performance-k6-or-locust/README.md): lightweight Locust smoke run with threshold-based pass/fail behavior

## Running from the repository root
- `make test-api`
- `make test-contract`
- `make test-data`
- `make test-ui`
- `make perf-smoke`
