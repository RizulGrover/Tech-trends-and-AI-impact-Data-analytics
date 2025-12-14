import os
from google.cloud import bigquery
from dotenv import load_dotenv

load_dotenv()

def get_bq_client():
    client = bigquery.Client.from_service_account_json(
        os.getenv("GOOGLE_APPLICATION_CREDENTIALS"),
        project=os.getenv("GCP_PROJECT_ID")
    )
    return client

def run_query(sql):
    client = get_bq_client()
    return client.query(sql).to_dataframe()
