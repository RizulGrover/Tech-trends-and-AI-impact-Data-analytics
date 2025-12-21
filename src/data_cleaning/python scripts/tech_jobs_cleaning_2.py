import pandas as pd

df = pd.read_csv(
    "D:/Data Analysis/Capstone project - Personal/data/cleaned/luke_tech_jobs_explodebyskill.csv",
    dtype=str,
    encoding="utf-8",
    on_bad_lines="skip"
)

df = df.applymap(lambda x: x.strip() if isinstance(x, str) else x)

df = df.replace(r"\s+", " ", regex=True)

df["skill_list"] = df["skill_list"].str.strip()

df["skillset_str"] = df["skillset_str"].str.replace('"', '').str.strip()


df.to_csv("D:/Data Analysis/Capstone project - Personal/data/cleaned/luke_tech_jobs_explodebyskill_clean.csv", index=False, encoding="utf-8")



import pandas as pd

df = pd.read_csv("D:\Data Analysis\Capstone project - Personal\data\cleaned\luke_tech_jobs_clean.csv", dtype=str)

df["job_date"] = pd.to_datetime(df["job_date"], format="%d-%m-%Y", errors="coerce") \
                    .dt.strftime("%Y-%m-%d")

df.to_csv("D:\Data Analysis\Capstone project - Personal\data\cleaned\luke_tech_jobs_clean1.csv", index=False)

import pandas as pd

df = pd.read_csv("D:\Data Analysis\Capstone project - Personal\data\cleaned\luke_tech_jobs_explodebyskill_clean.csv", dtype=str)

df["job_date"] = pd.to_datetime(df["job_date"], format="%d-%m-%Y", errors="coerce") \
                    .dt.strftime("%Y-%m-%d")

df.to_csv("D:\Data Analysis\Capstone project - Personal\data\cleaned\luke_tech_jobs_explodebyskill_clean1.csv", index=False)
