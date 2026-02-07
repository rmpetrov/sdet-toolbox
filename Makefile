PYTHON ?= python3
VENV ?= .venv
PIP := $(VENV)/bin/pip
PY := $(VENV)/bin/python

.PHONY: help venv lint test-ui test-api test-contract test-data perf-smoke clean

help:
	@echo "Targets:"
	@echo "  make lint         - Run ruff lint on mini-projects"
	@echo "  make test-ui      - Run Playwright UI smoke tests"
	@echo "  make test-api     - Run API requests tests"
	@echo "  make test-contract - Run contract tests (OpenAPI)"
	@echo "  make test-data    - Run data quality tests"
	@echo "  make perf-smoke   - Run Locust smoke test"
	@echo "  make clean        - Remove local venv"

venv:
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip

lint: venv
	$(PIP) install ruff
	$(VENV)/bin/ruff check mini-projects

test-ui: venv
	$(PIP) install -r mini-projects/ui-playwright-smoke/requirements.txt
	$(PY) -m playwright install chromium
	$(VENV)/bin/pytest mini-projects/ui-playwright-smoke

test-api: venv
	$(PIP) install -r mini-projects/api-requests-pytest/requirements.txt
	$(VENV)/bin/pytest mini-projects/api-requests-pytest

test-contract: venv
	$(PIP) install -r mini-projects/contract-testing/requirements.txt
	$(VENV)/bin/pytest mini-projects/contract-testing

test-data: venv
	$(PIP) install -r mini-projects/data-quality-tests/requirements.txt
	$(VENV)/bin/pytest mini-projects/data-quality-tests

perf-smoke: venv
	$(PIP) install -r mini-projects/performance-k6-or-locust/requirements.txt
	./scripts/run_locust_smoke.sh https://example.com

clean:
	rm -rf $(VENV)
