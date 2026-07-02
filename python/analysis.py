import pandas as pd
from pathlib import Path
import logging

# Define project paths
BASE_DIR = Path(__file__).resolve().parent.parent
PROCESSED_DATA_PATH = BASE_DIR / "data" / "processed"

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

# function to load the dataset from the processed folder


def load_dataset():
    datasets = {}
    for file in PROCESSED_DATA_PATH.glob("*.csv"):
        file_name = file.stem
        datasets[file_name] = pd.read_csv(file)
    logging.info(f'{len(datasets)} datasets loaded')
    return datasets


# Function to check dataset quality and detect missing values
def check_data_quality(datasets):
    quality_report = {}
    for name, df in datasets.items():
        rows = len(df)
        columns = df.shape[1]
        missing_values = df.isnull().sum().sum()
        quality_report[name] = {
            "rows": rows, "columns": columns, "missing_values": missing_values}
    logging.info(f'Data quality check completed')
    return quality_report

# Function to display data quality results


def display_data_quality(quality_report):
    for name, values in quality_report.items():
        print(
            f'dataset: {name}\n rows: {values["rows"]}\n columns: {values["columns"]}\n missing values: {values["missing_values"]}')

# Function to display a global project summary


def display_project_summary(datasets, quality_report):
    total_missing_values = 0
    for name, values in quality_report.items():
        total_missing_values += values["missing_values"]
    print(
        f'=== PROJECT SUMMARY ===\n Datasets loaded:{len(datasets)}\n Total missing values:{total_missing_values}\n Status: Ready for Power BI')
    logging.info(f'Analysis completed successfully')

# Main function


def main():
    datasets = load_dataset()
    quality_report = check_data_quality(datasets)
    display_data_quality(quality_report)
    display_project_summary(datasets, quality_report)


if __name__ == "__main__":
    main()
