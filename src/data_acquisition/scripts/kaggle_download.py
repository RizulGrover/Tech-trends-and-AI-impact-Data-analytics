import os
import csv
import kagglehub
import shutil

def download_kaggle_data(name,slug,filepath):
    print(f'Downloading {name} from Kaggle')

    path = kagglehub.dataset_download(slug)

    os.makedirs(filepath, exist_ok=True)

    csv_count=0

    if os.path.isdir(path):
        for file in os.listdir(path):
            if file.lower().endswith("csv"):
                src=os.path.join(path,file)
                dest=os.path.join(filepath,file)
                shutil.copy(src,dest)
                csv_count+=1

    else:
        if path.lower().endswith("csv"):
            shutil.copy(path, os.path.join(filepath, os.path.basename(path)))
            csv_count+=1

    if csv_count>0:
        print(f'{csv_count} CSV files downloaded from {name}')
    else:
        print(f'Cannot find CSV files in {name}')



def run_download(config_file):
    if not os.path.exists(config_file):
        print(f'Kaggle file not found!')
        return

    with open(config_file, newline="") as file:
        reader=csv.DictReader(file)
        for row in reader:
            download_kaggle_data(row['name'], row['slug'], row['filepath'])


if __name__ == "__main__":
    run_download("src/data_acquisition/config/kaggle_datasets.csv")