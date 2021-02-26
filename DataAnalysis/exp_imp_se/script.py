import pandas as pd

print('Sergipe Imports and exports\n')

file_path = "data/SE.csv"

impExp = pd.read_csv(file_path, ';')

print(impExp.head())

file_path = "data/NCM.csv"

ncm = pd.read_csv(file_path, ';' , error_bad_lines=False, encoding='latin-1')

print(ncm.head())