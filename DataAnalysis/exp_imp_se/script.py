import pandas as pd
import numpy as np

print('Sergipe Imports and exports\n')

file_path = "data/SE.csv"

impExp = pd.read_csv(file_path, ';')

file_path = "data/NCM.csv"

ncm = pd.read_csv(file_path, ';', error_bad_lines=False, encoding='latin-1')

ncmInfo = ncm.loc[:, ["NCM", "NO_NCM_POR"]]

impExp = impExp.merge(ncmInfo, on="NCM")

print(type(impExp), type(ncmInfo))
