# In[1]
import pandas as pd
import numpy as np

# In[1]
df = pd.DataFrame(np.array([[1,'balão', 3], [2, 'camiseta', 9],
                            [7, 'salgadinho', 8]]), columns=['a', 'item', 'c'])
df
# %%
item = pd.get_dummies(df['item'])
item
# %%
df.drop(['item'], axis=1, inplace=True)
df
# %%

df = pd.concat([df, item], axis=1)
df
# %%
