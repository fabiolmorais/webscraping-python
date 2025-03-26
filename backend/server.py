from fastapi import FastAPI, Query
from fastapi.middleware.cors import CORSMiddleware
import pandas as pd

app = FastAPI()

# Configuração do CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos os métodos (GET, POST, etc.)
    allow_headers=["*"],  # Permite todos os headers
)

CSV_PATH = "Relatorio_cadop.csv" 
df_operadoras = pd.read_csv(CSV_PATH, sep=";", encoding="utf-8")

@app.get("/operadoras")
def buscar_operadoras(search: str = Query(..., min_length=2, description="Modalidade da operadora")):
  """Busca operadoras pelo nome"""
  resultados = df_operadoras[df_operadoras["Modalidade"].str.contains(search, case=False, na=False)]
  resultados = resultados.fillna("Valor Ausente na Planilha")
  return resultados.to_dict(orient="records")

