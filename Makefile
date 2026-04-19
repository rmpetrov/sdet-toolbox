SHELL := /usr/bin/env bash

PYTHON ?= python3
VENV_ROOT ?= .venvs
TOOLS_VENV := $(VENV_ROOT)/tools
TOOLS_BIN := $(TOOLS_VENV)/bin
TOOLS_PIP := $(TOOLS_BIN)/pip
RUFF := $(TOOLS_BIN)/ruff

PLAYWRIGHT_INSTALL_ARGS ?= chromium

API_DIR := mini-projects/api-requests-pytest
API_REQ := $(API_DIR)/requirements.txt
API_VENV := $(VENV_ROOT)/api-requests-pytest
API_PYTEST := $(API_VENV)/bin/pytest
CONTRACT_DIR := mini-projects/contract-testing
CONTRACT_REQ := $(CONTRACT_DIR)/requirements.txt
CONTRACT_VENV := $(VENV_ROOT)/contract-testing
CONTRACT_PYTEST := $(CONTRACT_VENV)/bin/pytest
DATA_DIR := mini-projects/data-quality-tests
DATA_REQ := $(DATA_DIR)/requirements.txt
DATA_VENV := $(VENV_ROOT)/data-quality-tests
DATA_PYTEST := $(DATA_VENV)/bin/pytest
UI_DIR := mini-projects/ui-playwright-smoke
UI_REQ := $(UI_DIR)/requirements.txt
UI_VENV := $(VENV_ROOT)/ui-playwright-smoke
UI_PY := $(UI_VENV)/bin/python
UI_PYTEST := $(UI_VENV)/bin/pytest
PERF_DIR := mini-projects/performance-k6-or-locust
PERF_REQ := $(PERF_DIR)/requirements.txt
PERF_VENV := $(VENV_ROOT)/performance-k6-or-locust
PERF_LOCUST := $(PERF_VENV)/bin/locust

.PHONY: help setup lint fmt format test test-api test-ui test-contract test-data perf-smoke report clean

help:
	@echo "Targets:"
	@echo "  make setup        - Create the shared tooling environment"
	@echo "  make lint         - Run Ruff checks only (lint + format, no file changes)"
	@echo "  make fmt          - Apply Ruff lint fixes and formatting"
	@echo "  make test         - Run all automated tests with isolated project envs"
	@echo "  make test-api     - Create/update the API env and run tests"
	@echo "  make test-ui      - Create/update the UI env, install browsers, and run tests"
	@echo "  make test-contract - Create/update the contract env and run tests"
	@echo "  make test-data    - Create/update the data-quality env and run tests"
	@echo "  make perf-smoke   - Create/update the performance env and run Locust smoke test"
	@echo "  make report       - Generate Allure HTML reports into site/reports"
	@echo "  make clean        - Remove local virtualenvs and generated artifacts"

$(TOOLS_VENV)/bin/activate: requirements-dev.txt
	$(PYTHON) -m venv $(TOOLS_VENV)
	$(TOOLS_PIP) install --upgrade pip
	$(TOOLS_PIP) install -r requirements-dev.txt
	touch $@

$(API_VENV)/bin/activate: $(API_REQ)
	$(PYTHON) -m venv $(API_VENV)
	$(API_VENV)/bin/pip install --upgrade pip
	$(API_VENV)/bin/pip install -r $(API_REQ)
	touch $@

$(CONTRACT_VENV)/bin/activate: $(CONTRACT_REQ)
	$(PYTHON) -m venv $(CONTRACT_VENV)
	$(CONTRACT_VENV)/bin/pip install --upgrade pip
	$(CONTRACT_VENV)/bin/pip install -r $(CONTRACT_REQ)
	touch $@

$(DATA_VENV)/bin/activate: $(DATA_REQ)
	$(PYTHON) -m venv $(DATA_VENV)
	$(DATA_VENV)/bin/pip install --upgrade pip
	$(DATA_VENV)/bin/pip install -r $(DATA_REQ)
	touch $@

$(UI_VENV)/bin/activate: $(UI_REQ)
	$(PYTHON) -m venv $(UI_VENV)
	$(UI_VENV)/bin/pip install --upgrade pip
	$(UI_VENV)/bin/pip install -r $(UI_REQ)
	touch $@

$(PERF_VENV)/bin/activate: $(PERF_REQ)
	$(PYTHON) -m venv $(PERF_VENV)
	$(PERF_VENV)/bin/pip install --upgrade pip
	$(PERF_VENV)/bin/pip install -r $(PERF_REQ)
	touch $@

setup: $(TOOLS_VENV)/bin/activate

lint: $(TOOLS_VENV)/bin/activate
	$(RUFF) check .
	$(RUFF) format --check .

fmt: $(TOOLS_VENV)/bin/activate
	$(RUFF) check . --fix
	$(RUFF) format .

format: fmt

test-api: $(API_VENV)/bin/activate
	$(API_PYTEST) $(API_DIR) --alluredir $(API_DIR)/allure-results

test-contract: $(CONTRACT_VENV)/bin/activate
	$(CONTRACT_PYTEST) $(CONTRACT_DIR) --alluredir $(CONTRACT_DIR)/allure-results

test-data: $(DATA_VENV)/bin/activate
	$(DATA_PYTEST) $(DATA_DIR) --alluredir $(DATA_DIR)/allure-results

test-ui: $(UI_VENV)/bin/activate
	$(UI_PY) -m playwright install $(PLAYWRIGHT_INSTALL_ARGS)
	$(UI_PYTEST) $(UI_DIR) --alluredir $(UI_DIR)/allure-results

test: test-api test-contract test-data test-ui

perf-smoke: $(PERF_VENV)/bin/activate
	LOCUST_BIN=$(PERF_LOCUST) ./scripts/run_locust_smoke.sh https://example.com

report:
	@if ! command -v allure >/dev/null 2>&1; then \
		echo "allure CLI is required for 'make report'"; \
		echo "Install from https://allurereport.org/docs/install/"; \
		exit 1; \
	fi
	bash scripts/build_reports.sh

clean:
	rm -rf $(VENV_ROOT) .venv .pytest_cache .ruff_cache site/reports
	find mini-projects -type d -name allure-results -prune -exec rm -rf {} +
