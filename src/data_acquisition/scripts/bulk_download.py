import os
import csv
import requests
import zipfile
import gdown


def download_csv(url, filepath, name):
    response=requests.get(url)
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, "wb") as file:
        file.write(response.content)
    print(f"File {name} - CSV downloaded successfully")



def download_zip(url, filepath, name):
    response=requests.get(url)
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, "wb") as file:
        file.write(response.content)
    print(f"File {name} - ZIP downloaded successfully")

    extract_folder = "data/raw/zip_extracted/"
    os.makedirs(extract_folder, exist_ok=True)

    try:
        with zipfile.ZipFile(filepath, "r") as zip_ref:
            zip_ref.extractall(extract_folder)
        print(f"ZIP extracted → {extract_folder}")
    except zipfile.BadZipFile:
        print("ERROR: File is not a valid ZIP archive.")



def download_google_drive(file_id, filepath, name):
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    url = f"https://drive.google.com/uc?id={file_id}"
    gdown.download(url, filepath, quiet=False)
    print(f"{name} - Google Drive Download → {filepath}")



def download_file(name, url, filetype, filepath):
    print(f'Processing {name} - {filetype}')

    if filetype=='csv':
        download_csv(url, filepath, name)

    elif filetype=='zip':
        download_zip(url, filepath, name)

    elif filetype == 'google_drive':
        download_google_drive(url, filepath, name)

    else:
        print(f"Unknown file type specified for: {name}")



def run_bulk(config_file):
    if not os.path.exists(config_file):
        print("Config file not found:", config_file)
        return

    with open(config_file, newline='') as file:
        reader=csv.DictReader(file)

        for row in reader:
            download_file(row['name'], row['file_id'] if row['filetype']=='google_drive' else row['url'], row['filetype'], row['filepath'])



if __name__=="__main__":
    run_bulk("src/data_acquisition/config/dataset_sources.csv")