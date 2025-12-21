import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

df = dataset.copy()

df['ConvertedCompYearly'] = pd.to_numeric(df['ConvertedCompYearly'], errors='coerce')
df['WorkExp'] = pd.to_numeric(df['WorkExp'], errors='coerce')
df = df.dropna(subset=['ConvertedCompYearly', 'WorkExp'])

df_grp = (
    df
    .groupby('WorkExp', observed=True)
    .agg(avg_comp=('ConvertedCompYearly', 'mean'))
    .reset_index()
)

fig, ax = plt.subplots(figsize=(11, 6))

fig.patch.set_facecolor("#1d2d44")
ax.set_facecolor("#1d2d44")

sns.regplot(
    x='WorkExp',
    y='avg_comp',
    data=df_grp,
    ax=ax,
    scatter_kws={'alpha': 0.6, 'color': '#f0ebd8'},
    line_kws={'color': '#f0ebd8'}
)


ax.set_xlabel("Work Experience (Years)", color="#f0ebd8")
ax.set_ylabel("Average Compensation", color="#f0ebd8")

ax.tick_params(axis='x', colors="#f0ebd8")
ax.tick_params(axis='y', colors="#f0ebd8")

ax.set_title("")

plt.tight_layout()
plt.show()
