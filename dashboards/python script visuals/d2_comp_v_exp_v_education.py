import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap

df = dataset.copy()

df['ConvertedCompYearly'] = pd.to_numeric(
    df['ConvertedCompYearly'], errors='coerce'
)

df = df.dropna(
    subset=['ConvertedCompYearly', 'EducationLevel', 'ExpBucket']
)


exp_order = ['Leader', 'Mid-expert', 'Senior', 'Mid-Level', 'Beginner']

edu_order = [
    "Bachelor's Degree",
    "Master's Degree",
    "Associate Degree",
    "Professional Degree",
    "Studying in College",
    "Secondary School",
    "Primary School",
    "Other/NA"
]


df['ExpBucket'] = pd.Categorical(
    df['ExpBucket'], categories=exp_order, ordered=True
)

df['EducationLevel'] = pd.Categorical(
    df['EducationLevel'], categories=edu_order, ordered=True
)


df_grp = (
    df
    .groupby(['ExpBucket', 'EducationLevel'], observed=True)
    .agg(avg_compensation=('ConvertedCompYearly', 'mean'))
    .reset_index()
)


df_pivot = df_grp.pivot(
    index='ExpBucket',
    columns='EducationLevel',
    values='avg_compensation'
)


custom_cmap = LinearSegmentedColormap.from_list(
    "salary_dark",
    ["#F0EBD8", "#748CAB", "#3E5C76", "#1D2D44", "#0D1321"],
    N=256
)
fig, ax = plt.subplots(figsize=(11, 6))

fig.patch.set_facecolor("#1D2D44")
ax.set_facecolor("#1D2D44")

sns.heatmap(
    df_pivot,
    cmap=custom_cmap,
    linewidths=0.5,
    ax=ax,
    cbar=True
)

ax.set_xlabel("Education Level", color="#F0EBD8")
ax.set_ylabel("Experience Bucket", color="#F0EBD8")

ax.tick_params(axis="x", colors="#F0EBD8", rotation=45)
ax.tick_params(axis="y", colors="#F0EBD8")


cbar = ax.collections[0].colorbar
cbar.ax.tick_params(colors="#F0EBD8")
cbar.outline.set_visible(False)
cbar.ax.set_facecolor("#1D2D44")


ax.set_title("")

plt.tight_layout()
plt.show()
