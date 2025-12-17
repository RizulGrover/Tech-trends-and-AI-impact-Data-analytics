import os
from google.cloud import bigquery
from dotenv import load_dotenv

load_dotenv(override=True)

def get_bq_client():
    client = bigquery.Client.from_service_account_json(
        os.getenv("GOOGLE_APPLICATION_CREDENTIALS"),
        project=os.getenv("GCP_PROJECT_ID")
    )
    return client

def run_query(sql):
    client = get_bq_client()
    return client.query(sql).to_dataframe()


def run_update_query(sql):
    client = get_bq_client()
    job = client.query(sql)
    job.result()
    return job


def write_df_to_bq(df, dataset, table):
    client = get_bq_client()
    table_id = f"{os.getenv('GCP_PROJECT_ID')}.{dataset}.{table}"
    client.load_table_from_dataframe(df, table_id).result()
