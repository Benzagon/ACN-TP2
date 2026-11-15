import pandas as pd

df = pd.read_csv("demanda.csv", sep=",", encoding="utf-8-sig")
df.columns = df.columns.str.strip()
print(df.columns.tolist())  # debería mostrar ['Mes', 'A', 'B', 'C', 'D', 'E']

long = df.melt(id_vars="Mes", var_name="Producto", value_name="Demanda")
long.to_csv("demanda_larga.csv", sep=" ", index=False, header=False)