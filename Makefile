SHELL := /usr/bin/env bash

PYTHON ?= python3
VENV ?= .venv
BIN := $(VENV)/bin
PY := $(BIN)/python
PIP := $(BIN)/pip
PYTEST := $(BIN)/pytest
RUFF := $(BIN)/ruff

PLAYWRIGHT_INSTALL_ARGS ?= chromium

API_DIR := mini-projects/api-requests-pytest
CONTRACT_DIR := mini-projects/contract-testing
DATA_DIR := mini-projects/data-quality-tests
UI_DIR := mini-projects/ui-playwright-smoke
PERF_DIR := mini-projects/performance-k6-or-locust

.PHONY: help setup lint test test-api test-ui test-contract test-data perf-smoke report clean

help:
	@echo "Targets:"
	@echo "  make setup        - Create .venv and install pinned dependencies"
	@echo "  make lint         - Run Ruff lint + format checks"
	@echo "  make test         - Run all automated tests"
	@echo "  make test-api     - Run API request tests"
	@echo "  make test-ui      - Run Playwright UI smoke tests"
	@echo "  make test-contract - Run OpenAPI / contract tests"
	@echo "  make test-data    - Run data quality tests"
	@echo "  make perf-smoke   - Run Locust smoke test"
	@echo "  make report       - Generate Allure HTML reports into site/reports"
	@echo "  make clean        - Remove local virtualenv and generated artifacts"

$(VENV)/bin/activate: requirements-dev.txt
	$(PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements-dev.txt
	touch $(VENV)/bin/activate

setup: $(VENV)/bin/activate

lint: setup
	$(RUFF) check .
	$(RUFF) format --check .

test-api: setup
	$(PYTEST) $(API_DIR) --alluredir $(API_DIR)/allure-results

test-contract: setup
	$(PYTEST) $(CONTRACT_DIR) --alluredir $(CONTRACT_DIR)/allure-results

test-data: setup
	$(PYTEST) $(DATA_DIR) --alluredir $(DATA_DIR)/allure-results

test-ui: setup
	$(PY) -m playwright install $(PLAYWRIGHT_INSTALL_ARGS)
	$(PYTEST) $(UI_DIR) --alluredir $(UI_DIR)/allure-results

test: test-api test-contract test-data test-ui

perf-smoke: setup
	./scripts/run_locust_smoke.sh https://example.com

report:
	@if ! command -v allure >/dev/null 2>&1; then \
		echo "allure CLI is required for 'make report'"; \
		echo "Install from https://allurereport.org/docs/install/"; \
		exit 1; \
	fi
	./scripts/build_reports.sh

clean:
	rm -rf $(VENV) .pytest_cache .ruff_cache site/reports
	find mini-projects -type d -name allure-results -prune -exec rm -rf {} +
