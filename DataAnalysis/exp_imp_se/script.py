import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

plt.close("all")

print('Sergipe Imports and exports\n')

file_path = "data/SE.csv"

impExp = pd.read_csv(file_path, ';')

file_path = "data/NCM.csv"

ncm = pd.read_csv(file_path, ';', error_bad_lines=False, encoding='latin-1')

ncmInfo = ncm.loc[:, ["NCM", "NO_NCM_POR"]]

impExp = impExp.merge(ncmInfo, on="NCM")

netValues = pd.Series([impExp["Net_jan"].sum(), impExp["Net_fev"].sum(), impExp["Net_mar"].sum(), impExp["Net_abr"].sum(), impExp["Net_mai"].sum(), impExp["Net_jun"].sum(),
                       impExp["Net_jul"].sum(), impExp["Net_ago"].sum(), impExp["Net_set"].sum(), impExp["Net_out"].sum(), impExp["Net_nov"].sum(), impExp["Net_dez"].sum()],
                      ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'])

# print(impExp["Exp_total"].sum())
# print(impExp["Imp_total"].sum())

# Most exported item by Sergipe at 2020
# print(impExp.loc[impExp["Exp_total"].idxmax()])

# netValues.plot()
# plt.show()
