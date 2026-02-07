import json
from pathlib import Path

from jsonschema import Draft7Validator, FormatChecker


BASE_DIR = Path(__file__).resolve().parents[1]
SCHEMA_PATH = BASE_DIR / "contracts" / "user.schema.json"
FIXTURE_PATH = BASE_DIR / "fixtures" / "user.json"


def test_user_contract_fixture():
    schema = json.loads(SCHEMA_PATH.read_text())
    payload = json.loads(FIXTURE_PATH.read_text())
    validator = Draft7Validator(schema, format_checker=FormatChecker())
    errors = sorted(validator.iter_errors(payload), key=lambda e: e.path)
    assert errors == []
