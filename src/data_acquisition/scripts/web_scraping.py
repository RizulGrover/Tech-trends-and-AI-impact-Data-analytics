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

    with open(filepath, "w", newline="") as file:
        csv_writer=csv.writer(file)
        csv_writer.writerow(['company','title','tags','epoch','date','url'])

        for job in jobs:
            csv_writer.writerow([
                job.get('company'),
                job.get('position'),
                ", ".join(job.get('tags', [])),
                job.get('epoch'),
                job.get('date'),
                "https://remoteok.com"+job.get('url', "")
            ])

    print(f'Saved {len(jobs)} in the file')


if __name__=="__main__":
    fetch_remote_jobs()