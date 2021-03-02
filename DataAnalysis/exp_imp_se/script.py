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

### NET VALUES (exports - imports) ###
netValues = pd.Series([impExp["Net_jan"].sum(), impExp["Net_fev"].sum(), impExp["Net_mar"].sum(), impExp["Net_abr"].sum(), impExp["Net_mai"].sum(), impExp["Net_jun"].sum(),
                       impExp["Net_jul"].sum(), impExp["Net_ago"].sum(), impExp["Net_set"].sum(), impExp["Net_out"].sum(), impExp["Net_nov"].sum(), impExp["Net_dez"].sum()],
                      ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'])

netValues.plot()

# print(impExp["Exp_total"].sum())
# print(impExp["Imp_total"].sum())

# Most exported item by Sergipe at 2020
# print(impExp.loc[impExp["Exp_total"].idxmax()])

# all exported products
# print(impExp.loc[impExp.index[impExp['Exp_total'] > 0], ['Exp_total', 'NO_NCM_POR']])

### EXPORTS ###
positiveExports = impExp.loc[impExp.index[impExp['Exp_total'] > 0], [
    'Exp_total', 'NO_NCM_POR']].sort_values('Exp_total', ascending=False)

others = pd.DataFrame(data={
    'NO_NCM_POR': ['others'],
    'Exp_total': [positiveExports['Exp_total'][5:].sum()]
})

positiveExports = positiveExports[:5].copy()
positiveExports = pd.concat([positiveExports, others])
positiveExports.plot(kind='pie', y='Exp_total', subplots=True, labels=positiveExports['NO_NCM_POR'],
                     figsize=(11, 6), legend=None, autopct='%1.1f%%', title='Top 5 mais exportados de Sergipe')


### IMPORTS ###
positiveImports = impExp.loc[impExp.index[impExp['Imp_total'] > 0], [
    'Imp_total', 'NO_NCM_POR']].sort_values('Imp_total', ascending=False)

others = pd.DataFrame(data={
    'NO_NCM_POR': ['others'],
    'Imp_total': [positiveImports['Imp_total'][5:].sum()]
})

positiveImports = positiveImports[:5].copy()
positiveImports = pd.concat([positiveImports, others])
positiveImports.plot(kind='pie', y='Imp_total', subplots=True, labels=positiveImports['NO_NCM_POR'],
                     figsize=(11, 6), legend=None, autopct='%1.1f%%', title='Top 5 mais importados de Sergipe')


### Show everything ###
plt.show()
