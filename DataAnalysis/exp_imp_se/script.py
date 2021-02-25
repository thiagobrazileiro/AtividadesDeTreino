import pandas as pd

print('Sergipe Imports and exports\n')

file_path = "data/SE.csv"

csv = pd.read_csv(file_path, ';')

print(csv.head())