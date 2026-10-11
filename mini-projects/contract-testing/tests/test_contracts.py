import json
from pathlib import Path

from jsonschema import Draft7Validator, FormatChecker
from openapi_spec_validator import validate
from yaml import safe_load

BASE_DIR = Path(__file__).resolve().parents[1]
SCHEMA_PATH = BASE_DIR / "contracts" / "user.schema.json"
FIXTURE_PATH = BASE_DIR / "fixtures" / "user.json"
OPENAPI_PATH = BASE_DIR / "openapi.yaml"


def test_user_contract_fixture():
    schema = json.loads(SCHEMA_PATH.read_text())
    payload = json.loads(FIXTURE_PATH.read_text())
    validator = Draft7Validator(schema, format_checker=FormatChecker())
    errors = sorted(validator.iter_errors(payload), key=lambda e: e.path)
    assert errors == []


def test_openapi_spec_is_valid():
    spec = safe_load(OPENAPI_PATH.read_text())
    validate(spec)


def test_user_response_matches_openapi_schema():
    spec = safe_load(OPENAPI_PATH.read_text())
    response_schema = spec["paths"]["/users/{id}"]["get"]["responses"]["200"]["content"]["application/json"]["schema"]
    payload = json.loads(FIXTURE_PATH.read_text())
    # This example has one local reference and no nested references.
    response_schema = spec["components"]["schemas"][response_schema["$ref"].rsplit("/", 1)[-1]]
    validator = Draft7Validator(response_schema, format_checker=FormatChecker())
    errors = sorted(validator.iter_errors(payload), key=lambda e: e.path)
    assert errors == []
