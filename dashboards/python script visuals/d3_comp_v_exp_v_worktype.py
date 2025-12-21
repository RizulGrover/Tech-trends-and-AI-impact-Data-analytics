import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap

df = dataset.copy()

df['ConvertedCompYearly'] = pd.to_numeric(
    df['ConvertedCompYearly'], errors='coerce'
)

df = df.dropna(subset=['ConvertedCompYearly', 'work_type', 'ExpBucket'])

exp_order = ['Leader', 'Mid-expert', 'Senior', 'Mid-Level', 'Beginner']

work_order = [
    "Fully In-Person",
    "Hybrid, more in person",
    "Hybrid, very flexible",
    "Fully Remote",
    "Fully Flexible",
]

df['ExpBucket'] = pd.Categorical(
    df['ExpBucket'], categories=exp_order, ordered=True
)

df['work_type'] = pd.Categorical(
    df['work_type'], categories=work_order, ordered=True
)

df_grp = (
    df
    .groupby(['ExpBucket', 'work_type'], observed=True)
    .agg(avg_compensation=('ConvertedCompYearly', 'mean'))
    .reset_index()
)

df_pivot = df_grp.pivot(
    index='ExpBucket',
    columns='work_type',
    values='avg_compensation'
)

custom_cmap = LinearSegmentedColormap.from_list(
    "salary_dark",
    ["#F0EBD8", "#748CAB", "#3E5C76", "#1D2D44", "#0D1321"],
    N=256
)

fig, ax = plt.subplots(figsize=(12, 6))

fig.patch.set_facecolor("#1D2D44")
ax.set_facecolor("#1D2D44")

sns.heatmap(
    df_pivot,
    cmap=custom_cmap,
    linewidths=0.5,
    ax=ax,
    cbar=True
)

ax.set_xlabel("Work type", color="#F0EBD8")
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
