import os
import logging
import pandas as pd
from pathlib import Path
from sqlalchemy import create_engine
from dotenv import load_dotenv

# Logging configuration
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# Load environment variables from .env file
load_dotenv()

# Database connection variables
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_NAME = os.getenv("DB_NAME")

# Create PostgreSQL connection engine
ENGINE = create_engine(
    f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

# Define project paths
BASE_DIR = Path(__file__).resolve().parent.parent
SQL_ANALYSIS_PATH = BASE_DIR / "sql" / "analysis"
OUTPUT_PATH = BASE_DIR / "data" / "processed"
OUTPUT_PATH.mkdir(exist_ok=True)

# Create a function to read SQL files and return query results as a DataFrame


def get_dataframe_from_sql_file(file_path):
    try:
        query = file_path.read_text(encoding="utf-8")
        df = pd.read_sql(query, ENGINE)
        return df
    except Exception as e:
        logging.error(f"Error while processing {file_path.name} : {e}")
        return None

# Export each SQL query result to a CSV file


def export_queries_to_csv():
    for file in SQL_ANALYSIS_PATH.glob("*.sql"):
        df = get_dataframe_from_sql_file(file)
        if df is not None:
            file_name = file.stem + '.csv'
            output_file = OUTPUT_PATH / file_name
            df.to_csv(output_file, index=False)
            logging.info(f"csv created: {file_name}")

# Main function


def main():
    export_queries_to_csv()


if __name__ == "__main__":
    main()
