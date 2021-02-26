import pandas as pd
import numpy as np

print('Sergipe Imports and exports\n')

file_path = "data/SE.csv"

impExp = pd.read_csv(file_path, ';')
# impExp = pd.DataFrame(impExp)

# print(impExp.head())

file_path = "data/NCM.csv"

ncm = pd.read_csv(file_path, ';', error_bad_lines=False, encoding='latin-1')

# print(ncm.head())
# print(ncm.loc[:3, ["NCM", "NO_NCM_POR"]])

ncmInfo = ncm.loc[:, ["NCM", "NO_NCM_POR"]]
#ncmInfo = pd.DataFrame(ncmInfo)

# 39235000
# print(ncmInfo.loc[ncmInfo["NCM"] == 39235000, ["NO_NCM_POR"]].iat[0,0])
# print(impExp.loc[impExp["NCM"] == 39235000])
# ncmInfo.sort_index(inplace=True)
# impExp.sort_index(inplace=True)
# impExp['NO_NCM_POR'] = np.where(impExp['NCM'] == ncmInfo['NCM'], ncmInfo['NO_NCM_POR'], 'Invalid NCM')

# print(impExp.head())

# print(impExp.head())
print(ncmInfo['NCM'].head())

impExp = impExp.merge(ncmInfo, on="NCM")
# impExp = impExp.set_index('NCM').join(ncmInfo.set_index('NCM'))

print(impExp.head())

print(type(impExp), type(ncmInfo))
