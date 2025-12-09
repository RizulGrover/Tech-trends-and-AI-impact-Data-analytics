import requests
import json
import csv
import os
from datetime import datetime

def fetch_remote_jobs():

    url = "https://remoteok.com/remote-jobs.json"

    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0",
        "Accept": "application/json, text/plain, */*",
        "Referer": "https://remoteok.com/",
        "Accept-Language": "en-US,en;q=0.9",
        "Connection": "keep-alive"
    }

    session=requests.Session()
    session.get("https://remoteok.com/", headers=headers)

    response=session.get(url, headers=headers)
    data=json.loads(response.text)

    jobs=data[1:]

    filepath="data/raw/web/remote_jobs.csv"
    os.makedirs(os.path.dirname(filepath), exist_ok=True)

    existing_urls=set()       # We use a set because it has faster duplicate checking

    if os.path.exists(filepath):
        with open(filepath, "r", newline="", encoding="utf-8") as file:
            reader=csv.DictReader(file)

            for row in reader:
                existing_urls.add(row['url'])

        file_mode='a'
        write_header=False

    else:
        file_mode='w'
        write_header=True
  

    with open(filepath, file_mode, newline="", encoding="utf-8") as file:
        csv_writer=csv.writer(file)

        if write_header:
            csv_writer.writerow(['company','title','tags','epoch','date','url'])

        new_count=0

        for job in jobs:
            url_job="https://remoteok.com" + job.get('url', "")

            if url_job in existing_urls:
                continue

            else:
                csv_writer.writerow([
                    job.get('company'),
                    job.get('position'),
                    ", ".join(job.get('tags', [])),
                    job.get('epoch'),
                    job.get('date'),
                    url_job
                ])

                new_count+=1

    print(f'New jobs added today in file = {new_count}')
    print(f'Total jobs in the CSV file = {len(existing_urls) + new_count}')


if __name__=="__main__":
    fetch_remote_jobs()