from pathlib import Path

import pandera as pa
import pandas as pd


BASE_DIR = Path(__file__).resolve().parents[1]
DATA_PATH = BASE_DIR / "data" / "sample.csv"


def test_sample_data_quality():
    df = pd.read_csv(
        DATA_PATH,
        true_values=["true"],
        false_values=["false"],
    )

    schema = pa.DataFrameSchema(
        {
            "user_id": pa.Column(int, checks=pa.Check.ge(1), nullable=False, unique=True),
            "email": pa.Column(str, checks=pa.Check.str_contains("@"), nullable=False),
            "age": pa.Column(int, checks=pa.Check.between(18, 99), nullable=False),
            "is_active": pa.Column(bool, nullable=False),
        },
        coerce=True,
    )

    schema.validate(df)
