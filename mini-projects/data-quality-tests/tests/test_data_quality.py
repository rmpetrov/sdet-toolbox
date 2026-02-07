from pathlib import Path

import pandas as pd
import pandera as pa
from pandera import Column


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
            "user_id": Column(int, checks=pa.Check.ge(1), nullable=False, unique=True),
            "email": Column(str, checks=pa.Check.str_contains("@"), nullable=False),
            "age": Column(int, checks=pa.Check.between(18, 99), nullable=False),
            "is_active": Column(bool, nullable=False),
        },
        coerce=True,
    )

    schema.validate(df)
